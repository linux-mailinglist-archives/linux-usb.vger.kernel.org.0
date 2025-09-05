Return-Path: <linux-usb+bounces-27604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFC7B45A49
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 16:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 474FF1CC46BB
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 14:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9C6372896;
	Fri,  5 Sep 2025 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JR8KLbOt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4736CDE9
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082148; cv=none; b=cAePBHlpG6Dtuc4VBPGGUqro1P17lazv4mfOOqR6wyDWshXCbyMClY7m3OaLwar847iAO4po7VZc4fGozyFayXH1TDvcIi8qyLG6p+OhQTKN9i1S565RhJEwDChcN+VRTWqIYsUo5MrZ1GFfJ7KP6L4hkdVslIM56th7uy4caJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082148; c=relaxed/simple;
	bh=N70arxT/iGReacj90zjbg0gjuZvRPUxNf9AQDKl2eMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQZpjkzsNKQcFVi8r1vleqvu89KPhEXfsrXFuceRfmDwM0hZQCdNF0RPu7Hstr5tRmV6eTYFQoanEetMX53xK1QKE13aEWpyRkD8n/vRyA1IV5Q/0Z/1N1g6CF371km3oOfUHgUzVDCWZGhLdmP8Cy1lk6VCublN6EFGsPTU/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JR8KLbOt; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0454d63802so369604766b.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082143; x=1757686943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM2EplsdBpHriECPVCPtShoqnRN3L2lkTWP4nBkA3tY=;
        b=JR8KLbOtEVWf0UDPiXSO50Hn2M+APsmFamSG276Yx/XvhKV4cqwDY6UbJFPJ9ejvcj
         yB157NpUOkmLargTviCX/y9jVjmUA2GBc7kqfI5Et9kzTrMWFg/bfmvUJOrwFtQ8P1li
         XrTc7CYyztG8gTnhxFf47Gq16XfVreDcJpqI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082143; x=1757686943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aM2EplsdBpHriECPVCPtShoqnRN3L2lkTWP4nBkA3tY=;
        b=g3NMK6Mj86jaPMYI8n/LV85X4DZ+rsJiFXbg500UFdX9bNvEBSiTd+5wxzl+zUrEcE
         241WV/4o5FWlJXc+jKNjiPFTsDfCnw/81oZPeIGk4AMI9tbIHNnbRP4qmeQ9pZvkk51Y
         qF7D/ITcZsalXDc7m1j3K4Umw0htZDJgwS32Z2VwtKFVzh4AnoO/0O4YKVaNkJK3e/af
         OuDL//xXUG1ZTFQ0JeqCCb73+CSdRZ5C90LETMt8EG9pUzR4oGV1Ey+7Bfx8Ml245ycA
         fj7PFstw8OGS57quNFZeFj4PjnAjGxgEUXfyN4XxJJPJIVxHci5krN4ub3gLOAtDpPLT
         eyDA==
X-Forwarded-Encrypted: i=1; AJvYcCXqTHYs08nzrthfp3518r0p47kUkvMLfYVJh4gaoNSJaXsYflBCZRknwM16L+2e57/gfzO+USV9JWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZxI1n2VVONkpiJOlmFSkGSfF/qxKG5Bdod43VBdgWNIkd9tP
	+lInhk4h7tuGHRsXVZJ8gNXbaJ5J/p8ztmh91Y+s3w5klSF//XidkUzXYmvFxzqq2g==
X-Gm-Gg: ASbGncu4u9OhXLIQrhZ3CcvR0Ef/UkaOlccpGw9O83vS56DsGqL471LbEvsCSxZOCla
	n7ibikt/9lBN2hdw+vuzpvzOw1Ddk9wK/LZnkFU30TWHkCR97USmbtSym+sr0uJGD+lBnB2N97d
	JzY0GMImfp6nmOFI9L+6qkXetFDWEepl7Cq+ilWCP7A0lVNgGHExLZAFTYjhyNWn2f0jXRRNsBS
	tndIf47AxuY5UUt9x9+rGyLxoM+efe1nbiqxxTOO/ACbgK2wfsr54Yti/d/FVHyc/LncGjf6GpV
	dGxve3LrlssHiwxFliUvlIww6qa2+F+ukBG51ROlxBPs8RHkhmTtk4SOVu5971Vl152D4+Lzw1p
	/MJFrrnQzxKt0Wu+g6vkFBVkFVOyfCaxttIVcf6bCAyszojj2SFtW/Yc36HebhfXzIUhNj8h59Y
	c3ABNA+G16LHzdIVc=
X-Google-Smtp-Source: AGHT+IEUW8qkOHgjidxoy4ZII7ZAuk//jICzXdqIhvcSNPCu7yDo3dIGYIsHRdwcsjy825w3RSPySA==
X-Received: by 2002:a17:907:94d2:b0:af9:5ca0:e4fe with SMTP id a640c23a62f3a-b01d97bd1b7mr2225391066b.56.1757082143434;
        Fri, 05 Sep 2025 07:22:23 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:22 -0700 (PDT)
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
Subject: [PATCH v3 5/5] usb: typec: Expose alternate mode priority via sysfs
Date: Fri,  5 Sep 2025 14:22:06 +0000
Message-ID: <20250905142206.4105351-6-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
In-Reply-To: <20250905142206.4105351-1-akuchynski@chromium.org>
References: <20250905142206.4105351-1-akuchynski@chromium.org>
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
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/ABI/testing/sysfs-class-typec | 11 +++++++
 drivers/usb/typec/class.c                   | 32 ++++++++++++++++++++-
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
index 38e101c17a00..dab3e4e727b6 100644
--- a/Documentation/ABI/testing/sysfs-class-typec
+++ b/Documentation/ABI/testing/sysfs-class-typec
@@ -162,6 +162,17 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
 		- usb3 (USB 3.2)
 		- usb4 (USB4)
 
+		What:		/sys/class/typec/<port>/<alt-mode>/priority
+Date:		July 2025
+Contact:	Andrei Kuchynski <akuchynski@chromium.org>
+Description:
+		Displays and allows setting the priority for a specific alt-mode.
+		When read, it shows the current integer priority value. Lower numerical
+		values indicate higher priority (0 is the highest priority).
+		If the new value is already in use by another mode, the priority of the
+		conflicting mode and any subsequent modes will be incremented until they
+		are all unique.
+
 USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
 
 What:		/sys/class/typec/<port>-partner/accessory_mode
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9f86605ce125..aaab2e1e98b4 100644
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
+	unsigned int val;
+	int err = kstrtouint(buf, 10, &val);
+
+	if (!err) {
+		typec_mode_set_priority(to_typec_altmode(dev), val);
+		return size;
+	}
+
+	return err;
+}
+
+static ssize_t priority_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%u\n", to_typec_altmode(dev)->priority);
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
@@ -2491,6 +2519,8 @@ typec_port_register_altmode(struct typec_port *port,
 		to_altmode(adev)->retimer = retimer;
 	}
 
+	typec_mode_set_priority(adev, 0);
+
 	return adev;
 }
 EXPORT_SYMBOL_GPL(typec_port_register_altmode);
-- 
2.51.0.355.g5224444f11-goog


