import { SupabaseClient, type Session } from "@supabase/supabase-js";
import type { currentUserType } from "~/types";
import { jwtDecode } from "jwt-decode";
import {
  authenticateUserServer,
  setCurrentUserState,
  resetCurrentUser,
} from "~/utilities/authUtils";

export default defineNuxtPlugin(async (nuxtApp) => {
  const currentUser = useState<currentUserType | null>(
    "currentUser",
    () => null
  );

  console.log("Initializing Auth Plugin");

  const supabase = useSupabaseClient();
  // Listen for auth changes in Supabase
  supabase.auth.onAuthStateChange(async (_event, session) => {
    if (import.meta.server) {
      console.log("Server:");
      console.log(`OnAuthStateChange:\n
        Event: ${_event}`);

      authenticateUserServer(currentUser);
    }

    if (import.meta.client) {
      console.log("Client:");
      console.log(`OnAuthStateChange:\n
        Event: ${_event}\n
        Session: ${session}`);

      if (session) setCurrentUserState(session, currentUser);
      else resetCurrentUser(currentUser);
    }

  });
});
