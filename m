Return-Path: <linux-usb+bounces-1925-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C947D0188
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 20:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F041B21408
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 18:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E3438DF3;
	Thu, 19 Oct 2023 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE46C38DF1
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 18:30:28 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E11CA;
	Thu, 19 Oct 2023 11:30:22 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6ce2c5b2154so5373a34.3;
        Thu, 19 Oct 2023 11:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697740222; x=1698345022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4OlisRR/7jSUpcBpgGyXz1Fjy44KjCthVAKQggQWimY=;
        b=pEZz9CVc5QLdOFi5dMxS/RV7K7EZhQhvJpyPcAogvZm4tGJX2XVwiae8RLl7+iZK5l
         CcIvpWNxtpssrpR9OKCHIc7O0OGRwIoNxEsKxAKHNvTFIlhvoAe/KFCdEZYNHrU7jF/J
         Do066qXjzYRpMHkA3gmqSh2n0tWv9xKurGoOWqFiISvCEhEK3be4X8mWTki2WBr6rwma
         4GMH8n9zzI9LkDcRlVW2muEVF4CVQNno5ZFNyFj7AgvGOmluYDrDfj4QSfFEn1H21kbe
         wLXbq377zdTJt0S93K0b4VkYsxuixoA85Ci7UpzbwCq9BsxfAsPfGBfo1bjBk0AMEZSy
         mMGw==
X-Gm-Message-State: AOJu0YzxZSS7O3K7oJaeM42kJiflYvggKg83wTpkO9eVrhmEOM5D7Q6d
	NfbYGFHVJ3yLxNgaCzRdiQYXuJeHEA==
X-Google-Smtp-Source: AGHT+IFg3OHoS5WSSYGvYCn+MO5yYk/KYenlD4LywOXyVMey+Ef0qNeHS/zrWtk3oo7EE/LYCC6YPw==
X-Received: by 2002:aca:1112:0:b0:3a8:83df:d5a4 with SMTP id 18-20020aca1112000000b003a883dfd5a4mr2707867oir.59.1697740221913;
        Thu, 19 Oct 2023 11:30:21 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o13-20020a05680803cd00b003b2df32d9a9sm20077oie.19.2023.10.19.11.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 11:30:20 -0700 (PDT)
Received: (nullmailer pid 841631 invoked by uid 1000);
	Thu, 19 Oct 2023 18:30:20 -0000
From: Rob Herring <robh@kernel.org>
To: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: chipidea: Fix unused ci_hdrc_usb2_of_match warning for !CONFIG_OF
Date: Thu, 19 Oct 2023 13:30:15 -0500
Message-ID: <20231019183015.841460-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 14485de431b0 ("usb: Use device_get_match_data()") dropped the
unconditional use of ci_hdrc_usb2_of_match resulting in this warning:

drivers/usb/chipidea/ci_hdrc_usb2.c:41:34: warning: unused variable 'ci_hdrc_usb2_of_match' [-Wunused-const-variable]

The fix is to drop of_match_ptr() which is not necessary because DT is
always used for this driver.

Fixes: 14485de431b0 ("usb: Use device_get_match_data()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310131627.M43j234A-lkp@intel.com/
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index 180a632dd7ba..97379f653b06 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -119,7 +119,7 @@ static struct platform_driver ci_hdrc_usb2_driver = {
 	.remove_new = ci_hdrc_usb2_remove,
 	.driver	= {
 		.name		= "chipidea-usb2",
-		.of_match_table	= of_match_ptr(ci_hdrc_usb2_of_match),
+		.of_match_table	= ci_hdrc_usb2_of_match,
 	},
 };
 module_platform_driver(ci_hdrc_usb2_driver);
-- 
2.42.0


