Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7234D58AC67
	for <lists+linux-usb@lfdr.de>; Fri,  5 Aug 2022 16:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236804AbiHEObJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Aug 2022 10:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbiHEObJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Aug 2022 10:31:09 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9C631DF99
        for <linux-usb@vger.kernel.org>; Fri,  5 Aug 2022 07:31:05 -0700 (PDT)
Received: (qmail 698160 invoked by uid 1000); 5 Aug 2022 10:31:04 -0400
Date:   Fri, 5 Aug 2022 10:31:04 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC v2] USB: core: add a way to revoke access to open USB
 devices
Message-ID: <Yu0pqAYRfS46pte3@rowland.harvard.edu>
References: <20220804160306.134014-1-hadess@hadess.net>
 <YuwaFbxckLfnqhyv@rowland.harvard.edu>
 <b050e5b9f3ff1ff6da77483557e014f3e5ed4ece.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b050e5b9f3ff1ff6da77483557e014f3e5ed4ece.camel@hadess.net>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 05, 2022 at 02:38:16PM +0200, Bastien Nocera wrote:
> On Thu, 2022-08-04 at 15:12 -0400, Alan Stern wrote:
> > If you're going to revoke access to devices upon session switching, 
> > shouldn't the mechanism be more general?  I mean, shouldn't it apply
> > to 
> > all sorts of devices, not just those that happen to be USB?
> 
> I don't see how that could be done in a generic way without causing
> problems for devices accessed by multiple different parts of the OS.

I don't know enough about the issues involved to help much.  Still, 
doesn't it make more sense to offer logind a single API for revoking a 
session's access to all appropriate devices, rather than one API for 
revoking access to USB devices, another API for revoking access to HID 
devices, another API for revoking access to serial devices, another API 
for... etc.?

This sounds a lot like the old BSD concept of "foreground" and 
"background" ttys.  It didn't rely on revoking access to anything; maybe 
you should try to follow that example instead.

Why would multiple different parts of the OS cause problems?

> Revoking doesn't invalidate the file descriptor (whether in the
> existing evdev revoke ioctl, or this USB function), and as you can see
> in the patch, there are still things that can be done on the device
> even when revoked.

I didn't notice anything that can still be done.  You might be able, for 
instance, to do an lseek on the device file descriptor, but that doesn't 
affect the device.

> > Also, if you're going to use session switching as your criterion for 
> > revoking access to USB devices then what will you do to restore
> > access 
> > when the session switches back?
> 
> It's up to the application to do that. This is, for example, what
> compositors do when accessing input devices which already have their
> own revoke ioctl.

Okay, I'll take your word for it.  I'm not sure it's a good idea.

> > > I have some notes and questions on the API as it is exposed.
> > > 
> > > - I didn't see a point in having multiple kernel functions as entry
> > >   points as I was going to use a single BPF program as an entry
> > > point,
> > >   which can check the arguments. Can I rely on the BPF program
> > > checking
> > >   those arguments, or should I re-check them again in the kernel
> > >   implementation?
> > 
> > What is there to check?
> 
> Whether either busnum and devnum were passed, or a valid UID.

Does it really matter if none of them are valid values?  The call will 
end up doing nothing, but that's not really an error.

For that matter, how do you define whether a UID is valid?  As far as I 
know, the kernel doesn't keep track of valid UIDs; userspace does (in the 
/etc/passwd file or equivalent).

> > For that matter, are you certain that basing this on the UID is the
> > right 
> > way to go?  What if there are two different login sessions both using
> > the 
> > same UID?
> 
> Do you know another identifier that's not kernel internal, or relying
> on logind knowing the fd that we could use to differentiate those 2
> users?

Process or session ID, perhaps?  But I don't have a clear idea of how all 
this is meant to fit together.

> Is there a use case for a USB device being opened, two separate
> interfaces being claimed, by two different user sessions of the same
> user?

Well, you can ssh into the same machine from two different windows at the 
same time, and each of those ssh sessions could claim a different 
interface in the same USB device.  (In theory, that is; but maybe you 
don't want to allow ssh sessions to access USB devices at all.)

Alan Stern
