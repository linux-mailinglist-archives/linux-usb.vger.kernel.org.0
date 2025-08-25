Return-Path: <linux-usb+bounces-27262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79745B344E7
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 17:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08186203BC1
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A861C3019CD;
	Mon, 25 Aug 2025 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IgSX/PBm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8930149F
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133899; cv=none; b=nL5hgERLoxT+aA6VK690USnckz73suDWxAvAjbUwhQ1ezT7eTGyr0hPbhnfVOCkGG9KbWtO5PVt6Vf5UPnJhovn4p0NM7oD2MYnfC2IxKjR806b+aJeMMtXVGPoLSEclPbjiN8BNtsVLiyPRaWmHa1LzygAm4jbp7a8cBCyYUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133899; c=relaxed/simple;
	bh=XF1HMt7dKr2pKHf61hV+dMVYlJL1q20sHlne9+/cMD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/HDDU+2WdPuLsx9LcTsGqFEUrRyocamMIyqa2USbRYX7hNBOqB/CiEeVO7Ed9Oqj0wOLvPYe7WN36h9kSURMRPImkx1cqmZgG0JELF1F/LYuZzJbPvfejXlImgpIYYHbJSoxcpqf49CBGxCr9DSIYmrT4clnruzpDDONlue/Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IgSX/PBm; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7a3ee3cso648452266b.2
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133895; x=1756738695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q03fJibhKtDh3Ep473H06zamAbGTx2QJY+Jsovc71/Q=;
        b=IgSX/PBmrfE9IeRxR7sXEgZ/hCpJmvjQSwIf+y8zziwdRpcMZ9AlbMbSwNY3pFfFzg
         k6cHiEslq4PNVBqiIVxRtVOsca8anSZF/l+k0qkUfI5OWgGNmxIs8eSBWa1zADJSssK0
         6yIaEBT1N+0uq4RZJcIvv3GHSqzXXOSGu12nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133895; x=1756738695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q03fJibhKtDh3Ep473H06zamAbGTx2QJY+Jsovc71/Q=;
        b=FZ8Zo/RcgShzev59D7wt6dj1GNZdafb7gCGtstyaNyXcUIppEY0G4JdzKeGRpzdSjd
         dfND6GguY8XW1CQZjlw/ZEVpf3HyLSBQq8nCZlOcDPr3Uw5LqRT8gOzts3YrUxacCPbl
         t+XW/zLGRJwnOUvZuOvOQTfR61PeExgH7dDFQy4ne3P9xsDdOYuBDnx3K6oVDR0gWi+i
         iGzRLmeGEXZcOgkPWc0C+R7V2SJvt9XY16eQf1DPg2xX+NHcdhIPC9hzo7Udaveovb7i
         2Gcedd6LYOdW3g9LIukLxA3YYwi4hIeJmm2TOJBprO9wwJFQDEB9h6FQAkl+VYBqbt3d
         7U/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOkssX7YMQwILRwoMq08pd9lJPXAnXiNAQpM2voIIAhS5WPofhumvKlqhy+ZPMMipkegMZfG0h3n4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gnRRoY0DmThWcJLUyr9G0UiD/7gVw733IVIfZLTlUKTgq4CE
	Dh3X2KsAZ1lfLHcEfqVCYc3XFaHftddaP8vgt8vnMQ2aqk+PSDvs7Y8SaoRI0OxApA==
X-Gm-Gg: ASbGncuxA5KOm0BsyEO2MXydeJ9BV4PifV6degpU2Pw8U2LioB4tUm39EIkKE3dPo0w
	GDQ/eY0B7LlGuGwWWn0DENFz7eF5OrMTmY5Wd9wu2W1IL4FdEUXFCNXoF2163cvBD9E28i8b33H
	FVpXegArKRKsaCkbEZZwCzIDvmUJVmVD/aj1nHLy4yIdiwZEWo3DTm2D3AXAkwryJv1hEolv4fe
	Q8WVqoT4aKlhfbV2jE/ADy6TwggvQ1vRtDEnAoWUMXd4f+fhCquvNmlz3psiGS3HuJF//4AgvBy
	pvubRu9nfyJhTWGUZkRIVt2b1/B22u7SlyMZ+iA8GIu0l4qmp100WH/QpFDyFaqiPuSVOvEFPQZ
	X4qIiNUzE+hUeNmLViRQj3FVYuzvqVEZCwGXTEAaP39fGaqxSnnHnV9RIrY9dVZPTGPA2tr9YTH
	AlQNWU7KbOfJGZ0GXUTxmTuRHfesqtRx8YQw==
X-Google-Smtp-Source: AGHT+IFQk16CgrOBqQfmn0Kw8YzFpuW8oHF6Fa5HEls+UObeDgxxUHP9Lle73RVTSHFp8RT//Y03tg==
X-Received: by 2002:a17:907:9611:b0:afd:be7d:725 with SMTP id a640c23a62f3a-afe296e8771mr1244313266b.61.1756133895202;
        Mon, 25 Aug 2025 07:58:15 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:14 -0700 (PDT)
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
Subject: [PATCH v2 5/5] usb: typec: Expose alternate mode priority via sysfs
Date: Mon, 25 Aug 2025 14:57:50 +0000
Message-ID: <20250825145750.58820-6-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
In-Reply-To: <20250825145750.58820-1-akuchynski@chromium.org>
References: <20250825145750.58820-1-akuchynski@chromium.org>
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
2.51.0.rc2.233.g662b1ed5c5-goog


