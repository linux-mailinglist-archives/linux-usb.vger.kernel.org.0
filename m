Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C78264ACBD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Dec 2022 02:03:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbiLMBDI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Dec 2022 20:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbiLMBDG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Dec 2022 20:03:06 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA6062E4
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 17:03:05 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id jn7so13904111plb.13
        for <linux-usb@vger.kernel.org>; Mon, 12 Dec 2022 17:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wymRyJGrAg5W7ZlSo8qgeyYuXlFFAiVwqRyblVRmZq0=;
        b=efu1Vv5aR+ZmfheeYiWJDz56/EgD+2hdAjoxUiVraw3R5fUC+c8QdpC5SKG3epufEN
         UUTnhNYDZKB9llvWY+rFkBTRNbNBGxKl1fORV8E51oaUbFXDpsz9anaeQlyN3vrmqGB2
         kqEdsu9XcuxM1ZZ2qZ56rbs7+TiXxYvYN+3qhIhCCaCf89KWzunxbjpleR+zBAFw4LOi
         1AjzKPEEBgtxhqOFURx8CsHtS44zF4CSKvIGpa5OLSS+MD96mZIc5e2nW1ihvcqzVVUS
         chkQqr4WOVigUE4TKL+j4ceiRF7uqaMngsBrjX9FMIQe7VMDTTze5MhXbIB0QQFV7G/p
         qmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wymRyJGrAg5W7ZlSo8qgeyYuXlFFAiVwqRyblVRmZq0=;
        b=Nk0BSRmj9sYMk2gySj6AaNeKdIDe2uqszErIZtXaNYVTBrva6OeVBHjoD0YTHeqpt3
         naG5MmIn/cttP5gJkc1HV3ALg6T+kJcBIuJtZlRngfrN1pnk64AN140MSwuRoR3c9lvl
         7gzXTCWwGU+9XAGVmDmPDCniZy2/y2Kz9SGV1/XJ9BMWHN73FPrPUJ5q6+SG8TggxLoc
         jAk9NhR4eK2oe2Cv7qpji9k95MTYdMVDxtdJZzI4t+UTzD3nbNk7ZCHUpyzchIAvKueA
         6EruWmGaGEAGR4sg6upJgudrD62afzENVyp2Ri8Cq80/NrpFGlemqQBwZXCp36vtsWaj
         IFSw==
X-Gm-Message-State: ANoB5pkmrDCOeWDNLeMTHwuC/+xc4Wgy4kAtl074gc+0gf13vpB8s3vr
        s1M3NEzrZOUMWeoXnB/nbwf9Np4RyIaAVeVMqig=
X-Google-Smtp-Source: AA0mqf60DTbXze1BrgwrJiEUU8zAuN6i+bisEMLYuvXCe4EGnjS2+cv/+QnNH7dox0uPxnHV/IYzrFSdrK2Ce73FrBA=
X-Received: by 2002:a17:90a:764b:b0:219:bef2:8fb3 with SMTP id
 s11-20020a17090a764b00b00219bef28fb3mr150363pjl.66.1670893385057; Mon, 12 Dec
 2022 17:03:05 -0800 (PST)
MIME-Version: 1.0
References: <CAO3qeMVzXDP-JU6v1u5Ags6Q-bb35kg3=C6d04DjzA9ffa5x1g@mail.gmail.com>
 <Y5dV11OoM3ojxNHy@rowland.harvard.edu>
In-Reply-To: <Y5dV11OoM3ojxNHy@rowland.harvard.edu>
From:   Gerald Lee <sundaywind2004@gmail.com>
Date:   Tue, 13 Dec 2022 09:02:53 +0800
Message-ID: <CAO3qeMWZLEJeKg4B6p6g=AHecexQ9iPBXttujzbvHz-hRGwQjg@mail.gmail.com>
Subject: Re: usb: A use-after-free Write in put_dev
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

I've tested this patch. It resolves the problem.

Thanks.


On Tue, Dec 13, 2022 at 12:24 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Dec 12, 2022 at 04:07:43PM +0800, Gerald Lee wrote:
> > Hi, all
> >
> > I found a vulnerability when fuzzing linux kernel by syzkaller. The
> > KASAN reports that use-after-free Write in put_dev. Then I tried to
> > reproduce and got the C source file. I compiled it and executed the
> > binary program, but the kernel crashed as expected. This vulnerability
> > could be used to LPE as UAF, I thought.
>
> I think this use-after-free violation is caused by a race among the
> superblock operations in the gadgetfs driver.  Please try running your
> test after applying the patch below, to see if it fixes the problem.
>
> Alan Stern
>
>
> --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> @@ -229,6 +229,7 @@ static void put_ep (struct ep_data *data
>   */
>
>  static const char *CHIP;
> +static DEFINE_MUTEX(sb_mutex);         /* Serialize superblock maintenance */
>
>  /*----------------------------------------------------------------------*/
>
> @@ -2010,13 +2011,20 @@ gadgetfs_fill_super (struct super_block
>  {
>         struct inode    *inode;
>         struct dev_data *dev;
> +       int             rc;
>
> -       if (the_device)
> -               return -ESRCH;
> +       mutex_lock(&sb_mutex);
> +
> +       if (the_device) {
> +               rc = -ESRCH;
> +               goto Done;
> +       }
>
>         CHIP = usb_get_gadget_udc_name();
> -       if (!CHIP)
> -               return -ENODEV;
> +       if (!CHIP) {
> +               rc = -ENODEV;
> +               goto Done;
> +       }
>
>         /* superblock */
>         sb->s_blocksize = PAGE_SIZE;
> @@ -2053,13 +2061,17 @@ gadgetfs_fill_super (struct super_block
>          * from binding to a controller.
>          */
>         the_device = dev;
> -       return 0;
> +       rc = 0;
> +       goto Done;
>
> -Enomem:
> + Enomem:
>         kfree(CHIP);
>         CHIP = NULL;
> +       rc = -ENOMEM;
>
> -       return -ENOMEM;
> + Done:
> +       mutex_unlock(&sb_mutex);
> +       return rc;
>  }
>
>  /* "mount -t gadgetfs path /dev/gadget" ends up here */
> @@ -2081,6 +2093,7 @@ static int gadgetfs_init_fs_context(stru
>  static void
>  gadgetfs_kill_sb (struct super_block *sb)
>  {
> +       mutex_lock(&sb_mutex);
>         kill_litter_super (sb);
>         if (the_device) {
>                 put_dev (the_device);
> @@ -2088,6 +2101,7 @@ gadgetfs_kill_sb (struct super_block *sb
>         }
>         kfree(CHIP);
>         CHIP = NULL;
> +       mutex_unlock(&sb_mutex);
>  }
>
>  /*----------------------------------------------------------------------*/
