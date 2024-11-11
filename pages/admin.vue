<script setup lang="ts">

import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuLabel, DropdownMenuSeparator, DropdownMenuTrigger } from '@/components/ui/dropdown-menu'
import { Input } from '@/components/ui/input'
import { Sheet, SheetContent, SheetTrigger } from '@/components/ui/sheet'

const supabase = useSupabaseClient();

// async function displayCurrentUserSession() {
//   const { data: { session }, error } = await supabase.auth.getSession();

//   if (error) {
//     console.error("Error fetching session:", error);
//     return;
//   }

//   if (session) {
//     const user = session.user;
//     console.log("Current User Session:", session);
//     // Display other user information if needed
//   } else {
//     console.log("No user is currently signed in.");
//   }
// }

// // Call the function to display the current user session
// displayCurrentUserSession();

const { data: profiles, error: profilesError } = await supabase
  .from('profiles')
  .select('*');

if (profilesError) {
  console.error("Error fetching profiles:", profilesError);
} else {
  console.log("Profiles:", profiles);
}

const { data: roles, error: rolesErr } = await supabase
  .from('user_roles')
  .select('*');

if (rolesErr) {
  console.error("Error fetching user roles:", rolesErr);
} else {
  console.log("User roles:", roles);
}

const { data: userRoles, error: rolesError } = await supabase
  .from('roles')
  .select('*');

if (rolesError) {
  console.error("Error fetching user roles:", rolesError);
} else {
  console.log("User roles:", userRoles);
}



</script>

<template>
  <div class="grid min-h-screen w-full md:grid-cols-[220px_1fr] lg:grid-cols-[280px_1fr]">
    <div class="hidden border-r bg-muted/40 md:block">
      <div class="flex h-full max-h-screen flex-col gap-2 py-8">
           <nav class="list items-start px-2 text-xl font-bold lg:px-4">
             <a
               href="#"
               class="flex items-center rounded-lg px-3 py-2 text-primary hover:text-black"
             >
               Dashboard
             </a>
             <a
               href="#"
               class="flex items-center rounded-lg px-3 py-2 text-primary hover:text-black"
             >
               User Management
             </a>
           </nav>
      </div>
    </div>
    <div class="flex flex-col">
        <div class="flex-col">
            <form>
            <div class="relative">
                <Search class="left-2.5 h-4 w-full text-muted-foreground" />
                <Input
                type="search"
                placeholder="Search Users..."
                class="w-full justify-center appearance-none bg-background pl-8 shadow-none md:w-2/3 lg:w-1/3"
                />
            </div>
            </form>
        </div>
      <main class="flex flex-1 flex-col gap-4 p-4 lg:gap-6 lg:p-6">
        <div class="flex items-center">
          <h1 class="text-lg font-semibold md:text-2xl">
            Users
          </h1>
        </div>
        <div class="flex flex-1 items-center justify-center rounded-lg border shadow-sm">
          <div class="flex flex-col items-center gap-1 text-center">
            <h3 class="text-2xl font-bold tracking-tight">
              No Users Found
            </h3>
            
            <Button class="mt-4">
              Add User
            </Button>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>