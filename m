Return-Path: <linux-usb+bounces-30758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CBC71D2A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 03:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 93A39348C93
	for <lists+linux-usb@lfdr.de>; Thu, 20 Nov 2025 02:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880932D7806;
	Thu, 20 Nov 2025 02:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="BlVMdBy7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EA82D193C;
	Thu, 20 Nov 2025 02:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763605456; cv=none; b=Q2nH3CkfLUTT76eYm0v0D5mIfaxMUEi2gb1+DF/BCo8FXUJnzdJlzRN8/SspfvYmpsFROl5dgfqTxbzw4REU65iASPBG04oCxMFuLyFwcmDTPCvSnNddfC7IKEb8W4jEDIa8I0oU7S1fTU2dnp0fKokjU0/ZCYAyUF3WlyY9l6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763605456; c=relaxed/simple;
	bh=+93XFzrsl+Mlsx9c1Lxbv/o1PQtmB/e2le8mDGU24DQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=HwF5iV8PMuhfR7evnEhFFGCLQ2jjiLEA0ifKBbKlKu6BMMYIBsbMicDr03R/Zrl2/cn/NFBJ0NWK2ERrwX1Pnus/d+WaRzj18lazz9ctTHM81spiF9I5MbVRemAyShDUfQv4WuBV7VfnSB9zjlnbr+SD63fhocWQLVwwvWsgfjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=BlVMdBy7; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605438;
	bh=j1djG2TFE/CUEyP0COdHWqSO/caFFOIst9KD5pPTwfU=;
	h=From:To:Subject:Date:Message-Id;
	b=BlVMdBy7Ltf441wLnCmm0AVUXNNXTZ3ZWlUIy4BNh3+xUzTTU2XbgXzBhTOBz7Wu2
	 ZpmUgkC19gH5rdC/0MfNQkHGjckdTMbO3qRrVnu2uO31Op6KBfZ97G1rG2UTs6Kv8d
	 LobSEOUIwcV8KY6HToIkSajUDgB+GenvllqlBB88=
X-QQ-mid: zesmtpsz5t1763605436tb3e0b544
X-QQ-Originating-IP: xlc9ysITpbSHXMdJexYj64rNZJQOqI/N1w8Cl7S5hso=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:23:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17663910937081771390
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
Subject: [PATCH v10 01/11] usb: typec: Add notifier functions
Date: Thu, 20 Nov 2025 10:23:33 +0800
Message-Id: <20251120022343.250-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MoggEQ/w056c0cwQrknoff/OaUSA1S9PH5HvzFRlhm7bmZvqKQPxLx0s
	WlTnwqNj4afJEQy2fBzULBeAVDH57xZwNy/KAukcpfRaIU3GYzpkj0Xl/bZDYcIKnUvcF/i
	hBDL77acA/lGqK61QOA/ts+G/UJmW1WiLfh8r4Va/KuaDOIjf6zv5jQQRDBWHwL2e2k5SVl
	6AprX/44Nrs2N4OhxWJHJe5KrDCzTF6gLZNPyIe4wnZObBkhQMMjhvfJDv4cSWpljofqHHs
	mYhZiFmKZxpxo01iwzMnU0YGGfoj9+gr5+pGHla70VTx9lkqRy/d4TuMuB8XWCT18i/SC8A
	s19MAI8/etgc4rWe9seKXSqq6ZEc7Tg236qyPyJjO9eTCb0HB7BPgLYJ3z+gVDfpknaW53n
	QzVqCnKbROb7pnyIUCmmoz7vFrMcsruBIH1lEdbMkGg5vcfa9eBFbNpqKMd7TAcwmirTmy5
	Ym9xFjChnwj4RsuW5xzzPmWPn8XCq3oez67ET3oxnlJ+RsabeakvzkU4tfAbWWtNbxITtMG
	h1+YCT9fC09vw1uUa3WuOuAekdkx7dX52Xf7xqhBKjijD8uyxc/NFWcvxK4B6N4N58OXfLY
	oUKtFPeui3ii3xcWqmoZ/vroRUMxCbW5tU4T2sY0XPmpYByeo1OhBQQ8AkSqHNnVHJKVZQq
	WQ93YHSykXRfRNbkDnMcGOlmpL+FwIy3IcpwlMlL7XY+KUulClGUgLCVl1seEBIl205V4zh
	bUyDJ1wIEtaiTAj+PL+ci/MwKukDQ83NrC+YCo6A+xg9zyIArin2dueXuU7VWg3uyp3lhMQ
	T/4R7JaoWm+yy5SKuycKISWPnVYReOToozYkgbIHuuVglMU2xp+RRCgX/Vq3vy4T0u3m/cr
	P2HwYF4IcXtFwEFJ+BG6EBaLv8qnkCBHYDjWWGWDcmi5Qf1lP9kDPzBPjD7sbhq0q6OGNOA
	mxb8y+f3lqaonwFg2UFTIsMQjS07FbkOm5eGVjqnP8WF/TAwrkMt9MOaiZ8UtDe3qyE3VwC
	ZfMtD//Q==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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

Changes in v10:
- Notify TYPEC_ALTMODE_UNREGISTERED when altmode removed. 

Changes in v9:
- Remove redundant header files.

Changes in v8:
- Fix coding style.

 drivers/usb/typec/Makefile        |  2 +-
 drivers/usb/typec/bus.h           |  2 ++
 drivers/usb/typec/class.c         |  3 +++
 drivers/usb/typec/notify.c        | 23 +++++++++++++++++++++++
 include/linux/usb/typec_altmode.h |  9 +++++++++
 5 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/notify.c

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
index 9b2647cb199b..1ccf5385d559 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -600,6 +600,8 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
+
 	return &alt->adev;
 }
 
@@ -614,6 +616,7 @@ void typec_unregister_altmode(struct typec_altmode *adev)
 {
 	if (IS_ERR_OR_NULL(adev))
 		return;
+	typec_notify_event(TYPEC_ALTMODE_UNREGISTERED, adev);
 	typec_retimer_put(to_altmode(adev)->retimer);
 	typec_mux_put(to_altmode(adev)->mux);
 	device_unregister(&adev->dev);
diff --git a/drivers/usb/typec/notify.c b/drivers/usb/typec/notify.c
new file mode 100644
index 000000000000..9e50b54da359
--- /dev/null
+++ b/drivers/usb/typec/notify.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/notifier.h>
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
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index f7db3bd4c90e..59e20702504b 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -10,6 +10,7 @@
 #define MODE_DISCOVERY_MAX	6
 
 struct typec_altmode_ops;
+struct notifier_block;
 
 /**
  * struct typec_altmode - USB Type-C alternate mode device
@@ -77,6 +78,14 @@ int typec_altmode_notify(struct typec_altmode *altmode, unsigned long conf,
 const struct typec_altmode *
 typec_altmode_get_partner(struct typec_altmode *altmode);
 
+enum usb_typec_event {
+	TYPEC_ALTMODE_REGISTERED,
+	TYPEC_ALTMODE_UNREGISTERED,
+};
+
+int typec_altmode_register_notify(struct notifier_block *nb);
+int typec_altmode_unregister_notify(struct notifier_block *nb);
+
 /**
  * struct typec_cable_ops - Cable alternate mode operations vector
  * @enter: Operations to be executed with Enter Mode Command
-- 
2.51.1


