Return-Path: <linux-usb+bounces-25938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C354B09573
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 22:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82721AA5298
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jul 2025 20:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803E82248B0;
	Thu, 17 Jul 2025 20:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bP58NdRU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD2B1DE4E1
	for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752782909; cv=none; b=K/U421/KFZzAfwEnXb9ajraqUR4sU/N3dVlJhDAWD2O/Xwua/f1uOMm5v/27l4R/Oo0pMQNg24Cvi8yOoshFW1bNu3S+1P7EmRX4Aa6IUfxBlssEBWzOhOHjjjo7556KV4w+ZyiaMdx71+5BrEeUczKf3iKMn0kd14r8imY+dLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752782909; c=relaxed/simple;
	bh=abRUT4VIbFoxvso62PscTwQkzbe7cjWiYeJMRzWSc9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pSVaVaf36/a46ZdUKaYn0kYYPon6cQGH8oTkVE7SXR82SNXRLu/gJWpO3tl3wpWrqFAIZi6+D/Xh8FqKMZBJATchNw4EYKactn10OzoahvoHouadHnWRDzMCza5Dsghxq5B8jjJBj9fhRLj5+4dwMapHI9ETXuM3dYueWfRBULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bP58NdRU; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso1350759b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Jul 2025 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752782907; x=1753387707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oLi/2kK2OpzvR6kQ99RKZMJhDu4imyXic6NZCN8mCPw=;
        b=bP58NdRUw943/d316eoyI+vNLBd4nXFi0tqscjJ/cYvKyf201UvQlsQlhwBqDTpHym
         7JqsbcX3SL2t9B814yMtOsyheJL2LGNVuwCYHYPD9jCAIfywhaItZA5HH4KtwFwIRIeX
         GPlAg70vzbMkhXRMsO3EavdCdzN1ghE0mNAmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752782907; x=1753387707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLi/2kK2OpzvR6kQ99RKZMJhDu4imyXic6NZCN8mCPw=;
        b=cBNJ4zlyFIskvpETkv2WKngQ9Tsv5McopCxgTmKsBjAUBoJGhMIiDeAXdrJt/zDPGE
         fUZMBbsf9pX4sW9qgieHLt16CEsAzOsSO0820e2dJOUGQ6eIXe4JX8j/vL7XokyCursS
         LOCqn2lBed9DcpY8gWMoJX6TsDCXGyoCAwZs9HnuLu5DsNJQ+MgCgpYpFWUuPZur3srA
         s5PEzBOA3I+aFiG565dCapZ3qXx4uK9qdlXI61ZjhlvXvPxrGp5uYEMw14x8RJnlpF1t
         fmAqYtktd7Lk3hkyXNn8MtYtwnT+BQj+JXzOmdLVYA2ZxyJepL8T0Ea6LyT7DZqun5G2
         buVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrybXJFojC5RKS83hIH+P3bf/7zDSqHccXgPHm3CSYwqgBcfb5BiFkVaaYdcgwWaduIwbXyY3AakQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT5N7h87DwzIT1QEwsxaIdYdlO3eWm3ERpHQ1wm9OZeet8UWQJ
	ep5G+WXhvYGBlXzH2r0/SYlUdBLdNnW5PWsd8WdPBOQ6RINz0gu67j3jaKksqnyWBQ==
X-Gm-Gg: ASbGncuZxlX2Aq2hsWBdS0dx3kuih5fvcoad3A5i4soxw6KYxUOAIVoah5TLYSiesba
	xEZiVfHY7AAyApMSIr0CU4d4NTroegkWkyDyur0lTDEXfSvh38d3XOtDo1J+yJfiMT1JKq7Yzrc
	hyJI6IJiJXv7afl475KseO+9jhwEf4KFFvj/mploLaG7u/2DReTDxfS8locZjjm7GDnRp4aDXfz
	tBaMsb3mxE76/N0pNGvWQwaeK+ki7LWGzYQpraDDMPsaKgOi5PHYipyggVfBKPqcbsrQEdBNsAG
	Kl59xiwbROXDNDSeYyj2c32Lg5s7GBaWWQivq0E7sbaXxckfcXRMoHsVNWxRWuZW3JQJ2iLNj4f
	b0kPBm4+7OWUmkmS9FeF96pVT0SfIH9o3ICLJpOLqocsH22P3WOwj39g+8rfQxPMsiu3luTgQFg
	S6JmySH0sdd6KdEem6
X-Google-Smtp-Source: AGHT+IG7JZ+cgjz5MqKSp68wtq2cJNg234+8XTpqvhRJWsE4682BdNtl16OfvKygzFQBJ0C5v3EoxQ==
X-Received: by 2002:a05:6a21:998b:b0:237:d013:8a78 with SMTP id adf61e73a8af0-2381484403bmr12782253637.37.1752782906902;
        Thu, 17 Jul 2025 13:08:26 -0700 (PDT)
Received: from bleungmegatop.c.googlers.com.com (236.219.125.34.bc.googleusercontent.com. [34.125.219.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ff61f6csm39467a12.45.2025.07.17.13.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 13:08:26 -0700 (PDT)
From: Benson Leung <bleung@chromium.org>
To: heikki.krogerus@linux.intel.com,
	jthies@google.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	sebastian.reichel@collabora.com,
	dmitry.baryshkov@oss.qualcomm.com,
	madhu.m@intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bleung@google.com,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH] usb: typec: ucsi: psy: Set current max to 100mA for BC 1.2 and Default
Date: Thu, 17 Jul 2025 20:08:05 +0000
Message-ID: <20250717200805.3710473-1-bleung@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ucsi_psy_get_current_max would return 0mA as the maximum current if
UCSI detected a BC or a Default USB Power sporce.

The comment in this function is true that we can't tell the difference
between DCP/CDP or SDP chargers, but we can guarantee that at least 1-unit
of USB 1.1/2.0 power is available, which is 100mA, which is a better
fallback value than 0, which causes some userspaces, including the ChromeOS
power manager, to regard this as a power source that is not providing
any power.

In reality, 100mA is guaranteed from all sources in these classes.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/ucsi/psy.c  | 2 +-
 drivers/usb/typec/ucsi/ucsi.h | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index 62ac69730405..62a9d68bb66d 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -164,7 +164,7 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
 	case UCSI_CONSTAT_PWR_OPMODE_DEFAULT:
 	/* UCSI can't tell b/w DCP/CDP or USB2/3x1/3x2 SDP chargers */
 	default:
-		val->intval = 0;
+		val->intval = UCSI_TYPEC_DEFAULT_CURRENT * 1000;
 		break;
 	}
 	return 0;
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index b711e1ecc378..ebd7c27c2cc7 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -483,9 +483,10 @@ struct ucsi {
 #define UCSI_MAX_SVID		5
 #define UCSI_MAX_ALTMODES	(UCSI_MAX_SVID * 6)
 
-#define UCSI_TYPEC_VSAFE5V	5000
-#define UCSI_TYPEC_1_5_CURRENT	1500
-#define UCSI_TYPEC_3_0_CURRENT	3000
+#define UCSI_TYPEC_VSAFE5V		5000
+#define UCSI_TYPEC_DEFAULT_CURRENT	 100
+#define UCSI_TYPEC_1_5_CURRENT		1500
+#define UCSI_TYPEC_3_0_CURRENT		3000
 
 struct ucsi_connector {
 	int num;
-- 
2.50.0.727.gbf7dc18ff4-goog


