Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399B8251082
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 06:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbgHYEWl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 00:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgHYEWj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Aug 2020 00:22:39 -0400
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978D9C061574
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:38 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 36so6864343pgz.18
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 21:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=nWeRgBg8Ta0JRUMqjnIe2WAINWblXQ1/8Tod3psP/Qw=;
        b=qEp6lskpZWqC4EQJ85EobO2qxMlWdWKJb/ThqSCHe/SvBlUmgrda0L1rykQdI+/aNF
         EfYKonzOKbyEeGAECfW4HAra3tDodTSOaX8EsUVhsIVDw9tLH52IRWcF5slGHj5OVpMN
         ryNRSK6ZdR4dEC0zxZnHyzopX2OzuLFI3H6cjSKVjLml3qRbrBgMUd0f2VnGN4YtpTqo
         PzQgm+/4yr/yegRzzmru3yOZ4grnL7NC+1ctWiv15hFwxJdKUXcDEUXAUdJekQE8BKx9
         QHNJcfxwXHrxZ95ROVp7JovwMhp2ds9PkiGKheTQw5c5+A/jd/cntR5yW8YOmdH7PxVg
         w0hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nWeRgBg8Ta0JRUMqjnIe2WAINWblXQ1/8Tod3psP/Qw=;
        b=qqeFEai9ABsXCAJQRNwZfJeVSVN1qOdnrr7gPU8FxrDYm4fA0aCvPa4MmaMG+nBl7P
         fNb3+tBAX4aoNbGJBlG2fzjd3uOKlDXccF5/nzZohQARJVK4gPWkU+9mHb1P4CffmW0N
         N/SrMtafQTMZS+zZLxcHR9SXCt8L34AID6K1qlHve9K6YyNQZe4i3UiPX9YXu8YNbsQ+
         Vm0vVmUJne+uxlwCD+bJtOPa4D/qt30qUJZAQ+9Px55fKZPUWyE1UzkI06EX3mNJezFo
         CRQWjsvjf6Ud19D8C8mnTFasio5oEss+XmF/4GRVAZO9YUsY9yJycVsE7LSwMaTjL8mD
         iG/A==
X-Gm-Message-State: AOAM530x3YdN5kEusJEXCpLIHf8Y0NjJZscR2H270vX7KkZxpXaRo4Bc
        RQOIHnoe/P+TMz0IDP1XbMvhch7sURY=
X-Google-Smtp-Source: ABdhPJzgqZaIyM+aghkM5fFsP3zxDfJ+c5ExAt1tqg5VtdJqpTDO9F7xYLnF4n9fsWs0V1GJ/nfPbAbWH48=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90a:5aa2:: with SMTP id
 n31mr48366pji.33.1598329358088; Mon, 24 Aug 2020 21:22:38 -0700 (PDT)
Date:   Mon, 24 Aug 2020 21:22:00 -0700
In-Reply-To: <20200825042210.300632-1-badhri@google.com>
Message-Id: <20200825042210.300632-5-badhri@google.com>
Mime-Version: 1.0
References: <20200825042210.300632-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
Subject: [PATCH 04/14 v1] usb: typec: tcpci: Add a getter method to retrieve
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
 drivers/usb/typec/tcpm/tcpci.c | 6 ++++++
 drivers/usb/typec/tcpm/tcpci.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 9e814d454d14..7b7991c8ac87 100644
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
2.28.0.297.g1956fa8f8d-goog

