Return-Path: <linux-usb+bounces-1545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 356BF7C79D2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 00:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6787E1C213F4
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 22:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 328B22B5F8;
	Thu, 12 Oct 2023 22:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YupFDCoJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639BE3D038
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 22:33:38 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2710ED7
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 15:33:36 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d918aef0d0dso2103820276.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 15:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697150015; x=1697754815; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bMicK/Q5xy5Wa2FAFNQ3uoq4k2tHyYqo1F+SWUCF8nk=;
        b=YupFDCoJl/YjOA4Gw1wPmwXlSJDLi7RzOJAzPKRduQYqfu1wyyYpuAYM997B25pRwj
         lPiPxhNtHFbyvHPG6Mpk6QtzVtZMev1jKTEgPlqI32vxDcC+EH70szDzrER6VANc2mK8
         NsMM2qLUDN+8zM40A0RxhZr7tEcNi5te/TNh5G7oN5o3ODp6m248El1Y1od0yHlXNSG/
         hiPRLt88NukhlYPOhz6vkwXL8A9VzWKSutxDmYD0hQF7ZVhfMkVxWDV+MIvbDdOuaRYz
         Fp4Vuf2U6gBbndoEKFdJGXZEdEpoX+1fSvl3QnxJeBLLUnpgmPdY8PkVzA6E3xlPVGfo
         919Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697150015; x=1697754815;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bMicK/Q5xy5Wa2FAFNQ3uoq4k2tHyYqo1F+SWUCF8nk=;
        b=tBqVRcO/7ssxLZ+Y7hozq7JDiLLm1aP0Af+nPDEI33cbpHzXC4CELAmRpJaIuxAI8e
         ss+kqsz5eiHi09ZxA3Hn2JK/RhQWqOVp5nEB+scP1rAOhlVFQGWJlm88Vfww1NwIi8XW
         7GBL1wSmM/mHtnU67cvcxSGkWkgQCAmEE5YWwiFahfVrRB5pHDVSUjUlITXtStryv/mL
         oiwuKcFH1dw4vJr3IQUrWOlHZeEfFUEcs/UCx6y3bdUQDBHEtK10weYcBd+mIXzedxTu
         Y6z2y5AIeBdFYQ3EFN4zWK0aUl7EpQLS21oX232WO0AivvTHOatfXaYDT065lbDXCTvY
         pDVQ==
X-Gm-Message-State: AOJu0YwuLGjJLWmupPP2v1mcqm34In1IHHUHSy6jDV8Yv2RuVMDaaows
	8R68q4HyA7iHmc9ghp671pCBW3+zS/Nr97bxvw==
X-Google-Smtp-Source: AGHT+IGFC2dIaMmI0JDuC8HythokMvivv7ImS1E9FTXqpn3afgMUg1e2O4A3TXVog4ZLvVdjsPz+NEQDS5+nUp4Oow==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:828c:0:b0:d9a:bc5a:737c with SMTP
 id r12-20020a25828c000000b00d9abc5a737cmr93260ybk.4.1697150015398; Thu, 12
 Oct 2023 15:33:35 -0700 (PDT)
Date: Thu, 12 Oct 2023 22:33:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD10KGUC/x3NMQ6DMAxA0asgz7WUOEMoV0Ed2uCAlxTZFFFF3
 J2I8S3/VzBWYYOhq6C8i8m3NPhHB2l5l5lRpmYgR8E7T2iblrT+cVLZWQ0Lb/izD5o+e+cwYeh z9JQo50jQMqtyluNejK/zvADLCQxHcgAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697150014; l=1997;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=1U/Iz4RqgIW06rmNmlXGTtLjP2+AJ5auEeXiBs7XZfQ=; b=brMk5Cj7eHq7rhc3oxxfK9fgzLcaoOEhVmgXPUsQEqJdbnaDQp+DNiJaosWeTFIN1Sj/ZHhsN
 dWoYta7Hsf0BJJ3Ttyiqah6k3lJtPK4DA+awnlETQMF5I19LrW2lFz5
X-Mailer: b4 0.12.3
Message-ID: <20231012-strncpy-drivers-net-usb-sr9800-c-v1-1-5540832c8ec2@google.com>
Subject: [PATCH] net: usb: replace deprecated strncpy with strscpy
From: Justin Stitt <justinstitt@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous string
interfaces.

Other implementations of .*get_drvinfo use strscpy so this patch brings
sr_get_drvinfo() in line as well:

igb/igb_ethtool.c +851
static void igb_get_drvinfo(struct net_device *netdev,

igbvf/ethtool.c
167:static void igbvf_get_drvinfo(struct net_device *netdev,

i40e/i40e_ethtool.c
1999:static void i40e_get_drvinfo(struct net_device *netdev,

e1000/e1000_ethtool.c
529:static void e1000_get_drvinfo(struct net_device *netdev,

ixgbevf/ethtool.c
211:static void ixgbevf_get_drvinfo(struct net_device *netdev,

...

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/net/usb/sr9800.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/sr9800.c b/drivers/net/usb/sr9800.c
index f5e19f3ef6cd..143bd4ab160d 100644
--- a/drivers/net/usb/sr9800.c
+++ b/drivers/net/usb/sr9800.c
@@ -474,8 +474,8 @@ static void sr_get_drvinfo(struct net_device *net,
 {
 	/* Inherit standard device info */
 	usbnet_get_drvinfo(net, info);
-	strncpy(info->driver, DRIVER_NAME, sizeof(info->driver));
-	strncpy(info->version, DRIVER_VERSION, sizeof(info->version));
+	strscpy(info->driver, DRIVER_NAME, sizeof(info->driver));
+	strscpy(info->version, DRIVER_VERSION, sizeof(info->version));
 }
 
 static u32 sr_get_link(struct net_device *net)

---
base-commit: cbf3a2cb156a2c911d8f38d8247814b4c07f49a2
change-id: 20231012-strncpy-drivers-net-usb-sr9800-c-38f712c2ff72

Best regards,
--
Justin Stitt <justinstitt@google.com>


