Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E47769C36
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 18:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232600AbjGaQWI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 12:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbjGaQWH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 12:22:07 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BB2910E4
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 09:22:05 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5844a99c268so54494177b3.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690820524; x=1691425324;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LRo3hsVN444y0TtHMhMGsvOxbkL/I2oYGwECX+0Byew=;
        b=e2xip8j/kXJyG0dcPK0Zn443lF4UisCkaVTuX/YEcIbR0Sx8kOp/ulFyq8ggEbZaht
         XzVpcPNU++ZLwaUuj1pC1RAa+C/OqX0Zzd3a7LDbSRQy6vZXX232sSFXqNMmmPZgSSGm
         Y0tBuxcCtSPlXIvSOTEGd17dzcAGdtKYN/ZbrfWf9MKlHp+6SxADk2EkWjBdwTpDGw1A
         ST2ZdIs5jKG/vCSPLGxFgNXJDfMKc2LHJq8tzqvQhj+k8djvb7k+VGLl5LzxeuyFK/xB
         auHSCJO6ejTroiFqPk2CKJfm97gjCZqlnNbhg4WtPbh1dtq6XRdqojcYzAG3LQ+LvS/k
         tILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690820524; x=1691425324;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRo3hsVN444y0TtHMhMGsvOxbkL/I2oYGwECX+0Byew=;
        b=djM15ac2HgnSnzVY1IaLaH359Y227vac/7ZLqkwQla1aLlB04a75aRQJp+P3R5rxo9
         E4SK6hlT9XzSFcmpRabt1EOr/wjorYa2YhPC1AlWvWLhcspmJKV864qo2YHqRX/6/1AO
         tGdstE4KAC0c4phPclTbPRdaKhkYtc/SkiIqlRBLh1wCfZy8yKJPJH8vhrTLhnBN0PgR
         TkX3Xy4h4LKBSfWaxVomkF0YFVWV9MsgMqZCShXV3zLaIYfo/C0/giyaa6duu2mWljym
         UXSf+Sx0jFiiduGvowyeRrOg5hIHB0o1WCgwcqsEYc+1UmLzNr3D4n1OhO+KVmi/iW8c
         bxng==
X-Gm-Message-State: ABy/qLbLkSkUYMyyX/LdNaNODYLZd98LMME3iFHZexLO8mW7po6vS6W7
        E6baiUG6ORk26pRqqsvPPo9bjGu9+BfQ
X-Google-Smtp-Source: APBJJlHwDw8hHfctSTvG20cp1AfKZnIF/LJ8pK7D4h5+AmnTyceO45s+QGfH5TcfIihmEGJ60WxSukBwNQNo
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:ba23:5591:d70e:c541])
 (user=kyletso job=sendgmr) by 2002:a81:ac58:0:b0:579:e07c:2798 with SMTP id
 z24-20020a81ac58000000b00579e07c2798mr70972ywj.2.1690820524611; Mon, 31 Jul
 2023 09:22:04 -0700 (PDT)
Date:   Tue,  1 Aug 2023 00:21:59 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230731162159.19483-1-kyletso@google.com>
Subject: [PATCH] usb: typec: tcpm: Refactor the PPS APDO selection
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In current design of the PPS APDO selection, TCPM power supply only
accepts the requested voltage which is inside the range of the selected
PPS profile. To extend the flexibility and usability, remove the checks
about the voltage range in current profile. And try to search all PPS
APDOs of the Source that fit the requested voltage.

Also remove some redundant checks in tcpm_pd_build_pps_request.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 122 ++++++----------------------------
 1 file changed, 21 insertions(+), 101 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 829d75ebab42..9c496b8302b4 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3253,23 +3253,12 @@ static int tcpm_pd_select_pdo(struct tcpm_port *port, int *sink_pdo,
 	return ret;
 }
 
