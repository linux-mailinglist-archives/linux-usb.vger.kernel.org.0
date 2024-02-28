Return-Path: <linux-usb+bounces-7273-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C76F286BA75
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 23:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 784301F2556B
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 22:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55271361B3;
	Wed, 28 Feb 2024 22:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vKQoa0a+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639F1361AA
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 22:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709157790; cv=none; b=kf8VkrNQtjcgjwQplfZOWAe94QJtS1AlA6iiNPyWbyG7B2sLl3Xv9VnuonlTsYhl89jOAG7Ml6SAm9hCCW764ruVPPOMTiS+btTyFoOLRm1BnfDx+Q9X3J+9uRT5mKh2B9MqSgXg7sMh4MbupMPiJskTJbqTE+bII4v1UotXx1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709157790; c=relaxed/simple;
	bh=Ybd/HW3xor3RSSR0F37+S3Wo7Gc0r4PsvTMb4I8HHCI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Z2cUuFSoiHateAClnH0XJdC13DhERcx1YoRsLhhqBgileIdwqyETLw/CL9h2WvNwQe+MmgBK4UsbYNgRo5lr1hVeSdVpi/ins1LHNRMUtib8CuJYaWWTxm8NTrxTKmEDPNfBFSlozLUlEVuH2MIzkMrcBQNwKF3wog4aL635DgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vKQoa0a+; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcc15b03287so382102276.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 14:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709157787; x=1709762587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EOALInjeSh3HTsFKo9WeEXTAmZVBSHgGCLq/ONkSsHE=;
        b=vKQoa0a+MuYFP7qu+/L7cVNB6QPL2QiKG6k0ejUKLLGASeEjtHXTizcOx4mHfzvHB4
         9VUNIUoBKkJjiLQEse12DknNAVLyLps8yN030mrxeoqt/9cY4caXfiDHrubjIZX1v1gc
         jRz12nVBlxe3s8WMMf9ZIjDmV1omJegZNDbRMyjBTc3CRjx8OhYMsLBlyELliakCjFQA
         K8piN8tcsJlLeus+fFhTCupKF+cJdnvCd+wKy7pjAptu8Jvyt8RlFW9sOlHj/Qkmtk0n
         7qiWTDOVs7XYRcHxKugbATK1Pq3aaKYSxM77L1x42P0NWTpDUIqQTyD0xoe8qqhq4tab
         Ytew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709157787; x=1709762587;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EOALInjeSh3HTsFKo9WeEXTAmZVBSHgGCLq/ONkSsHE=;
        b=VIqRbiNnUUsEYB6yvxuf5+Mb2ceDGLgfVVFaXjUkZS3VAsPmowosjmHi7h6nksOa96
         ppqUgK335nhEvF3ECz68q8QOA/uGjSMt/qKxXrZlOV6kwiC0rR81LdXOmbANexNx97sZ
         90sUaOnPEda69hxhSpfE54dnteuNNlHKtJe3u6IhMJ31S1RJaC0T3tStn4rAW76KoY8w
         9sfFDJXsJhWTqw0B8mPp8UK0LYiYh1BRRZ7gwlhbubZH0DJpPqLY7jRwhq9uYSiXPqRj
         bIwhmyxxFLbZjdwDlxv0nq8qcrymkQVnz9L6r8BeYKRvAWpL1j5iFBpt3QOIhHwk3eUX
         hwCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8rUZZ3wPw7iRoGtCtrcNtQAEk2PI7aadNBePUpIgfPhcN4Yt+8mitk5/b9rZ7kTv1hxddlK/XpepDaRM8TM25YDDfmut4cZsp
X-Gm-Message-State: AOJu0YxU93FJxH6hMzUIc0PfFBcGwxSompYPrFsNvO656sZ+Rl14DDz/
	T/8dvSJcsRcw2CqZEPT/nFhSlj6PQISw3PK+7Y/i1o6ufoQ67+8ygCEYioG0i8oWeSjtgtjvQZm
	LKA==
X-Google-Smtp-Source: AGHT+IGMJv0UhUZ/qmZRP7/6yeugTC9G/Lx9cGOcVKv1FCV+MmpktOD6lzu7jHBhZw5mSTxD3Jq60w0kvRg=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:1142:b0:dce:5218:c89b with SMTP id
 p2-20020a056902114200b00dce5218c89bmr31900ybu.5.1709157787604; Wed, 28 Feb
 2024 14:03:07 -0800 (PST)
Date: Wed, 28 Feb 2024 22:02:51 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240228220251.3613424-1-jthies@google.com>
Subject: [PATCH v2 1/4] usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Clean up UCSI_CABLE_PROP macros by fixing a bitmask shifting error for
plug type and updating the modal support macro for consistent naming.

Fixes: 3cf657f07918 ("usb: typec: ucsi: Remove all bit-fields")
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in v2:
- Tested on usb-testing branch merged with chromeOS 6.8-rc2 kernel.

 drivers/usb/typec/ucsi/ucsi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 7e35ffbe0a6f2..469a2baf472e4 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -259,12 +259,12 @@ struct ucsi_cable_property {
 #define UCSI_CABLE_PROP_FLAG_VBUS_IN_CABLE	BIT(0)
 #define UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE	BIT(1)
 #define UCSI_CABLE_PROP_FLAG_DIRECTIONALITY	BIT(2)
-#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	((_f_) & GENMASK(3, 0))
+#define UCSI_CABLE_PROP_FLAG_PLUG_TYPE(_f_)	(((_f_) & GENMASK(4, 3)) >> 3)
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_A	0
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_B	1
 #define   UCSI_CABLE_PROPERTY_PLUG_TYPE_C	2
 #define   UCSI_CABLE_PROPERTY_PLUG_OTHER	3
-#define UCSI_CABLE_PROP_MODE_SUPPORT		BIT(5)
+#define UCSI_CABLE_PROP_FLAG_MODE_SUPPORT	BIT(5)
 	u8 latency;
 } __packed;
 
-- 
2.44.0.rc1.240.g4c46232300-goog


