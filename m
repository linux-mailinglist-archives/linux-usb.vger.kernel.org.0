Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3446F648D55
	for <lists+linux-usb@lfdr.de>; Sat, 10 Dec 2022 07:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiLJGQj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Dec 2022 01:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiLJGQd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Dec 2022 01:16:33 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 884B44B9AC
        for <linux-usb@vger.kernel.org>; Fri,  9 Dec 2022 22:16:32 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id a4-20020a5b0004000000b006fdc6aaec4fso7394899ybp.20
        for <linux-usb@vger.kernel.org>; Fri, 09 Dec 2022 22:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hNdDTBFA0gnydyNFTqB66Y1Zah9ImzWsTdCqGyQTt1U=;
        b=NM9KAY9rU713lWgCS0mCMCUU9mGwBR/nBctTEy2o8btZ/OMhVXknSQALPQ5OQNBegs
         QQV54wsS5aM08L5Xwfyv78qMe8YwPhiG+ZVylCX4e+Ee+fb6aEjvjqm2xXcS74CErz49
         N7iV/GoPbCcnMbMrSV6hLIfkri2iNexvAcCdGVjI21WUUzy2o4Ko9xhAbBxVcaapzjg3
         UxYA6NIX4ZEsRQrcq2grnEISgjG5JLI6o4qi1gum/UhJbxjIIpdQb+Ok60U4SlZJaepj
         UTgS6eUeyn9jjZhebWcUy7QaL4jJrC7UbDSXeobD++thjiBj+0GLE+244o9t+4peVUdH
         6IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNdDTBFA0gnydyNFTqB66Y1Zah9ImzWsTdCqGyQTt1U=;
        b=eXTN4oj/CIBXaSec67KKajW78g+/tiKHM7/0T0R4j9s6xkTu+lnFixMQDNqsPfOCtS
         IT497oesT1cBVse5+hyuVhNk9aE6i8yafoyMiLNfvcdmzSyQc0qsIMIHC+KM4y4Oz01O
         CsevDoshhSyIg6sgIzz3LRtKecOEAGv849KTXjcgI1DOitjcZl2sWHtgGSL8MOduf0vW
         sbIwte8RlFGPcGP3VEcnyRsLKVtTw2f9pQkXH/tvf7zrpR+vMpjt+VBttMO6n3JtURwH
         dMqITpUGXECFcC/7ywkw/TaAaXbqMh9pla3vPLkUwtqhEtnuvX3LATJNr3bscYjPHBOm
         P96Q==
X-Gm-Message-State: ANoB5pmp7HaE8aTgqlvQNVJPlW9meKEECDTS2TlOtcslJxGHauS2Jp3q
        gO2+Vu2wYu/6PkF6yLiTw1gLzBR953E=
X-Google-Smtp-Source: AA0mqf4YH+VyU+LTH9tams7aPHD2hD7kZMYqAgaOW9XMfyWuQ4bfS22T3zVQzbvFUWvuJPeQOaaNXvRuWfU=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:bcc6:f018:88f8:a199])
 (user=badhri job=sendgmr) by 2002:a0d:dd8a:0:b0:391:c415:f872 with SMTP id
 g132-20020a0ddd8a000000b00391c415f872mr8050009ywe.318.1670652991842; Fri, 09
 Dec 2022 22:16:31 -0800 (PST)
Date:   Fri,  9 Dec 2022 22:16:25 -0800
In-Reply-To: <20221210061626.948426-1-badhri@google.com>
Mime-Version: 1.0
References: <20221210061626.948426-1-badhri@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221210061626.948426-2-badhri@google.com>
Subject: [PATCH v9 2/3] usb: typec: tcpci: Add callback for evaluating
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
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 include/linux/usb/tcpci.h      | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index fe781a38dc82..c8e78c13c9c4 100644
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
@@ -777,6 +785,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.enable_frs = tcpci_enable_frs;
 	tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
 	tcpci->tcpc.set_partner_usb_comm_capable = tcpci_set_partner_usb_comm_capable;
+	tcpci->tcpc.check_contaminant = tcpci_check_contaminant;
 
 	if (tcpci->data->auto_discharge_disconnect) {
 		tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
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
2.39.0.rc1.256.g54fd8350bd-goog

