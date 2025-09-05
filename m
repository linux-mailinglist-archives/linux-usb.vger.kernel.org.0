Return-Path: <linux-usb+bounces-27603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B248B45A46
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 16:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 330267B4CA9
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 14:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA503705BE;
	Fri,  5 Sep 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aq++zDRw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF45336CDFF
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082144; cv=none; b=A4R/Y0FrG6nMlL9sctI8dtnttBJ5XYCjtfU+nveiOSMt6lSFqQyWP7H4gZVuTctp2nyHvTHEON20ne/pwxxYPmtFVH1HgZsV7YylpThLP0u9cqrlspEG15PHAch3f/NaIDqTg2XPistutbPACPjy4hSSlUprMJsqgNw7yhXRCzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082144; c=relaxed/simple;
	bh=5N/rH2l80Ktvf6ZOLrQvgwDOrXD0nhEqJ9c02j0Lg4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gw3px25XQwZgBRP/jeQTqfwF/nd4g4mOKAkvJMMARqNpdnNIXop3y+p/TZMC/S8zREIWl6i5nVb9oGX4uFcfbBWjiKJUppyqClUj0zlE2OqBlEnHPSatZzWFPutPnkg5N36daro4kPwVmkKla2x9FzLIvfL73yF+Cl91haY8Mnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aq++zDRw; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b046fc9f359so407869366b.0
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082141; x=1757686941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvUNphtUz9Y1R9ktHcB7KtYuXuG0QSWTDzZgUfzVFec=;
        b=aq++zDRwg1n7FS4sbh1nA226fEcGhF8WY0mJfEJz/uwH00TyqcqWWSarx8NgR/ocsG
         Brxq5r9Ko/QN0j5gmF3EwOsVFSpSDt6r7td/njtAZmVno/A07yoqzPi0i1dVYo6zqNOG
         GIL+tjM+lnGZnWtCrH35lwR7SBu6iEyNtQCZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082141; x=1757686941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvUNphtUz9Y1R9ktHcB7KtYuXuG0QSWTDzZgUfzVFec=;
        b=aAUNgssWfSEZ8IBgpQoaAjeDbY4bvg5Xv/l2Jv5g5Pf6jxpXFRBwiRxuRBxaAn4Nbl
         r6ZJi1vV7fhDKlB+RxrgtrjaRqBNVunmcOWOIqBqPYfU4x5cMuy8NbLe+xxV5X5CDPqS
         +S4KJsem5HKZWaVpHOvb1EY0NN839SO5MRkeOqSenEtiN+MfYXTA1Pz71cBk93Sn8a7M
         +6PfUZIpjtoPuTzXUzMzX3RjVsR4FN73bOvGbxREfgptVmji2hx7h1K7Kpc8hZN1Vljn
         0MnvmUYXTnprm9dkgUE/d4hiMq5n1gOfOG8X3WQwmTvazydwc119PZurtQPWgCr5+38z
         +ryA==
X-Forwarded-Encrypted: i=1; AJvYcCX1ZDtbiyPlRQjJod5FfzsLOZ2AgFNdF2q3SPh3SNbDphS1b6GgkctfM9yg1zk4YF9+6ZxjS67DuNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxEv6uk8iT3E3Jv8yl4yQrnxiP+pfamkHl6eQjgR/b+aaNnN0L
	oRjf1vgAU9Q+sZ/D7G+qnIEAck8o0/TD8GzsgpSH/UtnqxFOlV48XcDRKmkH4p21jw==
X-Gm-Gg: ASbGncsW8BukK9DFj1tB5oS45hr5+5r/5RRgWQBigj8O1K8DIjX6rD8WqnFz2XqnCmL
	CDoouRXPvDypJIQOGNVIBJX9B6pbD4je3NFSWWB6wz2TzWYODtNDVvxuUY+tjux2/oo6vrFi9bW
	LTnM+NRDNc4/2OoW29Tg5NW/PBkiF1jakb1sxoDJBEBwTuXle06uHZC19Hieavh9Dan+uVyJH2+
	gqBPCBYbelP/JjTIzuB1XvhsN0IDN5L4U43mLlaCQnuw1cVsWKUR69gIRwuZEMhKziBkvp3x+4P
	sFHNqvCMlj8bV/KXy/lTcpRGPpmFtOp50RIKZe1IFWg4L11llAkgoIerWjomTkLYHawrg+WQ4a/
	32/GoPmGw5vqgI+hiS0B259Zq6+8/aL8Ed5soYs5/cV/xQkleHYJjfo15wDKR0BgzWudsoR6ug5
	neGXdHP1taUZzpsYinB+VyZAv0rA==
X-Google-Smtp-Source: AGHT+IGfW53wYhRJFchVhlBh0z4k+oPM9nbab+nSZ8hw1YR5eT88L0CvzsuEHVeF3Ys4E5J3K9DYPg==
X-Received: by 2002:a17:907:728e:b0:b04:7b7f:33be with SMTP id a640c23a62f3a-b047b7f352amr825270066b.48.1757082141093;
        Fri, 05 Sep 2025 07:22:21 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:20 -0700 (PDT)
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
Subject: [PATCH v3 4/5] usb: typec: Implement alternate mode priority handling
Date: Fri,  5 Sep 2025 14:22:05 +0000
Message-ID: <20250905142206.4105351-5-akuchynski@chromium.org>
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
2.51.0.355.g5224444f11-goog


