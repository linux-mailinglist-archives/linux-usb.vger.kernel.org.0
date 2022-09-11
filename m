Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EED3B5B518E
	for <lists+linux-usb@lfdr.de>; Mon, 12 Sep 2022 00:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiIKWj4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Sep 2022 18:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiIKWjz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Sep 2022 18:39:55 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79669FD0A
        for <linux-usb@vger.kernel.org>; Sun, 11 Sep 2022 15:39:54 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id u22so6888061plq.12
        for <linux-usb@vger.kernel.org>; Sun, 11 Sep 2022 15:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=qRRQs2bGjpaLwXI2POp6+T5e3gO4USdW3PaSEgYXRs0=;
        b=MKtEX1wVUsmHJa8JRsd9iRh/J7m/TG3w0/TLn5jkF4RmWW4OUucOj4FINpzgLijmH+
         elHECt9Hc/jqn4zEQ5APfm2AwHcNuFBOX06fMkDuV8b6EoORCNUkzcaS5DwfQw8chxkZ
         y6XigSkPwVJ2Hfpdcyr2zcYJzd+uFG1fQ1AAwuqRkgMI2VsXWtUVpDVaoPr/U46mcIOD
         TivOb0A5+tH55NuYCByvQqIDNx3TmjUmhyPG9Vxbt9+z+9ETrBKL7kg/3M3HieD1gEgF
         0peHZg4SmAhzivmyfCzH6sEwglV4M1ENwVvbYCYpCmFQ7GikWo6XB6E9QxFjpWampbcL
         xOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=qRRQs2bGjpaLwXI2POp6+T5e3gO4USdW3PaSEgYXRs0=;
        b=BSelbiVz9CTMC+MRDrIGAuI/jQdkXAGA1BQm+HIaFV4cJeqNdIepFaJq6SfAm9KkWg
         TWDPQZg332O5RJkBJ1AZ1xPOS36lHKJnQLiw5QDOoXRCfbtg+mPZMN8tEIL76rxeL7x6
         pb2b/jlS8+0pZ1t2EWM9hlvhbahoxrQPk6ImVlEfdMSoqP1q1tcLMeaxj25vHzZHc9PR
         ob5ya8WYK0x27/c1tTpyq0tDX8lM4frEJsKJXikADnJQTm5kGWJTCZc1T60nByNaU5Q9
         lJyujPt5W25aAUNTCsm7mUkTqw1ykhMejc+s4goECHWcz/3mwRHLUA4cAdkFSxZFCQg7
         W1Hw==
X-Gm-Message-State: ACgBeo2jNSDyviMSDoRAXQo1sUo/+aNi3X896yjAzCwRsSD0iNR//Vao
        cKVPrWL/mSnSDxquj4IDZ64=
X-Google-Smtp-Source: AA6agR6sXrkwNnUK2ktdmEV5l09u9J2gzkZoMNsn2HjvwXV+klOqGbphB6g9V6760ROD+TIA3p+QDQ==
X-Received: by 2002:a17:90b:3b91:b0:202:91d7:6a5d with SMTP id pc17-20020a17090b3b9100b0020291d76a5dmr12778144pjb.101.1662935993977;
        Sun, 11 Sep 2022 15:39:53 -0700 (PDT)
Received: from localhost.localdomain ([75.164.0.18])
        by smtp.gmail.com with ESMTPSA id t123-20020a625f81000000b00540c7a7e9fcsm3795085pfb.89.2022.09.11.15.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 15:39:53 -0700 (PDT)
From:   Albert Briscoe <albertsbriscoe@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Albert Briscoe <albertsbriscoe@gmail.com>
Subject: [PATCH] usb: gadget: function: fix dangling pnp_string in f_printer.c
Date:   Sun, 11 Sep 2022 15:37:55 -0700
Message-Id: <20220911223753.20417-1-albertsbriscoe@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When opts->pnp_string is changed with configfs, new memory is allocated for
the string. It does not, however, update dev->pnp_string, even though the
memory is freed. When rquesting the string, the host then gets old or
corrupted data rather than the new string. The ieee 1284 id string should
be allowed to change while the device is connected.

The bug was introduced in commit fdc01cc286be ("usb: gadget: printer:
Remove pnp_string static buffer"), which changed opts->pnp_string from a
char[] to a char*.
This patch changes dev->pnp_string from a char* to a char** pointing to
opts->pnp_string.

Fixes: fdc01cc286be ("usb: gadget: printer: Remove pnp_string static buffer")
Signed-off-by: Albert Briscoe <albertsbriscoe@gmail.com>
---
 drivers/usb/gadget/function/f_printer.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/gadget/function/f_printer.c b/drivers/usb/gadget/function/f_printer.c
index abec5c58f525..a881c69b1f2b 100644
--- a/drivers/usb/gadget/function/f_printer.c
+++ b/drivers/usb/gadget/function/f_printer.c
@@ -89,7 +89,7 @@ struct printer_dev {
 	u8			printer_cdev_open;
 	wait_queue_head_t	wait;
 	unsigned		q_len;
-	char			*pnp_string;	/* We don't own memory! */
+	char			**pnp_string;	/* We don't own memory! */
 	struct usb_function	function;
 };
 
@@ -1000,16 +1000,16 @@ static int printer_func_setup(struct usb_function *f,
 			if ((wIndex>>8) != dev->interface)
 				break;
 
-			if (!dev->pnp_string) {
+			if (!*dev->pnp_string) {
 				value = 0;
 				break;
 			}
-			value = strlen(dev->pnp_string);
+			value = strlen(*dev->pnp_string);
 			buf[0] = (value >> 8) & 0xFF;
 			buf[1] = value & 0xFF;
-			memcpy(buf + 2, dev->pnp_string, value);
+			memcpy(buf + 2, *dev->pnp_string, value);
 			DBG(dev, "1284 PNP String: %x %s\n", value,
-			    dev->pnp_string);
+			    *dev->pnp_string);
 			break;
 
 		case GET_PORT_STATUS: /* Get Port Status */
@@ -1475,7 +1475,7 @@ static struct usb_function *gprinter_alloc(struct usb_function_instance *fi)
 	kref_init(&dev->kref);
 	++opts->refcnt;
 	dev->minor = opts->minor;
-	dev->pnp_string = opts->pnp_string;
+	dev->pnp_string = &opts->pnp_string;
 	dev->q_len = opts->q_len;
 	mutex_unlock(&opts->lock);
 
-- 
2.35.1

