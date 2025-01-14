Return-Path: <linux-usb+bounces-19338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE32A10932
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 15:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88B0116098F
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 14:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBB21494A7;
	Tue, 14 Jan 2025 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xuYlPV1s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A38762F7
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 14:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864722; cv=none; b=MxAUb411xXbPT1iINJ+fbDQntJ1sDhU8EzcqvJD7lUW9irKqvTk6CLUeKtNDlEcdZeQVw0Gf67pdo9DaCShBJZq3360kz2CXKjzJNToUltZTn3vB8T5q8eOKC+ClegMOre6Dn3VZT0HUV8wV77E2DI5mVLbTbtpUsjRKvxrHWWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864722; c=relaxed/simple;
	bh=3mZhZEpsVXvbK8kRBz620qSwc7gVFgby48NhPbc9xTE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eUPm37R/gGWQYXBzj5URE2PM/pE3HY+OWzJIVq3+du4u/JAZbWEGwrzkdm4E+5skvUfz3bTh3rMEzDOehRoxzDUboPiQAaqTJyq9U+V+t8sNdkZ0HEQpUhewyR0YpwPUinHP+UyD6o9kGfEoAF2uNPrGy6L+gXKxJ1sgJUMqbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xuYlPV1s; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2162259a5dcso160979815ad.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 06:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736864720; x=1737469520; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tSu4xp3Y6HOXZlKWn+sVDCe4JiYP/94emAGWE5skEzM=;
        b=xuYlPV1shoOzB2rJ0aWTP7Ve0u9ujyFpc0aDrCgvQ8H/3GTmO8eMil3/784WfOX8qD
         yp3+j0JvnRfPt2EMNjBJ+CtOE2tDg4PzxCMrK6TCpJklwA8zqhLsJSFr5ekH8wt3//PW
         46jMfbYdSaal+NXZv0qRDlfi0czaWKm92vTjBq2pmHxwGSSMZCk73C9VkVizwjq0t3Dt
         SqvkVeWwgW9/dR60QmVyWR2fpL6Xk0VpC31iMPgqKXtoFdA7SQwHkqb+oFB3FbMvfy5X
         DbWbuffLBvgdTPC460V+N962OrQBmK5xBmWGv/sUXtuhLRz/GlnxlxRFHyiMrYiYRCq5
         LSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864721; x=1737469521;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSu4xp3Y6HOXZlKWn+sVDCe4JiYP/94emAGWE5skEzM=;
        b=G0SthXz6hxOvF/PihGyhy1UqfQY5vEm1jybvXWNuoTeF1E/ZWaFhIZLHQuqUwI2xLN
         iTld+CUB7podQcSBvJLDvS1oowJKr3SdmOp0m7L5KjHn92zn6yhAoaJvZunK6KTG35Zq
         OanTWraCTdZEZyRc+U5QOKjTyZeuviF7n8Yc5QnOv61ZnFISh4Tf7ZaowvSb2vCsOlou
         KpZiJdsrH/Zc/G7uhpk1vufZQv2vdiHT/JqI9lxoUQW8pk5ZlD7MPy8L5mZSrTfiXBoN
         ge7Hzjel2reJQarXfTPWGCslO1eID6oLB5LoW7sBq3x9ctVIJjjTxuY72SRulH3luH94
         PoMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWz9AwqbTxD72dV+oMMdF21VYAeY4wWymQ6Q1rZp9YmXB3gUVqHKPPwW2L0TYw5FgARuWd4NXQ+qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB8TjvP3yEY/5XKA66KkKuBpE6K7R6Ob/N6U4oc30t68HZ91Ke
	XsQCSFX6WTR7fVkVhGd5DJkEXzDJj0YvmeCu7hoMyFF39+2kkEZIGqr1pINI4MrGRUrZ5ouiix0
	x39osMg==
