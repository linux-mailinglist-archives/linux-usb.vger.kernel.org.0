Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9990E69F0DC
	for <lists+linux-usb@lfdr.de>; Wed, 22 Feb 2023 10:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjBVJDG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Feb 2023 04:03:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbjBVJDE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Feb 2023 04:03:04 -0500
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253A62A6EE
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 01:02:56 -0800 (PST)
Received: from [172.31.17.196] (vpn1.lineo.co.jp [203.141.200.204])
        by mail.lineo.co.jp (Postfix) with ESMTPSA id 1A16A803339FB;
        Wed, 22 Feb 2023 18:02:55 +0900 (JST)
Message-ID: <f7e7fcd9-ddee-2c81-ca44-951b6cec1003@lineo.co.jp>
Date:   Wed, 22 Feb 2023 18:02:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
From:   Yuta Hayama <hayama@lineo.co.jp>
Subject: [RFC PATCH v2] usb: gadget: f_fs: Fix incorrect version checking of
 OS descs
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-usb@vger.kernel.org
Cc:     Yuta Hayama <hayama@lineo.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, the USB gadget framework supports only version 1.0 of the MS OS
descriptor. OS desc has a field bcdVersion indicating its version, with
v1.0 represented by the value 0x100. However, __ffs_do_os_desc_header()
was expecting the incorrect value 0x1, so allow the correct value 0x100.

The bcdVersion field of the descriptor that is actually sent to the host
is set by composite_setup() (in composite.c) to the fixed value 0x100.
Therefore, it can be understood that __ffs_do_os_desc_header() is only
performing a format check of the OS desc passed to functionfs. If a value
other than 0x100 is accepted, there is no effect on communication over
the USB bus. Indeed, until now __ffs_do_os_desc_header() has only accepted
the incorrect value 0x1, but there was no problem with the communication
over the USB bus.

However, this can be confusing for functionfs userspace drivers. Since
bcdVersion=0x100 is used in actual communication, functionfs should accept
the value 0x100.

Note that the correct value for bcdVersion in OS desc v1.0 is 0x100, but
to avoid breaking old userspace drivers, the value 0x1 is also accepted as
an exception. At this time, a message is output to notify the user to fix
the userspace driver.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
I am currently considering the patch approach itself. Please see below.
https://lore.kernel.org/linux-usb/80754db0-a3bb-ee5e-db39-b75b8ebbd30e@lineo.co.jp/

Changelog
v2:
- remove comma inserted incorrectly in pr_vdebug()
- if bcd_version == 0x1, use pr_warn() instead of pr_vdebug()

 drivers/usb/gadget/function/f_fs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 8ad354741380..05f83469956a 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2292,8 +2292,12 @@ static int __ffs_do_os_desc_header(enum ffs_os_desc_type *next_type,
 	u16 bcd_version = le16_to_cpu(desc->bcdVersion);
 	u16 w_index = le16_to_cpu(desc->wIndex);
 
-	if (bcd_version != 1) {
-		pr_vdebug("unsupported os descriptors version: %d",
+	if (bcd_version == 0x1) {
+		pr_warn("bcdVersion is expected to be 0x100, but it was 0x%x. "
+			"Pass for compatibility, but fix your user space driver.\n",
+			bcd_version);
+	} else if (bcd_version != 0x100) {
+		pr_vdebug("unsupported os descriptors version: 0x%x\n",
 			  bcd_version);
 		return -EINVAL;
 	}
-- 
2.25.1
