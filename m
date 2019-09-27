Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D086C0A58
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 19:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfI0R3z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 13:29:55 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:34199 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfI0R3z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 13:29:55 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 16378240002;
        Fri, 27 Sep 2019 17:29:52 +0000 (UTC)
Message-ID: <5e53febe013938d7b878de46a5ef9f18587bd4db.camel@hadess.net>
Subject: Driver for something that's neither a device nor an interface
 driver?
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-usb@vger.kernel.org
Cc:     benjamin.tissoires@redhat.com
Date:   Fri, 27 Sep 2019 19:29:52 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey,

I'm trying to write a "power supply" class driver for Apple MFi
devices, and struggling a little with the USB drivers.

To ask many Apple devices to draw more power, we need to make a call to
the device using a vendor command. It doesn't go to an interface, but
to the device itself.

The call done in the kernel would look something like:
usb_control_msg(mfi->udev, usb_sndctrlpipe(mfi->udev, 0), 
                0x40, /* Vendor-defined USB get enabled capabilities request. */
                USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
                current_ma, /* wValue, current offset */
                current_ma, /* wIndex, current offset */
                NULL, 0, USB_CTRL_GET_TIMEOUT);

But I can't figure out what type of driver I'd need to just be able to
export that power_supply interface.

Trying to use a "struct usb_device_driver" didn't work as probe
functions were never called, and a "struct usb_driver" gets unbound
after user-space and the ipheth drivers comes around.

This is my "struct usb_driver" attempt:
https://github.com/hadess/apple-mfi-fastcharge

Any ideas what type of driver, or what trick I should be using here?

Cheers

