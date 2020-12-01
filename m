Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFC52C966C
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 05:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgLAEXX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 23:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727976AbgLAEXW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 23:23:22 -0500
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96259C0613D2
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 20:22:42 -0800 (PST)
Received: by mail-pf1-x44a.google.com with SMTP id s201so187363pfs.1
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 20:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=N92L65vs0hZN6sbhv8nMQq5Z7xcM5ZZapP+dkcKSuqU=;
        b=btWG3ONsCv6PeV3rp4vVFHmjusgTjmABN+C30bO1SGVHFSe6C36HvYYA8ndJREdbxs
         FdRSol/vyFkUDbPfE0BGjqgIfP37sh8D79rUvGOjEJxaSCEo/lJ5WbKrojuDYEkil0N+
         1Z/MKpcDZ3RoBNQpKReNzbAidMoH0Iw1fCPmVGzMh98X1F6RkR5NUawp4sWtcw9dOfvB
         zITNk/XOaHGym+CMM3ICvOROcfCqzjA1azMME4Yhi6SCpQvXs6B+j0WtIi8VNfEYg3qY
         gy61pPYTEdsQJ9IkJftP19SqoDustePtMHzucxxnYGok0ncgMcv0+65nuxpgMfao1Q1Q
         rGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=N92L65vs0hZN6sbhv8nMQq5Z7xcM5ZZapP+dkcKSuqU=;
        b=XQfrJ3nY01Zm9gaxpogrOK4r+xxyRMy+3rorzpW/gmkNMf5iTFRwzRicK1VDtFjh2w
         JSHJ/Bj3bYsalSQvcCmiM7rrNzVgkCGteCM3YPZK+Ij7yk72I4mpmjqgKNXWJ11PazOX
         1i7ilt2vFxZdy/s6zhDSM95HPiN5T5XwGJKzss/RCK5qwVpIvd6p4N1qqkzTMWFCPAD4
         zuHA+fO5Y42XOthCktkQytoMTnxgZuabr+wb9QsZbCzCTPXccXPhtDK36gJpGaQJKlwP
         2bNX2F9+pXm8BfaaiP3aYMkgos2gWAQ0bdHCUaGC2z1s1bO0Cy+YoF4ikjr9Tg5eQcmu
         y1KA==
X-Gm-Message-State: AOAM533xvQT/c7YKbyP4h4QEAUt46eizdMIk37bXl7xnILW4X9M51cxR
        JbWtTztuz1wUfBuEo/Vhw9xy9QaxhjI=
X-Google-Smtp-Source: ABdhPJxhNSfzVMCAuC/49qFFxX8y+9/ZZDYhsrntdi227pnDJ6CxFEJDZzTM3YSri7VOtC1aCo1lP0v350Q=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a17:90a:460a:: with SMTP id
 w10mr121176pjg.1.1606796561660; Mon, 30 Nov 2020 20:22:41 -0800 (PST)
Date:   Mon, 30 Nov 2020 20:22:34 -0800
Message-Id: <20201201042237.414235-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1 1/4] usb: typec: tcpm: Pass down negotiated rev to update
 retry count
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

nRetryCount was updated from 3 to 2 between PD2.0 and PD3.0 spec.
nRetryCount in "Table 6-34 Counter parameters" of the PD 2.0
spec is set to 3, whereas, nRetryCount in "Table 6-59 Counter
parameters" is set to 2.

Pass down negotiated rev in pd_transmit so that low level chip
drivers can update the retry count accordingly before attempting
packet transmission.

This helps in passing "TEST.PD.PORT.ALL.02" of the
"Power Delivery Merged" test suite which was initially failing
with "The UUT did not retransmit the message nReryCount times"

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 include/linux/usb/tcpm.h      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3bbc1f10af49..c73bc3a8356a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -667,7 +667,7 @@ static int tcpm_pd_transmit(struct tcpm_port *port,
 		tcpm_log(port, "PD TX, type: %#x", type);
 
 	reinit_completion(&port->tx_complete);
-	ret = port->tcpc->pd_transmit(port->tcpc, type, msg);
+	ret = port->tcpc->pd_transmit(port->tcpc, type, msg, port->negotiated_rev);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index e68aaa12886f..efaedd7e8a18 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -121,7 +121,7 @@ struct tcpc_dev {
 			      enum typec_cc_status cc);
 	int (*try_role)(struct tcpc_dev *dev, int role);
 	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
-			   const struct pd_message *msg);
+			   const struct pd_message *msg, unsigned int negotiated_rev);
 	int (*set_bist_data)(struct tcpc_dev *dev, bool on);
 	int (*enable_frs)(struct tcpc_dev *dev, bool enable);
 	void (*frs_sourcing_vbus)(struct tcpc_dev *dev);
-- 
2.29.2.454.gaff20da3a2-goog

