Return-Path: <linux-usb+bounces-3141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C770C7F37A0
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C4D0B2184C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 20:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE5D3E47A;
	Tue, 21 Nov 2023 20:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z7K7PDAN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE491A3
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:38:54 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5c994880223so44959387b3.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 12:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700599134; x=1701203934; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KTDH53gNPxt291RajHzvpKvqzTC7KmzGzR+np8Bf7dA=;
        b=Z7K7PDANHV6Bf+bXmSWanOr4PmWVB/0AUObrlFVN7X7zTPnpOj0zr1fDpz+ah9yytr
         5yC36krdqXxvQ8Ajuc4HmJqNv8sDPu+dcs4vKAIL98d4u3TfCEuydFT4dqoLnChQ8iJb
         W5OZWAGySSTTz3E9lYXbeLfRMv0bx86O7offf/98PYuMbHS43qCR/86lirnbGJSv0wqW
         sSDbtUUN4ZvHAgL9mQNBMT4pRisKTfEafrcj5lrRJSAWF7vjBZLylpiX6aPyBckLBcoP
         tlSXRIDwnFHhiSbypgn6dNuk7DSPtgyaJhj2D4mVnvJ9lPIWN/BU0/DKJjCaWaF0il0a
         FjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599134; x=1701203934;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTDH53gNPxt291RajHzvpKvqzTC7KmzGzR+np8Bf7dA=;
        b=BjQf8+ka/ckkHHMcKlqThz9fN0ZSNh1ow68OS/5ezLTAn8gHVcakgxR9qY3cop3omG
         HL+l30aEqOxGQjrrCkmeEdlM8dN0UUv36SNRbONliYPwXqfMQA9+DkW50loHIw5+btDh
         MEUpHpJZ4fT0CfBLzg9HiyPjIAqgFI+qiDEdwKsNmANa0dp9MhXCE4yHBb11gqbQwbnC
         tvK+J+GL9mOkVGsOtk7cowBiphDUK8KnkCTYTD8gajnyiya2Snk2vboCeGN0uwf8OZax
         ixmW/qPPb8B1Ha24JOJNdWZXSAjrK1siTn1jMYFNSCy4rigdsDHNt3aljnyfHsXUyRS6
         l4rw==
X-Gm-Message-State: AOJu0YyUfp+uU8n3IYAcm0Q5KOz20AF125cmZBmXz0ljDH3gqnlMo9+B
	LSDqYhOzy5A8xAayv8sJ2wCcn87rz7ooBwU=
X-Google-Smtp-Source: AGHT+IEuYXxq5fTtblMTOGg6wqwt7Qleq9KC2mq1Yx89nISOxEToDfF76cL1rRm7YiLf6M1UU3OjdRy25uvmwp8=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a81:4f17:0:b0:5cb:6eaf:9ece with SMTP id
 d23-20020a814f17000000b005cb6eaf9ecemr4057ywb.1.1700599134145; Tue, 21 Nov
 2023 12:38:54 -0800 (PST)
Date: Tue, 21 Nov 2023 20:38:48 +0000
In-Reply-To: <20231121203845.170234-4-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231121203845.170234-4-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2847; i=rdbabiera@google.com;
 h=from:subject; bh=IjJhNlLnaEWlwoSGO/qly2CIqtjZgjikrPRbqBaNOy0=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmxomFHbqyTqV5TLa0YPDcpapbecrb/xzWVLabPXCNYJ
 OAlK1bTUcrCIMbBICumyKLrn2dw40rqljmcNcYwc1iZQIYwcHEKwETcZzMyzJHo6XF461b8/Wyy
 w/3wkD9BGVOUbtzMXHFxvWLAbhW1RQy/mJY9PxvIc+z89gDmI0n1c/ybm5tuZUWVzFXp/y7tNce PGQA=
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231121203845.170234-6-rdbabiera@google.com>
Subject: [PATCH v1 2/2] usb: typec: tcpci: add vconn over current fault
 handling to maxim_core
From: RD Babiera <rdbabiera@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, badhri@google.com, 
	RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Add TCPC_FAULT_STATUS_VCONN_OC constant and corresponding mask definition.
Maxim TCPC is capable of detecting VConn over current faults, so add
fault to alert mask. When a Vconn over current fault is triggered, put the
port in an error recovery state via tcpm_port_error_recovery.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 20 +++++++++++++++++++-
 include/linux/usb/tcpci.h                 |  5 ++++-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 9454b12a073c..7fb966fd639b 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -92,11 +92,16 @@ static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 		return;
 	}
 
+	/* Vconn Over Current Protection */
+	ret = max_tcpci_write8(chip, TCPC_FAULT_STATUS_MASK, TCPC_FAULT_STATUS_MASK_VCONN_OC);
+	if (ret < 0)
+		return;
+
 	alert_mask = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_TX_FAILED |
 		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_RX_STATUS | TCPC_ALERT_CC_STATUS |
 		TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF | TCPC_ALERT_POWER_STATUS |
 		/* Enable Extended alert for detecting Fast Role Swap Signal */
-		TCPC_ALERT_EXTND | TCPC_ALERT_EXTENDED_STATUS;
+		TCPC_ALERT_EXTND | TCPC_ALERT_EXTENDED_STATUS | TCPC_ALERT_FAULT;
 
 	ret = max_tcpci_write16(chip, TCPC_ALERT_MASK, alert_mask);
 	if (ret < 0) {
@@ -295,6 +300,19 @@ static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
 		}
 	}
 
+	if (status & TCPC_ALERT_FAULT) {
+		ret = max_tcpci_read8(chip, TCPC_FAULT_STATUS, &reg_status);
+		if (ret < 0)
+			return ret;
+
+		ret = max_tcpci_write8(chip, TCPC_FAULT_STATUS, reg_status);
+		if (ret < 0)
+			return ret;
+
+		if (reg_status & TCPC_FAULT_STATUS_VCONN_OC)
+			tcpm_port_error_recovery(chip->port);
+	}
+
 	if (status & TCPC_ALERT_EXTND) {
 		ret = max_tcpci_read8(chip, TCPC_ALERT_EXTENDED, &reg_status);
 		if (ret < 0)
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 83376473ac76..467e8045e9f8 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -36,7 +36,9 @@
 
 #define TCPC_ALERT_MASK			0x12
 #define TCPC_POWER_STATUS_MASK		0x14
-#define TCPC_FAULT_STATUS_MASK		0x15
+
+#define TCPC_FAULT_STATUS_MASK			0x15
+#define TCPC_FAULT_STATUS_MASK_VCONN_OC		BIT(1)
 
 #define TCPC_EXTENDED_STATUS_MASK		0x16
 #define TCPC_EXTENDED_STATUS_MASK_VSAFE0V	BIT(0)
@@ -104,6 +106,7 @@
 
 #define TCPC_FAULT_STATUS		0x1f
 #define TCPC_FAULT_STATUS_ALL_REG_RST_TO_DEFAULT BIT(7)
+#define TCPC_FAULT_STATUS_VCONN_OC	BIT(1)
 
 #define TCPC_ALERT_EXTENDED		0x21
 
-- 
2.43.0.rc1.413.gea7ed67945-goog


