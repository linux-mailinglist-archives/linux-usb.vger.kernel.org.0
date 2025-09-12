Return-Path: <linux-usb+bounces-27996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF725B5432F
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 08:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26FA6A03540
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 06:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0080A2BF01D;
	Fri, 12 Sep 2025 06:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ca8uOeGn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9062BE7A0
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659687; cv=none; b=BRU3Z9Fd2di9XWZoLIg3KC0hQICk1B1Hz7BWZ1ljt4QAexBBPZFhUc5/avIFbVxx49WSZfHiNY9ML+rMCJVoQ9fVMz/5dt2UpPKkXUrWNQyPb2aWcz+MsnBbt0W369wJbz0wW7DqXF8NV/V7cWZQS9oaPS43XRKzGNM5bUvcfQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659687; c=relaxed/simple;
	bh=DUPoh4Zyec6Zt7EqJ5e3ik3Z5aBUkLkTB6W4xkQH9DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jHmZtxXS24UPtsKX3G/W7hX6BZ/oTf5Rs5jLXWz3MYczYHmgX1SQNe6vtuzHH+VNe2faQODrwE3rh1NTLsd1EznyY4ydSZS/LRh7cpK62QAi+Fn5xW20aZ8GdTEgQqDP/iZvNpn5bySMmsNN3Gdc6U+joj24BpcSCoUfMDnx48k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ca8uOeGn; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso3147264a12.3
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 23:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659684; x=1758264484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NvADMrt6HurTsoe+Lfqu7ifPRq1qi6pH7Zq/9XUUt8=;
        b=ca8uOeGnXXxsicS323wJ9Wgub4BL+OtascBdAq8pCWyy4BuuyHIzNTEVPFKAFDUNlG
         HwbujBgxaioMKvnLwFoLZIqgm3rFFxv8//0P3N2qAPXixpWW+QB4DEh2d79F2/RPIUvB
         pKVJzrWUUL7qN5SSh6ABRq/kFvWuJ7kVpwsBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659684; x=1758264484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NvADMrt6HurTsoe+Lfqu7ifPRq1qi6pH7Zq/9XUUt8=;
        b=RDGOIyxwAuqnTfeLG4aWLpwTYdO2jyamDNt3s0oO3BcnJEVN7JzllGn9sUp+tZ7Qz+
         Q0Feowc/9E5iHBae93IyUrWu42SlibnbPLsBvl5Pghm7aZaDaubfNAchHzAxxfZXMEwr
         LUC4JY37v7xHU7HAcx7ekHy5kfJ/VoifYWdvT8UBg8qz+lpQ4vLyuV+P9yNw9ONfLWwf
         Lrd5KGnDtTjZZu/IpUPjWO9qNARdQ/AHa7fDsQwLUilbS7F7djJOK2eprgnU4IX/Sjm8
         iJwn1najQT0EhPi5H+aCJaCtDbqhoJpPKhDiC1uYJwSsPDWBowunqb/JyTTdu9ciNOqD
         jFxg==
X-Forwarded-Encrypted: i=1; AJvYcCVrkiRWjo5vXVW4uY38AsfBu719fbHs2CaxRkZUajd9EwK8vrwpJr5dRqQIa7to1eCdXgGUlT0m7rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNtj7Vg9Q2Fm/dqvkJFRdEnpZTmVfTV/SxVnV7YQ9hDGxKpC1
	UDUWjQuaXuFTw1GFVtWa/cgPb7jE4C5yiUJaFvVipQFVv1LJrkRuuA9dEOlR2S5ScA==
