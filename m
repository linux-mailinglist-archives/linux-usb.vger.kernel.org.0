Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58E5350E434
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 17:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239234AbiDYPUh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 25 Apr 2022 11:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237175AbiDYPUg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 11:20:36 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A6D9B53CC
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 08:17:31 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id A6DB0240004;
        Mon, 25 Apr 2022 15:17:28 +0000 (UTC)
Message-ID: <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon, 25 Apr 2022 17:17:28 +0200
In-Reply-To: <Yma3k3lRMIEFypMN@kroah.com>
References: <20220425132315.924477-1-hadess@hadess.net>
         <YmarwaNQYn1GwFbQ@kroah.com>
         <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
         <Yma3k3lRMIEFypMN@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2022-04-25 at 17:00 +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 25, 2022 at 04:28:40PM +0200, Bastien Nocera wrote:
> > On Mon, 2022-04-25 at 16:10 +0200, Greg Kroah-Hartman wrote:
> > > On Mon, Apr 25, 2022 at 03:23:15PM +0200, Bastien Nocera wrote:
> > > > There is a need for userspace applications to open USB devices
> > > > directly,
> > > > for all the USB devices without a kernel-level class driver,
> > > > and
> > > > implemented in user-space.
> > > > 
> > > > End-user access is usually handled by the uaccess tag in
> > > > systemd,
> > > > shipping application-specific udev rules that implement this
> > > > without too
> > > > much care for sandboxed applications, or overall security, or
> > > > just
> > > > sudo.
> > > > 
> > > > A better approach is what we already have for evdev devices:
> > > > give
> > > > the
> > > > application a file descriptor and revoke it when it may no
> > > > longer
> > > > access
> > > > that device.
> > > 
> > > Who is going to use this "better" approach?  Is there support in
> > > libusb
> > > for it?  Who talks raw usbfs other than libusb these days?
> > 
> > Did you read the follow-up mail with the links to example code for
> > the
> > hid revoke support?
> 
> HID revoke does not mess with usbfs though.  Or if it does, I don't
> understand the connection.

evdev, HID and USB revoke are 3 separate implementations that are
necessary for common device accesses to be revocable.

The HID patch shows how device access is implemented in systemd, with
the seat leader (usually the compositor) being able to request fds from
logind if the user doesn't already have access.

logind would then be responsible for closing the USB devices the user
doesn't have access to anymore when logging out, or switching user. It
could either close fds it passed out, or use BPF to revoke opened HID
and USB devices without needing to act as an intermediary.

In short:
- libusb programme opens USB device, either directly, or after asking
the compositor to pass a fd (and being authorised to do so)
- programme does its thing
- fast user switch to another user
- logind revokes libusb access for the old user
- new user can use the device without problems

Note that user switching could also be a toggle to revoke USB device
access for a sandbox.

> And usually the 0/X email has the context, not follow-on messages
> that I
> didn't read yet :)

Sorry, I'm not used to the horrendous workflow around email patches. In
a "forge" that follow-up mail would have been separate from the commit
messages.

Let me know what you need to get up to speed after reading that follow-
up mail (and this current one), so I know what to add to future cover
letters and/or commit messages.

> 
> 
> > > > This patch is the USB equivalent to the EVIOCREVOKE ioctl, see
> > > > commit c7dc65737c9a607d3e6f8478659876074ad129b8 for full
> > > > details.
> > > 
> > > c7dc65737c9a ("Input: evdev - add EVIOCREVOKE ioctl") is how I
> > > thought
> > > we were supposed to write out commits in changelogs these days :)
> > > 
> > > > 
> > > > Note that this variant needs to do a few things that the evdev
> > > > revoke
> > > > doesn't need to handle, particular:
> > > > - cancelling pending async transfers
> > > > - making sure to release claimed interfaces on revoke so they
> > > > can
> > > > be
> > > >   opened by another process/user, as USB interfaces require
> > > > being
> > > >   exclusively claimed to be used.
> > > 
> > > I love the idea of a real revoke() someday, but can't you just do
> > > the
> > > "unbind/bind" hack instead if you really want to do this?  Who
> > > wants
> > > to
> > > pass usbfs file descriptors around these days?
> > 
> > Again, please read the follow-up mail where I talk of the BPF
> > support
> > patch that would allow revoking USB fds without relying on a
> > service in
> > the middle to access devices (although that's eventually going to
> > be
> > the way to do things to allow elevating access to devices).
> 
> So would bpf be working at the usbfs level here?  I still don't
> understand the connection...

The explanation is here (for hidraw):
https://gitlab.freedesktop.org/bentiss/logind-hidraw/
