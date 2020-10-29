Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4661A29E584
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 08:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731130AbgJ2H5d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 03:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgJ2HYk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Oct 2020 03:24:40 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBC6C05BD21
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 23:31:50 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id 62so1432257pfv.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2020 23:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=4wHFl4meLUDTdOosTidWDBrzaH5xNKR+XS3gXiGY0NA=;
        b=ns2vttprtXN9/utBZvDjOQXSukPuYNiUYHkRWXxOGG8FOeY0jwlTU0vyDxCut2B4ow
         hjB6CFc6jLogU+TrmqYU42xuWHCDKRyJufy66DpkKdDu/FCe2MD9ymdi4HjFdcR3d0eD
         dcMV4aWb24qZatXGqFj8/j1HqjoYZDrJAL1W3/QokzNf+tzzj6shLZe3K9M+DYHBoMxa
         jsIA0vFS8S8LnOAPw9pLU1MwBeu6sMOtwgh7mHeRdKzkMux73DVpDaPrrTch2UAsdO/6
         V0MEyXurcRvuXkkjvBW1UYeIK+rFYHXp05rMx8eREW/UT1ZsyYzi3GZi7h4fp0oYjgm7
         Ba0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=4wHFl4meLUDTdOosTidWDBrzaH5xNKR+XS3gXiGY0NA=;
        b=hg3cjuncms8LZeuQIA9/inaChE+MMRH+VX4EH5jVc5Up0hVPgHSJlFRYEFIwXhec8S
         Oo+q01+RTHM2GiyeA8JarWgDtHu91TekBlIQ601e8jZu5GxkCZlOOlxBPW/GuR9KVVZx
         Lx7dZ3sdHoaGIDvZP/pOhRefqlRXU9JXUrKtYXyzKPrGU2voFz8jwduErt5JA4YKBZ//
         TS9Aao27FRPPgCpsCXkdLYL3y1HX/ib5m5wrZvE/Wvk3fbHoErpgQdPRkc82+u1T7UyS
         UECQJn0H308vxuhrsnqb/SACa6UTvT41DFY3nGmTmhI3RMPcp6pHsNsvK6eC2tg8M8d5
         HenA==
X-Gm-Message-State: AOAM531sGTsyNUIiV4+OnDdseSYgLtdY/D65o+k9WBbnRN15Xt0Wzcux
        /v9d9jeNxYDF3V/KgyIVa2EiExKb+o8=
X-Google-Smtp-Source: ABdhPJyqr6P1eHBIcxxZMWOIXb1uzSEGuPkBvGUKtmTm+MsMdmlVOfimEuOlasKxR3dlB5vET6KFbh4T6AA=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a62:6496:0:b029:155:b152:f0cf with SMTP id
 y144-20020a6264960000b0290155b152f0cfmr3032733pfb.75.1603953110146; Wed, 28
 Oct 2020 23:31:50 -0700 (PDT)
Date:   Wed, 28 Oct 2020 23:31:31 -0700
In-Reply-To: <20201029063138.1429760-1-badhri@google.com>
Message-Id: <20201029063138.1429760-4-badhri@google.com>
Mime-Version: 1.0
References: <20201029063138.1429760-1-badhri@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v12 03/10] usb: typec: tcpm: Refactor logic for new-source-frs-typec-current
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
        Badhri Jagan Sridharan <badhri@google.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
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

Changes since v10:
- Moving back to u32 for new-source-frs-typec-current.

Changes since v11:
- None
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
2.29.1.341.ge80a0c044ae-goog

