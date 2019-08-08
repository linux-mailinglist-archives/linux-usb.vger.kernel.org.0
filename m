Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB61B86840
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 19:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732708AbfHHRnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 13:43:37 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:58142 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727096AbfHHRnh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Aug 2019 13:43:37 -0400
Received: (qmail 3145 invoked by uid 2102); 8 Aug 2019 13:43:36 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 8 Aug 2019 13:43:36 -0400
Date:   Thu, 8 Aug 2019 13:43:36 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Oliver Neukum <oliver@neukum.org>
cc:     andreyknvl@google.com, <syzkaller-bugs@googlegroups.com>,
        <gregkh@linuxfoundation.org>,
        syzbot <syzbot+7bbcbe9c9ff0cd49592a@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: possible deadlock in iowarrior
In-Reply-To: <1565187142.15973.3.camel@neukum.org>
Message-ID: <Pine.LNX.4.44L0.1908081334580.1319-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 7 Aug 2019, Oliver Neukum wrote:

> > PS: syzbot reported a similar lock inversion problem (involving two
> > mutexes rather than just one) in drivers/usb/misc/iowarrior.c.  
> > Probably the two drivers need similar fixes.
> 
> No, but I got a fix.
> 
> 	Regards
> 		Oliver
> 
> From 973e82b3f583113e4d7fe5cd2f918a16022c4e38 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 6 Aug 2019 16:17:54 +0200
> Subject: [PATCH] usb: iowarrior: fix deadlock on disconnect
> 
> We have to drop the mutex before we close() upon disconnect()
> as close() needs the lock. This is safe to do by dropping the
> mutex as intfdata is already set to NULL, so open() will fail.
> 
> Fixes: 03f36e885fc26 ("USB: open disconnect race in iowarrior")
> Reported-by: syzbot+a64a382964bf6c71a9c0@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/misc/iowarrior.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
> index ba05dd80a020..f5bed9f29e56 100644
> --- a/drivers/usb/misc/iowarrior.c
> +++ b/drivers/usb/misc/iowarrior.c
> @@ -866,19 +866,20 @@ static void iowarrior_disconnect(struct usb_interface *interface)
>  	dev = usb_get_intfdata(interface);
>  	mutex_lock(&iowarrior_open_disc_lock);
>  	usb_set_intfdata(interface, NULL);
> +	/* prevent device read, write and ioctl */
> +	dev->present = 0;
>  
>  	minor = dev->minor;
> +	mutex_unlock(&iowarrior_open_disc_lock);
> +	/* give back our minor - this will call close() locks need to be dropped at this point*/

Ungrammatical and untrue: usb_deregister_dev() does not call close().

>  
> -	/* give back our minor */
>  	usb_deregister_dev(interface, &iowarrior_class);
>  
>  	mutex_lock(&dev->mutex);
>  
>  	/* prevent device read, write and ioctl */
> -	dev->present = 0;
>  
>  	mutex_unlock(&dev->mutex);
> -	mutex_unlock(&iowarrior_open_disc_lock);

That part looks weird.  The critical section is empty, except for a 
comment.  Maybe you meant to lock dev->mutex around the assignment to 
dev->present above?

In any case, this driver still seems to have at least one unnecessary 
mutex.  Look at the locking mess in iowarrior_open().

Alan Stern

