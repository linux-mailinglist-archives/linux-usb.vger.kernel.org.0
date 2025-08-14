Return-Path: <linux-usb+bounces-26882-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC18B26F3A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 20:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9EAD188F9BB
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 18:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA79D23D7EB;
	Thu, 14 Aug 2025 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B04Rs5wP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95C238C1E
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 18:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197105; cv=none; b=C3m4Y51g2+vcQWdXO4j/yTnub+PpGVP3BUBqPedgj7LrWFwOOV9SjYDXL+WLFcIBlMBqEn2vRhmsyTDiMrChjkv0zIpZwEvdyb22wB0Onm/xDnbcsXlYySZ/KtMcaMyzlOokW5l5SJ5LXtzI8F/gUjCTxnywFSvwpH5Y+y7pIQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197105; c=relaxed/simple;
	bh=eUBNjC8QE0qeN7YbjDptuSSINLe1oW6vNYbL6Ks8GS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxRBgk5mzNguoaTMpQHzZ3f2QYSG+182PxRSwzb236s/01S6cFwmTgFlRITJazLQEj+PnkIzZwc17NhhPRrwD+rzsUUpPW+ynQs2GtqSDcNqHoftwzeD8AB0QwoM1a7tteo+WqROFKF5ROYekSRkI/1FIQDdsr8pqzBMedOnSP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B04Rs5wP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb78e70c5so206280066b.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197102; x=1755801902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR3Vo6gytGVX7qnZsp8KSoWCmMGj6HFPr8g7tZMKrMk=;
        b=B04Rs5wP3dNwf/b1PwQScMAhfPZPaNuj9yMFcvLsGh5OndXA5aqRTEPZf1kuywUeK8
         6c/NKxTza9fa6utr+TQ/AdjCyrSw2c8oS5oj3ZDF906JvNvgoRsl14gJjy+vLLrUOnpA
         iXKzg05reVn8hMyIGlG5sMp7Qqog7HogB1Qx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197102; x=1755801902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RR3Vo6gytGVX7qnZsp8KSoWCmMGj6HFPr8g7tZMKrMk=;
        b=J1paVX/6oFmzML6Xlm9ZXLhFG1zWRL35ZCrMlvBcbMAR67UJ3D+8EsrAbfUeDV1Wv5
         IOGc3+SmIxe7ILvFgt1i+Sy+xGvVIyf8jdwGAJyUp1SQQoRlrmKWsSH9nA3UGG2gR2KB
         xzslT+iJ83eZtA/0J5UA6HZZ6oRhqBDJNeM8vVJClU2z3ydaVCNGOXVDYx+ZttJ8PcDK
         S1plhiD1hbv8v3VRSwH7+Z3Q+sMZCWztDjIwrfSeDB20TQybEYdkrAJIrhZ6My4lKHAx
         KoMYS4p5bBJMpPQ5DML7dUVrSyRowgvsTkCyZc0x9Eb3BxQ+BRqyd2FGGWcE6hyTqMEe
         XdQg==
X-Forwarded-Encrypted: i=1; AJvYcCUH9xYImooF1Nls10DE8MJhPrmrIrQarwMX+gznqiR417O1E6+IfKLkM/Y3Rm7krwCM8H/HDvme3NQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVyLmGsBTHufGHCHys5Y/fy1NlJvUqBZznRUdx4DfQBPMzd26H
	RWn/fbeyG5BIj2PnFzyjoUqZOhUpku6jcaYBYIi/t0+x+1N8lOh2uaDpcub/GmOb5w==
X-Gm-Gg: ASbGncvXkcQ6OPfSRjpkU5t8O7by33l9/US/AaGptqfCAI0IJI61aN81M/iCXZpOfu9
	5CnmuzQ0g7X/T5GxsBkqQ/X0zBZFQmd2DVbLKegpIThdYxlghL0iPHyO7o4P/xBgiXVDMwHWAhB
	6Mkg+QxBkfkvoIJ5KfeIygoM9FMgKzIXG4LX4riDrHSB8yYiWwJ6ZmlMxyGHu0/Mj26J3d6t1xJ
	GAIUXJ+9oJ7e9KE/Tj6ceKEDpg6v0gzpV38iBxNnzO2wTcdaKpNXxvJ5UUzH3qZjQj/Oq59z/vj
	r0X2CdYCtO1cgBEhyEn2sk7PyIk5jIeIq1j6VCQp/rs8UL8iTVWnv/TQFJY3zhD5P7NyndNrLJO
	yjns3sJQQJDuMM25amecK1J4qHksdbVnTd2VBdQ8YbW05dHSgqswrwBobh8vB9l4jPueJqCtSPa
	X1NhSiXs/awvxX
X-Google-Smtp-Source: AGHT+IF+BYCHuUTwdpdjVvLvUjz9fJvW2obdjNL293EGpVlweKHP0tzpD6mVfCW4djoRh1UoGciBdQ==
X-Received: by 2002:a17:907:7fa5:b0:ad5:8412:1c9 with SMTP id a640c23a62f3a-afcb996f1aamr380512666b.59.1755197101896;
        Thu, 14 Aug 2025 11:45:01 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:01 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 1/5] usb: typec: Add alt_mode_override field to port property
Date: Thu, 14 Aug 2025 18:44:51 +0000
Message-ID: <20250814184455.723170-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250814184455.723170-1-akuchynski@chromium.org>
References: <20250814184455.723170-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/class.c | 14 +++++++++++---
 drivers/usb/typec/class.h |  2 ++
 include/linux/usb/typec.h |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..a72325ff099a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -459,9 +459,16 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
 	if (attr == &dev_attr_active.attr)
-		if (!is_typec_port(adev->dev.parent) &&
-		    (!adev->ops || !adev->ops->activate))
-			return 0444;
+		if (!is_typec_port(adev->dev.parent)) {
+			struct typec_partner *partner =
+				to_typec_partner(adev->dev.parent);
+			struct typec_port *port =
+				to_typec_port(partner->dev.parent);
+
+			if (!port->alt_mode_override || !adev->ops ||
+				!adev->ops->activate)
+				return 0444;
+		}
 
 	return attr->mode;
 }
@@ -2681,6 +2688,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->alt_mode_override = cap->alt_mode_override;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..f05d9201c233 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -80,6 +80,8 @@ struct typec_port {
 	 */
 	struct device			*usb2_dev;
 	struct device			*usb3_dev;
+
+	bool				alt_mode_override;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 252af3f77039..6e09e68788dd 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -304,6 +304,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			alt_mode_override;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.51.0.rc0.215.g125493bb4a-goog


