Return-Path: <linux-usb+bounces-19337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9907BA10929
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 15:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E8893A2629
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 14:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E1E13CA97;
	Tue, 14 Jan 2025 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ioYRyRHj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D070762F7
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 14:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736864633; cv=none; b=XwWwJMXm2Av+eQfSBH5h3NdG7UH0w3W3KResm7G0qdFmXqPnFMGKf+FJ4x+aodbJpvpjR7wZu1ICLpju80m0ybXATNNUaL7zhKIe5HuuhwoIcA+qJJCOz77Z1unQ9DtLgfsrBHqjL69w3mbBS+Ha5vCGOXcVsBTMEqD8A7SWKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736864633; c=relaxed/simple;
	bh=3mZhZEpsVXvbK8kRBz620qSwc7gVFgby48NhPbc9xTE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MsmWLFXj9lRiYkjWyg0FqjWOsWvLyaL8qsvYXubodrawV+oXd6xb07t3ZKD0etgNmmLEbUEKtP2pg3kh0Y21UfG7/VY2gxXp4XgbCBQQTYNFzA+uOLQrAXaDVHLSOXb4hWsB+/TcSaQoef761NMPsCsfqUFQ0VIzWx1HV75MDdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ioYRyRHj; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2165433e229so109947095ad.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 06:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736864631; x=1737469431; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tSu4xp3Y6HOXZlKWn+sVDCe4JiYP/94emAGWE5skEzM=;
        b=ioYRyRHj+T2OW6nUmDqzOD4h+ES+NaJcTUebGX2sykWQPciJ8BwVdiDMZwUDD4QoU2
         tb4nbFsiDOMW1b7jOejdaMYO9KM1FaXh5GjXqoFAHYG42zDClQKXn809+j9tsuPlBYBM
         8a88uiHrMRu/MF/icu11OcV2bom6+zGXedkSdERbP/PytOyInLTP6pfPEHpemAvwXmH+
         N8z4Ft+rxOWlaMe89bSRdVjBFhuFNRrz57PoKTIKcUE+7v+dqr1BDD7ebgnBt/tz3FSD
         Zztmm/mFfgpX4Fg1KZoV/tC6OIDEmeo58cqC3iVhwc7M+uVWyU5aV4rAvlzzfWi6Ftkg
         tfnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736864631; x=1737469431;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSu4xp3Y6HOXZlKWn+sVDCe4JiYP/94emAGWE5skEzM=;
        b=osLfN5uroW+JWY0/awKwE3K717tUBh+iS/Bn+iHT6Uv/FX+mRlG/RA5TaN9K7wAHqG
         aKfXlGXuqS/VPu+tzY3MbHhrpYABnOUnKS84WztCpV1dzkZFgpkiIUXoRlVoaxNFopU6
         fMd71wbvAlfz2SqgMRVwaXWQd/Cy8JD+F13X41cZK+Lvhp1yho7mBvVii073mhxw09l7
         IzDODCCnLI1YljuFqwWu4Q79OKx9a0dYbH3tEp0paUz9BjiHl3geZr0J0oRZCxsjNoMR
         Fjfyht8dRCIqp8h1Xazk0PX9AeA3MUn+3O0MNSxblbxpBVXE6xHJ216r0EKerqUaUQ4t
         rzWA==
X-Forwarded-Encrypted: i=1; AJvYcCVGDDjmItFti239BEgs/7KIDJvOmWYG0+acwG3i/2USURl7BuIDXWdrE4tg1xDWvXUvGaVlIezmp9I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbnttogcaNcs1xMozB0S0zkG6QjDEGwH6WcgxlO0QodxVdOVep
	OQ033lTZ0O/8chaFPs1cnvrYsQDHU7siq8OgRktQa1MD9qlUUO47vpU5I7W4yLlEoL2nPPkX0CF
	AkkPbhw==
X-Google-Smtp-Source: AGHT+IHxhLIQFsKmIc6uIHglcMCVZJCSh0/6xS6b9sGYCM4heh8hBWJaOt/VQqM4nlAnjoGXCxNZMbBRcE3o
X-Received: from pgba33.prod.google.com ([2002:a63:4d21:0:b0:7fd:40dd:869f])
 (user=kyletso job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d481:b0:212:6187:6a76
 with SMTP id d9443c01a7336-21a83f4d7c8mr402711895ad.14.1736864631009; Tue, 14
 Jan 2025 06:23:51 -0800 (PST)
Date: Tue, 14 Jan 2025 22:23:39 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250114142339.2093399-1-kyletso@google.com>
Subject: [PATCH v1] usb: typec: tcpci: Prevent Sink disconnection before
 vPpsShutdown in SPR PPS
From: Kyle Tso <kyletso@google.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	andre.draszik@linaro.org, rdbabiera@google.com, m.felsch@pengutronix.de, 
	xu.yang_2@nxp.com, u.kleine-koenig@baylibre.com, emanuele.ghidoli@toradex.com
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


