Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54E4F66B295
	for <lists+linux-usb@lfdr.de>; Sun, 15 Jan 2023 17:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjAOQbE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Jan 2023 11:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjAOQbC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Jan 2023 11:31:02 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECBC4EDC
        for <linux-usb@vger.kernel.org>; Sun, 15 Jan 2023 08:31:01 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id e3so16156803wru.13
        for <linux-usb@vger.kernel.org>; Sun, 15 Jan 2023 08:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kERAq/jX3wBW1xkUqUoLgxzhFXacx+d0HiELuAOmTis=;
        b=LuOjOXQSbo5rPprgqThOL5vpfRPYMw2JF6ssnLv2HRofRDDdqS7PHoob447RCEYOIx
         28ohKoglb/dLe6nXgAMc+2IhQwkHUa9sC56Ngm8vz9w2Ce1vtm2ujSRbLKpZYVrbFH2S
         12tDZNK/9Mq4IUkCwVfcdgsVIMwxnpTMK0LMZYzO5tFCdyz69ar5IduRO0IIkXi664sC
         NE5LFBoLe+9xPy4xTUUfUdG8evt3u9mZ6+oaxiU2JnF2WtOb2YD8Ycy6/6jeaMTb90K0
         rB3MUBIzMfwr/EQQQ6eeEJr0j1TN4wx/BRQj9BrlSpK+gTiw7BSLMq5GEVAFSBnvUfAO
         3ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kERAq/jX3wBW1xkUqUoLgxzhFXacx+d0HiELuAOmTis=;
        b=iVzHyfe3Ge++hEI92VXihKcKp9mOV/pegWqLAFb3RNIDdKcM+Ox5+skMK9nnRrBOWk
         r+Kff7p0IJV0ptytdtLFUGVn/jB5gnAeExGX20a/SIBKPkW3SzwQx8IdkRbkfjLn7XQY
         e4Gfx9N5v6R0PEMizSdZNEGqaXllCvgTX69rigdL+OsU2EKiUYkA+7GYudaymdGfsCRt
         SBQf0DbYEriHiQGywyN6xfPgMR6DqSEi4JLMAnqRKGcK4dDudInraWB8552R1IJM8KDf
         dLOlbexKwBPCElLtSdkp/MaqC9+aRULi+Xt9Pv37md3Qy/RoS1RHoEM0VQ2rqx0WSOZy
         U2OA==
X-Gm-Message-State: AFqh2kolWCQunbYLDHMGXrGBC4uctdoD+XCo2ub8tZuoVp3I7KRNvFgU
        QTNkgn0iWS3pF9Flm3Jw6sNuf2axBgrgTw==
X-Google-Smtp-Source: AMrXdXtpQyuLVEpSNH68czW5DQVtTHZq0ZM7LGIVsOWi5MIAikCU+SyW3FPjlYxANJQje9uYp6hF7g==
X-Received: by 2002:a5d:5e8b:0:b0:2bd:fb81:6317 with SMTP id ck11-20020a5d5e8b000000b002bdfb816317mr2577412wrb.33.1673800259667;
        Sun, 15 Jan 2023 08:30:59 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d684f000000b002bddac15b3dsm8333188wrw.33.2023.01.15.08.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 08:30:59 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
        id 57CDABE2DE0; Sun, 15 Jan 2023 17:30:58 +0100 (CET)
Date:   Sun, 15 Jan 2023 17:30:58 +0100
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Gerald Lee <sundaywind2004@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: usb: A use-after-free Write in put_dev
Message-ID: <Y8QqQiJfLH8gwsOH@eldamar.lan>
References: <CAO3qeMVzXDP-JU6v1u5Ags6Q-bb35kg3=C6d04DjzA9ffa5x1g@mail.gmail.com>
 <Y5dV11OoM3ojxNHy@rowland.harvard.edu>
 <CAO3qeMWZLEJeKg4B6p6g=AHecexQ9iPBXttujzbvHz-hRGwQjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO3qeMWZLEJeKg4B6p6g=AHecexQ9iPBXttujzbvHz-hRGwQjg@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Dec 13, 2022 at 09:02:53AM +0800, Gerald Lee wrote:
> Hi Alan,
> 
> I've tested this patch. It resolves the problem.
> 
> Thanks.
> 
> 
> On Tue, Dec 13, 2022 at 12:24 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, Dec 12, 2022 at 04:07:43PM +0800, Gerald Lee wrote:
> > > Hi, all
> > >
> > > I found a vulnerability when fuzzing linux kernel by syzkaller. The
> > > KASAN reports that use-after-free Write in put_dev. Then I tried to
> > > reproduce and got the C source file. I compiled it and executed the
> > > binary program, but the kernel crashed as expected. This vulnerability
> > > could be used to LPE as UAF, I thought.
> >
> > I think this use-after-free violation is caused by a race among the
> > superblock operations in the gadgetfs driver.  Please try running your
> > test after applying the patch below, to see if it fixes the problem.
> >
> > Alan Stern
> >
> >
> > --- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
> > +++ usb-devel/drivers/usb/gadget/legacy/inode.c
> > @@ -229,6 +229,7 @@ static void put_ep (struct ep_data *data
> >   */
> >
> >  static const char *CHIP;
> > +static DEFINE_MUTEX(sb_mutex);         /* Serialize superblock maintenance */
> >
> >  /*----------------------------------------------------------------------*/
> >
> > @@ -2010,13 +2011,20 @@ gadgetfs_fill_super (struct super_block
> >  {
> >         struct inode    *inode;
> >         struct dev_data *dev;
> > +       int             rc;
> >
> > -       if (the_device)
> > -               return -ESRCH;
> > +       mutex_lock(&sb_mutex);
> > +
> > +       if (the_device) {
> > +               rc = -ESRCH;
> > +               goto Done;
> > +       }
> >
> >         CHIP = usb_get_gadget_udc_name();
> > -       if (!CHIP)
> > -               return -ENODEV;
> > +       if (!CHIP) {
> > +               rc = -ENODEV;
> > +               goto Done;
> > +       }
> >
> >         /* superblock */
> >         sb->s_blocksize = PAGE_SIZE;
> > @@ -2053,13 +2061,17 @@ gadgetfs_fill_super (struct super_block
> >          * from binding to a controller.
> >          */
> >         the_device = dev;
> > -       return 0;
> > +       rc = 0;
> > +       goto Done;
> >
> > -Enomem:
> > + Enomem:
> >         kfree(CHIP);
> >         CHIP = NULL;
> > +       rc = -ENOMEM;
> >
> > -       return -ENOMEM;
> > + Done:
> > +       mutex_unlock(&sb_mutex);
> > +       return rc;
> >  }
> >
> >  /* "mount -t gadgetfs path /dev/gadget" ends up here */
> > @@ -2081,6 +2093,7 @@ static int gadgetfs_init_fs_context(stru
> >  static void
> >  gadgetfs_kill_sb (struct super_block *sb)
> >  {
> > +       mutex_lock(&sb_mutex);
> >         kill_litter_super (sb);
> >         if (the_device) {
> >                 put_dev (the_device);
> > @@ -2088,6 +2101,7 @@ gadgetfs_kill_sb (struct super_block *sb
> >         }
> >         kfree(CHIP);
> >         CHIP = NULL;
> > +       mutex_unlock(&sb_mutex);
> >  }
> >
> >  /*----------------------------------------------------------------------*/

AFAICS, this patch has not yet been applied in mainline, is this
correct?

Regards,
Salvatore
