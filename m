Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1EF4800E
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2019 12:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727268AbfFQK51 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jun 2019 06:57:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:60666 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727059AbfFQK51 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Jun 2019 06:57:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6BF69AB99;
        Mon, 17 Jun 2019 10:57:25 +0000 (UTC)
Message-ID: <1560769038.8567.15.camel@suse.com>
Subject: Re: Force Feedback support not recognized on Granite Devices
 Simucube
From:   Oliver Neukum <oneukum@suse.com>
To:     linux-ml@bernd-steinhauser.de, linux-usb@vger.kernel.org
Date:   Mon, 17 Jun 2019 12:57:18 +0200
In-Reply-To: <68cebd85-92ad-8059-a767-a8a4f33c5c9e@bernd-steinhauser.de>
References: <68cebd85-92ad-8059-a767-a8a4f33c5c9e@bernd-steinhauser.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 17.06.2019, 12:35 +0200 schrieb Bernd Steinhauser:
> 
> The device advertises as MCS, Granite Devices SimuCUBE with id 16d0:0d5a, I'll attach lsusb output.
> Upon connection, the device is recognized and the output is:
> 
> [ 3271.812807] usb 1-2.4.2: new full-speed USB device number 10 using xhci_hcd
> [ 3271.921182] usb 1-2.4.2: New USB device found, idVendor=16d0, idProduct=0d5a, bcdDevice= 2.00
> [ 3271.921184] usb 1-2.4.2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [ 3271.921185] usb 1-2.4.2: Product: SimuCUBE
> [ 3271.921186] usb 1-2.4.2: Manufacturer: Granite Devices
> [ 3271.921187] usb 1-2.4.2: SerialNumber: 0123456789
> [ 3281.943990] input: Granite Devices SimuCUBE as /devices/pci0000:00/0000:00:09.0/0000:04:00.0/usb1/1-2/1-2.4/1-2.4.2/1-2.4.2:1.0/0003:16D0:0D5A.0016/input/input48
> [ 3281.944223] hid-generic 0003:16D0:0D5A.0016: unknown set_effect report layout
> [ 3281.944228] hid-generic 0003:16D0:0D5A.0016: input,hiddev2,hidraw15: USB HID v1.11 Joystick [Granite Devices SimuCUBE] on usb-0000:04:00.0-2.4.2/input0
> 
> I spent some time looking at the code and also other ffb code in usbhid, but since I'm not really familiar with C I have a hard time figuring out why it doesn't work out of the box and how to fix this, but I'd be happy to help implementing/debugging it.
> For a start, it would be really nice to find out what is reported, what the report should look like and why it doesn't match.

Hi,

1. this eport is more appropriate for linux-input. You should put it
into CC

2. You indeed triggered this check:

/*
 * Fill and check the pidff_usages
 */

static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
{
        int envelope_ok = 0;

        if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
                hid_err(pidff->hid, "unknown set_effect report layout\n");
                return -ENODEV;
        }


3. Your lsusb is incomplete (likely you need to run it as root), so
nobody can say what's wrong with your descriptors.

	HTH
		Oliver

