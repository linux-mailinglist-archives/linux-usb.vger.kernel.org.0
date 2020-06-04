Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670071EE3F5
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jun 2020 14:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbgFDMGB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jun 2020 08:06:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbgFDMGA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jun 2020 08:06:00 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39325C03E96E
        for <linux-usb@vger.kernel.org>; Thu,  4 Jun 2020 05:06:00 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id c14so5625576qka.11
        for <linux-usb@vger.kernel.org>; Thu, 04 Jun 2020 05:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10X0map6UOeGNTOAtJjcoZkFS3kyuEeuHwD1SVPg4bQ=;
        b=oMfNEmOdO72lJE24/sRZRqyyzU5L87JXMiN39g3iZUSaUx9wGVBhJG1llfPoLRVu3C
         E5CpVUeXgMGfCdXjSVFDTiEk8nzlkvW4IV1oEmJ1+5lhBQunofLf7lEl72TMswUFJmIW
         u++eT1tLghLvdkLJ5KIiOBYR8bDEtNBbjgsvJlVje96CGYMmWTba7TN7FPpfUOpV/r2+
         4idVzgLlaBUxE0hLzDNbcmvNmifHVOfZOKTrtpZR2czWRAq2uoVStcZTZ0wwilOwRwLj
         DX2fH4nTRvvwaaIBVnPUuEUQQaTgxYahsW3t+32m5Rbrh0BoAKnUcK5EKEi69m5WrGbp
         S5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10X0map6UOeGNTOAtJjcoZkFS3kyuEeuHwD1SVPg4bQ=;
        b=RiqnwdrdqRREaG4WGiPBSXFvG9kSOI7GheTwNNCIb6csjSPa5wOl+5bLJ2PEBCMQh6
         +Bb99dyuw7N/89ukEOAOwJwyMipS5wUJhKI3fzJYsxyhnAOPkpGrNwYFjTvYcu6scGUC
         0CD8f5zP3v2bGiLC0IqMqfRPiILnVY1XmyAU1IyPLl3RrExmtaVsFNaOtQUvSy+5xa1w
         BEDDg7plE4Mipng94qyTwYupjRx3ja0j0i1SCghOfnIQ/bF4WNe2udIyNtuwpVwadjXq
         tb9L52BSlZLZqhca4rSXBLky1XEheuiNqYsBYxJPOH0tqUT9u5AAOyyPbSrVk9q0lJlY
         nPNQ==
X-Gm-Message-State: AOAM5305Ng3qQ1xt/xdSf41mpqr7ESDCGX6hPV8GEp43ljFINl6AcU2e
        imXDw7i6XBs9+Q1zKXsEpYWDd8x6/y1s3ovJsj94Sg==
X-Google-Smtp-Source: ABdhPJwaLx2c3GthlyRENjofbQ7WxrJN7J7wcw4AxJv+iQH571VLbg+tKGZ3VinkSLrSzyFY8gg6Aqh5LxfbzUfAsAQ=
X-Received: by 2002:a05:620a:1428:: with SMTP id k8mr4067003qkj.43.1591272358982;
 Thu, 04 Jun 2020 05:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585233617.git.andreyknvl@google.com> <ab5e2885ce674ba6e04368551e51eeb6a2c11baf.1585233617.git.andreyknvl@google.com>
In-Reply-To: <ab5e2885ce674ba6e04368551e51eeb6a2c11baf.1585233617.git.andreyknvl@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 4 Jun 2020 14:05:47 +0200
Message-ID: <CACT4Y+bn1xR6YS-+mLsoneMriYEJRz37D-NDwp_M=4f3u0f_Zw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] kcov: cleanup debug messages
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrew Morton <akpm@linux-foundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 26, 2020 at 3:44 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> Previous commit left a lot of excessive debug messages, clean them up.
>
> Signed-off-by: Andrey Konovalov <andreyknvl@google.com>

Reviewed-by: Dmitry Vyukov <dvyukov@google.com>

