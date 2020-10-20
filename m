Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C969E293842
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 11:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405715AbgJTJhO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 05:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405702AbgJTJgn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 05:36:43 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8C7C0613D4
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 02:36:41 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j10so1432373ybl.19
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 02:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=68+qkqJJ0yGLVD99S4hdTLHhp4Q61Io/XotXvcoBiV8=;
        b=ZR2wc6dslObVvINB9BUikIlKrnpZm/ejNhWBSswVwuHXvxAX9xWLlasnBYoDLa2QFX
         S3aAcemb9GkFUrue0XxER8DBdvl91wF3vcDl7FtI8k+F4cNA+/8PcCwYjSz/Klcs37SW
         zI7QywfZicOrHzgPcypyayEfKcsIE3m7k0jgGsDoGEh386tmay9J3AwoAPUcMit7307F
         1kvgZAJJ33mie4RXZSuuw4BXx+AdTYXnoEWClQ+HzXuTIti4Y5YXApZgujTAoa2c+1ve
         aGmsQoyeXW0qPmqWKsLQ3JdYooQko3Lu8UDl+FINeY1tWZGngo+nglwnFAv5W/AEPLLL
         hWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=68+qkqJJ0yGLVD99S4hdTLHhp4Q61Io/XotXvcoBiV8=;
        b=nd6MyXdwHbQFabN98QQCJSrTKHFMdyrxTcOO9mxzQaBvEOXgheUEELU/biIc5WPaTC
         vovnRI01fEf3HA7SqVL2SjI4quXOZCZFVoMrseTuKjPDwVOlK1yzJSJeRiB9aMnypfU3
         VhuC+Qy08/yM5fsn5xFNMoyMLstF4EVcOCxz8HjrLt0VYhfBjXWiEHPUbTiv47RaLaot
         qDeqz33DVAaR+U886iXvR+PpuXcMu5hGAzHhHfzp84V2jugQEKVvYrX6HIao4bth0epN
         J223VfFfrpDyfsjmENVB1NrfX4Nk0vckwA13VxCAtoKUiEXSQJfeOrd5DZ/F1Jxrzje0
         OSpQ==
X-Gm-Message-State: AOAM532uH1/DbLJelv2dE80FQOmaTJ0TcWjiY8bNyqqohppRgRWoUA8Y
        wTzfk/b2DX6lYFIP2h+KlNZAT7Klpnc=
X-Google-Smtp-Source: ABdhPJyil+TPK0fD0mAFL5BbejbF9pJeXKE7dbv/JGrJAocl14Pd/3zIJQ3exhUfNX3qiZIpkT8FNM8G4Os=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:84cd:: with SMTP id x13mr2587479ybm.430.1603186600445;
 Tue, 20 Oct 2020 02:36:40 -0700 (PDT)
Date:   Tue, 20 Oct 2020 02:36:21 -0700
In-Reply-To: <20201020093627.256885-1-badhri@google.com>
Message-Id: <20201020093627.256885-5-badhri@google.com>
Mime-Version: 1.0
References: <20201020093627.256885-1-badhri@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v11 04/10] usb: typec: tcpm: Refactor logic for new-source-frs-typec-current
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

New source's current capability is now defined through
new-source-frs-typec-current. Refactor tcpm code to parse
new-source-frs-typec-current and infer local port's new source current
capability during frs.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
v9 is the first version of this patch in this series to rebase
TCPM code to read new source frs current from
new-source-frs-typec-current.

Changes since v10:
- Moving back to u32 for new-source-frs-typec-current.
---
 drivers/usb/typec/tcpm/tcpm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 55535c4f66bf..561480b67bce 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -363,8 +363,8 @@ struct tcpm_port {
 	/* port belongs to a self powered device */
 	bool self_powered;
 
-	/* FRS */
-	enum frs_typec_current frs_current;
+	/* Sink FRS */
+	enum frs_typec_current new_source_frs_current;
 
 	/* Sink caps have been queried */
 	bool sink_cap_done;
@@ -1713,7 +1713,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
 	unsigned int cnt = pd_header_cnt_le(msg->header);
 	unsigned int rev = pd_header_rev_le(msg->header);
 	unsigned int i;
-	enum frs_typec_current frs_current;
+	enum frs_typec_current partner_frs_current;
 	bool frs_enable;
 	int ret;
 
@@ -1786,12 +1786,13 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
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
@@ -4808,9 +4809,10 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 
 	/* FRS can only be supported byb DRP ports */
 	if (port->port_type == TYPEC_PORT_DRP) {
-		ret = fwnode_property_read_u32(fwnode, "frs-typec-current", &frs_current);
+		ret = fwnode_property_read_u32(fwnode, "new-source-frs-typec-current",
+					       &frs_current);
 		if (ret >= 0 && frs_current <= FRS_5V_3A)
-			port->frs_current = frs_current;
+			port->new_source_frs_current = frs_current;
 	}
 
 	return 0;
-- 
2.29.0.rc1.297.gfa9743e501-goog

