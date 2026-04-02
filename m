Return-Path: <linux-usb+bounces-35861-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAt/Kt5bzmmgnAYAu9opvQ
	(envelope-from <linux-usb+bounces-35861-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 14:06:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B66C388CCD
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 14:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2B4A030895D9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 12:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA75D3CA4A4;
	Thu,  2 Apr 2026 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b="pwzkdkce"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB293DA7F3
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131482; cv=none; b=l7kJiAr0oBuyUI2ZcCqV9lOg91wtUrGdnhH90tihafYnndYVc+JdBoQrYOs88EpjkUllcKR5yvCb++sZdBx82rBoWW1JngYPp/tISZK08Id5O4eZCROzuHwd9mRUxOEexvDJ4h5wZb00AmfUPKTXrmT0V+8+uaIsJR3RBnBEmGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131482; c=relaxed/simple;
	bh=hIoKEkmYI+uj4uzh1CShw/Jd+1fnNQxxaoj8+yNi5x4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JHRvjF896XKBsOwvJBO1eC6YDfQWHEJS9TJ6KHm+zGmbRk0iX1PTHNR2o28gipcsfap2/Npmgoaum0KSkv05LHFKjW+I68v+h47bvK6DkRmjR/FIoDRlR3GATt58XzE4UFPo1wS4++L2eNwnJ8UieggHDFQ5nurveWsAx8h6V6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name; spf=pass smtp.mailfrom=scala.name; dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b=pwzkdkce; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scala.name
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so1386991f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=scala.name; s=google; t=1775131476; x=1775736276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=au6NBDr0fGmDn65szYOZ246DKBvIDjwg9Q6ZgSFukH0=;
        b=pwzkdkceUkcbrVJUamjTkDKpTmqDJHoy9wpjv3lQdCfIYcI0Gi+oxHJGBbPcc8QLFy
         Q/ULV6jRcAppVMuKD5gq2hLmWjSu+qyvLtrgS7TygqFS2oAPDhEgqHe7/7xhYSLj+YSB
         YNuxzigLlh41lt84+dyJ9PVqW4F5PLT5NZWu4CnKA/w5a3bjzok2zYnaK8Zebg8SBbiJ
         XHyENMTrlylKJHFqQmqepNW6y2UUQVr76WOMWc0DheP1o5aXDa0AV+qideh8ljRVFUxJ
         ZFoLcYX+CweBAuKdVlzzUR8WEbwxb4B/W1O2Xuybp20oKEhM8fwwaTjciGcs2ymAQiea
         fEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775131476; x=1775736276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au6NBDr0fGmDn65szYOZ246DKBvIDjwg9Q6ZgSFukH0=;
        b=EDSZVKwz+Q8UOcAsFzBhedZJZSstgLuXazGynNtxE4itOOIAHbFSjEVJ48rGSa28D/
         hVGB+ee1BR/DJgoBQ8v+t/PXbwm2Zi1wy1zBFFNumFEyBaGE+rOcv2VtGpGngfl3/Vaw
         JwFVzn31q+m7raKY3nr/qfLv79dgXE3kcOKA4RJCk6jd3VsagRcmY5DFtL6eR4AUDTe5
         rG4NCLaEcbMoXt0t6tKdnb+u4zYL3jemNhfEumJCB3c0lsv92nlJW90JTuNXInMlF1DP
         F5cEVUknT130WrouJYmtOUIrRi9iy9miyPzrKjP371Yo1+P0Eme2JMjHwfNQ0wFA30UL
         fQgg==
X-Gm-Message-State: AOJu0YwulHG4QMUiNq+vS/h7Z24vc//WHkU3nbD1+knwoCOFffaUodr5
	56o41q9uDLiQYlXGuUbMndm3LBsk82sHTlvXdidplDeNsYNmNV17Bqo9Cbd/A2yAMRz2yxTReo7
	1U6qV
X-Gm-Gg: AeBDietPe7TSVuyJdE9ImQW75k8aFx1I5ozIV10qzeTFP7M453vW7aYEfMQ/PKrZV7I
	QA1lM+SQuN6qKBxD6qtBtv20hYk5Ymz7Q9+RhXoMxdimb3Udzik5I1xYL2Iayknb+wcOl2tT8pe
	XrC9DLmuvlsTl2HnTaehYYMWt3FOrVr4H7yWks6cFJgORwi8IMTRGB250dYkwwASqSO5jyYHV5a
	/SWf2X3kNVVtFvRP6xA/RxQToDEfP5Q9g7DEDf3ATowIprTnKjC27qQW4gQL/2ztoY2RQ1LzMKj
	6maxSMVne0lYPDpYUwqEEvy/PvbvAaBy5OO1yy0qgT6cX549ZHQd0PBPEaoCE6X+/TUCM/Nmp+z
	lNyxVo92EJ6HdwYJ9gv/D2gbB9ec/sTkw32ybjlsHyrIq5lLaqo2JzBfS+TlrOYRe4zI2bRnZYa
	D67GdYt9lATRb/eJciTAo=
X-Received: by 2002:a05:6000:1a8c:b0:43c:f650:cc97 with SMTP id ffacd0b85a97d-43d21185749mr4171682f8f.9.1775131476422;
        Thu, 02 Apr 2026 05:04:36 -0700 (PDT)
Received: from localhost ([2a02:169:ee00:0:98f1:7a2a:1483:7cf1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e1fe0b0sm6980355f8f.0.2026.04.02.05.04.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 05:04:36 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Scala?= <francois@scala.name>
To: linux-usb@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	=?UTF-8?q?Fran=C3=A7ois=20Scala?= <francois@scala.name>
Subject: [PATCH] usb: typec: altmode: Fix altmode to handle multiple parners
Date: Thu,  2 Apr 2026 14:04:32 +0200
Message-ID: <20260402120433.22967-1-francois@scala.name>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[scala.name:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35861-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[scala.name];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[scala.name:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francois@scala.name,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3B66C388CCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: François Scala <francois@scala.name>

The partner field in the altmode struct is a single pointer and the sysfs
symlink uses a fixed name. This cause an error when a second partner is
registered.

  sysfs: cannot create duplicate filename '/devices/platform/USBC000:00/typec/port0/port0.0/partner'

The field is replaced by an array of pointers and the symlink use the
device name to avoid conflict.

  /sys/devices/platform/USBC000:00/typec/port0/port0.0/
  lrwxrwxrwx 1 root root    0 Apr  2 09:12 port0-partner.0 -> ../port0-partner/port0-partner.0
  lrwxrwxrwx 1 root root    0 Apr  2 09:12 port0-partner.1 -> ../port0-partner/port0-partner.1

Signed-off-by: François Scala <francois@scala.name>

Thanks
François
---
 drivers/usb/typec/bus.c   | 133 ++++++++++++++++++++++++++++++++------
 drivers/usb/typec/bus.h   |   8 ++-
 drivers/usb/typec/class.c |  99 +++++++++++++++++++++++++---
 3 files changed, 209 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index e84b134a3381..e09ceb844342 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -7,6 +7,8 @@
  */
 
 #include <linux/usb/pd_vdo.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 
 #include "bus.h"
 #include "class.h"
@@ -62,7 +64,7 @@ static int typec_altmode_set_state(struct typec_altmode *adev,
 	bool is_port = is_typec_port(adev->dev.parent);
 	struct altmode *port_altmode;
 
-	port_altmode = is_port ? to_altmode(adev) : to_altmode(adev)->partner;
+	port_altmode = is_port ? to_altmode(adev) : to_altmode(adev)->partners[0];
 
 	return typec_altmode_set_switches(port_altmode, conf, data);
 }
@@ -89,6 +91,7 @@ int typec_altmode_notify(struct typec_altmode *adev,
 	bool is_port;
 	struct altmode *altmode;
 	struct altmode *partner;
+	int partner_idx;
 	int ret;
 
 	if (!adev)
@@ -96,11 +99,17 @@ int typec_altmode_notify(struct typec_altmode *adev,
 
 	altmode = to_altmode(adev);
 
-	if (!altmode->partner)
+	partner_idx = typec_altmode_get_partner_idx_by_name(altmode, dev_name(&adev->dev));
+	if (partner_idx == -1) {
+		dev_info(&adev->dev, "%s adev is not in the partners array\n", __func__);
+		return -ENODEV;
+	}
+
+	if (!altmode->partners[partner_idx])
 		return -ENODEV;
 
 	is_port = is_typec_port(adev->dev.parent);
-	partner = altmode->partner;
+	partner = altmode->partners[partner_idx];
 
 	ret = typec_altmode_set_switches(is_port ? altmode : partner, conf, data);
 	if (ret)
@@ -125,13 +134,18 @@ EXPORT_SYMBOL_GPL(typec_altmode_notify);
  */
 int typec_altmode_enter(struct typec_altmode *adev, u32 *vdo)
 {
-	struct altmode *partner = to_altmode(adev)->partner;
-	struct typec_altmode *pdev = &partner->adev;
+	struct altmode *partner;
+	struct typec_altmode *pdev;
 	int ret;
 
+	partner = to_altmode(adev)->partners[0];
+	pdev = &partner->adev;
+
 	if (!adev || adev->active)
 		return 0;
 
+	typec_altmode_dump("typec_altmode_enter partner", partner);
+
 	if (!pdev->ops || !pdev->ops->enter)
 		return -EOPNOTSUPP;
 
@@ -156,13 +170,15 @@ EXPORT_SYMBOL_GPL(typec_altmode_enter);
  */
 int typec_altmode_exit(struct typec_altmode *adev)
 {
-	struct altmode *partner = to_altmode(adev)->partner;
+	struct altmode *partner = to_altmode(adev)->partners[0];
 	struct typec_altmode *pdev = &partner->adev;
 	int ret;
 
 	if (!adev || !adev->active)
 		return 0;
 
+	typec_altmode_dump("typec_altmode_exit partner", partner);
+
 	if (!pdev->ops || !pdev->ops->exit)
 		return -EOPNOTSUPP;
 
@@ -185,7 +201,7 @@ EXPORT_SYMBOL_GPL(typec_altmode_exit);
  */
 int typec_altmode_attention(struct typec_altmode *adev, u32 vdo)
 {
-	struct altmode *partner = to_altmode(adev)->partner;
+	struct altmode *partner = to_altmode(adev)->partners[0];
 	struct typec_altmode *pdev;
 
 	if (!partner)
@@ -220,12 +236,15 @@ int typec_altmode_vdm(struct typec_altmode *adev,
 	if (!adev)
 		return 0;
 
+
 	altmode = to_altmode(adev);
 
-	if (!altmode->partner)
+	typec_altmode_dump("typec_altmode_vdm altmode", altmode);
+
+	if (!altmode->partners[0])
 		return -ENODEV;
 
-	pdev = &altmode->partner->adev;
+	pdev = &altmode->partners[0]->adev;
 
 	if (!pdev->ops || !pdev->ops->vdm)
 		return -EOPNOTSUPP;
@@ -237,10 +256,10 @@ EXPORT_SYMBOL_GPL(typec_altmode_vdm);
 const struct typec_altmode *
 typec_altmode_get_partner(struct typec_altmode *adev)
 {
-	if (!adev || !to_altmode(adev)->partner)
+	if (!adev || !to_altmode(adev)->partners[0])
 		return NULL;
 
-	return &to_altmode(adev)->partner->adev;
+	return &to_altmode(adev)->partners[0]->adev;
 }
 EXPORT_SYMBOL_GPL(typec_altmode_get_partner);
 
@@ -258,7 +277,7 @@ EXPORT_SYMBOL_GPL(typec_altmode_get_partner);
  */
 int typec_cable_altmode_enter(struct typec_altmode *adev, enum typec_plug_index sop, u32 *vdo)
 {
-	struct altmode *partner = to_altmode(adev)->partner;
+	struct altmode *partner = to_altmode(adev)->partners[0];
 	struct typec_altmode *pdev;
 
 	if (!adev || adev->active)
@@ -288,7 +307,7 @@ EXPORT_SYMBOL_GPL(typec_cable_altmode_enter);
  */
 int typec_cable_altmode_exit(struct typec_altmode *adev, enum typec_plug_index sop)
 {
-	struct altmode *partner = to_altmode(adev)->partner;
+	struct altmode *partner = to_altmode(adev)->partners[0];
 	struct typec_altmode *pdev;
 
 	if (!adev || !adev->active)
@@ -330,9 +349,9 @@ int typec_cable_altmode_vdm(struct typec_altmode *adev, enum typec_plug_index so
 	altmode = to_altmode(adev);
 
 	if (is_typec_plug(adev->dev.parent)) {
-		if (!altmode->partner)
+		if (!altmode->partners[0])
 			return -ENODEV;
-		pdev = &altmode->partner->adev;
+		pdev = &altmode->partners[0]->adev;
 	} else {
 		if (!altmode->plug[sop])
 			return -ENODEV;
@@ -360,7 +379,7 @@ EXPORT_SYMBOL_GPL(typec_cable_altmode_vdm);
 struct typec_altmode *typec_altmode_get_plug(struct typec_altmode *adev,
 					     enum typec_plug_index index)
 {
-	struct altmode *port = to_altmode(adev)->partner;
+	struct altmode *port = to_altmode(adev)->partners[0];
 
 	if (port->plug[index]) {
 		get_device(&port->plug[index]->adev.dev);
@@ -494,17 +513,58 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return add_uevent_var(env, "MODALIAS=typec:id%04X", altmode->svid);
 }
 
+void typec_altmode_dump(char *name, struct altmode *alt)
+{
+	if (alt) {
+		for (int i = 0; i < TYPEC_ALTMODE_MAX_PARTNERS; i++) {
+			if (alt->partners[i]) {
+				dev_info(&alt->adev.dev, "%s[%p]->partners[%d] = %p / adev name = %s",
+					name,
+					alt,
+					i,
+					alt->partners[i],
+					dev_name(&alt->partners[i]->adev.dev)
+				);
+			}
+		}
+		for (int i = 0; i < 2; i++) {
+			if (alt->plug[i]) {
+				dev_info(&alt->adev.dev, "%s[%p]->plug[%d] = %p / adev name = %s",
+					name,
+					alt,
+					i,
+					alt->plug[i],
+					dev_name(&alt->plug[i]->adev.dev)
+				);
+			}
+		}
+	} else {
+		dev_info(&alt->adev.dev, "alt == NULL !");
+	}
+}
+
 static int typec_altmode_create_links(struct altmode *alt)
 {
-	struct device *port_dev = &alt->partner->adev.dev;
+	struct device *port_dev = &alt->partners[0]->adev.dev;
 	struct device *dev = &alt->adev.dev;
 	int err;
 
+	dev_info(&alt->adev.dev, "%s \"port\" -> %s\n",
+		__func__,
+		dev_name(port_dev)
+	);
+
 	err = sysfs_create_link(&dev->kobj, &port_dev->kobj, "port");
 	if (err)
 		return err;
 
-	err = sysfs_create_link(&port_dev->kobj, &dev->kobj, "partner");
+	dev_info(port_dev, "%s \"%s\" -> %s\n",
+		__func__,
+		dev_name(port_dev),
+		dev_name(dev)
+	);
+
+	err = sysfs_create_link(&port_dev->kobj, &dev->kobj, dev_name(dev));
 	if (err)
 		sysfs_remove_link(&dev->kobj, "port");
 
@@ -513,7 +573,17 @@ static int typec_altmode_create_links(struct altmode *alt)
 
 static void typec_altmode_remove_links(struct altmode *alt)
 {
-	sysfs_remove_link(&alt->partner->adev.dev.kobj, "partner");
+	struct altmode *partner = alt->partners[0];
+
+	dev_info(&partner->adev.dev, "%s \"%s\"\n",
+		__func__,
+		dev_name(&alt->adev.dev)
+	);
+
+	sysfs_remove_link(&partner->adev.dev.kobj, dev_name(&alt->adev.dev));
+
+	dev_info(&alt->adev.dev, "%s \"port\"\n", __func__);
+
 	sysfs_remove_link(&alt->adev.dev.kobj, "port");
 }
 
@@ -525,7 +595,7 @@ static int typec_probe(struct device *dev)
 	int ret;
 
 	/* Fail if the port does not support the alternate mode */
-	if (!altmode->partner)
+	if (!altmode->partners[0])
 		return -ENODEV;
 
 	ret = typec_altmode_create_links(altmode);
@@ -561,6 +631,29 @@ static void typec_remove(struct device *dev)
 	adev->ops = NULL;
 }
 
+int typec_altmode_get_partner_idx_by_name(struct altmode *altmode, const char *name)
+{
+	if (!altmode)
+		return -1;
+
+	for (int i = 0; i < TYPEC_ALTMODE_MAX_PARTNERS; i++) {
+		if (!altmode->partners[i])
+			continue;
+		if (!strcmp(name, dev_name(&altmode->partners[i]->adev.dev)))
+			return i;
+	}
+	return -1;
+}
+
+bool typec_altmode_partners_is_empty(struct altmode *altmode)
+{
+	for (int i = 0; i < TYPEC_ALTMODE_MAX_PARTNERS; i++) {
+		if (altmode->partners[i])
+			return false;
+	}
+	return true;
+}
+
 const struct bus_type typec_bus = {
 	.name = "typec",
 	.dev_groups = typec_groups,
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 7df5deb1dd3a..3db1d407c322 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -8,6 +8,8 @@
 struct typec_mux;
 struct typec_retimer;
 
+#define TYPEC_ALTMODE_MAX_PARTNERS 2
+
 struct altmode {
 	unsigned int			id;
 	struct typec_altmode		adev;
@@ -21,10 +23,14 @@ struct altmode {
 	struct attribute_group		group;
 	const struct attribute_group	*groups[2];
 
-	struct altmode			*partner;
+	struct altmode			*partners[TYPEC_ALTMODE_MAX_PARTNERS];
 	struct altmode			*plug[2];
 };
 
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
+void typec_altmode_dump(char *name, struct altmode *alt);
+int typec_altmode_get_partner_idx_by_name(struct altmode *altmode, const char *name);
+bool typec_altmode_partners_is_empty(struct altmode *altmode);
+
 #endif /* __USB_TYPEC_ALTMODE_H__ */
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 831430909471..0ad9d7488bb0 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -241,6 +241,15 @@ static int altmode_match(struct device *dev, const void *data)
 	return (adev->svid == id->svid);
 }
 
+static int typec_altmode_partners_get_free_slot(struct altmode *altmode)
+{
+	for (int i = 0; i < TYPEC_ALTMODE_MAX_PARTNERS; i++) {
+		if (altmode->partners[i] == NULL)
+			return i;
+	}
+	return -1;
+}
+
 static void typec_altmode_set_partner(struct altmode *altmode)
 {
 	struct typec_altmode *adev = &altmode->adev;
@@ -253,9 +262,18 @@ static void typec_altmode_set_partner(struct altmode *altmode)
 	if (!dev)
 		return;
 
+	dev_info(&altmode->adev.dev, "%s dev %s\n",
+		__func__,
+		dev_name(dev)
+	);
+
+	typec_altmode_dump("altmode before set_partner", altmode);
+
 	/* Bind the port alt mode to the partner/plug alt mode. */
 	partner = to_altmode(to_typec_altmode(dev));
-	altmode->partner = partner;
+	typec_altmode_dump("partner before set_partner", partner);
+
+	altmode->partners[0] = partner;
 
 	/* Bind the partner/plug alt mode to the port alt mode. */
 	if (is_typec_plug(adev->dev.parent)) {
@@ -263,18 +281,51 @@ static void typec_altmode_set_partner(struct altmode *altmode)
 
 		partner->plug[plug->index] = altmode;
 	} else {
-		partner->partner = altmode;
+		int free_spot = typec_altmode_partners_get_free_slot(partner);
+
+		if (free_spot == -1) {
+			dev_info(&altmode->adev.dev, "typec altmode, no free slot in partners table");
+			return;
+		}
+		partner->partners[free_spot] = altmode;
 	}
+
+	typec_altmode_dump("altmode after set_partner", altmode);
+	typec_altmode_dump("partner after set_partner", partner);
+
 }
 
 static void typec_altmode_put_partner(struct altmode *altmode)
 {
-	struct altmode *partner = altmode->partner;
+	struct altmode *partner = altmode->partners[0];
 	struct typec_altmode *adev;
 	struct typec_altmode *partner_adev;
 
-	if (!partner)
+	if (!partner) {
+		dev_info(&altmode->adev.dev, "%s partner is already NULL\n", __func__);
+		return;
+	}
+
+	typec_altmode_dump("altmode before put_partner", altmode);
+	typec_altmode_dump("partner before put_partner", partner);
+
+	int partner_idx = typec_altmode_get_partner_idx_by_name(
+		partner,
+		dev_name(&altmode->adev.dev)
+	);
+
+	dev_info(&altmode->adev.dev, "%s partner_idx = %d\n", __func__, partner_idx);
+
+	if (partner_idx == -1) {
+		dev_info(&altmode->adev.dev, "partner_idx altmod not found in partners list");
 		return;
+	}
+
+	dev_info(&altmode->adev.dev, "%s altmode->adev = %p partner->adev = %p\n",
+		__func__,
+		&altmode->adev,
+		&partner->adev
+	);
 
 	adev = &altmode->adev;
 	partner_adev = &partner->adev;
@@ -284,9 +335,22 @@ static void typec_altmode_put_partner(struct altmode *altmode)
 
 		partner->plug[plug->index] = NULL;
 	} else {
-		partner->partner = NULL;
+		partner->partners[partner_idx] = NULL;
 	}
-	put_device(&partner_adev->dev);
+
+	typec_altmode_dump("partner after set to NULL", partner);
+
+	if (typec_altmode_partners_is_empty(partner)) {
+		dev_info(&altmode->adev.dev, "%s partner->partners is empty -> put_device(...)\n",
+			__func__
+		);
+		put_device(&partner_adev->dev);
+	} else {
+		dev_info(&altmode->adev.dev, "%s partner->partners is not empty -> keeping it\n",
+			__func__
+		);
+	}
+
 }
 
 /**
@@ -370,9 +434,17 @@ static ssize_t active_store(struct device *dev, struct device_attribute *attr,
 {
 	struct typec_altmode *adev = to_typec_altmode(dev);
 	struct altmode *altmode = to_altmode(adev);
+	int partner_idx = typec_altmode_get_partner_idx_by_name(altmode, dev_name(dev));
 	bool enter;
 	int ret;
 
+	dev_info(dev, "%s buf %s altmode %s partner_idx %d\n",
+		__func__,
+		buf,
+		dev_name(&altmode->adev.dev),
+		partner_idx
+	);
+
 	ret = kstrtobool(buf, &enter);
 	if (ret)
 		return ret;
@@ -380,14 +452,21 @@ static ssize_t active_store(struct device *dev, struct device_attribute *attr,
 	if (adev->active == enter)
 		return size;
 
+	if (partner_idx == -1) {
+		dev_warn(dev, "dev is not in the altmode partners array");
+		return 0;
+	}
+
 	if (is_typec_port(adev->dev.parent)) {
 		typec_altmode_update_active(adev, enter);
 
 		/* Make sure that the partner exits the mode before disabling */
-		if (altmode->partner && !enter && altmode->partner->adev.active)
-			typec_altmode_exit(&altmode->partner->adev);
-	} else if (altmode->partner) {
-		if (enter && !altmode->partner->adev.active) {
+		if (altmode->partners[partner_idx]
+				&& !enter
+				&& altmode->partners[partner_idx]->adev.active)
+			typec_altmode_exit(&altmode->partners[partner_idx]->adev);
+	} else if (altmode->partners[partner_idx]) {
+		if (enter && !altmode->partners[partner_idx]->adev.active) {
 			dev_warn(dev, "port has the mode disabled\n");
 			return -EPERM;
 		}
-- 
2.53.0


