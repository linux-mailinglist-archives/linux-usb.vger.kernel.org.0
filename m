Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88BF427BAF9
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbgI2Cki (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbgI2Ckb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:31 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BCAC0613CF
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:31 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id g1so1999156qtc.22
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=+8V9XbF+nrhvOeFjlq1gqGlcRl5hrQT9omJcJW0tz7E=;
        b=eThgSYYws9kLpLHXJUFr8JlqfR0wyD59aDcTKSpqbsx6KIFxXcnLhU123aJufAG5WH
         aDXDmzpTpskIbia0MgBBXSxSbn9D49hM95Y5gcdvk5KasouU/EUxaaOkgaLoA7gLHbBZ
         mLFZyzCFBFplneMO5kRnVhmXU8OVM+0SxYVaiILHXuCSd5etox30tyBSlB1pyq8j7vnl
         p+pt0YFFe0+KCPJNLCrOm6lKk/HCz3ASuUm/CgmjIvExOL/8MBztejPq9+WfTWQp84JX
         EqRvZ+FPJAi8dDJwpQAygrOGlF2gYOv2HypGFKuUp3WW+ZQz0YWAss5U+aX+fjVmfCzW
         QSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=+8V9XbF+nrhvOeFjlq1gqGlcRl5hrQT9omJcJW0tz7E=;
        b=GTa/mmyLt+7lh8vXI8tcD2eZLBDnnWbZfNYFt4psH5kiD64L7cECojHQJ4jmACsn2j
         4r63ezrudIvLrD8e8E/KOQCoSOaB8lHXODZCcSEp/nUQ7PDb9jxn4CDrtsxaIQ5MQE4b
         oElLzc5BzCbZCN7pKPMepbLDA8tL9KQlhYjhs46vsUyrr2yfqBFl3uPeihe7bK2OwMK8
         NlWkXbEbrLX0PgRopvQTOUd0dtUql2My9orS7Ywck22amIzSEkvDltp7Tp5CtkYvl2Jo
         WhdgMfzHnd3etftolN6kdqNUIU63OD2XO8LYUV1ZnzojELfp/mp7BfLJ2WyIG3MjZH1w
         DMmA==
X-Gm-Message-State: AOAM532798mTzyv20nQB5e3PhYFHlDdUh+7tIhIA7uN2xg/uh6Nzhg0B
        VOLrspPrtr/9QKkeL6iXciFUXtLNr6g=
X-Google-Smtp-Source: ABdhPJzwsg7Sc8wZ0WPfTkzvJTJdAdYy3e+MUHpTHIttV5fY2N8t9NGM6qfFCPHu+ad0WPdZNkpCdjyfmhM=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:ad4:58c7:: with SMTP id dh7mr2723471qvb.20.1601347230306;
 Mon, 28 Sep 2020 19:40:30 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:39:59 -0700
In-Reply-To: <20200929024004.244992-1-badhri@google.com>
Message-Id: <20200929024004.244992-11-badhri@google.com>
Mime-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 10/15] usb: typec: tcpci: frs sourcing vbus callback
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <treding@nvidia.com>,
        Prashant Malani <pmalani@chromium.org>,
        Badhri Jagan Sridharan <badhri@google.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During FRS hardware autonomously starts to source vbus. Provide
callback to perform chip specific operations.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
v9 is the first version of this patch in the series. Added to fix
occasional bug of vbus turning back on when disconnecting the FRS accessory
after disconnect.
---
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 drivers/usb/typec/tcpm/tcpci.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index f9f0af64da5f..f91688e43991 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -284,6 +284,14 @@ static int tcpci_enable_frs(struct tcpc_dev *dev, bool enable)
 	return ret;
 }
 
+static void tcpci_frs_sourcing_vbus(struct tcpc_dev *dev)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(dev);
+
+	if (tcpci->data->frs_sourcing_vbus)
+		tcpci->data->frs_sourcing_vbus(tcpci, tcpci->data);
+}
+
 static int tcpci_set_bist_data(struct tcpc_dev *tcpc, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -628,6 +636,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.pd_transmit = tcpci_pd_transmit;
 	tcpci->tcpc.set_bist_data = tcpci_set_bist_data;
 	tcpci->tcpc.enable_frs = tcpci_enable_frs;
+	tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
 
 	err = tcpci_parse_config(tcpci);
 	if (err < 0)
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 5ef07a56d67a..b418fe11b527 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -143,6 +143,9 @@
 /*
  * @TX_BUF_BYTE_x_hidden
  *		optional; Set when TX_BUF_BYTE_x can only be accessed through I2C_WRITE_BYTE_COUNT.
+ * @frs_sourcing_vbus:
+ *		Optional; Callback to perform chip specific operations when FRS
+ *		is sourcing vbus.
  */
 struct tcpci;
 struct tcpci_data {
@@ -154,6 +157,7 @@ struct tcpci_data {
 	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
 				  enum typec_cc_status cc);
 	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
+	void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.28.0.709.gb0816b6eb0-goog

