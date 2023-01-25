Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C176D67ABB0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 09:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbjAYI3S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 03:29:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbjAYI3O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 03:29:14 -0500
X-Greylist: delayed 367 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 25 Jan 2023 00:29:09 PST
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693555FCB
        for <linux-usb@vger.kernel.org>; Wed, 25 Jan 2023 00:29:09 -0800 (PST)
Received: from [172.31.17.196] (vpn1.lineo.co.jp [203.141.200.204])
        by mail.lineo.co.jp (Postfix) with ESMTPSA id 6B2CC802F9525;
        Wed, 25 Jan 2023 17:23:00 +0900 (JST)
Message-ID: <60cd04bb-c080-4242-b981-8da1e1c3ca53@lineo.co.jp>
Date:   Wed, 25 Jan 2023 17:23:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
From:   Yuta Hayama <hayama@lineo.co.jp>
Subject: OS Descriptor version in FunctionFS
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,URI_TRY_3LD autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I have a question about MS OS descriptor support in FunctionFS.

I understand that the current FunctionFS supports OS descriptors and that the
FunctionFS user mode driver can optionally be set up with a configuration that
includes OS descriptors. Here, there are several versions of the OS descriptor,
but the current FunctionFS (or gadget framework?) supports only v1.0, I think.
Indeed, __ffs_do_os_desc_header() in drivers/usb/gadget/function/f_fs.c rejects
OS descriptors other than v1.0 in the following way:

static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
				   struct usb_os_desc_header *desc)
{
	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
	u16 w_index = le16_to_cpu(desc->wIndex);

	if (bcd_version != 1) {
		pr_vdebug("unsupported os descriptors version: %d",
			  bcd_version);
		return -EINVAL;
	}
	
	/* ... */

Here's a question: isn't it wrong to assume that the value of desc->bcdVersion
in OS descriptor v1.0 is 0x0001? From reference to the following document on
OS descriptor v1.0, it looks like the value 0x0100 is assumed. (Well, I don't
think v1.0 will be 0x0001 since it would be in BCD form as the name suggests.)

[Microsoft OS 1.0 Descriptors Specification]
https://learn.microsoft.com/en-us/windows-hardware/drivers/usbcon/microsoft-os-1-0-descriptors-specification

Page 6 of OS_Desc_CompatID.doc and page 5 of OS_Desc_Ext_Prop.doc explain the
header section, which can be found there. The examples of descriptors also show
bcdVersion=0x0100.

Would the fix be something like the following?

	if (bcd_version == 0x0001) {
		pr_debug(" ... ");
		/*
		 * Pass through for compatibility, but notify to fix the user
		 * mode driver?
		 */
	} else if (bcd_version != 0x0100) {
		pr_vdebug("unsupported os descriptors version: %d",
				  bcd_version);
			return -EINVAL;
	}

By the way, with the current FunctionFS code, we have to set bcd_version=0x0001
in the OS descriptor, but it looks like the Windows host(USB host) won't
complain about that.


Thank you.

Yuta Hayama
