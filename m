Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C139127BB05
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbgI2Ck6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727481AbgI2Ckf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:35 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00740C0613D0
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:34 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d143so3266110ybh.11
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=0vOYtUX6nxGpyeypdwvv4NVNsjMVik0aJftyO5AEz3A=;
        b=XiA2HNwesllsncCWy6EWbhFNGB5X7Qo5Y86Kh09BFQB9sEU5LPugnEay38gtAW8LAC
         ImIAaQYImRfNFMf/7BulQMQz2+gZYVTuHfskyARnsHgaKs4tLKSvNW8oZCqHxbetQz3Z
         M2FB2YKaU5GM4MYyaPMEfMh0njRMVrxB/iTNboaPX2ds/2ZvpICXMRnhxUL6YFbTo3YB
         23G0lz+WaJnIAhjlwmdpQZAiVYWcqYAKs866t5soEXi6Gx2TFPW3Xw9wxTL9cBRMWCzw
         Au6SVnO/v4YCYDXuhJksGJJ7tz4MfQq8HQWOQWk9r/KN2vjxCKgA+3GA6HivatRtAdNq
         LBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0vOYtUX6nxGpyeypdwvv4NVNsjMVik0aJftyO5AEz3A=;
        b=aILg0rAA6fcuihNHzJAqyMr59OroOV+kshUVeQjlycOCR9wwY2bYSeUHmFHLGeNYPn
         Tjw9/AX7rKpX+L24XCGISwCz8g3rRhxBKlPMw8hCiXT8ylPriltcV8D0G0dibABgJUe+
         cr5Jq017J+xsbCOT6QOq4ZLzTf0aOgEKnD8Ns82M6W6xKyCNo0Mdno6kUf6YnE8dLIgj
         XcbQPf7COniqySvNiMQx5BXw7R2wEjxTIUkAVsg+BkoPy7cDm6rbcUDThLz3xglD6DIX
         T0CZkQ3OMvbow/9pCZ82D5J92Hf3B9d1QdFPQRCIoac86C4rv1kK9XWSOOE05bYLcY63
         cmgw==
X-Gm-Message-State: AOAM532iL/z/IMm+S0O9ywgauNza1XUibvJBKvU6YwfDTplETaOK23o/
        BIxkQ22B9o6HLbQe77Ju1P2FiKy9VYM=
X-Google-Smtp-Source: ABdhPJzlPLBPLb6Gty7RRp/o9efIss3x7igMMIHRTAddL1A/gVoP5YPMjcviEyCItFHKHzCVpMxbmZIWTmo=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:e0d2:: with SMTP id x201mr3548640ybg.180.1601347234136;
 Mon, 28 Sep 2020 19:40:34 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:40:01 -0700
In-Reply-To: <20200929024004.244992-1-badhri@google.com>
Message-Id: <20200929024004.244992-13-badhri@google.com>
Mime-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 12/15] usb: typec: tcpm: Parse frs type-c current from
 device tree
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

New source's current capability is now defined as string based
device tree property through new-source-frs-typec-current.
Refactor tcpm code to parse new-source-frs-typec-current and
infer local port's new source current capability during frs.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
v9 is the first version of this patch in this series to rebase
TCPM code to read new source frs current from
new-source-frs-typec-current.
---
 drivers/usb/typec/tcpm/tcpm.c | 41 +++++++++++++++++++----------------
 include/linux/usb/typec.h     | 12 ++++++++++
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 02b7f623f584..d5a3e2b3bea2 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -180,16 +180,11 @@ enum adev_actions {
 	ADEV_ATTENTION,
 };
 
