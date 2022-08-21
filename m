Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75E0A59B4AD
	for <lists+linux-usb@lfdr.de>; Sun, 21 Aug 2022 16:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiHUO6Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Aug 2022 10:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiHUO6X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Aug 2022 10:58:23 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1599795B7
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 07:58:21 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f4so5506152pgc.12
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=iXZWq/V5w/cLz3ymaylcpiXZy1yfoqFHcfvsTxipt7E=;
        b=Tjc8zLaTMEhubGL2fA5eP1RecFXcgcnx5TK76j7Rq1kjC0aQleNOzmztpfrDilHjMU
         iMSeelOwrGhejTRnx8j+b1owKOokQh4Z4B2RhfF9iRH9wGfBvP8242p/PZMg4OwQReWS
         XzYf4TkicdHRFxuM1F1SbJ2KMCLmrajABnvmaLQMQVacv+4wAlCcUdmmZCxvKOAju3Jj
         pZM9XVY7sIkBSbKN/mJw2AmXYeoheeRj6lVva8/7y3jqUbItqtZ1KZXry2q61NremmZy
         ZArpMmCMu32KqcbEaa+tAmuw+GrnY3o1t7Bw2VhdKYHdKRNIC2LM1rjYXpsgLb8+WBDl
         LhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=iXZWq/V5w/cLz3ymaylcpiXZy1yfoqFHcfvsTxipt7E=;
        b=tAHDz+XM6mu2zVJkJ1oz4Xh3lYArFh7RRZ+qtsy0wZmeuKGTqfutP8hNIngghebEpZ
         CrPC44D8sjBbW2+QS/T3sNTqxHCFPKCJY4OmY4eCx6IwPN8dDiw2uo8qCRFIBOy1UlWy
         VVgy/b2TXETQ8KeSk1VVkLEh5msN0+g7YTSjzr/W4g+yarGcaU/N+qviH1upjTy8fIhW
         ta/dkMuecz/XAXNfco/WzSHTGDHCN/YSafouKXW52Qvt5LNukRo4+OTz4aNVLuDkAA49
         NeeolnDMhQFX9mz0rQDnAMYHZ0x+5wFfO0iHKUpke+B00WkNXJSJmtgAqrWWhpu/21J+
         SSMA==
X-Gm-Message-State: ACgBeo3qqe+dLe/mYj44K9L3MPOZ/0EscJECsUj4yGHq7Ox29mMhJgPH
        Vs0AlMLqx5lTjRBd7T1h54I=
X-Google-Smtp-Source: AA6agR7LGIhPTXri0q9cV2F7XXjm6iH633K8rVWVqSSgmvYbzSYranku0Dh6/bnUgKVh2NBZp1JKvA==
X-Received: by 2002:a63:147:0:b0:42a:5157:c083 with SMTP id 68-20020a630147000000b0042a5157c083mr8275083pgb.269.1661093901165;
        Sun, 21 Aug 2022 07:58:21 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:200:6287:c054:b39c:dc2a])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a2b4200b001f326c7adb3sm6372153pjc.55.2022.08.21.07.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 07:58:19 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: [PATCH] usb: gadget: f_ncm: noop - remove INIT_NDP{16,32}_OPTS macros
Date:   Sun, 21 Aug 2022 07:57:45 -0700
Message-Id: <20220821145745.122587-1-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Maciej Żenczykowski <maze@google.com>

these are only used in one place, a few lines lower

Cc: Brooke Basile <brookebasile@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 60 ++++++++++++++---------------
 1 file changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index dc8f078f918c..c36bcfa0e9b4 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -450,39 +450,35 @@ struct ndp_parser_opts {
 	unsigned	next_ndp_index;
 };
 
-#define INIT_NDP16_OPTS {					\
-		.nth_sign = USB_CDC_NCM_NTH16_SIGN,		\
-		.ndp_sign = USB_CDC_NCM_NDP16_NOCRC_SIGN,	\
-		.nth_size = sizeof(struct usb_cdc_ncm_nth16),	\
-		.ndp_size = sizeof(struct usb_cdc_ncm_ndp16),	\
-		.dpe_size = sizeof(struct usb_cdc_ncm_dpe16),	\
-		.ndplen_align = 4,				\
-		.dgram_item_len = 1,				\
-		.block_length = 1,				\
-		.ndp_index = 1,					\
-		.reserved1 = 0,					\
-		.reserved2 = 0,					\
-		.next_ndp_index = 1,				\
-	}
-
-
-#define INIT_NDP32_OPTS {					\
-		.nth_sign = USB_CDC_NCM_NTH32_SIGN,		\
-		.ndp_sign = USB_CDC_NCM_NDP32_NOCRC_SIGN,	\
-		.nth_size = sizeof(struct usb_cdc_ncm_nth32),	\
-		.ndp_size = sizeof(struct usb_cdc_ncm_ndp32),	\
-		.dpe_size = sizeof(struct usb_cdc_ncm_dpe32),	\
-		.ndplen_align = 8,				\
-		.dgram_item_len = 2,				\
-		.block_length = 2,				\
-		.ndp_index = 2,					\
-		.reserved1 = 1,					\
-		.reserved2 = 2,					\
-		.next_ndp_index = 2,				\
-	}
+static const struct ndp_parser_opts ndp16_opts = {
+	.nth_sign = USB_CDC_NCM_NTH16_SIGN,
+	.ndp_sign = USB_CDC_NCM_NDP16_NOCRC_SIGN,
+	.nth_size = sizeof(struct usb_cdc_ncm_nth16),
+	.ndp_size = sizeof(struct usb_cdc_ncm_ndp16),
+	.dpe_size = sizeof(struct usb_cdc_ncm_dpe16),
+	.ndplen_align = 4,
+	.dgram_item_len = 1,
+	.block_length = 1,
+	.ndp_index = 1,
+	.reserved1 = 0,
+	.reserved2 = 0,
+	.next_ndp_index = 1,
+};
 
-static const struct ndp_parser_opts ndp16_opts = INIT_NDP16_OPTS;
-static const struct ndp_parser_opts ndp32_opts = INIT_NDP32_OPTS;
+static const struct ndp_parser_opts ndp32_opts = {
+	.nth_sign = USB_CDC_NCM_NTH32_SIGN,
+	.ndp_sign = USB_CDC_NCM_NDP32_NOCRC_SIGN,
+	.nth_size = sizeof(struct usb_cdc_ncm_nth32),
+	.ndp_size = sizeof(struct usb_cdc_ncm_ndp32),
+	.dpe_size = sizeof(struct usb_cdc_ncm_dpe32),
+	.ndplen_align = 8,
+	.dgram_item_len = 2,
+	.block_length = 2,
+	.ndp_index = 2,
+	.reserved1 = 1,
+	.reserved2 = 2,
+	.next_ndp_index = 2,
+};
 
 static inline void put_ncm(__le16 **p, unsigned size, unsigned val)
 {
-- 
2.37.1.595.g718a3a8f04-goog

