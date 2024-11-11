import type { currentUserType } from "~/types";
import { type Session } from "@supabase/supabase-js";
import { jwtDecode } from "jwt-decode";

export const authenticateUserServer = async (
  currentUser: Ref<currentUserType | null, currentUserType | null>
) => {
  const supabase = useSupabaseClient();

  const { data, error } = await supabase.auth.getSession();


  if (error || !data.session) {
    console.log("No session found", error);
    resetCurrentUser(currentUser);
    return null;
  }

  return setCurrentUserState(data.session, currentUser);
};

export const setCurrentUserState = (
  session: Session,
  currentUser: Ref<currentUserType | null, currentUserType | null>
) => {
  try {
    const { user_roles } = jwtDecode<{ user_roles: string[] }>(
      session.access_token
    );
    
    if (user_roles == undefined) user_roles=[]

    // console.log(user_roles)

    currentUser.value = {
      email: session.user.email,
      firstName: session.user.user_metadata?.firstName || "",
      lastName: session.user.user_metadata?.lastName || "",
      isUser: user_roles.includes("user"),
      isAdmin: user_roles.includes("admin"),
    };
  } catch (decodeError) {
    console.error("Error decoding JWT:", decodeError);
    resetCurrentUser(currentUser);
  }

  return currentUser;
};

export const resetCurrentUser = (
  currentUser: Ref<currentUserType | null, currentUserType | null>
) => {
  currentUser.value = null;
};
