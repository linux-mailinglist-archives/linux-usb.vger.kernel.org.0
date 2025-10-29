Return-Path: <linux-usb+bounces-29823-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7D2C189E1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 08:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 974C33BDFC1
	for <lists+linux-usb@lfdr.de>; Wed, 29 Oct 2025 07:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92BD2F6187;
	Wed, 29 Oct 2025 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="axDSjnoM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD230C635;
	Wed, 29 Oct 2025 07:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722108; cv=none; b=hcEo+hG0UwwBPH4TgrNMJk53OObT1Z7drOq9bLQaZ2UqqDzcEfhTHc7RUbN7I0+mXvLggZxKNqFAChZR4BA+VdPWSbk6QJyB2lbhoGKV37GIyAi4G1Ax6r9FFHk89dLEa8eODZ/N+Das6/UlCc3Alz0GpmIphXiH3bqoj5P6sg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722108; c=relaxed/simple;
	bh=0cv2DaVOvSCRKuK43q4uxtIsFfdtbekWcTaoQMKAUa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=mCKhGxExMc/RFAnOcwzop6nBJ30PjDvrWHcRuLKCo6NznSMbdnnNrJT/AE+/rmXcx0a8JMaFShoy1yECDpw5+zIJtKQlwg7/Qs+1z6csgihmfWPx3biqkDIFt+rkBoCNemtNPi7VJ397ZLjpzdOyM7lyFJ/PXRkW2EeFTrsxk1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=axDSjnoM; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722091;
	bh=j2j9WA1trqT3vAVw/jd1rQawmJe4KSEvtc97hT+jsmc=;
	h=From:To:Subject:Date:Message-Id;
	b=axDSjnoMzuC5X6IKwC9o8L+YT8jloY/jdQraAGDAwFUMaGnjlNLYOJirtVl6qZZMj
	 KneCijyldkDE7fIj9+2B5ZIO+YkhaGeOAIMhQqG3eo8f3ddXdiIzVbfcZnKqBQRTEj
	 9dpvZ6nagLyzIzSQCBE/WfKsv90ZVTNJhy0lwi0g=
X-QQ-mid: zesmtpsz6t1761722089t7ff69d0c
X-QQ-Originating-IP: 7bQdVQ9oUX34jRxfdd7Wtzl35M8B8aqczAbGIlIcToY=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:14:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 376849328953314141
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 01/10] usb: typec: Add notifier functions
Date: Wed, 29 Oct 2025 15:14:26 +0800
Message-Id: <20251029071435.88-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NAeO0+xU6W76d5kq9LLvslz7ZW508fr8c69yiOhYruV3NMGKDn1vocLM
	J7rn0P2kAfwqrrvGGylmBi4O3zCQmUnSR6y1h/0WXxXIoOmRHcKBwhpf1Xn/B26a8MvXfUr
	3nkYqynwQBHa3dyH8O5sPhhSVxIkUAZX3QX8TV+m8cI51CdJ8ouUVifMWg6XdH3ENmOHjtx
	0s4dxDILS2pMLANv2xngwuCmMZ9eqSQck3zFU6BSDZ+xVnvHWF53pDkbA3x6bbWLygs6F9w
	Jq4KQQKWvWWIyAJc6KHBbGcrkSlMGgPByVRKLWIB+9mCPu2Et1C574ltcInyVEkjzkEhDlE
	ER+9fWpCGvRvVWggxeauzIMAHRJDKFS7xHdDu6vPSbB/r6zwDuTGZt5UlqxXIrS5DTJtinS
	1wRHdhf+eZnEy4bZzG+GcLnbDVdfUHn7aFQgxdmpokq577sB2YNS6CtCOrVGKXzBHFm7wZy
	v8ISz74yEHhA+DBQH6+D1XLDr0qhLxi5Y6ptw8EPln+hE11uRU2ay1BBJUfHYavX6XJKkD1
	dTpSoLyaf/ME2ari/hOCwNLUH3V15lA1bKhCMJABs37waK7NJhlLJ9pJDhIQkQfrpK/e2ka
	L8mCaIkWXNMzW2rBggAKveOVHy9iG0zCBnfABlDTPb2KBttzB/h9AmGj4zjiQcvTLfndBhu
	KMDBUfXDfp6FDIUFNmH9ej8Hyzn9MqzIQDLbBTrFlfBOKoQGwsFq28Ipbi5l9LDNv7+0o6j
	RU4UaxDVyaB5cZtdzY5WJQjnmud2TvbwiWJ2d5xVbItIMUC4wCTVe4D8RMGtmJiWS3L9F2p
	5/jYvbjxB1c8b2+FJS6kD+imHkuJNgontYD6QB2qMwsGDMnf/D+iJ0g8P2rEUgfoV/EC/8r
	NDu0EXtru+szdnXMLRTfKhr30E7vjV0Wt32VETUysFhpW3AgnjFkpuW29/44q5rLYT0Z5S1
	uijARbBsY70LMOj6O8dObMzMtJZZwSPsFUk8/RhlB2YHr+Xdu/WB9XrcsWcTy2YjCDJA=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Some other part of kernel may want to know the event of typec bus.

This patch add common notifier function to notify these event.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v8:
- Fix coding style.

 drivers/usb/typec/Makefile       |  2 +-
 drivers/usb/typec/bus.h          |  2 ++
 drivers/usb/typec/class.c        |  3 +++
 drivers/usb/typec/notify.c       | 24 ++++++++++++++++++++++++
 include/linux/usb/typec_notify.h | 16 ++++++++++++++++
 5 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/notify.c
 create mode 100644 include/linux/usb/typec_notify.h

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..20d09c5314d7 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o notify.o bus.o pd.o retimer.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 643b8c81786d..820b59b6d434 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -26,6 +26,8 @@ struct altmode {
 	struct altmode			*plug[2];
 };
 
+void typec_notify_event(unsigned long event, void *data);
+
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
 extern const struct bus_type typec_bus;
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9b2647cb199b..51e971bc68d1 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -13,6 +13,7 @@
 #include <linux/string_choices.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_notify.h>
 #include <linux/usb/typec_retimer.h>
 #include <linux/usb.h>
 
@@ -600,6 +601,8 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
+
 	return &alt->adev;
 }
 
diff --git a/drivers/usb/typec/notify.c b/drivers/usb/typec/notify.c
new file mode 100644
index 000000000000..0a14d3ae224e
--- /dev/null
+++ b/drivers/usb/typec/notify.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/notifier.h>
+#include <linux/usb/typec_notify.h>
+
+#include "bus.h"
+
+static BLOCKING_NOTIFIER_HEAD(typec_notifier_list);
+
+int typec_altmode_register_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_register_notify);
+
+int typec_altmode_unregister_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_unregister_notify);
+
+void typec_notify_event(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&typec_notifier_list, event, data);
+}
diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
new file mode 100644
index 000000000000..f3a7b5f5b05b
--- /dev/null
+++ b/include/linux/usb/typec_notify.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __USB_TYPEC_NOTIFY
+#define __USB_TYPEC_NOTIFY
+
+#include <linux/notifier.h>
+
+enum usb_typec_event {
+	TYPEC_ALTMODE_REGISTERED,
+	TYPEC_ALTMODE_UNREGISTERED,
+};
+
+int typec_altmode_register_notify(struct notifier_block *nb);
+int typec_altmode_unregister_notify(struct notifier_block *nb);
+
+#endif /* __USB_TYPEC_NOTIFY */
-- 
2.49.0


