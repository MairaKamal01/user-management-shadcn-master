<script lang="ts" setup>
import { vAutoAnimate } from "@formkit/auto-animate/vue";
import type { currentUserType } from "~/types";
const currentUser = useState<currentUserType | null>("currentUser");

const handleLogout = () => {
  const supabase = useSupabaseClient();
  supabase.auth.signOut();
  navigateTo("/");
};
</script>

<template>
  <div v-auto-animate>
    <div v-if="!currentUser" class="hidden pl-1 gap-1 md:flex items-center">
      <Button as-child>
        <RouterLink to="/auth/login"> Login </RouterLink>
      </Button>
    </div>
    <div v-else class="hidden pl-1 gap-1 md:flex items-center">
      <DropdownMenu>
        <DropdownMenuTrigger as-child
          ><Avatar class="h-10 w-10 cursor-pointer">
            <Icon
              name="material-symbols:person"
              class="h-7 w-7 text-gray-500 dark:text-gray-100"
            />
          </Avatar>
        </DropdownMenuTrigger>
        <DropdownMenuContent>
          <DropdownMenuLabel>{{ currentUser.email }}</DropdownMenuLabel>
          <DropdownMenuSeparator />
          <DropdownMenuItem class="font-semibold cursor-pointer text-primary"
            >Admin Pannel</DropdownMenuItem
          >
          <DropdownMenuItem>My Account</DropdownMenuItem>
          <DropdownMenuItem>Billing</DropdownMenuItem>
          <DropdownMenuItem>Team</DropdownMenuItem>
          <DropdownMenuSeparator />
          <DropdownMenuItem class="p-0 m-0"
            ><Button @click="handleLogout" class="w-full p-0 m-0">
              Log Out
            </Button>
          </DropdownMenuItem>
        </DropdownMenuContent>
      </DropdownMenu>
    </div>
  </div>
</template>

<style></style>
