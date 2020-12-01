Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCE62C94B8
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 02:34:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731237AbgLABeP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 20:34:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731234AbgLABeP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 20:34:15 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE7BC0617A6
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 17:32:56 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id z8so9765184qti.17
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 17:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=QhLigLn75FAzXhIZ0bPoDFSVJj4c0SqhtU7L4z8HlcQ=;
        b=u0x83zQV/jRreAFGvsZ+wU1pXUVK4f7vHF+SEAm9974nWnWvBEbopyBw0e9TRsDrcS
         XghVo/rtgrUrJWMGnSeun6wTs9fajtlhWj3VDyOGK5sRwP24dmpfWnX5xUqTWjRgDQlJ
         ilhi/OxE3xDp/mPSVr9R7gSbML2nld8LzmNNsBLLFXBy9GBQlnhBGZSzYZaz95wuNbc6
         NCjClDAssQTTCFuO1yRi3xMFyZn6H/pyp8Pxr0GanWr2ApoLSjj14pHSeLzz5WakjCWH
         2+zd1DktDDOl32y2wLU+IfYXhd2B89bcFjNjxbuuPY+pnBO5vVJk6pftGjog/ovRMfZF
         HPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QhLigLn75FAzXhIZ0bPoDFSVJj4c0SqhtU7L4z8HlcQ=;
        b=UeYC34mhDKcU3+buYMBIGM69rqmF1OSCorF5Z3xSOWa98u7RBDGiMQsIDicHjH4pTa
         yyzYtP0xmZ0lyM9qnu41Mq9B9YOO9oLx3RkeITQOwMaV+7rPmJhcRCXDQbN64Khdp5hb
         cYNnzcWc7iaA96eunIZbZ6D/krKm81OSGQqRM5XB5+dFN4bDkaPbiWgJPxDbw0/VPwEH
         3AErAdijPiPuTf24Rtnd4N77rPgQ1fkXPsvu9ERPOY/gnTNXNs/3qe3XIPL1afT8v/vn
         Jb2r6SDQWT0E5EPADAipu871FKgedrW5aLr1GHGehO3FKK4qtwbVEf4UEpn/nr11DmYJ
         pXqg==
X-Gm-Message-State: AOAM532ZqGUD6i8+3LnNwjjqAGkhaLyLuLlFCQKw0IftnjKsdvSIXLZE
        EsTA9koaDik14AUlafJrfTh2cyTJfTc=
X-Google-Smtp-Source: ABdhPJyDYmJvnlZr2NIh57BebNSj+vT3RUHM8Z1J6YSG1rOMEPclFBovVukLEU19lt5yvjdFZQVwrc4pHPw=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a0c:ba20:: with SMTP id w32mr751329qvf.50.1606786375808;
 Mon, 30 Nov 2020 17:32:55 -0800 (PST)
Date:   Mon, 30 Nov 2020 17:32:46 -0800
In-Reply-To: <20201201013246.32034-1-badhri@google.com>
Message-Id: <20201201013246.32034-3-badhri@google.com>
Mime-Version: 1.0
References: <20201201013246.32034-1-badhri@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1 3/3] usb: typec: tcpci_maxim: Enable VSAFE0V signalling
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Unmask EXTENDED_STATUS_MASK.vSafe0V, ALERT.Extended_Status
and set vbus_vsafe0v to enable VSAFE0V signalling.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index c1797239bf08..1aabe6abd819 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -112,11 +112,18 @@ static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
 		return;
 	}
 
+	/* Enable VSAFE0V detection */
+	ret = max_tcpci_write8(chip, TCPC_EXTENDED_STATUS_MASK, TCPC_EXTENDED_STATUS_VSAFE0V);
+	if (ret < 0) {
+		dev_err(chip->dev, "Unable to unmask TCPC_EXTENDED_STATUS_VSAFE0V ret:%d\n", ret);
+		return;
+	}
+
 	alert_mask = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_TX_FAILED |
 		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_RX_STATUS | TCPC_ALERT_CC_STATUS |
 		TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF | TCPC_ALERT_POWER_STATUS |
 		/* Enable Extended alert for detecting Fast Role Swap Signal */
-		TCPC_ALERT_EXTND;
+		TCPC_ALERT_EXTND | TCPC_ALERT_EXTENDED_STATUS;
 
 	ret = max_tcpci_write16(chip, TCPC_ALERT_MASK, alert_mask);
 	if (ret < 0) {
@@ -315,6 +322,12 @@ static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
 		}
 	}
 
+	if (status & TCPC_ALERT_EXTENDED_STATUS) {
+		ret = max_tcpci_read8(chip, TCPC_EXTENDED_STATUS, (u8 *)&reg_status);
+		if (ret >= 0 && (reg_status & TCPC_EXTENDED_STATUS_VSAFE0V))
+			tcpm_vbus_change(chip->port);
+	}
+
 	if (status & TCPC_ALERT_RX_STATUS)
 		process_rx(chip, status);
 
@@ -442,6 +455,7 @@ static int max_tcpci_probe(struct i2c_client *client, const struct i2c_device_id
 	chip->data.init = tcpci_init;
 	chip->data.frs_sourcing_vbus = max_tcpci_frs_sourcing_vbus;
 	chip->data.auto_discharge_disconnect = true;
+	chip->data.vbus_vsafe0v = 1;
 
 	max_tcpci_init_regs(chip);
 	chip->tcpci = tcpci_register_port(chip->dev, &chip->data);
-- 
2.29.2.454.gaff20da3a2-goog

