Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50BC50E319
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 16:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbiDYObt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 25 Apr 2022 10:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiDYObs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 10:31:48 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE292E6AA
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 07:28:43 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 2138560008;
        Mon, 25 Apr 2022 14:28:40 +0000 (UTC)
Message-ID: <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon, 25 Apr 2022 16:28:40 +0200
In-Reply-To: <YmarwaNQYn1GwFbQ@kroah.com>
References: <20220425132315.924477-1-hadess@hadess.net>
         <YmarwaNQYn1GwFbQ@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2022-04-25 at 16:10 +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 25, 2022 at 03:23:15PM +0200, Bastien Nocera wrote:
> > There is a need for userspace applications to open USB devices
> > directly,
> > for all the USB devices without a kernel-level class driver, and
> > implemented in user-space.
> > 
> > End-user access is usually handled by the uaccess tag in systemd,
> > shipping application-specific udev rules that implement this
> > without too
> > much care for sandboxed applications, or overall security, or just
> > sudo.
> > 
> > A better approach is what we already have for evdev devices: give
> > the
> > application a file descriptor and revoke it when it may no longer
> > access
> > that device.
> 
> Who is going to use this "better" approach?  Is there support in
> libusb
> for it?  Who talks raw usbfs other than libusb these days?

Did you read the follow-up mail with the links to example code for the
hid revoke support?

> 
> > 
> > This patch is the USB equivalent to the EVIOCREVOKE ioctl, see
> > commit c7dc65737c9a607d3e6f8478659876074ad129b8 for full details.
> 
> c7dc65737c9a ("Input: evdev - add EVIOCREVOKE ioctl") is how I
> thought
> we were supposed to write out commits in changelogs these days :)
> 
> > 
> > Note that this variant needs to do a few things that the evdev
> > revoke
> > doesn't need to handle, particular:
> > - cancelling pending async transfers
> > - making sure to release claimed interfaces on revoke so they can
> > be
> >   opened by another process/user, as USB interfaces require being
> >   exclusively claimed to be used.
> 
> I love the idea of a real revoke() someday, but can't you just do the
> "unbind/bind" hack instead if you really want to do this?  Who wants
> to
> pass usbfs file descriptors around these days?

Again, please read the follow-up mail where I talk of the BPF support
patch that would allow revoking USB fds without relying on a service in
the middle to access devices (although that's eventually going to be
the way to do things to allow elevating access to devices).

Cheers
