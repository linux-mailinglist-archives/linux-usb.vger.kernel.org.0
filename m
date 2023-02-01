Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB4F6862AB
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 10:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbjBAJQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 04:16:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232031AbjBAJQm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 04:16:42 -0500
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62F3CC34
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 01:16:40 -0800 (PST)
Received: from [172.31.17.196] (vpn1.lineo.co.jp [203.141.200.204])
        by mail.lineo.co.jp (Postfix) with ESMTPSA id BB7F8803339BE;
        Wed,  1 Feb 2023 18:16:38 +0900 (JST)
Message-ID: <5c049a94-f848-ff9a-ffbe-c1cf335ca644@lineo.co.jp>
Date:   Wed, 1 Feb 2023 18:16:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: OS Descriptor version in FunctionFS
Content-Language: en-US
From:   Yuta Hayama <hayama@lineo.co.jp>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-usb@vger.kernel.org
References: <60cd04bb-c080-4242-b981-8da1e1c3ca53@lineo.co.jp>
 <979dcea0-938e-377b-c9a4-0a796bbdf7bc@collabora.com>
 <de051a0b-98e0-cca0-f9f4-4ac8d4c4fc02@lineo.co.jp>
In-Reply-To: <de051a0b-98e0-cca0-f9f4-4ac8d4c4fc02@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

My apologies, I had some misunderstandings.
After rechecking using USB packet capture, I found the following details.

First. Actually, the Windoes host appears to accept only bcdVersion = 0x0100.

Normally, during the USB enumeration phase, OS descs are exchanged in the
following steps.
1. Requests only the header section of the OS desc from the host to the device.
2. Returns the header section of the OS desc from the device to the host.
3. Request the entire OS desc from the host to the device.
4. Return the entire OS desc from the device to the host.

Here I found that if bcdVersion != 0x0100 is set in the OS desc header, then
3 and 4 are skipped. If the device has not been connected to the host before,
and if the right driver cannot be determined from the bDeviceClass, etc.,
the host will fail to autoload the driver. When I tried bcdVersion != 0x0100 in
the past, I was mistaken because the host had a memory of connecting a device
with the same VID, PID and the driver autoloading was performed.


Second, even though bcdVersion = 0x0001 was set on the FunctionFS user mode
driver, bcdVersion = 0x0100 was set on the packets actually flowing. It is the
composite driver that is actually filling the data to be sent, and that driver
only reads the body of the descriptor received from FunctionFS and does not
seem to care about the headers.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/gadget/composite.c#n1971

> 			os_desc_cfg = cdev->os_desc_config;
> 			w_length = min_t(u16, w_length, USB_COMP_EP0_OS_DESC_BUFSIZ);
> 			memset(buf, 0, w_length);
> 			buf[5] = 0x01; // <- here
> 			switch (ctrl->bRequestType & USB_RECIP_MASK) {
> 			case USB_RECIP_DEVICE:
> 				if (w_index != 0x4 || (w_value >> 8))

bcdVersion = 0x0100 is set here.


Now, if in fact bcdVersion = 0x0100 is correct,

> static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
> 				   struct usb_os_desc_header *desc)
> {
> 	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
> 	u16 w_index = le16_to_cpu(desc->wIndex);
> 
> 	if (bcd_version != 1) {
> 		pr_vdebug("unsupported os descriptors version: %d",
> 			  bcd_version);
> 		return -EINVAL;
> 	}

this would be confusing.
I think it would be better to modify the condition or perhaps even remove the
value checks.


Regards,

Yuta Hayama
