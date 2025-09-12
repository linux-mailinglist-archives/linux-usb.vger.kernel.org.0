Return-Path: <linux-usb+bounces-27997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10632B54331
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 08:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 159A6A08A44
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 06:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9075B2C0F75;
	Fri, 12 Sep 2025 06:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HJclE4RQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4992C027B
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659690; cv=none; b=TELInI6X/uH7Oiv6ytLWVJQn65bekknvPPdVX3ovysSsiyGRCQKJWOQlF4eBzll7wTYEPr5iFguxp7GQNmxddId5zGoGg8Je0vNdKL59cYBqtRql69+Df/tuHeP/MR4KhMd2afNSEEPyaQ3StYSfmGltZgmOBFFaKDUDpI3kBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659690; c=relaxed/simple;
	bh=UT/bION2zNpmXwBRk6uc/9Eat1ApMNYCZlITkT1NplQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLgyKVv/bjpprUQF45SqdD6LvNcrQ9DnJjmFfl/pHD3szaCjkrTCQc6hAZwocC94vH/sIHqMRNP3bDsShJ40YNx4jRT1q7Woc08JWqZ5BawV3gSig/9hsh4PSa9K+g1GMMVZD99Hen0q2nPPNk7NWkCTFaVK94Qmf5+Vy9Y3au8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HJclE4RQ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b04ba58a84fso212789966b.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659687; x=1758264487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0Xtud0TdVZ+DWagzGFvFsKpmqRiYDQ9VDWpfm1enwI=;
        b=HJclE4RQxmxaCLVM93/M+u9jaZapowUif+CwHjITSKUfHZux+HseO5umqbQKPEuZTI
         vxepY5pl31etZNwc+jzTLepMZGT3wn1IpRfgwluWLWqvnOKEwEAq7o/WY9jLRF5d2vyC
         UtyhuEvpuKz1iVBlDc7URgNWq8MO1JNU+DFoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659687; x=1758264487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a0Xtud0TdVZ+DWagzGFvFsKpmqRiYDQ9VDWpfm1enwI=;
        b=iyzahbl+9g0Fvwkap5EIzBD58LWpUb8c5W0xFDSMIOHAuNTMKP8hC8xzwfwVpaGE5m
         l1sl1t7OeU+zDwcRjF6Kq+1/hQfk8LzCfYUJKxMlLbOAPo/8TmSs6bdFK+a13XGmpwsv
         8zQ9GGWsoShaSM9kWrAw9D2qahzNtqS15Eu5ILzH8U/tk5m1imRQ1fGMJUy0K2m7oTcp
         cHbHlT4ZHUWHk9TpSvPAZT09C2QQLjjJntIeUSSAODIYHjyXfFaH3CJAHiBS0V0+Su4u
         Lo6yev9VmS4K+z/YTllg2CiD4rfyCStj/mBC+FIgrM1MWInO4sDEwff53on9zfd1O/Jy
         h9uw==
X-Forwarded-Encrypted: i=1; AJvYcCV1lf3Nek1VfJ+LB2zc0VbJ+JZwK4fniXC9xRVujwwRQbXnSDXjdIY7X0wagp/M+li8Ax15GMYtTkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUSAmF4rRhiGSB83Qln0KGeYGFsKzyoI7JWOqmCTGnztcEvUU8
	MdRghZ74CIWgFAUPm7USXDy+QLzxsVpKsEk9nPt3c85L3nyOfBKRPTLvkTTTRKAxkg==
X-Gm-Gg: ASbGncs7jxeL8vtJHEmQBLLTVP4E+oild8YHtIpANThcd4vFXE+rM7F1w52YHr7Lgw8
	CcVOVASWjRRoCAs26qio3O7427xima+G1HO+G/737pVT/ZqhncGd75RWuq+Cncb+89RARIyPn1x
	+u3UoG300MsedWSScTIrLan/gJAx8Dokhg+zCPqvZcJ3rl7r2Z51DrQ3Kv30AaFQkTcDhM3DeW7
	IyYr4kfNTf0+hC5M9tapb37XCpsem9r7wbNmRCIHaU5YdX7UCKhZKbfeTv6CcpWFBMHEAEgQydA
	9QOKlTDgDMD+k1iN+XE31CQrvsjQOznbTF5DAFJQDABVHBLWgXcs4Ij0LXCCLk4jkt8C3WPfo2h
	gefQfkSEPHBd/sCUL1vCHBt1JnuxxkbfY0XnUmgMYtItPPQ1qV/M+mibB/yvjrt2lkAi/PZ0DlS
	WqSnlU6egisCtEUNlD5XNcg3GI0QBSEYmYHnLB
