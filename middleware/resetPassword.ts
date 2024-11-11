import type { currentUserType } from "~/types";
import { authenticateUserServer } from "~/utilities/authUtils";
import { handleAuthRedirect } from "./auth";

export default defineNuxtRouteMiddleware(async (to, from) => {
  console.log("reset password middleware");
  if (import.meta.server) {
  }

  if (import.meta.client) {
    let currentUser = useState<currentUserType>("currentUser");
    await authenticateUserServer(currentUser);
    //return await handleAuthRedirect(currentUser, to);
  }
});
