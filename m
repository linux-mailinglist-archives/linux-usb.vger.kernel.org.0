Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66C559794B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Aug 2022 23:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238984AbiHQVyR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Aug 2022 17:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241842AbiHQVyP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Aug 2022 17:54:15 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6D2A406B
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 14:54:14 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-3359a55dcb6so33956157b3.21
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc;
        bh=C/QKypOIvJ6Rce8xT4vH1Np43b9AyTIhn63zh/KI2uM=;
        b=VMEaNRZngel6522Od5siI1fX5FQlaLPJ5eZSmEoVCRfDDEuooUEG2MlNxbK0XM+Oxe
         gkB+JyBVX5uwSyxu5ohjWipw+ykU+IcxIcVTeEKIUzxvzb9KusCmHGJ9/h+wHCA2ZQpJ
         lMTsRhV+DeHyGk4HAGUahcDkTjZuoFWOwGEvwCF4AfPoPhRRj6J6frntbreYNk6dtSUm
         Wd4Lr3kXYUOIONYHN+BCuVYVXmZ9cMLBwitZDNVIc6QB89B2FMQ5Hxlpzulgg9uzo/1f
         HwqRvpM86RUaQh9Yj/3gHmj/DCPR8Ke8uyj0lbhmyEW7BjuPHhstj5sAx2atFAC88LyZ
         sdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc;
        bh=C/QKypOIvJ6Rce8xT4vH1Np43b9AyTIhn63zh/KI2uM=;
        b=TWF9mBfEJbXEj0qYJEIW2LVvJIKijcJ+WGpUiNfiK52LzMAHVqm4uaNs8VCumFfVuJ
         LlHU8vE0+wdtMad04cmgzojM0iFBT877IOUXytOaX/Jr4RtsZ8Pd7SAqlOWdbWj7CIPD
         ANKKIJ33hOrY08URi8/eon6x1ivEh+asDmKKmkBQr88EYsSi9z3E4jfizORzcfRScmfl
         2c9Zydk5I+ijbI/wL8a+qlPgYXZfsAjsMCPf2OX4fgEQqyg09THGjSUx30JHNi386OwH
         P9ghm3tz5XdJ3IKQBn9CejBZzrsjEd/ClYmYPcNePOrNvtG+lOsqUis0vVyES3xa4eB4
         4kTA==
X-Gm-Message-State: ACgBeo1lPaY1Uo0dC3MWWlU6cb6BiSQ/5G8VdnQv22YZ70ErnPauB3m9
        wIv/phTWoGoOEkz3NYJYyR3oLq03Qt4=
X-Google-Smtp-Source: AA6agR6AJv7Nr2dA3OZEr6Mr/k8uc59n1Jky1TQ6onSmSX8miPfehs2p3zLXyZQb9qTlyC74sKL5J15rFEg=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:5faa:9f1a:38b4:b859])
 (user=badhri job=sendgmr) by 2002:a81:83cf:0:b0:334:fe5:b2fe with SMTP id
 t198-20020a8183cf000000b003340fe5b2femr167207ywf.402.1660773253404; Wed, 17
 Aug 2022 14:54:13 -0700 (PDT)
Date:   Wed, 17 Aug 2022 14:54:10 -0700
Message-Id: <20220817215410.1807477-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v3] usb: typec: tcpm: Return ENOTSUPP for power supply prop writes
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>, stable@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the port does not support USB PD, prevent transition to PD
only states when power supply property is written. In this case,
TCPM transitions to SNK_NEGOTIATE_CAPABILITIES
which should not be the case given that the port is not pd_capable.

[   84.308251] state change SNK_READY -> SNK_NEGOTIATE_CAPABILITIES [rev3 NONE_AMS]
[   84.308335] Setting usb_comm capable false
[   84.323367] set_auto_vbus_discharge_threshold mode:3 pps_active:n vbus:5000 ret:0
[   84.323376] state change SNK_NEGOTIATE_CAPABILITIES -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]

Fixes: e9e6e164ed8f6 ("usb: typec: tcpm: Support non-PD mode")
Cc: stable@vger.kernel.org
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
- Add Fixes tag.
Changes since v2:
- CCed stable
---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ea5a917c51b1..904c7b4ce2f0 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -6320,6 +6320,13 @@ static int tcpm_psy_set_prop(struct power_supply *psy,
 	struct tcpm_port *port = power_supply_get_drvdata(psy);
 	int ret;
 
+	/*
+	 * All the properties below are related to USB PD. The check needs to be
+	 * property specific when a non-pd related property is added.
+	 */
+	if (!port->pd_supported)
+		return -EOPNOTSUPP;
+
 	switch (psp) {
 	case POWER_SUPPLY_PROP_ONLINE:
 		ret = tcpm_psy_set_online(port, val);
-- 
2.37.1.595.g718a3a8f04-goog

