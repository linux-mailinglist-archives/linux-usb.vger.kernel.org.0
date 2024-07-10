Return-Path: <linux-usb+bounces-12093-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC0A92CB0D
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 08:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C8501F23A76
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 06:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835077174F;
	Wed, 10 Jul 2024 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M3HkflZ+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306BD4174C
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 06:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720592916; cv=none; b=RjEx6qxTUxUqvqRobWKVrvHrkFRhAx0S5GplnENwmiUJMAG2nEobHS7LBv/ECJbzSPTdmS258Yufvk63g1BUYkaRO7tCLuGGx501XoDCNnuqhrMZKRNFyyIi6MzivLemBb1C/0WGAIdzI/J2w+zAIu2LVcng30ddgalYhfZpWhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720592916; c=relaxed/simple;
	bh=aa+PTjPdFb7pEXOG/23o8LsqJHyfyS6ceMo72Jx/Iiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YOClxxzWKNnrPkpvVRVPNqTkHKb2mVTGemePjO78eyndDtuBCuZWDO9MFFHcBGK9zgVY8f6E8gcXwWY9ebzlgbdzTSSFQpGM7zsDZ8vl8DzMoLDyx5QPcihwh41q1tTvJF4qrdJ+7Ch4FrEZ/HZ5FWHVPl3v/txsYMZV9LOlYR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M3HkflZ+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a77e5929033so488488566b.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Jul 2024 23:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720592912; x=1721197712; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UOh+bebWnqoK8GvaLZPHSLkx51XlgsZw1fWDIwAjze4=;
        b=M3HkflZ+vHPAwTCi7NH78HQOC78j3gWNuEyO222OVVd9iUrb9rE8uUa7lu5a1agV8/
         hckk9BrYJn3Fv9GD10s3UK/kU90q7mcyd4MQs53xHVGsoZ7Rug2zf9yDqcEJ/ZFTjscC
         43htxP3Png/ntrEPZ9zyAE7oYyAy21+5QM3vFWZBaPcIbvxWqENi+bCW94zfSHPhzKI2
         RFMCYVxiCha4Yots45Pu1k4jf/5iVjP98fSH77n+dyb0//KSAoG4xpM3gjtHfuvLcbEm
         nirmNdwHup/Ys8mV2WGjz3JKkXQjuGxQddQP5ibMXsOsp01mJUgVFtjq6MTlazlnIwrY
         47Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720592912; x=1721197712;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UOh+bebWnqoK8GvaLZPHSLkx51XlgsZw1fWDIwAjze4=;
        b=W7a1nUuDpPrgSIfTfpxO2q6moiQyebTyR2W6cKLPdpshsACQBVzNe+OJaKAjHOjRdm
         aGoCUzv6GHf9z1c2Zoj1p+x60vteYSSaRsT1xEicru0fV2JDsYTRGy87NUOyMQy8e1Lf
         mo8GW/zp801Jdbe3gV/c+gr+sRvliFgTbmRKsRy+z+KXiOBtGSnTGDYecWxy6ugc08ju
         s6JZgg53ksOKsg/gNJZ1fcPhjZ/Z6d/lvA6gP0YvQGIQwdM+IYImmh0ld8U5PVpYQTKF
         rb5JgQtu216FuZ9qGo6RyqA9RepBDjsxuCc8JtFjARI/9WR88Erssmz6DtqZ/h+PIOOU
         5xGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHU5qB5Fn0Hw14dM0L3KbWpz2OuSTF75a6+XrUq2RxGXC9/Qr672cL7ITOiIJ0+P86y7RG3f5Ua+5yT6cEHi0F68Q6V5Nf4inB
X-Gm-Message-State: AOJu0YwulvK+gvIblqriwef5KRu76taq1Z0NGApdZDUsHlgJOI+HVqK6
	ArNd5JQJb1/2AZKXULBKsm2UOGCnNWK6QVf4ObvuOPi52tyw8jz55/KvOfCL8bY=
X-Google-Smtp-Source: AGHT+IHrlpp7pmF1xxD5sjW/chyDHJM2aF/6eK/xa0bYiVVZrOjWZeoie4nSP0Hp5X8oSBEzOaFOOg==
X-Received: by 2002:a17:906:1709:b0:a77:c9cc:f96f with SMTP id a640c23a62f3a-a780b68821emr319897066b.7.1720592912537;
        Tue, 09 Jul 2024 23:28:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dfc1esm131954866b.67.2024.07.09.23.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 23:28:32 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 07:28:32 +0100
Subject: [PATCH] usb: typec: tcpm/tcpci_maxim: fix non-contaminant CC
 handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-max33359-toggling-v1-1-f6dc123f3a0a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAA8qjmYC/x3MQQqAIBBA0avErBM0FamrRAux0QbKQiME6e5Jy
 7f4v0LGRJhh6iokfCjTGRtE34HbbAzIaG2GgQ+KG8HZYYuUUo/sPkPYKQbmvPEGNQqlJLTuSui
 p/M95ed8PZlFgS2MAAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 RD Babiera <rdbabiera@google.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

tcpci_maxim currently never triggers the TCPM state machine when CC
status has not changed due to a contaminant but due to a real
connection event, i.e. a genuine plug event, meaning the system will
stay idle and not notify any subscribers.

