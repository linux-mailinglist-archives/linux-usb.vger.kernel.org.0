Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA82326D8F6
	for <lists+linux-usb@lfdr.de>; Thu, 17 Sep 2020 12:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgIQKZh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Sep 2020 06:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbgIQKTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Sep 2020 06:19:05 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1986DC061788
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 03:19:05 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id r24so1082356pgu.23
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2020 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=lTFIRTR1zNwvJ04BgZN6fFlBDrcI3QRsPDim78iCLb4=;
        b=sZXLpVdl+nNo2cP9flul5No44LJwj8N0mPdruUaP6v2aqiRrUHLUsX2r3kJ6R2lgEY
         5pcMgvASvtXPMvdOZjcZtRoHpY9EGMi3Fw9TQ9bjtLy/4KfF6ZihSWfduHQs+kUmynKs
         KINImWENB/1MfEWHxhQdM7W7nssHpp67TB17hk2KoafoNA0tUqMbcZH8FF8+x1BDfzke
         YUm2sev4F2W3BfhD6cZvas1PRNN9xgXg5x7YsNT+bqgjP0W4xgpuWDctKIzDynNHIrfz
         3BODPguF7t/VhrlueO3gI+jWZNZzJlMAQ9uVoh7TgTMpoexsThUTdhr34m9GnR6iT8lG
         R2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=lTFIRTR1zNwvJ04BgZN6fFlBDrcI3QRsPDim78iCLb4=;
        b=D9a3wTFf8hcrsq+Am3pC2Xq0L6H2/kexnzGK6XuWzpvHX1r/v9fWXvHr76SDw71uL6
         Av4BM0IOzwXrKQ+H9tekVOgFlt/VLRs8P3jticMl8Z6SbFNihJfQcK+Upd2uursV5MCd
         Nu4PmLSVchAddZEzm+2/JTMljYJdFZ1axj0u7ddUgWE3YTIKyUwVmp8PpAWJHmzJT1vw
         GmdFfi5LkbkUB35sD7RaJsD5rkbIpOr6NqwiIRYl22ZVseLvDTHbt/Go19UcNeMECn2L
         UhjwavN+8jBcGAQG2g5m9xQGqS6Q4W4BecIfkDDNweWCduptNRs7XVAuB2fVUHvgJxrm
         eBWg==
X-Gm-Message-State: AOAM530DAH3UZo1UDeqlPiII0cZchdh2L1Iq4Bzc8JPXWBbvL5apymtk
        Bm3J7imkcfjD5xoup0HJ0+flqpX+Cb8=
X-Google-Smtp-Source: ABdhPJz2NDBYgm2dEJ0aYPOKY7ua+ImoHCM7sFC3Sx2DEdycXosdR3QJHU4KT70Qvt68Krz6YZCEGJZbKwo=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90b:941:: with SMTP id
 dw1mr733475pjb.1.1600337944220; Thu, 17 Sep 2020 03:19:04 -0700 (PDT)
Date:   Thu, 17 Sep 2020 03:18:47 -0700
In-Reply-To: <20200917101856.3156869-1-badhri@google.com>
Message-Id: <20200917101856.3156869-2-badhri@google.com>
Mime-Version: 1.0
References: <20200917101856.3156869-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
Subject: [PATCH v7 02/11] usb: typec: tcpci: Add set_vbus tcpci callback
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

set_vbus callback allows TCPC which are TCPCI based, however,
does not support turning on sink and source mode through
Command.SinkVbus and Command.SourceVbusDefaultVoltage.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
- Changing patch version to v6 to fix version number confusion.

Changes since v6:
- Rebase on usb-next
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
2.28.0.618.gf4bc123cb7-goog

