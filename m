Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2096338527
	for <lists+linux-usb@lfdr.de>; Fri, 12 Mar 2021 06:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCLFYv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Mar 2021 00:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbhCLFYt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Mar 2021 00:24:49 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F88DC061574
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 21:24:49 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id t5so17228313qti.5
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 21:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=9hWh3mPPnMd+7sgA4bB4jM0VJmsYOSTpWV6kivY/w7E=;
        b=Hg5mX1cINvIihpuUY2ieD0jNJTtxVNv/hp0fSVy5nAJFPqF3Em4k41fBrc+F9CRuDo
         Bt2CM5Hl2yy5XGQLb3AocKOExxdHgblnCKasIOxbrXxWcEOQFtqEzaEgzGmX/kd0AJaG
         BgPWpr8oZzPdbpo+imT8XBf+uiQbDu8ZHTNXl+/uyZ3GwPBpwRPCRMhVdfg98x7OEY3d
         kFyS5RWDGi23lmnFgIoF9vSvvoqraqJdhCZl+m1XHEtO8duTeH5xkSrRg0vD4twKWvNR
         1uAnzbuVBVfCNsRSs/zo/e43SrxJ2o41yPoBUF20h4albWrM0oqM0r71yAV81MEmiGO6
         8MqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=9hWh3mPPnMd+7sgA4bB4jM0VJmsYOSTpWV6kivY/w7E=;
        b=kh2I0DG04inK+ZaBsGcUie3NGZjgkhjQSaAcAQ2caOuAJvFPx6ZxXYlU8LhyUBy7vX
         X8RhDkzUxfhngJu5Ui0qmnKg/Bw0SMfjn/l5+bwyPyuPRP0YFl+Iu04WB2hHeR0F2AKc
         SNOktmRkLxIjuGRjHMoko3oEW4BOLHsIQXKxZMEtfplTtTQ49yoNn0+swp0k/1DsZW5W
         lSMlJkBTmygergobkICIpVa900fkzsTQJSlnI2U0Q6Ztvh61l3Mq/Ou5PIvjMbZWvn54
         eEL3mKNZf/UT2VjiLMNP4NRXSyoKdSERl1ijn2Uqc/0kk1hfytHitSOanyHOO9iPQ5fO
         fnVg==
X-Gm-Message-State: AOAM5329BcGGhXVieGk3STHjnTeUtJNvE6dRPN/u87zWGmY3VjBYkqRa
        emPjJv3W0PN6gbWQZ8KFjjZ3Hz5sKv8=
X-Google-Smtp-Source: ABdhPJx1KL5uJPgcPfK8l/iWCtj8fel/ejPIwTJbt3G4JxwxOrZYyB1k7MQ0rPxvKf3N1sPLFwByhAqpX0I=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:39e6:8b30:8665:4bec])
 (user=badhri job=sendgmr) by 2002:a05:6214:20ed:: with SMTP id
 13mr10835104qvk.34.1615526687598; Thu, 11 Mar 2021 21:24:47 -0800 (PST)
Date:   Thu, 11 Mar 2021 21:24:42 -0800
Message-Id: <20210312052443.3797674-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2 1/2] usb: typec: tcpci: Add tcpc chip level callbacks
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change adds chip callbacks for the following operations:
1. Notifying port role
2. Notifying orientation

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since V1:
- Dropped changes related to get_/set_current_limit and pd_capable
  callback. Will send them in as separate patches.
---
 drivers/usb/typec/tcpm/tcpci.c | 12 +++++++++++-
 drivers/usb/typec/tcpm/tcpci.h | 10 ++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 027afd7dfdce..c37bbb2e9961 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -265,9 +265,16 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
 	if (ret < 0)
 		return ret;
 
-	return regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
+	ret = regmap_write(tcpci->regmap, TCPC_TCPC_CTRL,
 			   (polarity == TYPEC_POLARITY_CC2) ?
 			   TCPC_TCPC_CTRL_ORIENTATION : 0);
+	if (ret < 0)
+		return ret;
+
+	if (tcpci->data->set_cc_polarity)
+		tcpci->data->set_cc_polarity(tcpci, tcpci->data, polarity);
+
+	return ret;
 }
 
 static void tcpci_set_partner_usb_comm_capable(struct tcpc_dev *tcpc, bool capable)
@@ -395,6 +402,9 @@ static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,
 	if (ret < 0)
 		return ret;
 
+	if (tcpci->data->set_roles)
+		tcpci->data->set_roles(tcpci, tcpci->data, attached, role, data);
+
 	return 0;
 }
 
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 57b6e24e0a0c..75a2c9b575b5 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -165,6 +165,12 @@ struct tcpci;
  *		Optional; The USB Communications Capable bit indicates if port
  *		partner is capable of communication over the USB data lines
  *		(e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
+ * @set_roles:
+ *		Optional; This callback notifies the TCPC driver of the resolved
+ *		port role and attached status.
+ * @set_cc_polarity:
+ *		Optional; This callback notifies the TCPC driver of the resolved
+ *		polarity.
  */
 struct tcpci_data {
 	struct regmap *regmap;
@@ -181,6 +187,10 @@ struct tcpci_data {
 	void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
 	void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
 					     bool capable);
+	void (*set_roles)(struct tcpci *tcpci, struct tcpci_data *data, bool attached,
+			  enum typec_role role, enum typec_data_role data_role);
+	void (*set_cc_polarity)(struct tcpci *tcpci, struct tcpci_data *data,
+				enum typec_cc_polarity polarity);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.31.0.rc2.261.g7f71774620-goog

