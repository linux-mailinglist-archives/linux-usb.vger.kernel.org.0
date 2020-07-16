Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49444221AEE
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 05:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728276AbgGPDlk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 23:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgGPDli (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 23:41:38 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC85CC08C5DD
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 20:41:37 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id z1so2919415qkz.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 20:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RqXiuX4xTk+c+m3/+/qauF2hZhj8i+Z6YtZCdH2Snc8=;
        b=SP5OdA53xpO2g879UlHzND9x16PSS2YeWd6k1DiG2SEtDMCq+XiIiaQv3lp4dwcxBb
         GZgChSNNBaBvlmpPwQqfqdSSp96ht7M2qACj2PWt47uaITvzqZ5Oxv5bYTIUR61DjsgF
         hPt+lTMLfRM2gkOb9M19KbD4CtWSnbj8QyBskUezCC0jRJxz1QbRR+I/HDHlQT2ZZOYx
         zfvf9eJK2R8FCYbGlmaLNoioILOyvAC8Ftk3NOORSLnIpsGjs2gE+e7DeE5xR3Z9s/oE
         xlDsQ/4UyKXy4/CAcNXQSHZUOrxmXleX8jXCxl4GDsrmAumGqsEFeGvgMVYaQDKeXwtr
         NjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RqXiuX4xTk+c+m3/+/qauF2hZhj8i+Z6YtZCdH2Snc8=;
        b=uS0y6NS6sKY/Ri+A+eLFA8DJr9INUpkBD50CeMI9qJSFhbjILsLniI2gtwByMut1yD
         ttkQe470wXjoqNOrkX/3pazDW4OPkr6OAFkWDqzLkxoq9rj1qv58AWbqnKqNhmOdux/x
         mFG1YQm9KPy9LDb50gR520Wr2FFvGxnx2yphailRoH2ApbdR6bY9LiLtmVOH1lAZM03v
         qhYj4Y+WZ8b6sQ9mjkqpfYzIkqMjnJIda4lYKDmliqr/ieGC8E7DaYYvxu7xvfmbJBLU
         JwWA+GJerRGm7t/ndtnyza2nnZAg+0jUO7UZPl/EWglRCdStVXYxZccCn8ZR31f5aCk7
         fmPA==
X-Gm-Message-State: AOAM532M+0BsWNp0eyR7njl5aotIWGByaNyrduKGLGJlP+8DsIXKUnqY
        WDqoE9mcC8jQibaP7kBV12/iOIAQY9Y=
X-Google-Smtp-Source: ABdhPJx/tvtrXjaNurK8r8bUP20wV+jbDXYBvFLMca6IAOG3Qo3S+zosA7MaGPg5sAlbB3kfn0j70NYK6bI=
X-Received: by 2002:ad4:57c4:: with SMTP id y4mr2377290qvx.230.1594870897051;
 Wed, 15 Jul 2020 20:41:37 -0700 (PDT)
Date:   Wed, 15 Jul 2020 20:41:27 -0700
In-Reply-To: <20200716034128.1251728-1-badhri@google.com>
Message-Id: <20200716034128.1251728-2-badhri@google.com>
Mime-Version: 1.0
References: <20200716034128.1251728-1-badhri@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH 2/3 v3] usb: typec: tcpci: Support BIST test data mode for compliance.
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        reg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting from TCPCI spec:
"Setting this bit to 1 is intended to be used only when a USB compliance
tester is using USB BIST Test Data to test the PHY layer of the TCPC. The
TCPM should clear this bit when a disconnect is detected.
0: Normal Operation. Incoming messages enabled by RECEIVE_DETECT
passed to TCPM via Alert.
1: BIST Test Mode. Incoming messages enabled by RECEIVE_DETECT
result in GoodCRC response but may not be passed to the TCPM via
Alert."

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since V1:(Guenter's suggestions)
- Split the change into two: TCPM and TCPCI
- Move BIST log to TCPM log
- Alignment and column count changes

Changes since V2:(Guenter's suggestions)
- Re-ordered patchset
- Included Reviewed-by tag
---
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 drivers/usb/typec/tcpm/tcpci.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 753645bb25273a..f57d91fd0e0924 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -227,6 +227,14 @@ static int tcpci_set_vconn(struct tcpc_dev *tcpc, bool enable)
 				enable ? TCPC_POWER_CTRL_VCONN_ENABLE : 0);
 }
 
+static int tcpci_set_bist_data(struct tcpc_dev *tcpc, bool enable)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
+
+	return regmap_update_bits(tcpci->regmap, TCPC_TCPC_CTRL, TCPC_TCPC_CTRL_BIST_TM,
+				 enable ? TCPC_TCPC_CTRL_BIST_TM : 0);
+}
+
 static int tcpci_set_roles(struct tcpc_dev *tcpc, bool attached,
 			   enum typec_role role, enum typec_data_role data)
 {
@@ -530,6 +538,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.set_pd_rx = tcpci_set_pd_rx;
 	tcpci->tcpc.set_roles = tcpci_set_roles;
 	tcpci->tcpc.pd_transmit = tcpci_pd_transmit;
+	tcpci->tcpc.set_bist_data = tcpci_set_bist_data;
 
 	err = tcpci_parse_config(tcpci);
 	if (err < 0)
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 303ebde265465c..11c36d086c8608 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -36,6 +36,7 @@
 
 #define TCPC_TCPC_CTRL			0x19
 #define TCPC_TCPC_CTRL_ORIENTATION	BIT(0)
+#define TCPC_TCPC_CTRL_BIST_TM		BIT(1)
 
 #define TCPC_ROLE_CTRL			0x1a
 #define TCPC_ROLE_CTRL_DRP		BIT(6)
-- 
2.27.0.389.gc38d7665816-goog

