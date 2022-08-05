Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A92358AAEE
	for <lists+linux-usb@lfdr.de>; Fri,  5 Aug 2022 14:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240554AbiHEMiW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 5 Aug 2022 08:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiHEMiV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Aug 2022 08:38:21 -0400
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [IPv6:2001:4b98:dc4:8::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDAD65645
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 05:38:20 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 93E74200011;
        Fri,  5 Aug 2022 12:38:17 +0000 (UTC)
Message-ID: <b050e5b9f3ff1ff6da77483557e014f3e5ed4ece.camel@hadess.net>
Subject: Re: [RFC v2] USB: core: add a way to revoke access to open USB
 devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Fri, 05 Aug 2022 14:38:16 +0200
In-Reply-To: <YuwaFbxckLfnqhyv@rowland.harvard.edu>
References: <20220804160306.134014-1-hadess@hadess.net>
         <YuwaFbxckLfnqhyv@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2022-08-04 at 15:12 -0400, Alan Stern wrote:
> On Thu, Aug 04, 2022 at 06:03:04PM +0200, Bastien Nocera wrote:
> > Hey,
> > 
> > This is a follow-up to "[RFC v1] USB: core: add USBDEVFS_REVOKE
> > ioctl" from April.
> > 
> > The end-goal is being able to cut-off access to USB devices for
> > applications/programs that open raw USB devices using, in most
> > cases,
> > libusb.
> > 
> > I've implemented this using BPF, so we don't need to add new
> > ioctls.
> 
> I'm not sure that's a good reason for using BPF.
> 
> > The presence or absence of that feature can be evaluated at
> > runtime,
> > and can be used to implement revoke support on session switching,
> > in logind for example:
> > https://github.com/hadess/usb-revoke-userspace/
> 
> This isn't clear.  Are you talking about having the kernel
> automatically 
> do this when certain conditions are met?  Or do you mean that logind 
> could invoke the BPF program at the appropriate times?

logind would be the one loading and executing the BPF program. I've
slightly reworded the first paragraph in the 2nd patch, but it's pretty
clear there that the functionality is implemented in user-space, and
the BPF acts as a bridge.

> Left unsaid here is that logind generally won't have a file
> descriptor 
> for any of the open USB devices that it wants to revoke access to.  
> That's a good reason to use BPF instead of ioctl.

That's right. I've make a note of this in the BPF patch.

> If you're going to revoke access to devices upon session switching, 
> shouldn't the mechanism be more general?  I mean, shouldn't it apply
> to 
> all sorts of devices, not just those that happen to be USB?

I don't see how that could be done in a generic way without causing
problems for devices accessed by multiple different parts of the OS.

Revoking doesn't invalidate the file descriptor (whether in the
existing evdev revoke ioctl, or this USB function), and as you can see
in the patch, there are still things that can be done on the device
even when revoked.

> Also, if you're going to use session switching as your criterion for 
> revoking access to USB devices then what will you do to restore
> access 
> when the session switches back?

It's up to the application to do that. This is, for example, what
compositors do when accessing input devices which already have their
own revoke ioctl.

> > I have some notes and questions on the API as it is exposed.
> > 
> > - I didn't see a point in having multiple kernel functions as entry
> >   points as I was going to use a single BPF program as an entry
> > point,
> >   which can check the arguments. Can I rely on the BPF program
> > checking
> >   those arguments, or should I re-check them again in the kernel
> >   implementation?
> 
> What is there to check?

Whether either busnum and devnum were passed, or a valid UID.

> > - Are my UID checks correct if I expect revoking to be called
> > outside
> >   namespaces, on the effective UID of the user. Is there a way to
> > assert
> >   that?
> 
> We're probably not the right people to ask.  You could try Eric 
> Biederman.
> 

I'll CC: Eric on the next patch then.

> > - Is there a good "errno" error for ENOSUCHUSER for using in the
> >   usb_revoke() loop if we couldn't find any USB device matching the
> >   requested user?
> 
> Why do you want that to be an error?  If you tell the kernel "Remove
> all 
> access to USB devices for user X", why should it be an error if X
> doesn't 
> have any open file descriptors for USB devices?

I imagined that it would be useful to know whether any devices were
found, or any users matched, but I guess this isn't strictly necessary.
I'll remove it.

> 
> For that matter, are you certain that basing this on the UID is the
> right 
> way to go?  What if there are two different login sessions both using
> the 
> same UID?

Do you know another identifier that's not kernel internal, or relying
on logind knowing the fd that we could use to differentiate those 2
users?

Is there a use case for a USB device being opened, two separate
interfaces being claimed, by two different user sessions of the same
user?

> 
> Alan Stern
> 
> > 
> > Cheers
> > 
> > Bastien Nocera (2):
> >   USB: core: add a way to revoke access to open USB devices
> >   usb: Implement usb_revoke() BPF function
> > 
> >  drivers/usb/core/devio.c | 105
> > ++++++++++++++++++++++++++++++++++++---
> >  drivers/usb/core/usb.c   |  51 +++++++++++++++++++
> >  drivers/usb/core/usb.h   |   8 +++
> >  3 files changed, 158 insertions(+), 6 deletions(-)
> > 
> > -- 
> > 2.36.1
> > 

