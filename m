Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA305A7919
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 10:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiHaIdZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 04:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbiHaIdX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 04:33:23 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA250C166A
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=Efpjn8c17i97rDguMM
        b6qgxYF3kPl3NW9dQwRv5oh+Y=; b=OYhganZxzmc/+pJdvLhjOGvnPsmX6D9vns
        GYLxMlL93smemeDSbX9cb27EHq+EqtUYATa55PMjyDo5SxYBq7dVQsWBui3gBBAi
        8pcPijCGlx7/R69WQPr2HIzhGDztshinFdoFuz7Lzk/qwVKP5eXt6af3RqIXT/dW
        aFjpkd/Ms=
Received: from localhost.localdomain.localdomain (unknown [112.64.161.44])
        by smtp10 (Coremail) with SMTP id NuRpCgDX30zAHA9jX8gDAg--.24868S2;
        Wed, 31 Aug 2022 16:33:05 +0800 (CST)
From:   zenghongling <zhongling0719@126.com>
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        zhongling0719@126.com
Subject: [PATCH v2] uas: add no-uas quirk for Thinkplus and Hiksemi usb-storage
Date:   Wed, 31 Aug 2022 16:33:31 +0800
Message-Id: <1661934811-24263-1-git-send-email-zhongling0719@126.com>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: NuRpCgDX30zAHA9jX8gDAg--.24868S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr48JrW7WF17urWfWFyfJFb_yoW8Xw1fpF
        n8ZrZ5C397W3WavrnI9w4UCr93Ja1vkF1kGay7Kw15Zw1rAayUXrnxJr48Kry7Cr43Xr40
        vF4qvFWxKrWUG3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piahF7UUUUU=
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/1tbiYBNu0FpEI1MM2gABs0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The UAS mode of Thinkplus and Hiksemi is reported to fail to work on
several platforms with the following error message:

[   39.702439] xhci_hcd 0000:0c:00.3: ERROR Transfer event for disabled
               endpoint or incorrect stream ring
[   39.702442] xhci_hcd 0000:0c:00.3: @000000026c61f810 00000000 00000000
               1b000000 05038000

And when running iozone will disconnect from the USB controller, then after
re-connecting the device will be offlined and not working at all.

Signed-off-by: zenghongling <zhongling0719@126.com>
---
 drivers/usb/storage/unusual_uas.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
index cdff7dc..bb0d31d 100644
--- a/drivers/usb/storage/unusual_uas.h
+++ b/drivers/usb/storage/unusual_uas.h
@@ -215,6 +215,24 @@ UNUSUAL_DEV(0x4971, 0x1012, 0x0000, 0x9999,
 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_IGNORE_UAS),
 
+UNUSUAL_DEV(0x17ef, 0x3899, 0x0000, 0x9999,
+		"Thinkplus",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
+UNUSUAL_DEV(0x090c, 0x2000, 0x0000, 0x9999,
+		"Hiksemi",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
+UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
+		"Hiksemi",
+		"External HDD",
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
+		US_FL_IGNORE_UAS),
+
 /* Reported-by: Richard Henderson <rth@redhat.com> */
 UNUSUAL_DEV(0x4971, 0x8017, 0x0000, 0x9999,
 		"SimpleTech",
-- 
2.1.0

