Return-Path: <linux-usb+bounces-27261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC49FB344E4
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 17:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 774BF2035D3
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 15:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD34301474;
	Mon, 25 Aug 2025 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GcvgPcRE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E94301035
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133895; cv=none; b=lKybrJwXv/bpd8BOaA0pndQ+Rg8vgo9Q9cc5GVuXBAs5IIByouJSPKLeqQVOSPQ3mE7B9obYis1Hu4XJMHEjmsFhYNbZTROTN3ML0HyEKxxZ3O/7P2fZ/a/3LEVXrBgiSvZgXC0R1ZxeMUluCEd3yprxBjiw7n7KUQ+b/mZw6jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133895; c=relaxed/simple;
	bh=0BGpDIvSRWnL+9XoMN9WOJgDbPiOu14Iony9ATZBpSs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DN8LjdZ5+8C53Es7cuBMv1/eF0Oqfak/SQnBIn/hiNzLfvAMd6gtjmPaUrauN2VkRKCLhLvLMZPjXY4kPO1fkKx4KrkrIrdxybpoAe+p7i++So+ht0qOlyUREtV+2BLfkxpOFyk3onuwN/G2kppB/eXRHvC5QLEVcAkllAf2xDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GcvgPcRE; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb78da8a7so705855866b.1
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133892; x=1756738692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtPmPO5XNYkE7V8xoQ7flpHn7rik8pyLeIH7/5dO6qM=;
        b=GcvgPcRElz5dzOBuUxwmPvGTSfJ+77Sxe9H+5XF+T6pcK8k/BD4SdFck9LsS1f/QyI
         PIR9Rpn8KINW0aEKbKt1Ed0pX62i5tR+NDETkiR51fnblNS1LtlOAIqC86ftBcZ7Rn4o
         E7ESOge8DCsoo2PiQUW21rm1WoaGZCj7AXLzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133892; x=1756738692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtPmPO5XNYkE7V8xoQ7flpHn7rik8pyLeIH7/5dO6qM=;
        b=CPzP+RRNKG/q0SX6wWutFoz7qiVtvAj5D+zqJnY4j/GdDl89cEfQgHrPlX3zGuy7Eo
         InMDGOHlx2cgEnNio1zvaI3Cg7+NTN3yyVYi6dHqT6nv//CT+M7+MO0fEOENWqc6tVTp
         OaUk9WYa25i76v1TdmkCu22x38LpPyU87Afs5XBfBnqCdEqxG4L2Z0bK7CtahoGT5MAa
         8OsFcU8YbgEpC4u1kechJvkyfMosupzqGotDQ7shUwqKFOO1jzKDy0PXwq0S0fVJvrcO
         4nAqgIsYaPxOHCjnS+owRuSGICYr1yO2IzOxVyXS+lvPq9gZo0PcxWCjGwK9xKlNbw40
         Xq4A==
X-Forwarded-Encrypted: i=1; AJvYcCW3O5OIEZdJ9gmRq75dzuzD7UMHcieuXvv2aDuZsUX/FQ1b8pSPzsEgdo9hNol9BlErJCn0xhQlcig=@vger.kernel.org
X-Gm-Message-State: AOJu0YymT80Axo90YVVktEYFuIoV0XGjcoS6HGpMFq+1Cjk9bBbcvX+0
	ql3mVIcXv6SZgOLkaS+FqGPLZT9CQtFhfSFIzpdN0DhXYuVYXF2zI42NcG0Pkfo/Ww==
X-Gm-Gg: ASbGncuhWYEv/gEkLC3WT1wtjJv7Z1UYLIjqYaqm0sde+QiOhPeqFasUd5Iby5HT1Lr
	Tn/cbRj5t2FFuRU/AlztWYwQ/x/YkR/Gpq1HPsHRc+hSRSzcnMEKAqcCbe5j1Ho2kMC+T3PhwJF
	Kp7avo5dDKx59PYII7bttxkdk7es5ZP6ie3luVNELUjIyfIV0P8ZrP+Q2VCRlU8u7cxKqWeVm4H
	p4glsjwmioy7mV428ju/k424a3gtY0P8b2tz2Nd0IG3d8Lvn9gmFJDb3UI/Y8zns8PtxcxTlbaR
	khQ0hlUsHxwDQZOr4Ev0RZCFjwMBvE8CvOmQo9v7Fg1JW2MU8LuU5Uv12OThXwqdnmkVn/B1koF
	n2rXkrqMTXSoC1JhT05x+FTsljKZLHC70MPPP16z51YHJ31XC7k41IWdC8RZM91yJu/6hC2kCit
	HmMSjgIduHQTxB
X-Google-Smtp-Source: AGHT+IFHIKJNDrGoroZVVpWmctlQ9FpQ8lFadPfFf19Uh7Mtgvrs7j6pKi3bP2ml+nSy2qOMBnyr+A==
X-Received: by 2002:a17:907:6e92:b0:af9:5b3f:2dfc with SMTP id a640c23a62f3a-afe2965ac9fmr1000432766b.47.1756133892254;
        Mon, 25 Aug 2025 07:58:12 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:11 -0700 (PDT)
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
Subject: [PATCH v2 4/5] usb: typec: Implement alternate mode priority handling
Date: Mon, 25 Aug 2025 14:57:49 +0000
Message-ID: <20250825145750.58820-5-akuchynski@chromium.org>
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

This patch introduces APIs to manage the priority of USB Type-C alternate
modes. These APIs allow for setting and retrieving a priority number for
each mode. If a new priority value conflicts with an existing mode's
priority, the priorities of the conflicting mode and all subsequent modes
are automatically incremented to ensure uniqueness.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/Makefile         |  2 +-
 drivers/usb/typec/mode_selection.c | 38 ++++++++++++++++++++++++++++++
 drivers/usb/typec/mode_selection.h |  6 +++++
 include/linux/usb/typec_altmode.h  |  1 +
 4 files changed, 46 insertions(+), 1 deletion(-)
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
index 000000000000..2179bf25f5d4
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.c
@@ -0,0 +1,38 @@
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
+	struct typec_altmode **alt_target = (struct typec_altmode **)data;
+
+	if (is_typec_altmode(dev)) {
+		struct typec_altmode *alt = to_typec_altmode(dev);
+
+		if (alt != *alt_target && alt->priority == (*alt_target)->priority) {
+			alt->priority++;
+			*alt_target = alt;
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+void typec_mode_set_priority(struct typec_altmode *alt,
+		const unsigned int priority)
+{
+	struct typec_port *port = to_typec_port(alt->dev.parent);
+	int res = 1;
+
+	alt->priority = priority;
+
+	while (res)
+		res = device_for_each_child(&port->dev, &alt,
+				increment_duplicated_priority);
+}
diff --git a/drivers/usb/typec/mode_selection.h b/drivers/usb/typec/mode_selection.h
new file mode 100644
index 000000000000..cbf5a37e6404
--- /dev/null
+++ b/drivers/usb/typec/mode_selection.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <linux/usb/typec_altmode.h>
+
+void typec_mode_set_priority(struct typec_altmode *alt,
+		const unsigned int priority);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..571c6e00b54f 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -28,6 +28,7 @@ struct typec_altmode {
 	int				mode;
 	u32				vdo;
 	unsigned int			active:1;
+	unsigned int			priority;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


