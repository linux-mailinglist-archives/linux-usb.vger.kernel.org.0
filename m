Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A80E56D6C8
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jul 2022 09:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbiGKH2r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jul 2022 03:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiGKH2q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jul 2022 03:28:46 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CBC65EE
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 00:28:45 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id q5so3724482plr.11
        for <linux-usb@vger.kernel.org>; Mon, 11 Jul 2022 00:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+189CxxcoXTJww1vvNRT20TPCnm9kCVhx1btF3TMXi8=;
        b=k74DOFzNKkceSWgme9B9za4lw91QGrG2qroaIHb8gns+t7uTeteRvn4NBHF6QGCAz7
         3PaEWSWLS9kbrum42fuA4GA6Tko9EfKdNPyTKFyn1UXvXVfw6Abh+Wyp9v/uWQbAAfjC
         HHnYXgeP+D9JEx0OYFvlogJ2vUNGnqXtBqEUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+189CxxcoXTJww1vvNRT20TPCnm9kCVhx1btF3TMXi8=;
        b=mN9bIByliyzLhrsmpR0KEartuW9j+Ek/p0h+EZtn81PwOzG1Sa/RlrUNL34rpabZw9
         1N4g/2SplV6evPSuuxdB2wjf8pvCD+BdqTBEkiT8LJcFrJEh1DyqquVPf+Bu+xtnq7XY
         L/p65jcw7ra/8se/81OX+O5lZmga/uxcbdlq0o4KLXQNUzGaUtloTUSWXCqJYlKrI3DZ
         elEvWyhJxfOV9HYdDyy0feQy4bavfhutuZcdmzLonUKCf7Kr+XFiVrLzh48dmluOcT1/
         Nb7R4WQ+WshJ2pD90XFU0t1CiMWGeqC0bynIxckSv3YQlTms/dklMp6thUJKbiIPRm3X
         8N2g==
X-Gm-Message-State: AJIora9JDPb/7jSAHhwp59N9w3CnzitdBJF2ldrWUuMyXS6npJc3QXTH
        t1IlXCna1/sHIbzCLet2Ch0kTQ==
X-Google-Smtp-Source: AGRyM1vvlzYjpioNK7owzTp0M9LAaXsvaxsc/kYBhI2lIuqlMsmMz4iD3WVH7/La8w+rtVzCIakaMw==
X-Received: by 2002:a17:90b:4f85:b0:1f0:95d:c02b with SMTP id qe5-20020a17090b4f8500b001f0095dc02bmr14519392pjb.89.1657524524861;
        Mon, 11 Jul 2022 00:28:44 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id z8-20020aa79e48000000b0051bc5f4df1csm4012839pfq.154.2022.07.11.00.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:28:44 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        "Dustin L. Howett" <dustin@howett.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH v4 7/9] platform/chrome: cros_typec_switch: Register mode switches
Date:   Mon, 11 Jul 2022 07:23:01 +0000
Message-Id: <20220711072333.2064341-8-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
In-Reply-To: <20220711072333.2064341-1-pmalani@chromium.org>
References: <20220711072333.2064341-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Register mode switch devices for Type C connectors, when they are
specified by firmware. These control Type C configuration for any USB
Type-C mode switches (sometimes known as "muxes") which are controlled
by the Chrome EC.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v3:
- No changes.

Changes since v2:
- Fixed missing "static" identifier.

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_typec_switch.c | 40 +++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 7c01957a032d..024a2bb146b2 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/usb/typec_altmode.h>
 #include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
 
 #define DRV_NAME "cros-typec-switch"
@@ -22,6 +23,7 @@
 /* Handles and other relevant data required for each port's switches. */
 struct cros_typec_port {
 	int port_num;
+	struct typec_mux_dev *mode_switch;
 	struct typec_retimer *retimer;
 	struct cros_typec_switch_data *sdata;
 };
@@ -147,6 +149,15 @@ static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int po
 	return -ETIMEDOUT;
 }
 
+static int cros_typec_mode_switch_set(struct typec_mux_dev *mode_switch,
+				      struct typec_mux_state *state)
+{
+	struct cros_typec_port *port = typec_mux_get_drvdata(mode_switch);
+
+	/* Mode switches have index 0. */
+	return cros_typec_configure_mux(port->sdata, port->port_num, 0, state->mode, state->alt);
+}
+
 static int cros_typec_retimer_set(struct typec_retimer *retimer, struct typec_retimer_state *state)
 {
 	struct cros_typec_port *port = typec_retimer_get_drvdata(retimer);
@@ -163,9 +174,27 @@ static void cros_typec_unregister_switches(struct cros_typec_switch_data *sdata)
 		if (!sdata->ports[i])
 			continue;
 		typec_retimer_unregister(sdata->ports[i]->retimer);
+		typec_mux_unregister(sdata->ports[i]->mode_switch);
 	}
 }
 
+static int cros_typec_register_mode_switch(struct cros_typec_port *port,
+					   struct fwnode_handle *fwnode)
+{
+	struct typec_mux_desc mode_switch_desc = {
+		.fwnode = fwnode,
+		.drvdata = port,
+		.name = fwnode_get_name(fwnode),
+		.set = cros_typec_mode_switch_set,
+	};
+
+	port->mode_switch = typec_mux_register(port->sdata->dev, &mode_switch_desc);
+	if (IS_ERR(port->mode_switch))
+		return PTR_ERR(port->mode_switch);
+
+	return 0;
+}
+
 static int cros_typec_register_retimer(struct cros_typec_port *port, struct fwnode_handle *fwnode)
 {
 	struct typec_retimer_desc retimer_desc = {
@@ -235,6 +264,17 @@ static int cros_typec_register_switches(struct cros_typec_switch_data *sdata)
 		}
 
 		dev_dbg(dev, "Retimer switch registered for index %llu\n", index);
+
+		if (!fwnode_property_read_bool(fwnode, "mode-switch"))
+			continue;
+
+		ret = cros_typec_register_mode_switch(port, fwnode);
+		if (ret) {
+			dev_err(dev, "Mode switch register failed\n");
+			goto err_switch;
+		}
+
+		dev_dbg(dev, "Mode switch registered for index %llu\n", index);
 	}
 
 	return 0;
-- 
2.37.0.144.g8ac04bfd2-goog

