Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B567356908E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 19:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbiGFRWe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 13:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233817AbiGFRWX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 13:22:23 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE081EC65
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 10:22:21 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id r22so7618157pgr.2
        for <linux-usb@vger.kernel.org>; Wed, 06 Jul 2022 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8vkh4TpqQ2iDSGtdYg+e9qVXOj8wmBpN55yIEeN36y0=;
        b=ThTTUVLaBkNvNvD7kstnLhRwdeS954leLaxWs9DUoyO/M6VlQPx/G0zAQHtOIRcyIe
         SJx6dbUkTs4Wj9NVD/CC85q2hXjmkc2eeSJtNtD9avsWZXE1f9UPiUOJUKn621GRzrAv
         2QeSVX4w7Gn76Ho02P3s2Ei+sW6816z0csY/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8vkh4TpqQ2iDSGtdYg+e9qVXOj8wmBpN55yIEeN36y0=;
        b=Uu2+Slel/NJ0E0BPZNV00X67POwJSzNFRlBmmNxOiyvv1B6btwE6ymOcubpnC/TdWt
         WMqGe4wkf4P+kv5PAu+8xLAU9BndrSzff51y0t9ynA66Vu2tBA62EMUV4FuOqGXaHiZG
         kbbpyxceC/91Fp+Y4nq8VkJ8SKyYkbbU8y/bOt+6b2k3ZyNMp/yILOoDbyu2T7l0lRpD
         4QA6vXhOiobgxL8FZcEWBuJtWIj4G+ISTyjrbtdq3qDHNNBcZH5uHgy2TqeB7NTM5Q3f
         S4WkD1STKGf9hZFQxFeTPeEixvFmAFik1f+2WNqWcTZ2izzIsaPFe7uAHuleRr9Ehinn
         NPSw==
X-Gm-Message-State: AJIora9PERLDyOjv5+d1MlLdFAvO3N+5EsMMmjPfUrw69UxRNrxT6wRw
        oLLuqOS9ygPxy8mg+4v1Bq7Vdg==
X-Google-Smtp-Source: AGRyM1sOulPvskKuXxJw8YFyvB7Ug9Hn6UdaLMDf2/lSv05bFdXt9zZpJcRLUpeYqbs3c3fJXpSWcQ==
X-Received: by 2002:a63:b341:0:b0:40d:677:881a with SMTP id x1-20020a63b341000000b0040d0677881amr35450152pgt.407.1657128140603;
        Wed, 06 Jul 2022 10:22:20 -0700 (PDT)
Received: from pmalani.c.googlers.com.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f7ce00b0016be0d5483asm7514953plw.252.2022.07.06.10.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 10:22:20 -0700 (PDT)
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
Subject: [PATCH v2 6/9] platform/chrome: cros_typec_switch: Add event check
Date:   Wed,  6 Jul 2022 17:15:10 +0000
Message-Id: <20220706171601.807042-7-pmalani@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706171601.807042-1-pmalani@chromium.org>
References: <20220706171601.807042-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Chrome EC updates Type-C status events when mux set requests from
the Application Processor (AP) are completed. Add a check to the
flow of configuring muxes to look for this status done bit, so that
the driver is aware that the mux set completed successfully or not.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- No changes.

 drivers/platform/chrome/cros_typec_switch.c | 72 ++++++++++++++++++++-
 1 file changed, 70 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_switch.c b/drivers/platform/chrome/cros_typec_switch.c
index 9faa442dd81a..a226f828514f 100644
--- a/drivers/platform/chrome/cros_typec_switch.c
+++ b/drivers/platform/chrome/cros_typec_switch.c
@@ -7,6 +7,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -63,6 +65,40 @@ static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *al
 	return ret;
 }
 
+static int cros_typec_send_clear_event(struct cros_typec_switch_data *sdata, int port_num,
+				       u32 events_mask)
+{
+	struct ec_params_typec_control req = {
+		.port = port_num,
+		.command = TYPEC_CONTROL_COMMAND_CLEAR_EVENTS,
+		.clear_events_mask = events_mask,
+	};
+
+	return cros_ec_command(sdata->ec, 0, EC_CMD_TYPEC_CONTROL, &req,
+			       sizeof(req), NULL, 0);
+}
+
+bool cros_typec_check_event(struct cros_typec_switch_data *sdata, int port_num, u32 mask)
+{
+	struct ec_response_typec_status resp;
+	struct ec_params_typec_status req = {
+		.port = port_num,
+	};
+	int ret;
+
+	ret = cros_ec_command(sdata->ec, 0, EC_CMD_TYPEC_STATUS, &req, sizeof(req),
+			      &resp, sizeof(resp));
+	if (ret < 0) {
+		dev_warn(sdata->dev, "EC_CMD_TYPEC_STATUS failed for port: %d\n", port_num);
+		return false;
+	}
+
+	if (resp.events & mask)
+		return true;
+
+	return false;
+}
+
 /*
  * The Chrome EC treats both mode-switches and retimers as "muxes" for the purposes of the
  * host command API. This common function configures and verifies the retimer/mode-switch
@@ -71,12 +107,44 @@ static int cros_typec_get_mux_state(unsigned long mode, struct typec_altmode *al
 static int cros_typec_configure_mux(struct cros_typec_switch_data *sdata, int port_num, int index,
 				    unsigned long mode, struct typec_altmode *alt)
 {
-	int ret = cros_typec_get_mux_state(mode, alt);
+	unsigned long end;
+	u32 event_mask;
+	u8 mux_state;
+	int ret;
+
+	ret = cros_typec_get_mux_state(mode, alt);
+	if (ret < 0)
+		return ret;
+	mux_state = (u8)ret;
 
+	/* Clear any old mux set done event. */
+	if (index == 0)
+		event_mask = PD_STATUS_EVENT_MUX_0_SET_DONE;
+	else
+		event_mask = PD_STATUS_EVENT_MUX_1_SET_DONE;
+
+	ret = cros_typec_send_clear_event(sdata, port_num, event_mask);
+	if (ret < 0)
+		return ret;
+
+	/* Send the set command. */
+	ret = cros_typec_cmd_mux_set(sdata, port_num, index, mux_state);
 	if (ret < 0)
 		return ret;
 
-	return cros_typec_cmd_mux_set(sdata, port_num, index, (u8)ret);
+	/* Check for the mux set done event. */
+	end = jiffies + msecs_to_jiffies(1000);
+	do {
+		if (cros_typec_check_event(sdata, port_num, event_mask))
+			return 0;
+
+		usleep_range(500, 1000);
+	} while (time_before(jiffies, end));
+
+	dev_err(sdata->dev, "Timed out waiting for mux set done on index: %d, state: %d\n",
+		index, mux_state);
+
+	return -ETIMEDOUT;
 }
 
 static int
-- 
2.37.0.rc0.161.g10f37bed90-goog