-/*
- * Initial current capability of the new source when vSafe5V is applied during PD3.0 Fast Role Swap.
- * Based on "Table 6-14 Fixed Supply PDO - Sink" of "USB Power Delivery Specification Revision 3.0,
- * Version 1.2"
- */
-enum frs_typec_current {
-	FRS_NOT_SUPPORTED,
-	FRS_DEFAULT_POWER,
-	FRS_5V_1P5A,
-	FRS_5V_3A,
+static const char * const typec_new_source_frs_current[] = {
+	[FRS_NOT_SUPPORTED]	= "not-supported",
+	[FRS_DEFAULT_POWER]	= "default",
+	[FRS_5V_1P5A]		= "1.5A",
+	[FRS_5V_3A]		= "3.0A",
 };
 
 /* Events from low level driver */
@@ -364,7 +359,7 @@ struct tcpm_port {
 	bool self_powered;
 
 	/* FRS */
-	enum frs_typec_current frs_current;
+	enum typec_new_source_frs_current new_source_frs_current;
 
 	/* Sink caps have been queried */
 	bool sink_cap_done;
@@ -1713,7 +1708,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
 	unsigned int cnt = pd_header_cnt_le(msg->header);
 	unsigned int rev = pd_header_rev_le(msg->header);
 	unsigned int i;
-	enum frs_typec_current frs_current;
+	enum typec_new_source_frs_current partner_frs_current;
 	bool frs_enable;
 	int ret;
 
@@ -1786,12 +1781,13 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
 		for (i = 0; i < cnt; i++)
 			port->sink_caps[i] = le32_to_cpu(msg->payload[i]);
 
-		frs_current = (port->sink_caps[0] & PDO_FIXED_FRS_CURR_MASK) >>
+		partner_frs_current = (port->sink_caps[0] & PDO_FIXED_FRS_CURR_MASK) >>
 			PDO_FIXED_FRS_CURR_SHIFT;
-		frs_enable = frs_current && (frs_current <= port->frs_current);
+		frs_enable = partner_frs_current && (partner_frs_current <=
+						     port->new_source_frs_current);
 		tcpm_log(port,
 			 "Port partner FRS capable partner_frs_current:%u port_frs_current:%u enable:%c",
-			 frs_current, port->frs_current, frs_enable ? 'y' : 'n');
+			 partner_frs_current, port->new_source_frs_current, frs_enable ? 'y' : 'n');
 		if (frs_enable) {
 			ret  = port->tcpc->enable_frs(port->tcpc, true);
 			tcpm_log(port, "Enable FRS %s, ret:%d\n", ret ? "fail" : "success", ret);
@@ -4746,7 +4742,8 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 {
 	const char *cap_str;
 	int ret;
-	u32 mw, frs_current;
+	u32 mw;
+	const char *new_source_frs_current;
 
 	if (!fwnode)
 		return -EINVAL;
@@ -4817,9 +4814,15 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 
 	/* FRS can only be supported byb DRP ports */
 	if (port->port_type == TYPEC_PORT_DRP) {
-		ret = fwnode_property_read_u32(fwnode, "frs-typec-current", &frs_current);
-		if (ret >= 0 && frs_current <= FRS_5V_3A)
-			port->frs_current = frs_current;
+		ret = fwnode_property_read_string(fwnode, "new-source-frs-typec-current",
+						  &new_source_frs_current);
+		if (!ret) {
+			ret = match_string(typec_new_source_frs_current,
+					   ARRAY_SIZE(typec_new_source_frs_current),
+					   new_source_frs_current);
+			if (ret >= 0)
+				port->new_source_frs_current = ret;
+		}
 	}
 
 	return 0;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 9cb1bec94b71..76bb078a433c 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -72,6 +72,18 @@ enum typec_orientation {
 	TYPEC_ORIENTATION_REVERSE,
 };
 
+/*
+ * Based on "Table 6-14 Fixed Supply PDO - Sink" of "USB Power Delivery Specification Revision 3.0,
+ * Version 1.2"
+ * Initial current capability of the new source when vSafe5V is applied.
+ */
+enum typec_new_source_frs_current {
+	FRS_NOT_SUPPORTED,
+	FRS_DEFAULT_POWER,
+	FRS_5V_1P5A,
+	FRS_5V_3A,
+};
+
 /*
  * struct enter_usb_data - Enter_USB Message details
  * @eudo: Enter_USB Data Object
-- 
2.28.0.709.gb0816b6eb0-goog

