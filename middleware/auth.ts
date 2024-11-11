import type { RouteLocationNormalized } from "vue-router";
import type { currentUserType } from "~/types";
import { authenticateUserServer } from "~/utilities/authUtils";

export default defineNuxtRouteMiddleware(async (to, from) => {
  console.log("middleware");
  if (import.meta.server) {
    if (to.path != "/auth/resetPassword") {
      console.log("Server:");
      let currentUser = useState<currentUserType>("currentUser");
      await authenticateUserServer(currentUser);
      return await handleAuthRedirect(currentUser, to);
    }
  }

  if (import.meta.client) {
    let currentUser = useState<currentUserType>("currentUser");
    await authenticateUserServer(currentUser);
    return await handleAuthRedirect(currentUser, to);
  }
});

export const handleAuthRedirect = async (
  currentUser: Ref<currentUserType | null, currentUserType | null>,
  to: RouteLocationNormalized
) => {
  if (!currentUser.value) {
    // Redirect to login if authentication is required but currentUser is null
    return navigateTo({
      path: "/auth/login",
      query: { redirect: to.fullPath },
    });
  }

  // if (to.meta.requiresAdmin && !currentUser?.value?.isAdmin) {
  //   // Redirect to unauthorized if admin privileges are required but the user is not an admin
  //   return navigateTo({
  //     path: "/errors/unauthorized",
  //     query: { message: "You are not authorized to access this page." },
  //   });
  // }

  //return navigateTo(to); // No redirection needed
};
