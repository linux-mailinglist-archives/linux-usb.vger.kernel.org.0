Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31D65381615
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 07:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234127AbhEOF1h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 01:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbhEOF1d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 01:27:33 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F623C061756
        for <linux-usb@vger.kernel.org>; Fri, 14 May 2021 22:26:20 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id o6-20020a5b06460000b02905004326697dso1840957ybq.22
        for <linux-usb@vger.kernel.org>; Fri, 14 May 2021 22:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bTPswpk0akuXBvppl1rK6ylc4XjQRVDSR+CWbyIJ8R0=;
        b=k+1nYC7AfjyDzebPwV02klldD0WK5NuHGwOTI92ajmoY/H50D79Db2MK+AlgUzUOEt
         3rn7OmDjsroF2l3HFNgux/FbE8E0UtqoSeHspI7gcDQnNP/piazGgjZ9yArBzV7/SZiH
         TwYkCP/dGppXuWsUc4z9UOz3jpORFGJWMwIrFP+jDB+wATZt09m8KTXav67fxmJMtGDO
         SSRrd1gERDlg+2PqVC/KMAE51vKdvQzmGpwgMWJsfr8S33FzCq70Z8GKp5yEOeHzK3TY
         qDXAT/z9u1AG50S/xkm+MdBCbhHjVpov8PvXyBeVd9lGObwBCDmCEZhlL72+uv/nnLXt
         /pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bTPswpk0akuXBvppl1rK6ylc4XjQRVDSR+CWbyIJ8R0=;
        b=tzrCqiI5XyylC+LS2jb6lrPLhL+X+cA8/cV64UTP++SuVWV0pyuVRKzQ/RByA4loKh
         cJCawJVjbtAaAZmxU9C7urPKhsQWcFLCEJNjGJWpTdTNguNP+NO8ujwv7kFdJbFumeOx
         F8YyS+wWH5qkJ+Bwfsu+l0l1pZjX3PSRiM3XAkCRn14wEB4H3PlgBVCOlln+lgW3a0GU
         j84ZL6cU/OHZrrBgGgQ5mrpu6BXMNAmoCrQ4Ndf3zDPSNBDvjJLnhmMnFkryf+uEY3sM
         uDvhRaPJecQ2Gl4GgaiE3fk6MkNlRNr7+e9SVQxcjpw58AZP56SJLvUM+Y2K48RNUvW5
         SlZQ==
X-Gm-Message-State: AOAM531JmwhFQfMeGKzlsZYPkyH9xTX2RT+5I7H/t/6aX1e82Jyeor0j
        Gj02pogNvosU4mvWdwKroG/zm40Cp/I=
X-Google-Smtp-Source: ABdhPJwBjPn+Vci5sBFcE4dI3IBlEGpIkiIcuAqrB1B8Zzk/N00HSiugvk3U8iXRPbkl7WSkqFuUUXCdSDk=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:6bd1:251e:e226:7071])
 (user=badhri job=sendgmr) by 2002:a5b:b46:: with SMTP id b6mr1211609ybr.66.1621056379879;
 Fri, 14 May 2021 22:26:19 -0700 (PDT)
Date:   Fri, 14 May 2021 22:26:11 -0700
In-Reply-To: <20210515052613.3261340-1-badhri@google.com>
Message-Id: <20210515052613.3261340-2-badhri@google.com>
Mime-Version: 1.0
References: <20210515052613.3261340-1-badhri@google.com>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v1 2/4] usb: typec: tcpm: Refactor logic to enable/disable
 auto vbus dicharge
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>, stable@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The logic to enable vbus auto discharge on disconnect is used in
more than one place. Since this is repetitive code, moving this into
its own method.

Fixes: f321a02caebd ("usb: typec: tcpm: Implement enabling Auto Discharge disconnect support")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 39 ++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index b93c4c8d7b15..b475d9b9d38d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -771,6 +771,21 @@ static void tcpm_set_cc(struct tcpm_port *port, enum typec_cc_status cc)
 	port->tcpc->set_cc(port->tcpc, cc);
 }
 
+static int tcpm_enable_auto_vbus_discharge(struct tcpm_port *port, bool enable)
+{
+	int ret = 0;
+
+	if (port->tcpc->enable_auto_vbus_discharge) {
+		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, enable);
+		tcpm_log_force(port, "%s vbus discharge ret:%d", enable ? "enable" : "disable",
+			       ret);
+		if (!ret)
+			port->auto_vbus_discharge_enabled = enable;
+	}
+
+	return ret;
+}
+
 /*
  * Determine RP value to set based on maximum current supported
  * by a port if configured as source.
@@ -3445,12 +3460,7 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
-	if (port->tcpc->enable_auto_vbus_discharge) {
-		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, true);
-		tcpm_log_force(port, "enable vbus discharge ret:%d", ret);
-		if (!ret)
-			port->auto_vbus_discharge_enabled = true;
-	}
+	tcpm_enable_auto_vbus_discharge(port, true);
 
 	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, tcpm_data_role_for_source(port));
 	if (ret < 0)
@@ -3527,14 +3537,7 @@ static void tcpm_set_partner_usb_comm_capable(struct tcpm_port *port, bool capab
 
 static void tcpm_reset_port(struct tcpm_port *port)
 {
-	int ret;
-
-	if (port->tcpc->enable_auto_vbus_discharge) {
-		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, false);
-		tcpm_log_force(port, "Disable vbus discharge ret:%d", ret);
-		if (!ret)
-			port->auto_vbus_discharge_enabled = false;
-	}
+	tcpm_enable_auto_vbus_discharge(port, false);
 	port->in_ams = false;
 	port->ams = NONE_AMS;
 	port->vdm_sm_running = false;
@@ -3602,13 +3605,7 @@ static int tcpm_snk_attach(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
-	if (port->tcpc->enable_auto_vbus_discharge) {
-		tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, VSAFE5V);
-		ret = port->tcpc->enable_auto_vbus_discharge(port->tcpc, true);
-		tcpm_log_force(port, "enable vbus discharge ret:%d", ret);
-		if (!ret)
-			port->auto_vbus_discharge_enabled = true;
-	}
+	tcpm_enable_auto_vbus_discharge(port, true);
 
 	ret = tcpm_set_roles(port, true, TYPEC_SINK, tcpm_data_role_for_sink(port));
 	if (ret < 0)
-- 
2.31.1.751.gd2f1c929bd-goog

