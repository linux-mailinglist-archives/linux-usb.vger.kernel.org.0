Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE694F1FF8
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 21:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbfKFUht (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 15:37:49 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:50968 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfKFUhs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 15:37:48 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1E4266021C; Wed,  6 Nov 2019 20:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573072667;
        bh=8SpMw2RcqeyCjW3KzaEaJLmuWOZ/VMGRX9yK+fUcK2w=;
        h=From:To:Cc:Subject:Date:From;
        b=ogM206oGA/bqa6AxA0dTAmsY3Z3C3CqaS9VwO76jRMV2vwhY7yYnwegakbXvZ993R
         2H6sMS6ZgCRExmnFH+UR7PvkOMD5G0JlYvNOItpH9AORSEGVtSvXMQiGd34HPPUSbB
         giqYiFxfUxgBnf9kwWkw9ziDGG63K6QT2C5S3B1I=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 055FC6021C;
        Wed,  6 Nov 2019 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573072666;
        bh=8SpMw2RcqeyCjW3KzaEaJLmuWOZ/VMGRX9yK+fUcK2w=;
        h=From:To:Cc:Subject:Date:From;
        b=WugCjI9EGUI1QK2YMpCTDE4WpmMzkM70/wnO/rxKZQN+Dg37azLkTU516B7b0kGuA
         mscVpBBcaSeQDoq/4oxNPg5FNInSA7/8cLommIKWGIGyJdt1oalHnhhcq6F1ZGBgY3
         CZhIT+tt5DGpzFwkT1PzaLXdrspXYAD5p/vZfLus=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 055FC6021C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
From:   Jack Pham <jackp@codeaurora.org>
To:     Felipe Balbi <balbi@kernel.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Youn <John.Youn@synopsys.com>, linux-usb@vger.kernel.org,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: gadget: f_fs: Re-use SS descriptors for SuperSpeedPlus
Date:   Wed,  6 Nov 2019 12:37:30 -0800
Message-Id: <20191106203730.18827-1-jackp@codeaurora.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In many cases a function that supports SuperSpeed can very well
operate in SuperSpeedPlus, if a gadget controller supports it,
as the endpoint descriptors (and companion descriptors) are
generally identical and can be re-used. This is true for two
commonly used functions: Android's ADB and MTP. So we can simply
assign the usb_function's ssp_descriptors array to point to its
ss_descriptors, if available. Similarly, we need to allow an
epfile's ioctl for FUNCTIONFS_ENDPOINT_DESC to correctly
return the corresponding SuperSpeed endpoint descriptor in case
the connected speed is SuperSpeedPlus as well.

The only exception is if a function wants to implement an
Isochronous endpoint capable of transferring more than 48KB per
service interval when operating at greater than USB 3.1 Gen1
speed, in which case it would require an additional SuperSpeedPlus
Isochronous Endpoint Companion descriptor to be returned as part
of the Configuration Descriptor. Support for that would need
to be separately added to the userspace-facing FunctionFS API
which may not be a trivial task considering a new descriptor format
(v3?) may need to be devised to allow for separate SS and SSP
descriptors to be supplied.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/function/f_fs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 59d9d512dcda..246730dbb7f3 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1328,6 +1328,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 
 		switch (epfile->ffs->gadget->speed) {
 		case USB_SPEED_SUPER:
+		case USB_SPEED_SUPER_PLUS:
 			desc_idx = 2;
 			break;
 		case USB_SPEED_HIGH:
@@ -3183,7 +3184,8 @@ static int _ffs_func_bind(struct usb_configuration *c,
 	}
 
 	if (likely(super)) {
-		func->function.ss_descriptors = vla_ptr(vlabuf, d, ss_descs);
+		func->function.ss_descriptors = func->function.ssp_descriptors =
+			vla_ptr(vlabuf, d, ss_descs);
 		ss_len = ffs_do_descs(ffs->ss_descs_count,
 				vla_ptr(vlabuf, d, raw_descs) + fs_len + hs_len,
 				d_raw_descs__sz - fs_len - hs_len,
@@ -3593,6 +3595,7 @@ static void ffs_func_unbind(struct usb_configuration *c,
 	func->function.fs_descriptors = NULL;
 	func->function.hs_descriptors = NULL;
 	func->function.ss_descriptors = NULL;
+	func->function.ssp_descriptors = NULL;
 	func->interfaces_nums = NULL;
 
 	ffs_event_add(ffs, FUNCTIONFS_UNBIND);
-- 
2.21.0

