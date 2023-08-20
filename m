Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34E21781C92
	for <lists+linux-usb@lfdr.de>; Sun, 20 Aug 2023 08:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjHTGBY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Aug 2023 02:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjHTGBC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Aug 2023 02:01:02 -0400
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79960D94F
        for <linux-usb@vger.kernel.org>; Sat, 19 Aug 2023 21:45:00 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-26d5094188cso1923999a91.0
        for <linux-usb@vger.kernel.org>; Sat, 19 Aug 2023 21:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692506700; x=1693111500;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0FxH3RmVNebbCiuph+Bo6boQ8Nz4tprYlS7+OEsOmqw=;
        b=5jmbfSXOvAMBjY7XcewJDVevQopgO54KQmbQ2iQKCPwWla6sUAswnrQug61V8hji0P
         FaRA54BkkIuCNeFsp8E4UIG5T7V4sFSfFeatIfwF6jAXyA9xgu2mNc6TuPy513kAB3Rz
         RiT7tiN4pfEvGwwI8oiuOlidELgMrLeYxDbWEaI7W5tajNVXMefLkGp05jOY8nS1ru9H
         /pGsi97IyOxc244X4uetUs36QpUq+1OB6S4HvDZXotaICbhy4suLuW6xt5bXIl6MgD9v
         DvC03mjIj0uwMuIRzFNUmiBWXBVYTlO6b+XCGLeqq8G0ERC4BwKeoxk3CCel2uiyUEGe
         wvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692506700; x=1693111500;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0FxH3RmVNebbCiuph+Bo6boQ8Nz4tprYlS7+OEsOmqw=;
        b=EXT6ODOxtg/2ajhLYz7aF/NJHxK8zUeG2c8xXH6xHE4MvTIUQa/82CSvRqbRIBsPrX
         q80c9SBxbMVIKbjxdT3hNgrZxK17SU5TJbKF3+ZmaISnLU/38Lx7LZiSFQhDV0Ms9OyH
         YQ3mq5YVx3tN1KZpnzBbGmc4kPO4RihrPa/MYHIweFYVtUrtEmaTL3rGT21E25XiHiYP
         MieB+r/zDxF/frSyw7gi/58/cbLOxP6dSNTMsjPDYJvhDfeD4drYtdaWHkBC0n7KAswG
         RiHKWa+QZydvbwvfdEQBSlx4xlMXbEm9tBC4v1Ha0M6yO5GLr2eXLUDbdI+UzKWV9p8c
         o4Fw==
X-Gm-Message-State: AOJu0YzsrtmoB/E7PvL/6pspRVNRVRMVf7BxTmbRuagy5GNZxxmkUWzZ
        /bowYfhk2MPCAX3ruqQ/WvVtX5XEInI=
X-Google-Smtp-Source: AGHT+IEqOT3wwRMG5WwcbGjs5DHF28XuWoiMfoFuFwXlv5eZTJ+qF6GxclqG4t6qc2t8wDLRKskoRu3kjBA=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a17:90a:f00b:b0:268:4dee:eba0 with SMTP id
 bt11-20020a17090af00b00b002684deeeba0mr669301pjb.8.1692506699855; Sat, 19 Aug
 2023 21:44:59 -0700 (PDT)
Date:   Sun, 20 Aug 2023 04:44:48 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Message-ID: <20230820044449.1005889-1-badhri@google.com>
Subject: [PATCH v1] tcpm: Avoid soft reset when partner does not support get_status
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     gregkh@linuxfoundation.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com
Cc:     kyletso@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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

When partner does not support get_status message, tcpm right now
responds with soft reset message. This causes PD renegotiation to
happen and resets PPS link. Avoid soft resetting the link when
partner does not support get_status message to mitigate PPS resets.

[  208.926752] Setting voltage/current limit 9500 mV 2450 mA
[  208.930407] set_auto_vbus_discharge_threshold mode:3 pps_active:y vbus:9500 ret:0
[  208.930418] state change SNK_TRANSITION_SINK -> SNK_READY [rev3 POWER_NEGOTIATION]
[  208.930455] AMS POWER_NEGOTIATION finished

// ALERT message from the Source
[  213.948442] PD RX, header: 0x19a6 [1]
[  213.948451] state change SNK_READY -> GET_STATUS_SEND [rev3 GETTING_SOURCE_SINK_STATUS]
[  213.948457] PD TX, header: 0x492
[  213.950402] PD TX complete, status: 0
[  213.950427] pending state change GET_STATUS_SEND -> GET_STATUS_SEND_TIMEOUT @ 60 ms [rev3 GETTING_SOURCE_SINK_STATUS]

// NOT_SUPPORTED from the Source
[  213.959954] PD RX, header: 0xbb0 [1]

// sink sends SOFT_RESET
[  213.959958] state change GET_STATUS_SEND -> SNK_SOFT_RESET [rev3 GETTING_SOURCE_SINK_STATUS]
[  213.959962] AMS GETTING_SOURCE_SINK_STATUS finished
[  213.959964] AMS SOFT_RESET_AMS start
[  213.959966] state change SNK_SOFT_RESET -> AMS_START [rev3 SOFT_RESET_AMS]
[  213.959969] state change AMS_START -> SOFT_RESET_SEND [rev3 SOFT_RESET_AMS]

Cc: stable@vger.kernel.org
Fixes: 8dea75e11380 ("usb: typec: tcpm: Protocol Error handling")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 5639b9a1e0bf..280ce1bd7b53 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2753,6 +2753,13 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 			port->sink_cap_done = true;
 			tcpm_set_state(port, ready_state(port), 0);
 			break;
+		/*
+		 * Some port partners do not support GET_STATUS, avoid soft reset the link to
+		 * prevent redundant power re-negotiation
+		 */
+		case GET_STATUS_SEND:
+			tcpm_set_state(port, ready_state(port), 0);
+			break;
 		case SRC_READY:
 		case SNK_READY:
 			if (port->vdm_state > VDM_STATE_READY) {

base-commit: bbb9e06d2c6435af9c62074ad7048910eeb2e7bc
-- 
2.42.0.rc1.204.g551eb34607-goog