> ---
>  kernel/kcov.c | 22 ++--------------------
>  1 file changed, 2 insertions(+), 20 deletions(-)
>
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index f50354202dbe..f6bd119c9419 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -98,6 +98,7 @@ static struct kcov_remote *kcov_remote_find(u64 handle)
>         return NULL;
>  }
>
> +/* Must be called with kcov_remote_lock locked. */
>  static struct kcov_remote *kcov_remote_add(struct kcov *kcov, u64 handle)
>  {
>         struct kcov_remote *remote;
> @@ -119,16 +120,13 @@ static struct kcov_remote_area *kcov_remote_area_get(unsigned int size)
>         struct kcov_remote_area *area;
>         struct list_head *pos;
>
> -       kcov_debug("size = %u\n", size);
>         list_for_each(pos, &kcov_remote_areas) {
>                 area = list_entry(pos, struct kcov_remote_area, list);
>                 if (area->size == size) {
>                         list_del(&area->list);
> -                       kcov_debug("rv = %px\n", area);
>                         return area;
>                 }
>         }
> -       kcov_debug("rv = NULL\n");
>         return NULL;
>  }
>
> @@ -136,7 +134,6 @@ static struct kcov_remote_area *kcov_remote_area_get(unsigned int size)
>  static void kcov_remote_area_put(struct kcov_remote_area *area,
>                                         unsigned int size)
>  {
> -       kcov_debug("area = %px, size = %u\n", area, size);
>         INIT_LIST_HEAD(&area->list);
>         area->size = size;
>         list_add(&area->list, &kcov_remote_areas);
> @@ -366,7 +363,6 @@ static void kcov_remote_reset(struct kcov *kcov)
>         hash_for_each_safe(kcov_remote_map, bkt, tmp, remote, hnode) {
>                 if (remote->kcov != kcov)
>                         continue;
> -               kcov_debug("removing handle %llx\n", remote->handle);
>                 hash_del(&remote->hnode);
>                 kfree(remote);
>         }
> @@ -553,7 +549,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>
>         switch (cmd) {
>         case KCOV_INIT_TRACE:
> -               kcov_debug("KCOV_INIT_TRACE\n");
>                 /*
>                  * Enable kcov in trace mode and setup buffer size.
>                  * Must happen before anything else.
> @@ -572,7 +567,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                 kcov->mode = KCOV_MODE_INIT;
>                 return 0;
>         case KCOV_ENABLE:
> -               kcov_debug("KCOV_ENABLE\n");
>                 /*
>                  * Enable coverage for the current task.
>                  * At this point user must have been enabled trace mode,
> @@ -598,7 +592,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                 kcov_get(kcov);
>                 return 0;
>         case KCOV_DISABLE:
> -               kcov_debug("KCOV_DISABLE\n");
>                 /* Disable coverage for the current task. */
>                 unused = arg;
>                 if (unused != 0 || current->kcov != kcov)
> @@ -610,7 +603,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                 kcov_put(kcov);
>                 return 0;
>         case KCOV_REMOTE_ENABLE:
> -               kcov_debug("KCOV_REMOTE_ENABLE\n");
>                 if (kcov->mode != KCOV_MODE_INIT || !kcov->area)
>                         return -EINVAL;
>                 t = current;
> @@ -629,7 +621,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                 kcov->remote_size = remote_arg->area_size;
>                 spin_lock(&kcov_remote_lock);
>                 for (i = 0; i < remote_arg->num_handles; i++) {
> -                       kcov_debug("handle %llx\n", remote_arg->handles[i]);
>                         if (!kcov_check_handle(remote_arg->handles[i],
>                                                 false, true, false)) {
>                                 spin_unlock(&kcov_remote_lock);
> @@ -644,8 +635,6 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                         }
>                 }
>                 if (remote_arg->common_handle) {
> -                       kcov_debug("common handle %llx\n",
> -                                       remote_arg->common_handle);
>                         if (!kcov_check_handle(remote_arg->common_handle,
>                                                 true, false, false)) {
>                                 spin_unlock(&kcov_remote_lock);
> @@ -782,7 +771,6 @@ void kcov_remote_start(u64 handle)
>         spin_lock(&kcov_remote_lock);
>         remote = kcov_remote_find(handle);
>         if (!remote) {
> -               kcov_debug("no remote found");
>                 spin_unlock(&kcov_remote_lock);
>                 return;
>         }
> @@ -810,8 +798,6 @@ void kcov_remote_start(u64 handle)
>         /* Reset coverage size. */
>         *(u64 *)area = 0;
>
> -       kcov_debug("area = %px, size = %u", area, size);
> -
>         kcov_start(t, size, area, mode, sequence);
>
>  }
> @@ -881,10 +867,8 @@ void kcov_remote_stop(void)
>         unsigned int size = t->kcov_size;
>         int sequence = t->kcov_sequence;
>
> -       if (!kcov) {
> -               kcov_debug("no kcov found\n");
> +       if (!kcov)
>                 return;
> -       }
>
>         kcov_stop(t);
>         t->kcov = NULL;
> @@ -894,8 +878,6 @@ void kcov_remote_stop(void)
>          * KCOV_DISABLE could have been called between kcov_remote_start()
>          * and kcov_remote_stop(), hence the check.
>          */
> -       kcov_debug("move if: %d == %d && %d\n",
> -               sequence, kcov->sequence, (int)kcov->remote);
>         if (sequence == kcov->sequence && kcov->remote)
>                 kcov_move_area(kcov->mode, kcov->area, kcov->size, area);
>         spin_unlock(&kcov->lock);
> --
> 2.26.0.rc2.310.g2932bb562d-goog
>
