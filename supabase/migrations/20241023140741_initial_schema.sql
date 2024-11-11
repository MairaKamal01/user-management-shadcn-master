create table "public"."profiles" (
    "id" uuid not null,
    "updated_at" timestamp with time zone,
    "username" text,
    "first_name" text not null,
    "last_name" text not null,
    "full_name" text,
    "avatar_url" text,
    "website" text
);


create table "public"."roles" (
    "id" uuid not null default uuid_generate_v4(),
    "role" character varying(100) not null,
    "created_at" timestamp without time zone default now()
);


alter table "public"."roles" enable row level security;

create table "public"."user_roles" (
    "user_id" uuid not null,
    "role_id" uuid not null,
    "created_at" timestamp without time zone not null default now()
);

CREATE EXTENSION IF NOT EXISTS plv8;


alter table "public"."user_roles" enable row level security;

CREATE UNIQUE INDEX profiles_pkey ON public.profiles USING btree (id);

CREATE UNIQUE INDEX profiles_username_key ON public.profiles USING btree (username);

CREATE UNIQUE INDEX roles_pkey ON public.roles USING btree (id);

CREATE UNIQUE INDEX roles_role_key ON public.roles USING btree (role);

CREATE UNIQUE INDEX user_roles_pkey ON public.user_roles USING btree (user_id, role_id);

alter table "public"."profiles" add constraint "profiles_pkey" PRIMARY KEY using index "profiles_pkey";

alter table "public"."roles" add constraint "roles_pkey" PRIMARY KEY using index "roles_pkey";

alter table "public"."user_roles" add constraint "user_roles_pkey" PRIMARY KEY using index "user_roles_pkey";

alter table "public"."profiles" add constraint "profiles_id_fkey" FOREIGN KEY (id) REFERENCES auth.users(id) ON DELETE CASCADE not valid;

alter table "public"."profiles" validate constraint "profiles_id_fkey";

alter table "public"."profiles" add constraint "profiles_username_key" UNIQUE using index "profiles_username_key";

alter table "public"."profiles" add constraint "username_length" CHECK ((char_length(username) >= 3)) not valid;

alter table "public"."profiles" validate constraint "username_length";

alter table "public"."roles" add constraint "roles_role_key" UNIQUE using index "roles_role_key";

alter table "public"."user_roles" add constraint "user_roles_role_id_fkey" FOREIGN KEY (role_id) REFERENCES roles(id) not valid;

alter table "public"."user_roles" validate constraint "user_roles_role_id_fkey";

alter table "public"."user_roles" add constraint "user_roles_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."user_roles" validate constraint "user_roles_user_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.custom_access_token(event jsonb)
 RETURNS jsonb
 LANGUAGE plv8
AS $function$var user_roles = [];

  console.log('Event: ', event)

  var result = plv8.execute("select roles.role from public.roles inner join public.user_roles on roles.id = user_roles.role_id where user_roles.user_id = $1", [event.user_id]);

  console.log('Result: ', result)

  if (result.length > 0) {
    result.forEach(function(row) {
      user_roles.push(row.role);  // Add each role to the user_roles array
    });
  } 
  else {

    user_roles = [];
  }

  if (!event.claims) {
    event.claims = {};
  }

 
  event.claims.user_roles = user_roles;

  return event;$function$
;

CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$BEGIN
  INSERT INTO public.profiles (id, first_name, last_name, full_name, updated_at)
  VALUES (
    NEW.id,
    -- Concatenate first_name and last_name to form full_name
    NEW.raw_user_meta_data->>'firstName',
    NEW.raw_user_meta_data->>'lastName',
    (NEW.raw_user_meta_data->>'firstName') || ' ' || (NEW.raw_user_meta_data->>'lastName'),
    NOW()
  );
  RETURN NEW;
END;$function$
;

grant delete on table "public"."profiles" to "service_role";

grant insert on table "public"."profiles" to "service_role";

grant references on table "public"."profiles" to "service_role";

grant select on table "public"."profiles" to "service_role";

grant trigger on table "public"."profiles" to "service_role";

grant truncate on table "public"."profiles" to "service_role";

grant update on table "public"."profiles" to "service_role";

grant delete on table "public"."profiles" to "supabase_auth_admin";

grant insert on table "public"."profiles" to "supabase_auth_admin";

grant references on table "public"."profiles" to "supabase_auth_admin";

grant select on table "public"."profiles" to "supabase_auth_admin";

grant trigger on table "public"."profiles" to "supabase_auth_admin";

grant truncate on table "public"."profiles" to "supabase_auth_admin";

grant update on table "public"."profiles" to "supabase_auth_admin";

grant delete on table "public"."roles" to "service_role";

grant insert on table "public"."roles" to "service_role";

grant references on table "public"."roles" to "service_role";

grant select on table "public"."roles" to "service_role";

grant trigger on table "public"."roles" to "service_role";

grant truncate on table "public"."roles" to "service_role";

grant update on table "public"."roles" to "service_role";

grant delete on table "public"."roles" to "supabase_auth_admin";

grant insert on table "public"."roles" to "supabase_auth_admin";

grant references on table "public"."roles" to "supabase_auth_admin";

grant select on table "public"."roles" to "supabase_auth_admin";

grant trigger on table "public"."roles" to "supabase_auth_admin";

grant truncate on table "public"."roles" to "supabase_auth_admin";

grant update on table "public"."roles" to "supabase_auth_admin";

grant delete on table "public"."user_roles" to "service_role";

grant insert on table "public"."user_roles" to "service_role";

grant references on table "public"."user_roles" to "service_role";

grant select on table "public"."user_roles" to "service_role";

grant trigger on table "public"."user_roles" to "service_role";

grant truncate on table "public"."user_roles" to "service_role";

grant update on table "public"."user_roles" to "service_role";

grant delete on table "public"."user_roles" to "supabase_auth_admin";

grant insert on table "public"."user_roles" to "supabase_auth_admin";

grant references on table "public"."user_roles" to "supabase_auth_admin";

grant select on table "public"."user_roles" to "supabase_auth_admin";

grant trigger on table "public"."user_roles" to "supabase_auth_admin";

grant truncate on table "public"."user_roles" to "supabase_auth_admin";

grant update on table "public"."user_roles" to "supabase_auth_admin";

create policy "Allow auth admin to read roles"
on "public"."roles"
as permissive
for select
to supabase_auth_admin
using (true);


create policy "Allow auth admin to read user roles"
on "public"."user_roles"
as permissive
for select
to supabase_auth_admin
using (true);



