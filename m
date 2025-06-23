Return-Path: <linux-usb+bounces-25024-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF958AE4E5B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 22:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38E3917633E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 20:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59C11FF1A0;
	Mon, 23 Jun 2025 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TB9qhk5V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C700A14658D
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711813; cv=none; b=OiCXuzrSmbhZz1ESGn1R6x9g0qTynH+JCiG45DW/S3lm8H991mN5HOGWMokUAPC/MMguPM8Kc09vIEYGQEl7dAgRJqTOVR+enEJC5MlVSCS47IvRruIBMDSv87iuBqLGInhic6cDWn1RER5DRl91dCAB0CgY4SRch6AxT8G0qqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711813; c=relaxed/simple;
	bh=uz2ElJYIzX/cgxoKu5QBxgP+WP9haMEoF7b6RVX3zZ0=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=M6Xs52DXsD3SUw9krzp8N/4vy4HXVatazeFYSupe/50wiIwwwgmYeUQJAOqlGTL5RMde2f6+rrpX6+7AxGa2fg5Ob80eOiWMEXsuNw8Xq8GNryA7YlG0xTdNj0qk13yQsGG0mqq0MUGZYLwwj75Igdclngogh31oCKzmHhhAb8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TB9qhk5V; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235c897d378so37393845ad.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750711811; x=1751316611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:from:subject:message-id:mime-version
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1zclfHGYxg3v3CZHfO4BrhgqnbUkfK0CqXRN/pzU0E=;
        b=TB9qhk5VMjmWqowiWam6wZc28NuyGMUEWHyJeanS6vKx5aHc0cGQ9rZ0xKsCwdx/gp
         2vRY+C85T9kOLGEuNFk8MEGKNlwLBPzm5WpmXsdoIB1dEf470oOcqjePPk+SUNjUEQCv
         y0n2bXU3XtfgzozAUm3KJFDiYAPeOOI1RuZs/YTcIoEa+ENmbg55H5ZG6e/zm60kVUFg
         KYpTIOYCCtaW85+DmpKtNG9wnRCKhOPXKP2Pija0gK3C+kuB7eexAQvuHxVzgoOWL1VW
         Qjfo4SjPzyJ6G7qLEgs29XabRjQudgwhrY+syiN6iU47uzj9ZWndj7DzlR9khtJVCptl
         8RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750711811; x=1751316611;
        h=content-transfer-encoding:cc:from:subject:message-id:mime-version
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1zclfHGYxg3v3CZHfO4BrhgqnbUkfK0CqXRN/pzU0E=;
        b=kNXeCIAQBEDeQW+CKrbutKf/BUCQN0yYmjDEm3zYmT3SYyr1jA8YD0P1c3PZ/IBmTy
         ruNW1B2lGsWL11BJ8xGhdqSbPiUtRQ67tsKo8IQVkaVetv/Gw+auk2ckPzhRZn0+pXKg
         RA4F/a1pQRBwZwZm7xgLbpoiDlLzr+hk+Gg7B/9Yu7GOshAkqqSIGL7KgjOFPz/CsxcL
         3hmSukStFlZtB7uL2WMm/PqVbCHwUQcrxEEf+8tXNzATvFu+Qrd3IFtAqqZtdDeqA64U
         J1adqP8Rmz0depxCvGSnmUFApftXAZ6UOj7IaEsmAbxxW0qybx2FXfaYgzeFuFtxkK2X
         4EUw==
X-Forwarded-Encrypted: i=1; AJvYcCX2PNdgP08cXTC7i3s9lvLR4k3+GkddQDzpjgAw7NAMiMJwtTiRynTddefMd4yZUSmpUMJ9e/qLRR0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2A4vg+jWO/lOknL9N8zpNwLn2HJBqY00rfJJ3Z1sNMVau10ME
	5zLrMA7ETu8DEXrrMbo9HkvcehS4euvqPmJmmD0PAPPeaRbvV9Y0jtGtQE6rVbK87/+e2D+AcVl
	uHolVZxaDbc7uU7l71Q==
X-Google-Smtp-Source: AGHT+IFDGJLG0QlqDQnT3WtSeQpyn/e6JxnM+cmkts63ncExcI0VOTu4ODfryuTASzY0kSDdxCfdlc9Zebc4m2g=
X-Received: from pjboi14.prod.google.com ([2002:a17:90b:3a0e:b0:2ff:6132:8710])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ea0c:b0:234:f19a:eead with SMTP id d9443c01a7336-237d991ebf6mr221096795ad.43.1750711811223;
 Mon, 23 Jun 2025 13:50:11 -0700 (PDT)
Date: Mon, 23 Jun 2025 20:49:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4465; i=rdbabiera@google.com;
 h=from:subject; bh=v3QvCmL9HP7IokaiL57iE+36eWNE8t2pZpwDIUWeDHA=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDBmRe18/0r1gp+K6s+xocHazWdbV+nTXNI049hyDvny1e
 74vty3tKGVhEONgkBVTZNH1zzO4cSV1yxzOGmOYOaxMIEMYuDgFYCJGfgz/g/Zl2p9XaLy0cF+D
 94IqgSrW5ZPOHnXwm7Hi+5ZdF88+c2P47zpz06Q1Jxf7ZX3gke/xux52Wqub/fQEjXsPLzPOVus xZwMA
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250623204947.732915-2-rdbabiera@google.com>
Subject: [PATCH v2] usb: typec: altmodes/displayport: add irq_hpd to sysfs
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add irq_hpd sysfs node to displayport driver. This allows the userspace
to subscribe to irq events similar to how it can subscribe to changes in
hpd.

