Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4392727BAEA
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 04:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgI2CkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 22:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727325AbgI2CkO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 22:40:14 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B956C0613D3
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:14 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id g18so1972111pgl.10
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 19:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=uVW3Z+u07IwSiZ81LJWDtaSjqshs7wc7ABB8YxJPogA=;
        b=YiEiwKczsaVHFLvHOfEQPhe9rXiFB+aKMN8Ym3pQT6U/Yl6hbUPqD4DwuCEj2K5UBb
         dN6HseLFOx5Dj+mCHxTpOQZ+rMYEZgaq+UdKNOg5lb1fdOIOLdqk858mPJ6Zj+gNButv
         RCsXauePEzdjIq537skr55pV8/2YO4YNMeyYaNiIq5xTzn1g2hpZwe22oeESFhzWhmNw
         qyV41IxVer15RuGqldFplgMvJYdSGseuZ9vvv2n0ACkhbdI5EcANEMkkjbNEJMTZjvkl
         I0wPA/umUEStoLV5JXAWMAayFrSwR4LJ1AhQzlbQLKA0RuCArPt3uekK0/EZ9onne1hJ
         X8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uVW3Z+u07IwSiZ81LJWDtaSjqshs7wc7ABB8YxJPogA=;
        b=scygGfKTwXJzxUFeaCkkGx/miig7dVzHIMEKiL/0Ea3xXR7YDaNSMYxaM8Cn1u79yV
         kEDNHs7mOUSVe/0lM05znJkHA8B4Sr0N7pnR0nbNRjRXwjBvI8H9qRVxTfvAJay8LQo0
         BVKSI4fkBPn6pEvZ2p7fSYKCjwbCXSGx1ok5OkkgYA0NfoT2HMgHe613uw+26nc6tuuO
         VjmokIhQ3T9jcaTQOFUpAN1N/p9jmNhGekdlz1wRwbU7BhTYEnnLx2nNeDGBr017FNAw
         cDXf24AbE5OrBKFrk9E3kUgiCx6SYhGEhxymlzgs3tr+l12/AydDPE61I6zaEbf+eH/H
         xAIg==
X-Gm-Message-State: AOAM533bQdWYmNrfNZnayLg3gDO0vTeBZDX6XugfrbG7o207xvlW8yKg
        DJC5D/1tPbR2rU+3z/QX168X4LH5C8w=
X-Google-Smtp-Source: ABdhPJzVoBkmb9C55jpF5DbEv3FQDozhZDOlLiuUrCOmGFnzYiQ8vi/RVk6f5zhTycU3Es9Ru66HxXNztYA=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:902:d909:b029:d0:cbe1:e716 with SMTP id
 c9-20020a170902d909b02900d0cbe1e716mr2341569plz.36.1601347213916; Mon, 28 Sep
 2020 19:40:13 -0700 (PDT)
Date:   Mon, 28 Sep 2020 19:39:51 -0700
In-Reply-To: <20200929024004.244992-1-badhri@google.com>
Message-Id: <20200929024004.244992-3-badhri@google.com>
Mime-Version: 1.0
References: <20200929024004.244992-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v9 02/15] usb: typec: tcpci: Add set_vbus tcpci callback
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

set_vbus callback allows TCPC which are TCPCI based, however,
does not support turning on sink and source mode through
Command.SinkVbus and Command.SourceVbusDefaultVoltage.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.

Changes since v6:
- Rebase on usb-next

Changes since v7:
- Added Reviewed-by: Heikki
- Rebase change

Change since v8:
- None
---
 drivers/usb/typec/tcpm/tcpci.c | 7 +++++++
 drivers/usb/typec/tcpm/tcpci.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index b960fe5a0f28..d6a6fac82d48 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -328,6 +328,13 @@ static int tcpci_set_vbus(struct tcpc_dev *tcpc, bool source, bool sink)
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	int ret;
 
+	if (tcpci->data->set_vbus) {
+		ret = tcpci->data->set_vbus(tcpci, tcpci->data, source, sink);
+		/* Bypass when ret > 0 */
+		if (ret != 0)
+			return ret < 0 ? ret : 0;
+	}
+
 	/* Disable both source and sink first before enabling anything */
 
 	if (!source) {
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 04c49a0b0368..4d441bdf24d5 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -144,6 +144,7 @@ struct tcpci_data {
 			 bool enable);
 	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
 				  enum typec_cc_status cc);
+	int (*set_vbus)(struct tcpci *tcpci, struct tcpci_data *data, bool source, bool sink);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.28.0.709.gb0816b6eb0-goog

