Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B4C2585D9
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 05:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgIAC7p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgIAC7l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:59:41 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F2EFC06137B
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:41 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id mu14so826797pjb.7
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=Yh60bZiNGZOc6tQmxndGlvfAxn8JuzncJI3aBSV8EoY=;
        b=E/9+iKxP4Os7jwiIYc3rotS8dGcNiNtYwvKk+8ZDeBMp1d8/CH4ofA0oj+UZ3XCpPz
         cfG0DNZEAaOMlRwzmh3cEixzcpJr8ft7sOdRVchESWS7Pn5ZIEX/aZUgcI8jZByjJBWR
         bOZ5CvWvG3Qr+WQBqglexl2FnjtwFsGi6i8wwURyU71HQ19QkiGCB1eePYUzXd7u4umn
         E7ud3CDzios8WHEHHnvbnbfLM2L1TXJ4h24eTD8kffHPgnvd3Dfcfv+dotCETio+RNHk
         Tdz6a1KJf5zUVEfC7uDHgTxnMaLDY3jLpbHgFgwrED6qx0A7tZr6qGalEABmVTZc3UWD
         o8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Yh60bZiNGZOc6tQmxndGlvfAxn8JuzncJI3aBSV8EoY=;
        b=pLeR449XnOG5otJ6mBN2Tdj/7NU7p356kgeqpQDJdwhGHMATtHKBpIpVa+rfS4Cw9S
         yKG2KmqX6448dmM9LoOzQHVEJUxJxovN1IJMB48C56v56teahCVNZOkG5Q6ZkxbCJq3p
         VhxITA+aZFuwbFXt8vKysQLT7uWj++pPEl0QKf9lUYNvl9ntNLGfd5zJc4VMW7wZS+E2
         EYFgu9clRQs2762hDLiKcZhBRghusigrWrReI53TCm2eWy/SH4zRMQdHervYyxMQREAv
         jNd2aaMxTsbU/J5NT1RxcEgPpg2CPNeVgpns9sp6r8rdho/FIeQxxKOTTb38Av2sfr7C
         zXug==
X-Gm-Message-State: AOAM530Yd9aQNYX0cPSwhejgn0lFSDFFq1JiYR3a0TFvcHNug73d4bOu
        aHVtMt7iwmM+woMhgL7Css1MtlK5I44=
X-Google-Smtp-Source: ABdhPJx2p8nBPH0VHIF0A2JGccic6C05ANWW5kVbeqZiWcdXnz3TnvAIjroB4b0QcEePrRgfD0JuzZYrUKI=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90a:fb91:: with SMTP id
 cp17mr2215983pjb.141.1598929180360; Mon, 31 Aug 2020 19:59:40 -0700 (PDT)
Date:   Mon, 31 Aug 2020 19:59:18 -0700
In-Reply-To: <20200901025927.3596190-1-badhri@google.com>
Message-Id: <20200901025927.3596190-6-badhri@google.com>
Mime-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v6 05/14] usb: typec: tcpci: Add set_vbus tcpci callback
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

set_vbus callback allows TCPC which are TCPCI based, however,
does not support turning on sink and source mode through
Command.SinkVbus and Command.SourceVbusDefaultVoltage.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.
---
 drivers/usb/typec/tcpm/tcpci.c | 7 +++++++
 drivers/usb/typec/tcpm/tcpci.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index b960fe5a0f28..d6a6fac82d48 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -328,6 +328,13 @@ static int tcpci_set_vbus(struct tcpc_dev *tcpc, bool source, bool sink)
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	int ret;
 
+	if (tcpci->data->set_vbus) {
+		ret = tcpci->data->set_vbus(tcpci, tcpci->data, source, sink);
+		/* Bypass when ret > 0 */
+		if (ret != 0)
+			return ret < 0 ? ret : 0;
+	}
+
 	/* Disable both source and sink first before enabling anything */
 
 	if (!source) {
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 04c49a0b0368..4d441bdf24d5 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -144,6 +144,7 @@ struct tcpci_data {
 			 bool enable);
 	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
 				  enum typec_cc_status cc);
+	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.28.0.402.g5ffc5be6b7-goog