-#define min_pps_apdo_current(x, y)	\
-	min(pdo_pps_apdo_max_current(x), pdo_pps_apdo_max_current(y))
-
 static unsigned int tcpm_pd_select_pps_apdo(struct tcpm_port *port)
 {
-	unsigned int i, j, max_mw = 0, max_mv = 0;
-	unsigned int min_src_mv, max_src_mv, src_ma, src_mw;
-	unsigned int min_snk_mv, max_snk_mv;
-	unsigned int max_op_mv;
-	u32 pdo, src, snk;
-	unsigned int src_pdo = 0, snk_pdo = 0;
+	unsigned int i, src_ma, max_temp_mw = 0, max_op_ma, op_mw;
+	unsigned int src_pdo = 0;
+	u32 pdo, src;
 
-	/*
-	 * Select the source PPS APDO providing the most power while staying
-	 * within the board's limits. We skip the first PDO as this is always
-	 * 5V 3A.
-	 */
 	for (i = 1; i < port->nr_source_caps; ++i) {
 		pdo = port->source_caps[i];
 
@@ -3280,54 +3269,17 @@ static unsigned int tcpm_pd_select_pps_apdo(struct tcpm_port *port)
 				continue;
 			}
 
-			min_src_mv = pdo_pps_apdo_min_voltage(pdo);
-			max_src_mv = pdo_pps_apdo_max_voltage(pdo);
-			src_ma = pdo_pps_apdo_max_current(pdo);
-			src_mw = (src_ma * max_src_mv) / 1000;
-
-			/*
-			 * Now search through the sink PDOs to find a matching
-			 * PPS APDO. Again skip the first sink PDO as this will
-			 * always be 5V 3A.
-			 */
-			for (j = 1; j < port->nr_snk_pdo; j++) {
-				pdo = port->snk_pdo[j];
-
-				switch (pdo_type(pdo)) {
-				case PDO_TYPE_APDO:
-					if (pdo_apdo_type(pdo) != APDO_TYPE_PPS) {
-						tcpm_log(port,
-							 "Not PPS APDO (sink), ignoring");
-						continue;
-					}
-
-					min_snk_mv =
-						pdo_pps_apdo_min_voltage(pdo);
-					max_snk_mv =
-						pdo_pps_apdo_max_voltage(pdo);
-					break;
-				default:
-					tcpm_log(port,
-						 "Not APDO type (sink), ignoring");
-					continue;
-				}
+			if (port->pps_data.req_out_volt > pdo_pps_apdo_max_voltage(pdo) ||
+			    port->pps_data.req_out_volt < pdo_pps_apdo_min_voltage(pdo))
+				continue;
 
-				if (min_src_mv <= max_snk_mv &&
-				    max_src_mv >= min_snk_mv) {
-					max_op_mv = min(max_src_mv, max_snk_mv);
-					src_mw = (max_op_mv * src_ma) / 1000;
-					/* Prefer higher voltages if available */
-					if ((src_mw == max_mw &&
-					     max_op_mv > max_mv) ||
-					    src_mw > max_mw) {
-						src_pdo = i;
-						snk_pdo = j;
-						max_mw = src_mw;
-						max_mv = max_op_mv;
-					}
-				}
+			src_ma = pdo_pps_apdo_max_current(pdo);
+			max_op_ma = min(src_ma, port->pps_data.req_op_curr);
+			op_mw = max_op_ma * port->pps_data.req_out_volt / 1000;
+			if (op_mw > max_temp_mw) {
+				src_pdo = i;
+				max_temp_mw = op_mw;
 			}
-
 			break;
 		default:
 			tcpm_log(port, "Not APDO type (source), ignoring");
@@ -3337,16 +3289,10 @@ static unsigned int tcpm_pd_select_pps_apdo(struct tcpm_port *port)
 
 	if (src_pdo) {
 		src = port->source_caps[src_pdo];
-		snk = port->snk_pdo[snk_pdo];
-
-		port->pps_data.req_min_volt = max(pdo_pps_apdo_min_voltage(src),
-						  pdo_pps_apdo_min_voltage(snk));
-		port->pps_data.req_max_volt = min(pdo_pps_apdo_max_voltage(src),
-						  pdo_pps_apdo_max_voltage(snk));
-		port->pps_data.req_max_curr = min_pps_apdo_current(src, snk);
-		port->pps_data.req_out_volt = min(port->pps_data.req_max_volt,
-						  max(port->pps_data.req_min_volt,
-						      port->pps_data.req_out_volt));
+
+		port->pps_data.req_min_volt = pdo_pps_apdo_min_voltage(src);
+		port->pps_data.req_max_volt = pdo_pps_apdo_max_voltage(src);
+		port->pps_data.req_max_curr = pdo_pps_apdo_max_current(src);
 		port->pps_data.req_op_curr = min(port->pps_data.req_max_curr,
 						 port->pps_data.req_op_curr);
 	}
@@ -3464,32 +3410,16 @@ static int tcpm_pd_send_request(struct tcpm_port *port)
 static int tcpm_pd_build_pps_request(struct tcpm_port *port, u32 *rdo)
 {
 	unsigned int out_mv, op_ma, op_mw, max_mv, max_ma, flags;
-	enum pd_pdo_type type;
 	unsigned int src_pdo_index;
-	u32 pdo;
 
 	src_pdo_index = tcpm_pd_select_pps_apdo(port);
 	if (!src_pdo_index)
 		return -EOPNOTSUPP;
 
-	pdo = port->source_caps[src_pdo_index];
-	type = pdo_type(pdo);
-
-	switch (type) {
-	case PDO_TYPE_APDO:
-		if (pdo_apdo_type(pdo) != APDO_TYPE_PPS) {
-			tcpm_log(port, "Invalid APDO selected!");
-			return -EINVAL;
-		}
-		max_mv = port->pps_data.req_max_volt;
-		max_ma = port->pps_data.req_max_curr;
-		out_mv = port->pps_data.req_out_volt;
-		op_ma = port->pps_data.req_op_curr;
-		break;
-	default:
-		tcpm_log(port, "Invalid PDO selected!");
-		return -EINVAL;
-	}
+	max_mv = port->pps_data.req_max_volt;
+	max_ma = port->pps_data.req_max_curr;
+	out_mv = port->pps_data.req_out_volt;
+	op_ma = port->pps_data.req_op_curr;
 
 	flags = RDO_USB_COMM | RDO_NO_SUSPEND;
 
@@ -5882,12 +5812,6 @@ static int tcpm_pps_set_out_volt(struct tcpm_port *port, u16 req_out_volt)
 		goto port_unlock;
 	}
 
-	if (req_out_volt < port->pps_data.min_volt ||
-	    req_out_volt > port->pps_data.max_volt) {
-		ret = -EINVAL;
-		goto port_unlock;
-	}
-
 	target_mw = (port->current_limit * req_out_volt) / 1000;
 	if (target_mw < port->operating_snk_mw) {
 		ret = -EINVAL;
@@ -6440,11 +6364,7 @@ static int tcpm_psy_set_prop(struct power_supply *psy,
 		ret = tcpm_psy_set_online(port, val);
 		break;
 	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-		if (val->intval < port->pps_data.min_volt * 1000 ||
-		    val->intval > port->pps_data.max_volt * 1000)
-			ret = -EINVAL;
-		else
-			ret = tcpm_pps_set_out_volt(port, val->intval / 1000);
+		ret = tcpm_pps_set_out_volt(port, val->intval / 1000);
 		break;
 	case POWER_SUPPLY_PROP_CURRENT_NOW:
 		if (val->intval > port->pps_data.max_curr * 1000)
-- 
2.41.0.487.g6d72f3e995-goog

