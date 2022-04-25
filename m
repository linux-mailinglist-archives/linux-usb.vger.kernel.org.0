Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C8C50E4A7
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 17:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiDYPs0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 11:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbiDYPsY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 11:48:24 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4C8DF7F
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 08:45:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A0BA2B81870
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 15:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E616FC385A4;
        Mon, 25 Apr 2022 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650901515;
        bh=S5RGaFwfht0FPDrnxB/+DprK+k0lv2iJVwfjOuOeeKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u6MQF+8nsIGwpNqlL8aLPuoM9INJIhG2n5P8GOSV8QeONOGW+gFoGgU6UBfIkmEXo
         YD3Quntp6cQZ/JSf3V0+wELPVP0w2+kdpqSP6Brb3S+T3psY+g+BOpscduN5bPUi4K
         VgF/RguFVFyCsREpZIgaigUPV0VCC4+hkJ6f+2A4=
Date:   Mon, 25 Apr 2022 17:45:11 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
Message-ID: <YmbCBwEMvKO5z0Dh@kroah.com>
References: <20220425132315.924477-1-hadess@hadess.net>
 <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com>
 <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 05:17:28PM +0200, Bastien Nocera wrote:
> On Mon, 2022-04-25 at 17:00 +0200, Greg Kroah-Hartman wrote:
> > On Mon, Apr 25, 2022 at 04:28:40PM +0200, Bastien Nocera wrote:
> > > On Mon, 2022-04-25 at 16:10 +0200, Greg Kroah-Hartman wrote:
> > > > On Mon, Apr 25, 2022 at 03:23:15PM +0200, Bastien Nocera wrote:
> > > > > There is a need for userspace applications to open USB devices
> > > > > directly,
> > > > > for all the USB devices without a kernel-level class driver,
> > > > > and
> > > > > implemented in user-space.
> > > > > 
> > > > > End-user access is usually handled by the uaccess tag in
> > > > > systemd,
> > > > > shipping application-specific udev rules that implement this
> > > > > without too
> > > > > much care for sandboxed applications, or overall security, or
> > > > > just
> > > > > sudo.
> > > > > 
> > > > > A better approach is what we already have for evdev devices:
> > > > > give
> > > > > the
> > > > > application a file descriptor and revoke it when it may no
> > > > > longer
> > > > > access
> > > > > that device.
> > > > 
> > > > Who is going to use this "better" approach?  Is there support in
> > > > libusb
> > > > for it?  Who talks raw usbfs other than libusb these days?
> > > 
> > > Did you read the follow-up mail with the links to example code for
> > > the
> > > hid revoke support?
> > 
> > HID revoke does not mess with usbfs though.  Or if it does, I don't
> > understand the connection.
> 
> evdev, HID and USB revoke are 3 separate implementations that are
> necessary for common device accesses to be revocable.
> 
> The HID patch shows how device access is implemented in systemd, with
> the seat leader (usually the compositor) being able to request fds from
> logind if the user doesn't already have access.
> 
> logind would then be responsible for closing the USB devices the user
> doesn't have access to anymore when logging out, or switching user. It
> could either close fds it passed out, or use BPF to revoke opened HID
> and USB devices without needing to act as an intermediary.
> 
> In short:
> - libusb programme opens USB device, either directly, or after asking
> the compositor to pass a fd (and being authorised to do so)

What libusb programs open usb devices today like this?  And who is going
to change them to use the compositor instead of just opening the file
descriptor directly like they do today?

> - programme does its thing
> - fast user switch to another user
> - logind revokes libusb access for the old user
> - new user can use the device without problems
> 
> Note that user switching could also be a toggle to revoke USB device
> access for a sandbox.
> 
> > And usually the 0/X email has the context, not follow-on messages
> > that I
> > didn't read yet :)
> 
> Sorry, I'm not used to the horrendous workflow around email patches. In
> a "forge" that follow-up mail would have been separate from the commit
> messages.

It'sn ot horrendous, it's much simpler, compose an email, send it off.
Or use git send-email if you like.  Much simpler than trying to log into
a random web site and keep track of what is and is not happening.

> Let me know what you need to get up to speed after reading that follow-
> up mail (and this current one), so I know what to add to future cover
> letters and/or commit messages.

I still do not know who would use this.

> > > > > This patch is the USB equivalent to the EVIOCREVOKE ioctl, see
> > > > > commit c7dc65737c9a607d3e6f8478659876074ad129b8 for full
> > > > > details.
> > > > 
> > > > c7dc65737c9a ("Input: evdev - add EVIOCREVOKE ioctl") is how I
> > > > thought
> > > > we were supposed to write out commits in changelogs these days :)
> > > > 
> > > > > 
> > > > > Note that this variant needs to do a few things that the evdev
> > > > > revoke
> > > > > doesn't need to handle, particular:
> > > > > - cancelling pending async transfers
> > > > > - making sure to release claimed interfaces on revoke so they
> > > > > can
> > > > > be
> > > > >   opened by another process/user, as USB interfaces require
> > > > > being
> > > > >   exclusively claimed to be used.
> > > > 
> > > > I love the idea of a real revoke() someday, but can't you just do
> > > > the
> > > > "unbind/bind" hack instead if you really want to do this?  Who
> > > > wants
> > > > to
> > > > pass usbfs file descriptors around these days?
> > > 
> > > Again, please read the follow-up mail where I talk of the BPF
> > > support
> > > patch that would allow revoking USB fds without relying on a
> > > service in
> > > the middle to access devices (although that's eventually going to
> > > be
> > > the way to do things to allow elevating access to devices).
> > 
> > So would bpf be working at the usbfs level here?  I still don't
> > understand the connection...
> 
> The explanation is here (for hidraw):
> https://gitlab.freedesktop.org/bentiss/logind-hidraw/

usbfs is not in that explanation at all.  Will there be a logind-libusb
process as well?

But back to the original question, what programs would use this that
today offer direct access to USB devices through libusb?  I can maybe
think of some fingerprint scanners and some flatbed scanners (printers?)
But those are generally rare and the fingerprint scanners only have
limited access to the device already.

You're going to have to test this somehow with some program, what are
you using today for this?

thanks,

greg k-h
