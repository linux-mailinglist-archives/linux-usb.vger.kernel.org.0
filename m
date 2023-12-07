Return-Path: <linux-usb+bounces-3815-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0938083D3
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EF021C21F4B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB3F328DE;
	Thu,  7 Dec 2023 09:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KWa4rV1A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D31010C3
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 01:08:07 -0800 (PST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1cf74396cbeso6745805ad.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 01:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940086; x=1702544886; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvDg/R2gSLn48edjZ4SZ5kD8LZGAyJ7uj0ZHgiqVOPk=;
        b=KWa4rV1AwKwkQd5LP3epf2bquSIv6c279YeEhmCSwGUEWUmspRvM1+dY+oPSlT2cNl
         HOsLQShKnSVgcZRRjuhN9CyfU5duqzbTWaVWq+n9euAWKqpNUir3gvPbsD1z8D70nwyg
         2141/BDPZIltPEC4wLGAcr2LJVnalZYF05vPDiF6RxAbZM1JBmP/JTuKyArtUuQp50vq
         nM30reo7d8jkLnacktcm+Wp6vDdo9iSXOCMBG+RqleMnLyk6nPnYw+Uliyy2Q0fZ/MVf
         +rAnVRMQR/BLFe9jQ7LF3nqaG26auwl8GfCZe2WztoNMOX/dCK0pFB6YilP3iI6ytwll
         o7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940086; x=1702544886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yvDg/R2gSLn48edjZ4SZ5kD8LZGAyJ7uj0ZHgiqVOPk=;
        b=MFJKjifvwF1b25rigSTVbyzoWdJ2cHjS0Fo6MP5m6HizXl5dg2SI0VHOnLL9R5Eihs
         EFokQEQgTrCekiouMz3fy4L0AK9L7iSxTW/ku+mZoBxmwvmfmrxw3WQNLs1XCIG3rIi7
         zGnvalOw1O2113MV7SWK5yUVRa5Z0cxsPW4aWNTzisWB9ElxqI690snrcnXcLReXgf42
         N3tAo1F3SW7vfA5JLQUr3XZ1NgafTjXa5ebi4Gs4XujUsch/dcXWLY718lBARRW7kuRH
         0T55ev2Vk7TDx4bFFFQP4m5N07q2Hv4u82mLbZy9qGY5+pOEw5HoDwNKwXZJ4Jsyib1R
         eCnQ==
X-Gm-Message-State: AOJu0YwV7O3LETHyEOpt/TPJCzhRl6ZG3CNw2cJ/cDJT9ixEezIXlT3T
	1hFfaWbPxS+73luTC7ED00/kaBjXgPqd28k=
X-Google-Smtp-Source: AGHT+IGFS1y8GzVlmb5r97QSOC3E0Vl4Ayu3baL38b/OTdUA7IOvPkeE2QGWnc1JLw5uUPTfjYG2EqpVj+M152Q=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a17:902:dac3:b0:1d0:bf46:ad73 with SMTP
 id q3-20020a170902dac300b001d0bf46ad73mr27994plx.4.1701940086149; Thu, 07 Dec
 2023 01:08:06 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:36 +0000
In-Reply-To: <20231207090738.15721-12-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=6626; i=rdbabiera@google.com;
 h=from:subject; bh=pigUdCpa03znkcBnwrc9DOizk0IUCBc0sAIBBmegE2I=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3TGdbf99qth/7vt1uniD8t/Ds3hsLW/9kVTWchc6p
 3DScrN7RykLgxgHg6yYIouuf57BjSupW+Zw1hjDzGFlAhnCwMUpABNRm8zIsP9S2HfH6/tWHFdb
 9dhk427nBubUCNdl9sJyXJ9eaM3Yb83wV1xno6nWZOMJbdfT0tdb6Eo1a5d468/cJnH1hsPNwxY 6nAA=
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-17-rdbabiera@google.com>
Subject: [PATCH v1 05/10] usb: typec: tcpci: add attempt_vconn_swap_discovery callback
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Add attempt_vconn_swap_discovery callback to determine whether the TCPM
should perform a Vconn swap following Discover Identity on SOP. The tcpci
will return false unless chip level drivers implement the callback.

Maxim based TCPCs will return true unless the last connection resulted in
a Vconn Over Current Fault, which may be the result of the Vconn swap. In
addition to the port resetting, the TCPCI will veto the next Vconn swap
from occurring.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c            | 11 +++++++++++
 drivers/usb/typec/tcpm/tcpci_maxim.h      |  1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 17 ++++++++++++++++-
 include/linux/usb/tcpci.h                 |  9 +++++++++
 include/linux/usb/tcpm.h                  |  9 +++++++++
 5 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 8ea4ed159a13..40c7b6224c74 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -594,6 +594,16 @@ static bool tcpci_cable_comm_capable(struct tcpc_dev *tcpc)
 	return tcpci->data->cable_comm_capable;
 }
 