irq_hpd is read only and returns the number of irq events generated since
driver probe. pending_irq_hpd is added so that a sysfs_emit can be
generated if the HPD high event belonging to the same status message
is delayed until a successful configuration.

Signed-off-by: RD Babiera <rdbabiera@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
* fixed bracket styling error
---
 .../testing/sysfs-driver-typec-displayport    | 10 +++++++
 drivers/usb/typec/altmodes/displayport.c      | 28 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-typec-displayport b/Doc=
umentation/ABI/testing/sysfs-driver-typec-displayport
index 256c87c5219a..314acd54e13e 100644
--- a/Documentation/ABI/testing/sysfs-driver-typec-displayport
+++ b/Documentation/ABI/testing/sysfs-driver-typec-displayport
@@ -62,3 +62,13 @@ Description:
 			     by VESA DisplayPort Alt Mode on USB Type-C Standard.
 			- 0 when HPD=E2=80=99s logical state is low (HPD_Low) as defined by
 			     VESA DisplayPort Alt Mode on USB Type-C Standard.
+
+What:		/sys/bus/typec/devices/.../displayport/irq_hpd
+Date:		June 2025
+Contact:	RD Babiera <rdbabiera@google.com>
+Description:
+		IRQ_HPD events are sent over the USB PD protocol in Status Update and
+		Attention messages. IRQ_HPD can only be asserted when HPD is high,
+		and is asserted when an IRQ_HPD has been issued since the last Status
+		Update. This is a read only node that returns the number of IRQ events
+		raised in the driver's lifetime.
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/a=
ltmodes/displayport.c
index b09b58d7311d..7f9f1f98f450 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -65,6 +65,13 @@ struct dp_altmode {
 	enum dp_state state;
 	bool hpd;
 	bool pending_hpd;
+	u32 irq_hpd_count;
+	/*
+	 * hpd is mandatory for irq_hpd assertion, so irq_hpd also needs its own =
pending flag if
+	 * both hpd and irq_hpd are asserted in the first Status Update before th=
e pin assignment
+	 * is configured.
+	 */
+	bool pending_irq_hpd;
=20
 	struct mutex lock; /* device lock */
 	struct work_struct work;
@@ -151,6 +158,7 @@ static int dp_altmode_status_update(struct dp_altmode *=
dp)
 {
 	bool configured =3D !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
 	bool hpd =3D !!(dp->data.status & DP_STATUS_HPD_STATE);
+	bool irq_hpd =3D !!(dp->data.status & DP_STATUS_IRQ_HPD);
 	u8 con =3D DP_STATUS_CONNECTION(dp->data.status);
 	int ret =3D 0;
=20
@@ -170,6 +178,8 @@ static int dp_altmode_status_update(struct dp_altmode *=
dp)
 				dp->hpd =3D hpd;
 				dp->pending_hpd =3D true;
 			}
+			if (dp->hpd && dp->pending_hpd && irq_hpd)
+				dp->pending_irq_hpd =3D true;
 		}
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
@@ -177,6 +187,10 @@ static int dp_altmode_status_update(struct dp_altmode =
*dp)
 						      connector_status_disconnected);
 		dp->hpd =3D hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
+		if (hpd && irq_hpd) {
+			dp->irq_hpd_count++;
+			sysfs_notify(&dp->alt->dev.kobj, "displayport", "irq_hpd");
+		}
 	}
=20
 	return ret;
@@ -196,6 +210,11 @@ static int dp_altmode_configured(struct dp_altmode *dp=
)
 						connector_status_connected);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd =3D false;
+		if (dp->pending_irq_hpd) {
+			dp->irq_hpd_count++;
+			sysfs_notify(&dp->alt->dev.kobj, "displayport", "irq_hpd");
+			dp->pending_irq_hpd =3D false;
+		}
 	}
=20
 	return dp_altmode_notify(dp);
@@ -707,10 +726,19 @@ static ssize_t hpd_show(struct device *dev, struct de=
vice_attribute *attr, char
 }
 static DEVICE_ATTR_RO(hpd);
=20
+static ssize_t irq_hpd_show(struct device *dev, struct device_attribute *a=
ttr, char *buf)
+{
+	struct dp_altmode *dp =3D dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", dp->irq_hpd_count);
+}
+static DEVICE_ATTR_RO(irq_hpd);
+
 static struct attribute *displayport_attrs[] =3D {
 	&dev_attr_configuration.attr,
 	&dev_attr_pin_assignment.attr,
 	&dev_attr_hpd.attr,
+	&dev_attr_irq_hpd.attr,
 	NULL
 };
=20

base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
--=20
2.50.0.rc2.761.g2dc52ea45b-goog


