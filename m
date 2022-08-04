Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B5158A11B
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 21:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbiHDTMY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 15:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiHDTMY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 15:12:24 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4B99E5244E
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 12:12:22 -0700 (PDT)
Received: (qmail 674506 invoked by uid 1000); 4 Aug 2022 15:12:21 -0400
Date:   Thu, 4 Aug 2022 15:12:21 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC v2] USB: core: add a way to revoke access to open USB
 devices
Message-ID: <YuwaFbxckLfnqhyv@rowland.harvard.edu>
References: <20220804160306.134014-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804160306.134014-1-hadess@hadess.net>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 04, 2022 at 06:03:04PM +0200, Bastien Nocera wrote:
> Hey,
> 
> This is a follow-up to "[RFC v1] USB: core: add USBDEVFS_REVOKE ioctl" from April.
> 
> The end-goal is being able to cut-off access to USB devices for
> applications/programs that open raw USB devices using, in most cases,
> libusb.
> 
> I've implemented this using BPF, so we don't need to add new ioctls.

I'm not sure that's a good reason for using BPF.

> The presence or absence of that feature can be evaluated at runtime,
> and can be used to implement revoke support on session switching,
> in logind for example:
> https://github.com/hadess/usb-revoke-userspace/

This isn't clear.  Are you talking about having the kernel automatically 
do this when certain conditions are met?  Or do you mean that logind 
could invoke the BPF program at the appropriate times?

Left unsaid here is that logind generally won't have a file descriptor 
for any of the open USB devices that it wants to revoke access to.  
That's a good reason to use BPF instead of ioctl.

If you're going to revoke access to devices upon session switching, 
shouldn't the mechanism be more general?  I mean, shouldn't it apply to 
all sorts of devices, not just those that happen to be USB?

Also, if you're going to use session switching as your criterion for 
revoking access to USB devices then what will you do to restore access 
when the session switches back?

> I have some notes and questions on the API as it is exposed.
> 
> - I didn't see a point in having multiple kernel functions as entry
>   points as I was going to use a single BPF program as an entry point,
>   which can check the arguments. Can I rely on the BPF program checking
>   those arguments, or should I re-check them again in the kernel
>   implementation?

What is there to check?

> - Are my UID checks correct if I expect revoking to be called outside
>   namespaces, on the effective UID of the user. Is there a way to assert
>   that?

We're probably not the right people to ask.  You could try Eric 
Biederman.

> - Is there a good "errno" error for ENOSUCHUSER for using in the
>   usb_revoke() loop if we couldn't find any USB device matching the
>   requested user?

Why do you want that to be an error?  If you tell the kernel "Remove all 
access to USB devices for user X", why should it be an error if X doesn't 
have any open file descriptors for USB devices?

For that matter, are you certain that basing this on the UID is the right 
way to go?  What if there are two different login sessions both using the 
same UID?

Alan Stern

> 
> Cheers
> 
> Bastien Nocera (2):
>   USB: core: add a way to revoke access to open USB devices
>   usb: Implement usb_revoke() BPF function
> 
>  drivers/usb/core/devio.c | 105 ++++++++++++++++++++++++++++++++++++---
>  drivers/usb/core/usb.c   |  51 +++++++++++++++++++
>  drivers/usb/core/usb.h   |   8 +++
>  3 files changed, 158 insertions(+), 6 deletions(-)
> 
> -- 
> 2.36.1
> 
