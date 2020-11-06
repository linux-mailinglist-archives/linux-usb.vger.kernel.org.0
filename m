Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C492A9C93
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 19:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgKFSl6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 13:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728018AbgKFSl6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Nov 2020 13:41:58 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2317CC0613CF
        for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2020 10:41:58 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id y7so2139485pfq.11
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2020 10:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XeYdtp0accnvA282EGyKNiLUJ2oXayxLKluUy6e2Lcw=;
        b=nQa6i0RJCQB07WIpfmxyQT/17YrFmbUVIoptN9h7XwkTEPBoaE8/L+4Cg3aZ1STUf/
         saL6DU/0jXXGXqlekniKYJaJh0D4xakhzAUCsevAofzhIs1f9nbLEVE6Fl4pu2CdiSqI
         Z/wNkzG5gNRM5ap5jN9hN28mLQDEwucJFGb68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XeYdtp0accnvA282EGyKNiLUJ2oXayxLKluUy6e2Lcw=;
        b=ck1AXvrD/lMsNevc0GUU9BFZt5PI12azLWOg0wxgYPC75YQDbWHwDpcyE74VnhYkLt
         yvcrkREtknqKRIqYTflf1W+eF2c3clnD9+Rm59D9nbW8hT1zJAzvqwWqO7Zg/Sl2W/cn
         58Z+NVZcNtrOZGOj+Ajf6VHGojT0xa6HdpN8Ur/7SHvB8R4QveJyR+4WH98SaizBSsvw
         NheNANAEahBeD5jALJvries83d6tCBm8llHmlEFgw21VWDLUNbTC2VQwJQ6kFNR5wj5F
         EttjLYiC3/3XaTFpj6naF03kpja4rL20QnwavwxsLL0txyxulKbOQiX6K57p5wuASWfn
         ding==
X-Gm-Message-State: AOAM531Bh3hjQr8mT7BdfNftjdv9kzguQ81zXb9mDqUScwJl1RPQ3WrK
        qle+Jm0/g9bGDp8bbjWcF1+C7Q==
X-Google-Smtp-Source: ABdhPJyEYplM6gN85L78WJ0voo+lWqX77lX5OJRSbzensgU5sFXRNOfpZXpMd77wTX2/0ROhBmtEEQ==
X-Received: by 2002:a17:90a:11:: with SMTP id 17mr991022pja.66.1604688117767;
        Fri, 06 Nov 2020 10:41:57 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id b6sm3246143pjq.42.2020.11.06.10.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 10:41:57 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Subject: [PATCH v2 3/6] platform/chrome: cros_ec_typec: Rename discovery struct
Date:   Fri,  6 Nov 2020 10:41:04 -0800
Message-Id: <20201106184104.939284-4-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201106184104.939284-1-pmalani@chromium.org>
References: <20201106184104.939284-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rename the sop_disc data struct which is used to store PD discovery data
to the more generic name of disc_data. It can then be re-used to store
and process cable discovery data.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- No changes.

 drivers/platform/chrome/cros_ec_typec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index f6d3c37c2c27..3c8ff07c8803 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -59,7 +59,7 @@ struct cros_typec_port {
 
 	/* Flag indicating that PD partner discovery data parsing is completed. */
 	bool sop_disc_done;
-	struct ec_response_typec_discovery *sop_disc;
+	struct ec_response_typec_discovery *disc_data;
 	struct list_head partner_mode_list;
 };
 
@@ -323,8 +323,8 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cros_typec_register_port_altmodes(typec, port_num);
 
-		cros_port->sop_disc = devm_kzalloc(dev, EC_PROTO2_MAX_RESPONSE_SIZE, GFP_KERNEL);
-		if (!cros_port->sop_disc) {
+		cros_port->disc_data = devm_kzalloc(dev, EC_PROTO2_MAX_RESPONSE_SIZE, GFP_KERNEL);
+		if (!cros_port->disc_data) {
 			ret = -ENOMEM;
 			goto unregister_ports;
 		}
@@ -617,7 +617,7 @@ static int cros_typec_get_mux_info(struct cros_typec_data *typec, int port_num,
 static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_num)
 {
 	struct cros_typec_port *port = typec->ports[port_num];
-	struct ec_response_typec_discovery *sop_disc = port->sop_disc;
+	struct ec_response_typec_discovery *sop_disc = port->disc_data;
 	struct cros_typec_altmode_node *node;
 	struct typec_altmode_desc desc;
 	struct typec_altmode *amode;
@@ -682,7 +682,7 @@ static void cros_typec_parse_pd_identity(struct usb_pd_identity *id,
 static int cros_typec_handle_sop_disc(struct cros_typec_data *typec, int port_num)
 {
 	struct cros_typec_port *port = typec->ports[port_num];
-	struct ec_response_typec_discovery *sop_disc = port->sop_disc;
+	struct ec_response_typec_discovery *sop_disc = port->disc_data;
 	struct ec_params_typec_discovery req = {
 		.port = port_num,
 		.partner_type = TYPEC_PARTNER_SOP,
-- 
2.29.1.341.ge80a0c044ae-goog

