Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDA858D603
	for <lists+linux-usb@lfdr.de>; Tue,  9 Aug 2022 11:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbiHIJKX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 9 Aug 2022 05:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbiHIJKU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Aug 2022 05:10:20 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F06D7F
        for <linux-usb@vger.kernel.org>; Tue,  9 Aug 2022 02:10:17 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 25743FF808;
        Tue,  9 Aug 2022 09:10:14 +0000 (UTC)
Message-ID: <f193c5efbcca6d6577c93ec62559f81db35a11db.camel@hadess.net>
Subject: Re: [RFC v2] USB: core: add a way to revoke access to open USB
 devices
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Tue, 09 Aug 2022 11:10:14 +0200
In-Reply-To: <Yu0pqAYRfS46pte3@rowland.harvard.edu>
References: <20220804160306.134014-1-hadess@hadess.net>
         <YuwaFbxckLfnqhyv@rowland.harvard.edu>
         <b050e5b9f3ff1ff6da77483557e014f3e5ed4ece.camel@hadess.net>
         <Yu0pqAYRfS46pte3@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2022-08-05 at 10:31 -0400, Alan Stern wrote:
> > On Fri, Aug 05, 2022 at 02:38:16PM +0200, Bastien Nocera wrote:
> > > > On Thu, 2022-08-04 at 15:12 -0400, Alan Stern wrote:
> > > > > > If you're going to revoke access to devices upon session >
> > > > > > > > switching, 
> > > > > > shouldn't the mechanism be more general?  I mean, shouldn't
> > > > > > it > > > apply
> > > > > > to 
> > > > > > all sorts of devices, not just those that happen to be USB?
> > > > 
> > > > I don't see how that could be done in a generic way without
> > > > causing
> > > > problems for devices accessed by multiple different parts of
> > > > the > > OS.
> > 
> > I don't know enough about the issues involved to help much.  Still,
> > doesn't it make more sense to offer logind a single API for
> > revoking > a 
> > session's access to all appropriate devices, rather than one API
> > for 
> > revoking access to USB devices, another API for revoking access to
> > > HID 
> > devices, another API for revoking access to serial devices, another
> > > API 
> > for... etc.?
> > 
> > This sounds a lot like the old BSD concept of "foreground" and 
> > "background" ttys.  It didn't rely on revoking access to anything;
> > > maybe 
> > you should try to follow that example instead.

Would be happy to read up about the BSD concept of background and
foreground ttys, although I doubt that they dealt with the same sort of
devices we're dealing with here, but I couldn't find any useful
information about it (loads of info on changing the tty's background
colour or putting processes in the background using bash...).

About having a single revoking API, others have already mentioned
revoking "all types of devices" when this was first brought up in
April. There's a couple of problems though.

For USB at least, we already have a long-tail of existing applications
and APIs, and we don't have file descriptors to manipulate as we don't
have a proxy/broker for those apps. So a file descriptor solution like
revoke() wouldn't work for our use.

The other problem is that because we don't have a file descriptor, we
need another way to identify devices, and that can only be
hardware/bus/type specific.

Finally we don't want or need to revoke access to *all* the devices, or
even to all the real devices, when fast-user switching. There will be
cases where a particular device can used through 2 different interfaces
where it will be useful for the user to hang on to. This sounds like a
policy decision which is best taken in user-space.
> 

> > > > Revoking doesn't invalidate the file descriptor (whether in the
> > > > existing evdev revoke ioctl, or this USB function), and as you
> > > > can > > see
> > > > in the patch, there are still things that can be done on the
> > > > device
> > > > even when revoked.
> > 
> > I didn't notice anything that can still be done.  You might be
> > able, > for 
> > instance, to do an lseek on the device file descriptor, but that >
> > doesn't 
> > affect the device.

You can still reap the in-flight URBs, and the device is inert, not
closed.

If the app doesn't know anything, then USB traffic just stopped, and
any other contact will fail. If the app does know, it knows that it
doesn't have to let go of the file descriptor, and when the user's
session is back active and presumably the user gains back access to the
device node, it can reopen the fd.

> > 
> > > > > > Also, if you're going to use session switching as your
> > > > > > criterion > > > for 
> > > > > > revoking access to USB devices then what will you do to
> > > > > > restore
> > > > > > access 
> > > > > > when the session switches back?
> > > > 
> > > > It's up to the application to do that. This is, for example,
> > > > what
> > > > compositors do when accessing input devices which already have
> > > > > > their
> > > > own revoke ioctl.
> > 
> > Okay, I'll take your word for it.  I'm not sure it's a good idea.

The process goes something like:
- change permissions on the device node so user A can't access it
- revoke access so that the device is effectively "muted"
- change permissions on the device node so user B can access it

It's already what exists for input devices.

> > 
> > > > > > > > I have some notes and questions on the API as it is
> > > > > > > > exposed.
> > > > > > > > 
> > > > > > > > - I didn't see a point in having multiple kernel
> > > > > > > > functions as > > > > entry
> > > > > > > >   points as I was going to use a single BPF program as
> > > > > > > > an entry
> > > > > > > > point,
> > > > > > > >   which can check the arguments. Can I rely on the BPF
> > > > > > > > program
> > > > > > > > checking
> > > > > > > >   those arguments, or should I re-check them again in
> > > > > > > > the > > > > kernel
> > > > > > > >   implementation?
> > > > > > 
> > > > > > What is there to check?
> > > > 
> > > > Whether either busnum and devnum were passed, or a valid UID.
> > 
> > Does it really matter if none of them are valid values?  The call >
> > will 
> > end up doing nothing, but that's not really an error.
> > 
> > For that matter, how do you define whether a UID is valid?  As far
> > as > I 
> > know, the kernel doesn't keep track of valid UIDs; userspace does
> > (in > the 
> > /etc/passwd file or equivalent).

I meant valid as in "being a positive integer".

> > 
> > > > > > For that matter, are you certain that basing this on the
> > > > > > UID is > > > the
> > > > > > right 
> > > > > > way to go?  What if there are two different login sessions
> > > > > > both > > > using
> > > > > > the 
> > > > > > same UID?
> > > > 
> > > > Do you know another identifier that's not kernel internal, or >
> > > > > relying
> > > > on logind knowing the fd that we could use to differentiate
> > > > those 2
> > > > users?
> > 
> > Process or session ID, perhaps?  But I don't have a clear idea of
> > how > all 
> > this is meant to fit together.
> > 
> > > > Is there a use case for a USB device being opened, two separate
> > > > interfaces being claimed, by two different user sessions of the
> > > > > > same
> > > > user?
> > 
> > Well, you can ssh into the same machine from two different windows
> > at > the 
> > same time, and each of those ssh sessions could claim a different 
> > interface in the same USB device.  (In theory, that is; but maybe
> > you
> > don't want to allow ssh sessions to access USB devices at all.)

It's a user-space policy whether to do that or not. I don't believe
that any permissions get changed/device access would get revoked until
the user's last session is closed.

Cheers