X-Google-Smtp-Source: AGHT+IGzEszmDZk4FhEWLOcRg1abwedqDueuOVK7MIK2k4wjynrs8GaVu9upTo3mx4cp9fIselYBFA62pIWo
X-Received: from plbmo13.prod.google.com ([2002:a17:903:a8d:b0:216:31f0:27de])
 (user=kyletso job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94f:b0:216:25a2:2ebe
 with SMTP id d9443c01a7336-21a83f573d7mr374935705ad.19.1736864720690; Tue, 14
 Jan 2025 06:25:20 -0800 (PST)
Date: Tue, 14 Jan 2025 22:24:35 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250114142435.2093857-1-kyletso@google.com>
Subject: [PATCH v1] usb: typec: tcpci: Prevent Sink disconnection before
 vPpsShutdown in SPR PPS
From: Kyle Tso <kyletso@google.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	andre.draszik@linaro.org, rdbabiera@google.com, m.felsch@pengutronix.de, 
	xu.yang_2@nxp.com, u.kleine-koenig@baylibre.com, emanuele.ghidoli@toradex.com, 
	badhri@google.com, amitsd@google.com
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Source can drop its output voltage to the minimum of the requested
PPS APDO voltage range when it is in Current Limit Mode. If this voltage
falls within the range of vPpsShutdown, the Source initiates a Hard
Reset and discharges Vbus. However, currently the Sink may disconnect
before the voltage reaches vPpsShutdown, leading to unexpected behavior.

Prevent premature disconnection by setting the Sink's disconnect
threshold to the minimum vPpsShutdown value. Additionally, consider the
voltage drop due to IR drop when calculating the appropriate threshold.
This ensures a robust and reliable interaction between the Source and
Sink during SPR PPS Current Limit Mode operation.

Fixes: 4288debeaa4e ("usb: typec: tcpci: Fix up sink disconnect thresholds for PD")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 13 +++++++++----
 drivers/usb/typec/tcpm/tcpm.c  |  8 +++++---
 include/linux/usb/tcpm.h       |  3 ++-
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 48762508cc86..19ab6647af70 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -27,6 +27,7 @@
 #define	VPPS_NEW_MIN_PERCENT			95
 #define	VPPS_VALID_MIN_MV			100
 #define	VSINKDISCONNECT_PD_MIN_PERCENT		90
+#define	VPPS_SHUTDOWN_MIN_PERCENT		85
 
 struct tcpci {
 	struct device *dev;
@@ -366,7 +367,8 @@ static int tcpci_enable_auto_vbus_discharge(struct tcpc_dev *dev, bool enable)
 }
 
 static int tcpci_set_auto_vbus_discharge_threshold(struct tcpc_dev *dev, enum typec_pwr_opmode mode,
-						   bool pps_active, u32 requested_vbus_voltage_mv)
+						   bool pps_active, u32 requested_vbus_voltage_mv,
+						   u32 apdo_min_voltage_mv)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(dev);
 	unsigned int pwr_ctrl, threshold = 0;
@@ -388,9 +390,12 @@ static int tcpci_set_auto_vbus_discharge_threshold(struct tcpc_dev *dev, enum ty
 		threshold = AUTO_DISCHARGE_DEFAULT_THRESHOLD_MV;
 	} else if (mode == TYPEC_PWR_MODE_PD) {
 		if (pps_active)
-			threshold = ((VPPS_NEW_MIN_PERCENT * requested_vbus_voltage_mv / 100) -
-				     VSINKPD_MIN_IR_DROP_MV - VPPS_VALID_MIN_MV) *
-				     VSINKDISCONNECT_PD_MIN_PERCENT / 100;
+			/*
+			 * To prevent disconnect when the source is in Current Limit Mode.
+			 * Set the threshold to the lowest possible voltage vPpsShutdown (min)
+			 */
+			threshold = VPPS_SHUTDOWN_MIN_PERCENT * apdo_min_voltage_mv / 100 -
+				    VSINKPD_MIN_IR_DROP_MV;
 		else
 			threshold = ((VSRC_NEW_MIN_PERCENT * requested_vbus_voltage_mv / 100) -
 				     VSINKPD_MIN_IR_DROP_MV - VSRC_VALID_MIN_MV) *
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 460dbde9fe22..e4b85a09c3ae 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2973,10 +2973,12 @@ static int tcpm_set_auto_vbus_discharge_threshold(struct tcpm_port *port,
 		return 0;
 
 	ret = port->tcpc->set_auto_vbus_discharge_threshold(port->tcpc, mode, pps_active,
-							    requested_vbus_voltage);
+							    requested_vbus_voltage,
+							    port->pps_data.min_volt);
 	tcpm_log_force(port,
-		       "set_auto_vbus_discharge_threshold mode:%d pps_active:%c vbus:%u ret:%d",
-		       mode, pps_active ? 'y' : 'n', requested_vbus_voltage, ret);
+		       "set_auto_vbus_discharge_threshold mode:%d pps_active:%c vbus:%u pps_apdo_min_volt:%u ret:%d",
+		       mode, pps_active ? 'y' : 'n', requested_vbus_voltage,
+		       port->pps_data.min_volt, ret);
 
 	return ret;
 }
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 061da9546a81..b22e659f81ba 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -163,7 +163,8 @@ struct tcpc_dev {
 	void (*frs_sourcing_vbus)(struct tcpc_dev *dev);
 	int (*enable_auto_vbus_discharge)(struct tcpc_dev *dev, bool enable);
 	int (*set_auto_vbus_discharge_threshold)(struct tcpc_dev *dev, enum typec_pwr_opmode mode,
-						 bool pps_active, u32 requested_vbus_voltage);
+						 bool pps_active, u32 requested_vbus_voltage,
+						 u32 pps_apdo_min_voltage);
 	bool (*is_vbus_vsafe0v)(struct tcpc_dev *dev);
 	void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool enable);
 	void (*check_contaminant)(struct tcpc_dev *dev);
-- 
2.47.1.688.g23fc6f90ad-goog


