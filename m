Return-Path: <linux-usb+bounces-847-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7549F7B439D
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 22:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id CE130282818
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 20:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F0E18C1E;
	Sat, 30 Sep 2023 20:38:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F633F6
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 20:38:14 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DA4DD;
	Sat, 30 Sep 2023 13:38:13 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c27d653856so22064941fa.0;
        Sat, 30 Sep 2023 13:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696106291; x=1696711091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=legsvKyWWxyzmO1CVoext9AuacagNtz6wv7FLmewiU0=;
        b=cTylJgJ+3i1WG1rzMdUF4LL6XFVQWfAKkAFPpd8o2bG+ULlnfCrJmTA3XryopnSj8X
         Tx8ygudUQ5C8A2jIOV5vReH2gsHUMjRUziruB7ClzZhwTe440bkjuANfM0fZKNCoa3/A
         yGP1R2KRupHFYKUh/7iR+veGR0oyN9uPYEr1Hj/qTopJBmRCl719WhNJ75XgA/qW2X26
         V2XNQRqV0TeQR7qJUsUGnBuyxtUi6IZmCOY28T/TIRn2J2Q+DY7D6woKY71mXYWhQR+/
         cU+9fumVYRmM80MlXfEWE9PKMxGmrjTIQG5TkTAGL2iJGJ3YJ8zYJH5JYe+hiZ9dG6LH
         MDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696106291; x=1696711091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=legsvKyWWxyzmO1CVoext9AuacagNtz6wv7FLmewiU0=;
        b=oLTnlLJSOHwnarCLnrsnDxprmK6v7Sd2XNjY7Pb3lYk0RRQJCVYqPFIr7Ag0R0PJUj
         MlStD1guzAWDZRNLQa8GPIHpVk6zDSQER6/8hKb8RFR/4GQp9jQKzJkiZ/narNNAy34r
         cXS0YaN57tUw6fQZVHqzriXsAyibQdycchaOIzBSkY/mPetgDvBA2aepLpqnJl0S4XnL
         zLoYM1hAT7EcVVqPh3fkkD9WWqnQFieVsbG7Cyi/ySEoSrI+u2ZMM4axNY/eNd4zlYY1
         bar8jK2UDWoolFNCk+MFZZHXufhYTDi6vkck7MIP+01tsY901FnVBbMjm8TIVupfox83
         LEug==
X-Gm-Message-State: AOJu0YxCLaLn4cUbIJU581fcmlENTfZQOxjWzMkoLv8GPU7E1j1SHMbM
	g+/RtuSWlScZJn0i6UT2jWrIuPEm0/dhcg==
X-Google-Smtp-Source: AGHT+IFQXfgKYyvhsUungqr9rgZDXEe1m1XyQgXJ/ZkVNwWnci64sDZft8ZfIRGkJ6o2oMpG4FRx3w==
X-Received: by 2002:a2e:a4d6:0:b0:2bf:f90e:2794 with SMTP id p22-20020a2ea4d6000000b002bff90e2794mr6445483ljm.23.1696106290784;
        Sat, 30 Sep 2023 13:38:10 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d8-20020a2eb048000000b002ba7ae1f52asm4654499ljl.0.2023.09.30.13.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 13:38:10 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 1/3] drivers: usb: Fix block comments whose trailing */ was not on a separate line
Date: Sat, 30 Sep 2023 22:36:46 +0200
Message-Id: <20230930203646.61863-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Fixed various instances where block comments trailing */ where not on a
separate line and should be.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/usb/atm/cxacru.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/atm/cxacru.c b/drivers/usb/atm/cxacru.c
index 4ce7cba2b48a..ba795a8d3888 100644
--- a/drivers/usb/atm/cxacru.c
+++ b/drivers/usb/atm/cxacru.c
@@ -55,7 +55,8 @@ static const char cxacru_driver_name[] = "cxacru";
 #define POLL_INTERVAL	1	/* secs */
 
 /* commands for interaction with the modem through the control channel before
- * firmware is loaded  */
+ * firmware is loaded
+ */
 enum cxacru_fw_request {
 	FW_CMD_ERR,
 	FW_GET_VER,
@@ -67,7 +68,8 @@ enum cxacru_fw_request {
 };
 
 /* commands for interaction with the modem through the control channel once
- * firmware is loaded  */
+ * firmware is loaded
+ */
 enum cxacru_cm_request {
 	CM_REQUEST_UNDEFINED = 0x80,
 	CM_REQUEST_TEST,
@@ -369,7 +371,8 @@ static ssize_t adsl_state_store(struct device *dev,
 	/* Line status is only updated every second
 	 * and the device appears to only react to
 	 * START/STOP every second too. Wait 1.5s to
-	 * be sure that restart will have an effect. */
+	 * be sure that restart will have an effect.
+	 */
 	if (!strcmp(str_cmd, "restart"))
 		msleep(1500);
 
@@ -1237,7 +1240,8 @@ static void cxacru_unbind(struct usbatm_data *usbatm_instance,
 	BUG_ON(instance->poll_state == CXPOLL_SHUTDOWN);
 
 	/* ensure that status polling continues unless
-	 * it has already stopped */
+	 * it has already stopped
+	 */
 	if (instance->poll_state == CXPOLL_STOPPED)
 		is_polling = 0;
 
-- 
2.34.1