The reason is that the initial state of the port is 'toggling', which
causes _max_tcpci_irq() to only drive the contamination part of the
TCPM state machine (via tcpm_port_clean()).

What should happen instead is that if no contamination was detected,
the TCPM should be notified of the CC change in this case.

To fix this, we update ...is_contaminant() to also allow its caller to
determine if more CC processing is required and then call into the TCPM
as required.

While at it, add a kernel-doc for max_contaminant_is_contaminant().

Note: the code has an issue where I2C errors during contaminant
detection also cause the TCPM state machine to not be updated. This
commit doesn't change this behaviour and should be addressed by
follow-up commit(s).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/maxim_contaminant.c |  7 +++++--
 drivers/usb/typec/tcpm/tcpci_maxim.h       | 15 ++++++++++++++-
 drivers/usb/typec/tcpm/tcpci_maxim_core.c  | 12 ++++++++----
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/maxim_contaminant.c b/drivers/usb/typec/tcpm/maxim_contaminant.c
index f8504a90da26..e7fa3e36f8ae 100644
--- a/drivers/usb/typec/tcpm/maxim_contaminant.c
+++ b/drivers/usb/typec/tcpm/maxim_contaminant.c
@@ -322,11 +322,14 @@ static int max_contaminant_enable_dry_detection(struct max_tcpci_chip *chip)
 	return 0;
 }
 
-bool max_contaminant_is_contaminant(struct max_tcpci_chip *chip, bool disconnect_while_debounce)
+bool max_contaminant_is_contaminant(struct max_tcpci_chip *chip, bool disconnect_while_debounce,
+				    bool *cc_handled)
 {
 	u8 cc_status, pwr_cntl;
 	int ret;
 
+	*cc_handled = true;
+
 	ret = max_tcpci_read8(chip, TCPC_CC_STATUS, &cc_status);
 	if (ret < 0)
 		return false;
@@ -368,7 +371,6 @@ bool max_contaminant_is_contaminant(struct max_tcpci_chip *chip, bool disconnect
 				return true;
 			}
 		}
-		return false;
 	} else if (chip->contaminant_state == DETECTED) {
 		if (STATUS_CHECK(cc_status, TCPC_CC_STATUS_TOGGLING, 0)) {
 			chip->contaminant_state = max_contaminant_detect_contaminant(chip);
@@ -379,6 +381,7 @@ bool max_contaminant_is_contaminant(struct max_tcpci_chip *chip, bool disconnect
 		}
 	}
 
+	*cc_handled = false;
 	return false;
 }
 
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.h b/drivers/usb/typec/tcpm/tcpci_maxim.h
index 78ff3b73ee7e..9c7f714d2c21 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.h
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.h
@@ -85,6 +85,19 @@ static inline int max_tcpci_write8(struct max_tcpci_chip *chip, unsigned int reg
 	return regmap_raw_write(chip->data.regmap, reg, &val, sizeof(u8));
 }
 
-bool max_contaminant_is_contaminant(struct max_tcpci_chip *chip, bool disconnect_while_debounce);
+/**
+ * max_contaminant_is_contaminant - Test if CC was toggled due to contaminant
+ *
+ * @chip: Handle to a struct max_tcpci_chip
+ * @disconnect_while_debounce: Whether or not to sleep as debouncing measure
+ * @cc_handled: Returns whether or not CC toggling was handled here
+ *
+ * Determine if a contaminant was detected.
+ *
+ * Returns: true if a contaminant was detected, false otherwise. cc_handled
+ * is updated to reflect whether or not further CC handling is required.
+ */
+bool max_contaminant_is_contaminant(struct max_tcpci_chip *chip, bool disconnect_while_debounce,
+				    bool *cc_handled);
 
 #endif  // TCPCI_MAXIM_H_
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index eec3bcec119c..55d931672ecd 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -357,12 +357,15 @@ static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
 		tcpm_vbus_change(chip->port);
 
 	if (status & TCPC_ALERT_CC_STATUS) {
+		bool cc_handled = false; /* CC toggle handled by contaminant detection */
+
 		if (chip->contaminant_state == DETECTED || tcpm_port_is_toggling(chip->port)) {
-			if (!max_contaminant_is_contaminant(chip, false))
+			if (!max_contaminant_is_contaminant(chip, false,
+							    &cc_handled))
 				tcpm_port_clean(chip->port);
-		} else {
-			tcpm_cc_change(chip->port);
 		}
+		if (!cc_handled)
+			tcpm_cc_change(chip->port);
 	}
 
 	if (status & TCPC_ALERT_POWER_STATUS)
@@ -455,8 +458,9 @@ static int tcpci_init(struct tcpci *tcpci, struct tcpci_data *data)
 static void max_tcpci_check_contaminant(struct tcpci *tcpci, struct tcpci_data *tdata)
 {
 	struct max_tcpci_chip *chip = tdata_to_max_tcpci(tdata);
+	bool cc_handled;
 
-	if (!max_contaminant_is_contaminant(chip, true))
+	if (!max_contaminant_is_contaminant(chip, true, &cc_handled))
 		tcpm_port_clean(chip->port);
 }
 

---
base-commit: 82d01fe6ee52086035b201cfa1410a3b04384257
change-id: 20240710-max33359-toggling-cf7f7e5e1443

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


