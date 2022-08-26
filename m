Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5465A2351
	for <lists+linux-usb@lfdr.de>; Fri, 26 Aug 2022 10:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245438AbiHZIl2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Aug 2022 04:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343705AbiHZIkj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Aug 2022 04:40:39 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5606E24963
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 01:40:11 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-33dd097f993so15675077b3.10
        for <linux-usb@vger.kernel.org>; Fri, 26 Aug 2022 01:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=RLmxwVwtne7Ris2nr8dSsVg7os+UaP8tQY3U04GCx/Q=;
        b=bUWPHNUvCcT+uV6k7KJHdeY5B+TXt9tNnJE7NjCcjfnWH9S5GYXggIwBwIPylOO2Zg
         8xZmT4s/Q/73gUdWXlzpv9vTZm2ZFGl+kC4vEjUva2NNG9Tebr87+w175hJVn4IcTWUw
         wuZBDMDfMNeuEcIhIUQJmzsPWI7rZ69942HHPnkyC3RV56Nv+k6p/vm82de5pHQLQ2+K
         vxVx/Sh+Bgt+9EvFX3+Gga6YEl0NIClbj61smG9Ygn9xvdH4obcbeW3F3JanL1CLeEfu
         qPOpF0H9O/Px4CsoqMzDu68YvyEbZXVr2z5PYOqhmohrJ0vWDRukGHIjPYBTOez1WowK
         Lp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=RLmxwVwtne7Ris2nr8dSsVg7os+UaP8tQY3U04GCx/Q=;
        b=4IubFzzNPJ7U9sITLZ9s+ps6ZiCarUcFSEnZnEt7myJU0WckOO8P4UsyNjYKKqo4Cv
         p5Of8je7nlNaNoyuuQ5f56V4NmjjOWHKaBH5Mo8JzCmw0+ngI1yRcycMHG7K/YbXAc80
         1ANh3kKkbUgjZIfGqy7+62jK8smN/S+BvHJpB1cbA+HlOECkHIprXasu4QSdUlvn18w+
         YdLZvM59QNi7SNoiI7GyDdEWIuSIGHzPbq+FDXKTZJXGI5/EypLG8zjkTUNybnSr3xps
         zh7f3dYfmjdGnXAJn0ho28KoolR4JYj9rOgJ5K94vvl14ZKntox09nJNLfMPKVG0a31a
         CHCg==
X-Gm-Message-State: ACgBeo1BYf4anFJM5QpwSPZZUOEZvporbsY2i21ZbBCmhIR4dy9/Kdo5
        kwLO5ZIZMQQCO1yIUF4IG2jvzS/8TMw=
X-Google-Smtp-Source: AA6agR4KLKITQOlDJ02mlSvMKGIjTT/6g02Bqj3cS1aQg1rBbh1nvTiFY+LvtnmVm7uVG74q+zc0+lIAL2M=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:9c82:622c:af33:39f2])
 (user=badhri job=sendgmr) by 2002:a05:6902:722:b0:695:62a2:f22c with SMTP id
 l2-20020a056902072200b0069562a2f22cmr7071146ybt.272.1661503210277; Fri, 26
 Aug 2022 01:40:10 -0700 (PDT)
Date:   Fri, 26 Aug 2022 01:39:59 -0700
In-Reply-To: <20220826084001.3341215-1-badhri@google.com>
Mime-Version: 1.0
References: <20220826084001.3341215-1-badhri@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220826084001.3341215-2-badhri@google.com>
Subject: [PATCH v1 2/4] usb: typec: tcpci: Add callback for evaluating
 contaminant presence
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This change adds callback to evaluate presence of contaminant in
the TCPCI layer.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 9 +++++++++
 include/linux/usb/tcpci.h      | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 50674ecf430d..53f6fad61781 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -403,6 +403,14 @@ static void tcpci_frs_sourcing_vbus(struct tcpc_dev *dev)
 		tcpci->data->frs_sourcing_vbus(tcpci, tcpci->data);
 }
 
+static void tcpci_check_contaminant(struct tcpc_dev *dev, bool disconnect_while_debouncing)
+{
+	struct tcpci *tcpci = tcpc_to_tcpci(dev);
+
+	if (tcpci->data->check_contaminant)
+		tcpci->data->check_contaminant(tcpci, tcpci->data, disconnect_while_debouncing);
+}
+
 static int tcpci_set_bist_data(struct tcpc_dev *tcpc, bool enable)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
@@ -777,6 +785,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->tcpc.enable_frs = tcpci_enable_frs;
 	tcpci->tcpc.frs_sourcing_vbus = tcpci_frs_sourcing_vbus;
 	tcpci->tcpc.set_partner_usb_comm_capable = tcpci_set_partner_usb_comm_capable;
+	tcpci->tcpc.check_contaminant = tcpci_check_contaminant;
 
 	if (tcpci->data->auto_discharge_disconnect) {
 		tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 17657451c762..250b34ccbf9c 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -188,6 +188,11 @@ struct tcpci;
  *		Optional; The USB Communications Capable bit indicates if port
  *		partner is capable of communication over the USB data lines
  *		(e.g. D+/- or SS Tx/Rx). Called to notify the status of the bit.
+ * @check_contaminant:
+ *		Optional;The callback is called when CC pins report open status
+ *		at the end of the deboumce period or when the port is still
+ *		toggling. Chip level drivers are expected to check for contaminant
+ *		and call tcpm_clean_port when the port is clean.
  */
 struct tcpci_data {
 	struct regmap *regmap;
@@ -204,6 +209,8 @@ struct tcpci_data {
 	void (*frs_sourcing_vbus)(struct tcpci *tcpci, struct tcpci_data *data);
 	void (*set_partner_usb_comm_capable)(struct tcpci *tcpci, struct tcpci_data *data,
 					     bool capable);
+	void (*check_contaminant)(struct tcpci *tcpci, struct tcpci_data *data,
+				  bool disconnect_while_debouncing);
 };
 
 struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
-- 
2.37.2.672.g94769d06f0-goog