X-Google-Smtp-Source: AGHT+IFJXwxQzhGtmgTg6Wyltw4l/rkxAEpJ7pN6ZY/j+zLPCSWzQ8LLU+wbeQfpDvkIAniXPe0jLQ==
X-Received: by 2002:a17:907:9623:b0:b04:708e:7348 with SMTP id a640c23a62f3a-b07c37e0e05mr181292666b.30.1757659686414;
        Thu, 11 Sep 2025 23:48:06 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:48:06 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 4/4] usb: typec: Expose alternate mode priority via sysfs
Date: Fri, 12 Sep 2025 06:47:51 +0000
Message-ID: <20250912064751.1987850-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250912064751.1987850-1-akuchynski@chromium.org>
References: <20250912064751.1987850-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a priority sysfs attribute to the USB Type-C
alternate mode port interface. This new attribute allows user-space to
configure the numeric priority of alternate modes managing their preferred
order of operation.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 Documentation/ABI/testing/sysfs-class-typec | 11 ++++++
 drivers/usb/typec/class.c                   | 37 ++++++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..0f6e6adb71c4 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+		What:		/sys/class/typec/<port>/<alt-mode>/priority
+Date:		July 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:
+		Displays and allows setting the priority for a specific alternate mode.
+		The priority is an integer in the range 0-255. A lower numerical value
+		indicates a higher priority (0 is the highest).
+		If the new value is already in use by another mode, the priority of the
+		conflicting mode and any subsequent modes will be incremented until they
+		are all unique.
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9f86605ce125..6191f7def91c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -19,6 +19,7 @@
 #include "bus.h"
 #include "class.h"
 #include "pd.h"
+#include "mode_selection.h"
 
 static DEFINE_IDA(typec_index_ida);
 
@@ -445,11 +446,34 @@ svid_show(struct device *dev, struct device_attribute *attr, char *buf)
 }
 static DEVICE_ATTR_RO(svid);
 
+static ssize_t priority_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t size)
+{
+	u8 val;
+	int err = kstrtou8(buf, 10, &val);
+
+	if (!err)
+		err = typec_mode_set_priority(to_typec_altmode(dev), val);
+
+	if (!err)
+		return size;
+	return err;
+}
+
+static ssize_t priority_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n", to_typec_altmode(dev)->priority);
+}
+static DEVICE_ATTR_RW(priority);
+
 static struct attribute *typec_altmode_attrs[] = {
 	&dev_attr_active.attr,
 	&dev_attr_mode.attr,
 	&dev_attr_svid.attr,
 	&dev_attr_vdo.attr,
+	&dev_attr_priority.attr,
 	NULL
 };
 
@@ -459,11 +483,15 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 	struct typec_port *port = typec_altmode2port(adev);
 
-	if (attr == &dev_attr_active.attr)
+	if (attr == &dev_attr_active.attr) {
 		if (!is_typec_port(adev->dev.parent)) {
 			if (!port->mode_control || !adev->ops || !adev->ops->activate)
 				return 0444;
 		}
+	} else if (attr == &dev_attr_priority.attr) {
+		if (!is_typec_port(adev->dev.parent) || !port->mode_control)
+			return 0;
+	}
 
 	return attr->mode;
 }
@@ -2471,6 +2499,7 @@ typec_port_register_altmode(struct typec_port *port,
 	struct typec_altmode *adev;
 	struct typec_mux *mux;
 	struct typec_retimer *retimer;
+	int ret;
 
 	mux = typec_mux_get(&port->dev);
 	if (IS_ERR(mux))
@@ -2489,6 +2518,12 @@ typec_port_register_altmode(struct typec_port *port,
 	} else {
 		to_altmode(adev)->mux = mux;
 		to_altmode(adev)->retimer = retimer;
+
+		ret = typec_mode_set_priority(adev, 0);
+		if (ret) {
+			typec_unregister_altmode(adev);
+			return ERR_PTR(ret);
+		}
 	}
 
 	return adev;
-- 
2.51.0.384.g4c02a37b29-goog