+static bool tcpci_attempt_vconn_swap_discovery(struct tcpc_dev *tcpc)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+
+	if (tcpci->data->attempt_vconn_swap_discovery)
+		return tcpci->data->attempt_vconn_swap_discovery(tcpci, tcpci->data);
+
+	return false;
+}
+
 static int tcpci_init(struct tcpc_dev *tcpc)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -804,6 +814,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
 	tcpci->tcpc.set_partner_usb_comm_capable = tcpci_set_partner_usb_comm_capable;
 	tcpci->tcpc.cable_comm_capable = tcpci_cable_comm_capable;
+	tcpci->tcpc.attempt_vconn_swap_discovery = tcpci_attempt_vconn_swap_discovery;
 
 	if (tcpci->data->check_contaminant)
 		tcpci->tcpc.check_contaminant = tcpci_check_contaminant;
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
index 2c1c4d161b0d..78ff3b73ee7e 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.h
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
@@ -62,6 +62,7 @@ struct max_tcpci_chip {
 	struct i2c_client *client;
 	struct tcpm_port *port;
 	enum contamiant_state contaminant_state;
+	bool veto_vconn_swap;
 };
 
 static inline int max_tcpci_read16(struct max_tcpci_chip *chip, unsigned int reg, u16 *val)
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 548c583ab1a1..6acc9f741bc3 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -322,8 +322,10 @@ static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
 		if (ret < 0)
 			return ret;
 
-		if (reg_status & TCPC_FAULT_STATUS_VCONN_OC)
+		if (reg_status & TCPC_FAULT_STATUS_VCONN_OC) {
+			chip->veto_vconn_swap = true;
 			tcpm_port_error_recovery(chip->port);
+		}
 	}
 
 	if (status & TCPC_ALERT_EXTND) {
@@ -457,6 +459,18 @@ static void max_tcpci_check_contaminant(struct tcpci *tcpci, struct tcpci_data *
 		tcpm_port_clean(chip->port);
 }
 
+static bool max_tcpci_attempt_vconn_swap_discovery(struct tcpci *tcpci, struct tcpci_data *tdata)
+{
+	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
+
+	if (chip->veto_vconn_swap) {
+		chip->veto_vconn_swap = false;
+		return false;
+	}
+
+	return true;
+}
+
 static int max_tcpci_probe(struct i2c_client *client)
 {
 	int ret;
@@ -492,6 +506,7 @@ static int max_tcpci_probe(struct i2c_client *client)
 	chip->data.set_partner_usb_comm_capable = max_tcpci_set_partner_usb_comm_capable;
 	chip->data.check_contaminant = max_tcpci_check_contaminant;
 	chip->data.cable_comm_capable = true;
+	chip->data.attempt_vconn_swap_discovery = max_tcpci_attempt_vconn_swap_discovery;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 62c518cca934..e9da75125292 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -201,6 +201,14 @@ struct tcpci;
  *		Chip level drivers are expected to check for contaminant and call
  *		tcpm_clean_port when the port is clean to put the port back into
  *		toggling state.
+ * @attempt_vconn_swap_discovery:
+ *		Optional; The callback is called by the TCPM when the result of
+ *		a Discover Identity request indicates that the port partner is
+ *		a receptacle capable of modal operation. Chip level TCPCI drivers
+ *		can implement their own policy to determine if and when a Vconn
+ *		swap following Discover Identity on SOP' occurs.
+ *		Return true when the TCPM is allowed to request a Vconn swap
+ *		after Discovery Identity on SOP.
  */
 struct tcpci_data {
 	struct regmap *regmap;
@@ -219,6 +227,7 @@ struct tcpci_data {
 	void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
 					     bool capable);
 	void (*check_contaminant)(struct tcpci *tcpci, struct tcpci_data *data);
+	bool (*attempt_vconn_swap_discovery)(struct tcpci *tcpci, struct tcpci_data *data);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 41d1ac9c8bbf..6671427f7eeb 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -122,6 +122,14 @@ enum tcpm_transmit_type {
  * @cable_comm_capable
  *		Optional; Returns whether cable communication over SOP' is supported
  *		by the tcpc
+ * @attempt_vconn_swap_discovery:
+ *		Optional; The callback is called by the TCPM when the result of
+ *		a Discover Identity request indicates that the port partner is
+ *		a receptacle capable of modal operation. Chip level TCPCI drivers
+ *		can implement their own policy to determine if and when a Vconn
+ *		swap following Discover Identity on SOP' occurs.
+ *		Return true when the TCPM is allowed to request a Vconn swap
+ *		after Discovery Identity on SOP.
  */
 struct tcpc_dev {
 	struct fwnode_handle *fwnode;
@@ -158,6 +166,7 @@ struct tcpc_dev {
 	void (*set_partner_usb_comm_capable)(struct tcpc_dev *dev, bool enable);
 	void (*check_contaminant)(struct tcpc_dev *dev);
 	bool (*cable_comm_capable)(struct tcpc_dev *dev);
+	bool (*attempt_vconn_swap_discovery)(struct tcpc_dev *dev);
 };
 
 struct tcpm_port;
-- 
2.43.0.rc2.451.g8631bc7472-goog


