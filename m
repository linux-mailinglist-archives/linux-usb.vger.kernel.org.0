Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B7226D8EC
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgIQKYf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgIQKTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 06:19:05 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2049EC061756
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 03:19:03 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id u23so1159561qku.17
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 03:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=ZU+DPT22S0CV1ES1wtFAa83RDjLdxcwwskP2a3Xj38w=;
        b=u1mDyPU0nqs9XqH5wdSySLV7aOgSvluTZAD4YXy4RysXzuU07tm5o+/aik1DX57pGq
         uL9iPY/fBDQe7yOZkt4yq8zvW4LD7kxcNPbNt1QOgszjhVyFRMsP08dmrYcATtcsufTF
         uapGy7cc2Bhlg+/UulkOUNn+l4eRNMFnKKLUfb9VxrtTWshb1QBUWvj14Oo8PQCW1GXg
         MN4usefnhoKMY2lZWGUYzI333dS8G1DuDNMXcHxcrgBypgeC9cRMuH4KdtHLZNcdcnZS
         tvyQOusOb7QIi2C9Piny0GP546KAAo+kemfHkpqJKPMIptnm/SZm/dtPZz/slQU2XgQK
         ku3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=ZU+DPT22S0CV1ES1wtFAa83RDjLdxcwwskP2a3Xj38w=;
        b=kjpDiqOatbk+dlkNsK/50Lm07bYclo0q51EBXnW0mFFPMxTzwhb6Q/UvCrDgErPjCG
         xK8PQYvltoIGnG2d2Rn18Qv8kZ2Ut2CL0prniL18oM3+BedPsKa9LkuBECkhwNh2UU82
         mpzL/C/P6foLPUr+/iMvxFHIQt6G3daxFVSYXG2owyT7GovKd6x7USK+Gib3jZFfEwkx
         R3oeQwNm4MCHaSSujrdYYMqOpxsNCUyGSbmuH1Fx3IenON5OBm7UMgJaMfVfkTvUszk6
         R93M41u0gzowtE/QuEOeqeQ7JKYw8kP63prjNl5n4ye/AjaXJn7ReQ2lD/DTMzvy+ESe
         5XXQ==
X-Gm-Message-State: AOAM532zymDjXz1Z8zyNmTS/lFfLzRY+YiP2MYyqdNTkJlumlHVbGdBF
        Scb2pc70KYGAb35g6XtPNpO1McZkSLE=
X-Google-Smtp-Source: ABdhPJxDnWgHN2qC3rqj59a7E1XQy8vDobQsTiIdnHwfq+MyZWjuKBk/rUH9eEnO0X3gcR9QLePElYvsZms=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:ad4:58e3:: with SMTP id di3mr11458117qvb.54.1600337942277;
 Thu, 17 Sep 2020 03:19:02 -0700 (PDT)
Date:   Thu, 17 Sep 2020 03:18:46 -0700
Message-Id: <20200917101856.3156869-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [PATCH v7 01/11] usb: typec: tcpci: Add a getter method to retrieve
 tcpm_port reference
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Allow chip level drivers to retrieve reference to tcpm_port.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Change since v1:
- Changing patch version to v6 to fix version number confusion.

Change since v6:
- Rebase on usb-next
- Added Reviewed-by from Heikki.
---
 drivers/usb/typec/tcpm/tcpci.c | 6 ++++++
 drivers/usb/typec/tcpm/tcpci.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 7d9491ba62fb..b960fe5a0f28 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -38,6 +38,12 @@ struct tcpci_chip {
 	struct tcpci_data data;
 };
 
+struct tcpm_port *tcpci_get_tcpm_port(struct tcpci *tcpci)
+{
+	return tcpci->port;
+}
+EXPORT_SYMBOL_GPL(tcpci_get_tcpm_port);
+
 static inline struct tcpci *tcpc_to_tcpci(struct tcpc_dev *tcpc)
 {
 	return container_of(tcpc, struct tcpci, tcpc);
diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index cf9d8b63adcb..04c49a0b0368 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -150,4 +150,6 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data);
 void tcpci_unregister_port(struct tcpci *tcpci);
 irqreturn_t tcpci_irq(struct tcpci *tcpci);
 
+struct tcpm_port;
+struct tcpm_port *tcpci_get_tcpm_port(struct tcpci *tcpci);
 #endif /* __LINUX_USB_TCPCI_H */
-- 
2.28.0.618.gf4bc123cb7-goog

