Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEB32585F4
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 05:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgIADA4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 23:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgIAC7j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:59:39 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3156CC061366
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:39 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id d26so11465919yba.20
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=w1UiPTD/f2UFRqEkkMxcTUrZKSmEPHz0i7r6iATF5vY=;
        b=G3MpYmtFbtXFRcbsDt+y9S/+m7BwADYJFG8KG+QB5h40UyAGiV3wAs94o21M1nV5Fa
         qOtxuwmKmBaG8gjnnq+FkKuGU/sIixa4qn+o7IVur5TiSWoCyFmJYL+I8L8nbyuvz7i8
         PJbi8gDn26msam4r5OtqtOxhx6Y0qHBDaYvoV0sTACydbrraBj+GJFtyf7f2Zmjbi74H
         TEugzcbhkEzlyvXOH1SbzVp7DLwZfiYLNPhYPj8IB7/nQKWbvNkUULpHb7nYF2zbCfLq
         xvnsDCwas3+TdPFkBLcrmVCg+vc+KGQBwiZ+WY7g33VoFWn2gvCkL7FZPS/e8z1sF7hi
         0IzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=w1UiPTD/f2UFRqEkkMxcTUrZKSmEPHz0i7r6iATF5vY=;
        b=o/dMvi7dCE1YkAQI0U1azpq9x9Wm02LF7Q8hg0doE7hbyF25Uqt0BLMuXswpXCCdrk
         muvfoegRhfU66FzGEV7MaRsE3MWll+FD5BFYhxjqbENzbnY86LKtE0P5uQzM4M28kK3+
         1FuKMxqD7YZGPZX4tfID8yf2uSDFke1EU3LaczSojnfnZ7zu68Pju7nvSD+NYPkm9+ai
         LEUOgcwkzpHnwo4a6gF5Z+rmDtIttYP2f4heWvgJ73E18EUyx/7gJDoflJW5y1w5YhGr
         kigGoQqxCBsKragJFGrrCN55NOazMkMLOVBuGYe+lrQqw66YNXcXw/c7Rss6noP2PKyM
         qx2w==
X-Gm-Message-State: AOAM530/cuXkCHnSmm8lXYYRb3r/GbUQQiVJYTDxynsy3rutwEjzalPk
        WjAPK93vt449sC4ka8cwlElbprWvdeo=
X-Google-Smtp-Source: ABdhPJwQjHinBxBt8p8BKihksjE00T0PQQJ9IyBSLc9nBjjZB++N8UlO7oksDt+RthLvFqAn7YYYXDXLpvg=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a05:6902:100c:: with SMTP id
 w12mr6741192ybt.488.1598929178400; Mon, 31 Aug 2020 19:59:38 -0700 (PDT)
Date:   Mon, 31 Aug 2020 19:59:17 -0700
In-Reply-To: <20200901025927.3596190-1-badhri@google.com>
Message-Id: <20200901025927.3596190-5-badhri@google.com>
Mime-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v6 04/14] usb: typec: tcpci: Add a getter method to retrieve
 tcpm_port reference
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Allow chip level drivers to retrieve reference to tcpm_port.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Change since v1:
- Changing patch version to v6 to fix version number confusion.
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
2.28.0.402.g5ffc5be6b7-goog

