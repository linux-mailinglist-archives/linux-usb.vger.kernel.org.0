Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE18166AA7A
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jan 2023 10:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjANJdA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Jan 2023 04:33:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbjANJcz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Jan 2023 04:32:55 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8080D659D
        for <linux-usb@vger.kernel.org>; Sat, 14 Jan 2023 01:32:53 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4d5097a95f5so117388927b3.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Jan 2023 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wht8S1tiS6ErGYffBA+FLaploIN0PjL9TJxJ3obSUDA=;
        b=Z/8q2PzUfv9PKvdmJmcLjsg8n4iQHcKVOk6G3Ddl89b5u0C4uEcKPoZcQtFWPfIIdH
         u5f03xp2lY+Ip0mFFmXlfTc7Pif5hbcQWn1tvvYh7/igqsDYUCzKNjZ2TvDAOMLAsltd
         gEfqkT0lfSqWCP8708YA4KW+IBKJ3JAYA2P31Rxe4YWrKCUfnInlq0d8+K4fsRQ6/3RX
         +xNL97CW2qJ14y5NlrQu4NzSREdRjnPv4Bjlot9tDaUcdGLMPL2HmSnG365NBr+SjQHR
         Dv6JCWljLibe2siOw3gktwitNWQ6Ju/T6wuyc3eOJIiL+8Gj1vrbnMdo2qTuDc7Acadq
         bCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wht8S1tiS6ErGYffBA+FLaploIN0PjL9TJxJ3obSUDA=;
        b=G16T+Due5x4gK7ZBiBerKBIfeZbdKg8GzO3LZVbkx+We1MsmszMdAIqM0VPPW6Ud3A
         A0Igk4ROWzWRHIncCS+17v7+S1VExQIMTTWjOhgXM0CGPaPbq3UQiN+EwW+U8rNy3XoQ
         vyuzzQ+RrpRxjtABFm10Xd7OIZFXt9N3jV4txtd3nnmkS1Y3F5yLG/chSe5taHl9cMJv
         ZK8RpQilVAWZoU2Lcj0XuukpFcd0WrrZAXax+c1BESSIRqWuSWgAZacjHP/7zL8fGsAB
         5D7HEyBYwXeLv/DvUcYeIlnV3yB6UQ07yF15xCzT8Fu7LbDtwMLqJYyAQq7IlgHvObJ3
         P0xw==
X-Gm-Message-State: AFqh2kq/Z7DJUNXMpdegpXeDw6pDwWAq8zzbFP2+nFEWl6WPTLMb7gTI
        gIuOFSyqtb8wDGa0LUUwGRtUoAk6NPI=
X-Google-Smtp-Source: AMrXdXud5Kn1RPDHqUVfpTCBsiHRp5IAJ9CSXYbBJpFFGWdo3yLQ7LRVDOxEWdttcxSWMB919olo/ZRWyhg=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:d726:232e:7cc0:6434])
 (user=badhri job=sendgmr) by 2002:a05:690c:857:b0:38b:17c4:4297 with SMTP id
 bz23-20020a05690c085700b0038b17c44297mr3608057ywb.446.1673688772790; Sat, 14
 Jan 2023 01:32:52 -0800 (PST)
Date:   Sat, 14 Jan 2023 01:32:45 -0800
In-Reply-To: <20230114093246.1933321-1-badhri@google.com>
Mime-Version: 1.0
References: <20230114093246.1933321-1-badhri@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230114093246.1933321-2-badhri@google.com>
Subject: [PATCH v13 2/3] usb: typec: tcpci: Add callback for evaluating
 contaminant presence
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change adds callback to evaluate presence of contaminant in
the TCPCI layer.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v12:
* None
Changes since v11:
* None
Changes since v10:
* None
Changes since v9:
* Check for presence of low level check_contaminant before installing tcpc.check_contaminant.
Changes since v7:
* None. Skipped versions by mistake.
Changes since v6:
* Removed is_potential_contaminant callback
Changes since v5:
* None
Changes since v4:
* None
Changes since v3:
* None
Changes since v2:
* Added tcpci_is_potential_contaminant to offload
* disconnect_while_debounce logic
---
 drivers/usb/typec/tcpm/tcpci.c | 11 +++++++++++
 include/linux/usb/tcpci.h      |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index fe781a38dc82..699539e1be06 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -403,6 +403,14 @@ static void tcpci_frs_sourcing_vbus(struct tcpc_dev *dev)
 		tcpci->data->frs_sourcing_vbus(tcpci, tcpci->data);
 }
 
+static void tcpci_check_contaminant(struct tcpc_dev *dev)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(dev);
+
+	if (tcpci->data->check_contaminant)
+		tcpci->data->check_contaminant(tcpci, tcpci->data);
+}
+
 static int tcpci_set_bist_data(struct tcpc_dev *tcpc, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -778,6 +786,9 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
 	tcpci->tcpc.set_partner_usb_comm_capable = tcpci_set_partner_usb_comm_capable;
 
+	if (tcpci->data->check_contaminant)
+		tcpci->tcpc.check_contaminant = tcpci_check_contaminant;
+
 	if (tcpci->data->auto_discharge_disconnect) {
 		tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
 		tcpci->tcpc.set_auto_vbus_discharge_threshold =
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 17657451c762..85e95a3251d3 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -188,6 +188,12 @@ struct tcpci;
  *		Optional; The USB Communications Capable bit indicates if port
  *		partner is capable of communication over the USB data lines
  *		(e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
+ * @check_contaminant:
+ *		Optional; The callback is invoked when chiplevel drivers indicated
+ *		that the USB port needs to be checked for contaminant presence.
+ *		Chip level drivers are expected to check for contaminant and call
+ *		tcpm_clean_port when the port is clean to put the port back into
+ *		toggling state.
  */
 struct tcpci_data {
 	struct regmap *regmap;
@@ -204,6 +210,7 @@ struct tcpci_data {
 	void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
 	void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
 					     bool capable);
+	void (*check_contaminant)(struct tcpci *tcpci, struct tcpci_data *data);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.39.0.314.g84b9a713c41-goog

