Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C456A293827
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 11:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405729AbgJTJgs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 05:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392934AbgJTJgo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 05:36:44 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2468BC0613D1
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 02:36:43 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id k6so857844qvg.9
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 02:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=RO8+F+AZynQ8z9gnNYSkehQkLC4PdmM+7OgKF65OMag=;
        b=J2YN8PeeFWvC4FqnPy0juAGSztPEz73SSov7sHYge5N5T/oEGGGypUdyXF1i711W+9
         noEv04bglt9VXr107ZNu3D9U4XvADbdh8JN6ee0a5Uk7KAO9jphg4wvXUK6KEUCjxced
         xzwRhdTBkSUCZLNA/tRcriV15ikmZVeGdEqNbMY5ZzIfoQCidMpjLoyKoFYEHbMTFoih
         kmIrMauF+PbOiZjA7CGcG+PY9BxM183bRGBkU+0IZBqcyyXX85yUYt2OS/nXk4FMSoI+
         ShrLZu+hIri57MgNd3bZErvYqWPlWU78wtI3fcsYJOgNzJ9afUoXOdAf8hS1y4gwFAVF
         61MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RO8+F+AZynQ8z9gnNYSkehQkLC4PdmM+7OgKF65OMag=;
        b=WjTLOZIAbBPVpjW0PdTmbhI/Wzp63e1kFLrP09EwUoBxjgSkM9dgsRVVefVxcoPRRw
         Q/HfX0Fh7qX4UeIkuFOQreZK1MRXm9/P8mDT9xHPtbnmFFT7q16gGjvzz1LACzIu6fwl
         WMV8a6wZ4gOH8C+YD4cw1cb21X7HLiv+KuiHzDz+6x9u0H1WMPiDL85JYP7qmDPBaP75
         Qo3FikvglrJKsTOoP2sEve/8s3MjaWhHXRtg2/2dvCjb3e1pkD4nb5STzVnxj7KDVrww
         MwXxj+v0vGhOToe6DNPd1AQluIRdEu58H1h9sMLz17EhFZwykmQX6Qwehw5MJT0NGZZu
         DdkA==
X-Gm-Message-State: AOAM5320Anc9PHmNmXrxcSRncthWik4gRkM5Y87jTen7vlvsyI+zHZHA
        fz3oh/bxcvuVXarIaRO5NIPFmlDePZM=
X-Google-Smtp-Source: ABdhPJxNUWy8MGQheEG5DT4g6p4ce7dS600GhbxebDD+eleqGUeWD64PLCAMr3ylmd1nojOGxXcAhfKgow8=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:ad4:5547:: with SMTP id v7mr2301078qvy.9.1603186602279;
 Tue, 20 Oct 2020 02:36:42 -0700 (PDT)
Date:   Tue, 20 Oct 2020 02:36:22 -0700
In-Reply-To: <20201020093627.256885-1-badhri@google.com>
Message-Id: <20201020093627.256885-6-badhri@google.com>
Mime-Version: 1.0
References: <20201020093627.256885-1-badhri@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v11 05/10] usb: typec: tcpm: frs sourcing vbus callback
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

During FRS hardware autonomously starts to source vbus. Provide
callback to perform chip specific operations.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Introduced in v9.

Changes since v10:
Added Reviewed-by: Heikki Krogerus
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 include/linux/usb/tcpm.h      | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 561480b67bce..0123d2f14c96 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4091,7 +4091,16 @@ static void _tcpm_pd_vbus_on(struct tcpm_port *port)
 	case SRC_TRY_DEBOUNCE:
 		/* Do nothing, waiting for sink detection */
 		break;
+	case FR_SWAP_SEND:
+	case FR_SWAP_SEND_TIMEOUT:
+	case FR_SWAP_SNK_SRC_TRANSITION_TO_OFF:
+	case FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED:
+		if (port->tcpc->frs_sourcing_vbus)
+			port->tcpc->frs_sourcing_vbus(port->tcpc);
+		break;
 	case FR_SWAP_SNK_SRC_NEW_SINK_READY:
+		if (port->tcpc->frs_sourcing_vbus)
+			port->tcpc->frs_sourcing_vbus(port->tcpc);
 		tcpm_set_state(port, FR_SWAP_SNK_SRC_SOURCE_VBUS_APPLIED, 0);
 		break;
 
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 09762d26fa0c..7303f518ba49 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -83,6 +83,9 @@ enum tcpm_transmit_type {
  *		Optional; Called to enable/disable PD 3.0 fast role swap.
  *		Enabling frs is accessory dependent as not all PD3.0
  *		accessories support fast role swap.
+ * @frs_sourcing_vbus:
+ *		Optional; Called to notify that vbus is now being sourced.
+ *		Low level drivers can perform chip specific operations, if any.
  */
 struct tcpc_dev {
 	struct fwnode_handle *fwnode;
@@ -109,6 +112,7 @@ struct tcpc_dev {
 			   const struct pd_message *msg);
 	int (*set_bist_data)(struct tcpc_dev *dev, bool on);
 	int (*enable_frs)(struct tcpc_dev *dev, bool enable);
+	void (*frs_sourcing_vbus)(struct tcpc_dev *dev);
 };
 
 struct tcpm_port;
-- 
2.29.0.rc1.297.gfa9743e501-goog

