Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADCEF30A4B5
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 10:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbhBAJyH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 04:54:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbhBAJx5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 04:53:57 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9EAC06174A
        for <linux-usb@vger.kernel.org>; Mon,  1 Feb 2021 01:53:17 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id j14so10238176qtv.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Feb 2021 01:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=sPq47L+9BIHkF/0ZeuUBPSrtxyRugGo3S/yCj7eF4vI=;
        b=CykSh0HYXKYqMFqk4XIx+wZoRDcvQHO8vloTRTJ6cDqgnywwzn5wE7ZMQCyHhBjrR8
         ROdMtIGFByu4xylZX+BBtzd5I27VBtoewefepR6oXt113O52o8gaM3wXpHS6EIKDNCMI
         kU2B0DFg1nexTRQ+Oxjg+mkcpTJNvEf9s0UlKTFrmdF9EpvGdnfCcU23GkJbKBOWRSlf
         S/7KyjeM2H3ETdRQrPgs84OyCo2l4Hsyx6muWZbkY4oZLzvs4OcCIZpqKzAt3LT3XZ0E
         84WkFbDMqNq9vUEBpLPT6soLThrrCtpw2xG1lU66X1WCt6g1w5A+hAWMhxv0ccC2fw8L
         VNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sPq47L+9BIHkF/0ZeuUBPSrtxyRugGo3S/yCj7eF4vI=;
        b=VEY6os0xejTdXiGW87KZ0BumYmSNacSXR9QCOYyXdDLHwjdwGrrcWE94AK0stviHg1
         V2zmqH64l9edbrQCidbf8QKnWFBRjpffKLEEy1okXhSrP1fKJkMtxD/N3Dipz9hAQ42U
         /5RyrKNajhoeun47ZONA0XTZzwtrsi1mHAXr0W4zua39gbK4g4pn+QHZwjRGooKsyIYd
         TQHnvGerxs84+pQHx5/TzQQMSGN+1rsIG99XwnqMCOtYknSX9kl+NSWCC7+JtTmjvvRX
         EVd8GPIbMxfOZ9KI0qcIgsHmvaPCR+hsaK+sTKDtsxPPTJCYqI9NnbcFa0zgEs9dPFYF
         nu2g==
X-Gm-Message-State: AOAM531Ja4Ptf0Cv5/lQdfvq+sczD2Ud1xSHa/JJggC/Wkc1p5h1fK/9
        //FdesepK4MM2g6J+zKWpuE2fWHuIvg=
X-Google-Smtp-Source: ABdhPJxzDkag1gdwbHrqQiew2dqEu7C1PUDVubNtQH2M2u78T2SxHd4IhDDCh1sKZ9lTaJy6g1zgSMHoQXw=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a05:6214:324:: with SMTP id
 j4mr14375736qvu.53.1612173196198; Mon, 01 Feb 2021 01:53:16 -0800 (PST)
Date:   Mon,  1 Feb 2021 01:53:08 -0800
In-Reply-To: <20210201095309.39486-1-badhri@google.com>
Message-Id: <20210201095309.39486-2-badhri@google.com>
Mime-Version: 1.0
References: <20210201095309.39486-1-badhri@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v1 2/3] usb: typec: tcpci: Add Callback to Usb Communication
 capable partner
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kyle Tso <kyletso@google.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB Communications Capable bit indicates if port
partner is capable of communication over the USB data lines
(e.g. D+/- or SS Tx/Rx). TCPM passes this information for chip specific
operations.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 drivers/usb/typec/tcpm/tcpci.h | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index f676abab044b..a27deb0b5f03 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -255,6 +255,14 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 			   TCPC_TCPC_CTRL_ORIENTATION : 0);
 }
 
+static void tcpci_set_partner_usb_comm_capable(struct tcpc_dev *tcpc, bool capable)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+
+	if (tcpci->data->set_partner_usb_comm_capable)
+		tcpci->data->set_partner_usb_comm_capable(tcpci, tcpci->data, capable);
+}
+
 static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -720,6 +728,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_bist_data = tcpci_set_bist_data;
 	tcpci->tcpc.enable_frs = tcpci_enable_frs;
 	tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
+	tcpci->tcpc.set_partner_usb_comm_capable = tcpci_set_partner_usb_comm_capable;
 
 	if (tcpci->data->auto_discharge_disconnect) {
 		tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index c3c7d07d9b4e..57b6e24e0a0c 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -161,6 +161,10 @@ struct tcpci;
  *		Optional; Enables TCPC to autonously discharge vbus on disconnect.
  * @vbus_vsafe0v:
  *		optional; Set when TCPC can detect whether vbus is at VSAFE0V.
+ * @set_partner_usb_comm_capable:
+ *		Optional; The USB Communications Capable bit indicates if port
+ *		partner is capable of communication over the USB data lines
+ *		(e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
  */
 struct tcpci_data {
 	struct regmap *regmap;
@@ -175,6 +179,8 @@ struct tcpci_data {
 				  enum typec_cc_status cc);
 	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
 	void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
+	void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
+					     bool capable);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.30.0.365.g02bc693789-goog