X-Gm-Gg: ASbGnctyvN+05GSXA6dVfcYjBNdYQGTKFdG3tcOEGxf0Zg0DpCYnGkB45pPeyyKRDgp
	pYHLCqBovsgAC28GhOXc3MoSFN+H/NnsS2i3k3Cgj/vGD0MFoH3+UjEIz7CkWi7ZOTQc5AVbSUJ
	W8Rv7nRboM17EteyxzPW86i6Cj1TmIW10DedY6s4NVij8H5MO0fBstFWxTSLG32Sg1jownqb65A
	dqFsEcDRh/4nLJBORqyxuEW841Tbn65u+KNgMOvwnD+0pOnOmlS7tUxqCmomkTc8eyib2Y2kfHW
	F6LZ2HpffrkGsF1iqSmW+37HxdTa8T68+VUZ/4Z6NkqS9dWDUMy/lMGu2RXBS6fNR2TQQi9E0q6
	VImgTFvz2Ywfrxqmu7H2EyQ6Y7X0ChvwldkCJPkF9GxM2bY1Mik24+sOUL5YX5xJsdr39RnMl/B
	Ab6Wgvw6e0/9WsB7tPV3foWM4gjbit+TPzvTCF
X-Google-Smtp-Source: AGHT+IHO5xX13tdxcN9DsT2lG0RauabvfBllR6+E3bjJfEFfjTIbdd3fJBDvYLD+ZC7qjjUCzN9HRQ==
X-Received: by 2002:a17:907:7e9a:b0:afe:ea93:ddbb with SMTP id a640c23a62f3a-b07c38673ccmr167104066b.45.1757659684076;
        Thu, 11 Sep 2025 23:48:04 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:48:03 -0700 (PDT)
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
Subject: [PATCH v4 3/4] usb: typec: Implement alternate mode priority handling
Date: Fri, 12 Sep 2025 06:47:50 +0000
Message-ID: <20250912064751.1987850-4-akuchynski@chromium.org>
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

This patch introduces APIs to manage the priority of USB Type-C alternate
modes. These APIs allow for setting and retrieving a priority number for
each mode. If a new priority value conflicts with an existing mode's
priority, the priorities of the conflicting mode and all subsequent modes
are automatically incremented to ensure uniqueness.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/Makefile         |  2 +-
 drivers/usb/typec/mode_selection.c | 62 ++++++++++++++++++++++++++++++
 drivers/usb/typec/mode_selection.h |  5 +++
 include/linux/usb/typec_altmode.h  |  1 +
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..8a6a1c663eb6 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o bus.o pd.o retimer.o mode_selection.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
new file mode 100644
index 000000000000..048e3f75efa5
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2025 Google LLC.
+ */
+
+#include "mode_selection.h"
+#include "class.h"
+#include "bus.h"
+
+static int increment_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_altmode(dev)) {
+		struct typec_altmode **alt_target = (struct typec_altmode **)data;
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
+			alt->priority++;
+			*alt_target = alt;
+			return 1;
+		}
+	}
+	return 0;
+}
+
+static int find_duplicated_priority(struct device *dev, void *data)
+{
+	if (is_typec_altmode(dev)) {
+		struct typec_altmode **alt_target = (struct typec_altmode **)data;
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority)
+			return 1;
+	}
+	return 0;
+}
+
+int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority)
+{
+	struct typec_port *port = to_typec_port(alt->dev.parent);
+	const u8 old_priority = alt->priority;
+	int res = 1;
+
+	alt->priority = priority;
+	while (res) {
+		res = device_for_each_child(&port->dev, &alt, find_duplicated_priority);
+		if (res) {
+			alt->priority++;
+			if (alt->priority == 0) {
+				alt->priority = old_priority;
+				return -EOVERFLOW;
+			}
+		}
+	}
+
+	res = 1;
+	alt->priority = priority;
+	while (res)
+		res = device_for_each_child(&port->dev, &alt,
+				increment_duplicated_priority);
+
+	return 0;
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
new file mode 100644
index 000000000000..7f027d591cdc
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.h
@@ -0,0 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/usb/typec_altmode.h>
+
+int typec_mode_set_priority(struct typec_altmode *alt, const u8 priority);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..fdac5e227df5 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -28,6 +28,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	u8				priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.51.0.384.g4c02a37b29-goog


