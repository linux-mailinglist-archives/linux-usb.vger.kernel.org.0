Return-Path: <linux-usb+bounces-29545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C78BFEFE7
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B27ED3A80B0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 03:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DE428750A;
	Thu, 23 Oct 2025 03:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="Sd1GbnEb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE5A280324;
	Thu, 23 Oct 2025 03:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761190245; cv=none; b=aJx3xG96Rb0brrxqGGxcdxmpymoqYQOjvHv001XzTHsEzNv2GlpXBfLHwKUpsKDhEA+LPCHyUGNP/WzPTR+nkzLW8GLrOyLtstqyi8342eXm5mht53jXECT9XAfGGvqPQ78pryHC1WaQlcn6uJR0TzoNv+KlOfw/juPAs2WzB7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761190245; c=relaxed/simple;
	bh=Km0tnPpSvB7hKaQPVLRA5Qgjl88/xHP2CenuDJI6+u8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ps1ZcsTsVdFXmYOZR9xdyCvSNyzWJCafysuxBauYFebaY+n3G/7Nzq0sYJysUeRJuVN3e7iyiYOQmAe7Mb6OSk+v/RSpKaBfWP07zDvEsPsBn5javn/HYzq8WP3KXD6atNJvBZjDA0jngspIP5Qz5boXwvBZ6zV1f5pt4P+pNbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=Sd1GbnEb; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761190227;
	bh=z3Z+FuiRydfa9KXtfzUasAoRXAzbkbbUPpgJYhzIq0U=;
	h=From:To:Subject:Date:Message-Id;
	b=Sd1GbnEbEzfpB++HBjq1A0UUiJ8gGQ9tEYUhMPSyupM9HQqiTuJlR5v9lTb3MLvk8
	 b00h5yAiZRBH8QZfdTzFcEpAZjcHutLFWANEHXegJr5rgyHleoc7/rgi61LBv4pcbK
	 k1RjHgpVUtMNXjH2pDqlt4/4jo1Ipo/csAKzQInc=
X-QQ-mid: esmtpsz16t1761190226t700443f6
X-QQ-Originating-IP: CR3cgQmOsWIwA9RJdPHoa1hKzkyO00I9vsk6MHfqamI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 11:30:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8850868920315239972
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
Subject: [PATCH v7 1/9] usb: typec: Add notifier functions
Date: Thu, 23 Oct 2025 11:30:01 +0800
Message-Id: <20251023033009.90-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NYz8c2bcbB9MQnNn3zMpWCw84OuTnnaBtW50E5uvICT9pW0so/BJEcwe
	Lmuz0JmdNqYy3KP7FjT3NI6ozIudBKDwFR0n/YWr8ct3/LQnZeeTnhYzo2mUZIF5kFdgKE7
	0kCjQkGUTWfHpAxv/3E22z7pUROVqSJnVYXeyA8fHV0VbbGcwDtyLTt+TUFEFf3yNgv6OHM
	4RUfiLgXjMGkkFJ7lkf8TousIKyN2RUQkzGuIPkB4jgdmW8lXGF7rpYYi4MUGhOAeujc1ga
	hGrSIbYpI7Q/IMdnumBfrH+M0uXvStMxF/Ufv7uIYP2EwCvA9au2qz2BezRkvJ0mEAXk904
	yVEiJScugL5NqQUB1ojT0jwT36KoOOQ/lEE8UYNliM41R31/OdDddwTBKqDQRFMBR/Ybp9Y
	8p2Cqddzg9iR2HyA8TaUMq+WfHSsqrx3KW+xTs1IBhClU5e3GxrdIGgs38oTu3PlvekODak
	nJ2gm7qGthFJtSMzpVqrKvB/NIY1+jGq6fjzEKXtyDuwFz2egNCL5+AOOqyG07RPDqVsGCn
	2URguH/ny75xBO2GsGsGhYHrcJN+cg9KOigydwENVZEEP34Wn2gLahLcP3S2SYpd05bcJAd
	OzSmMhclSiOL73De12yvSZeFzqRUl6ukCpUSf8KGZ84Gvgisc9GXQMuAiRCP4ARCe53NCD9
	NnxgMuc5pRkPAmB3IRwdjzX0gMSy4sS3qdrosf8GpJbrE3mQTWnjuRBg1y3fVux+kaht6pw
	/Dq1kopETXV4t8ouJPMM/Enp+gAlN7isSTfTcftsnQCAT/SetQKIt2316cZ2mHXW2307KR4
	sJ9GeB6Dk3sclyplWZOEqGhvZqO9UMqLKIESZhZDp1P9D94DlSNmaIGxwYB8nVKIkbGE3Ra
	uKLCWKv4rFH+6h8uT6xqOy5ZQoLlgRTa272E7C3FuffMwyW+tHhknBjHtg45rt3akqONmJS
	ppxbcv1fxVSu0A6C8oMZoLRchwZj62p7lKl+h0EbqwLD14mOzrDeC4HIXQmVUS/dkkzQ=
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
 drivers/usb/typec/Makefile       |  2 +-
 drivers/usb/typec/class.c        |  3 +++
 drivers/usb/typec/notify.c       | 22 ++++++++++++++++++++++
 include/linux/usb/typec_notify.h | 17 +++++++++++++++++
 4 files changed, 43 insertions(+), 1 deletion(-)
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
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..11c80bc59cda 100644
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
index 000000000000..4ae14dd1f461
--- /dev/null
+++ b/drivers/usb/typec/notify.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/notifier.h>
+#include <linux/usb/typec_notify.h>
+
+static BLOCKING_NOTIFIER_HEAD(typec_notifier_list);
+
+int typec_register_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_register_notify);
+
+int typec_unregister_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_unregister_notify);
+
+void typec_notify_event(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&typec_notifier_list, event, data);
+}
diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
new file mode 100644
index 000000000000..a3f1f3b3ae47
--- /dev/null
+++ b/include/linux/usb/typec_notify.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __USB_TYPEC_NOTIFY
+#define __USB_TYPEC_NOTIFY
+
+#include <linux/notifier.h>
+
+enum usb_typec_event {
+	TYPEC_ALTMODE_REGISTERED
+};
+
+int typec_register_notify(struct notifier_block *nb);
+int typec_unregister_notify(struct notifier_block *nb);
+
+void typec_notify_event(unsigned long event, void *data);
+
+#endif /* __USB_TYPEC_NOTIFY */
-- 
2.49.0


