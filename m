Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D79A22D70AD
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 08:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436745AbgLKHMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 02:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436732AbgLKHMb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 02:12:31 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251CAC0613D3
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 23:11:51 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id e68so480377yba.7
        for <linux-usb@vger.kernel.org>; Thu, 10 Dec 2020 23:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=S/8U8Wqnz8DEcGGiOqsnrJd03FjrqIJ6MV2RgXvfHHw=;
        b=bHFK7rVtg7vjW5mqAuGF6w/HJr0MS15XcdG9l9J/NwPma77Y3WMVsmb6VppS+CoNzR
         KvP9mHQsBvTfcfn+lAY8cc+F2bFvgI5FKWm1kbJ7ZxpC3RLsRReZcwuVWcNjLwf5mPPZ
         Z5wiC4JHuHePQzWhflnd+rFLMYuRwnXKnavSlDwRFRfCEqEwT5a0lzkwygPz9XFhgpY6
         2Z+bhgYs3Tv9NRwjbroy7Sivgf8ygE9bpaNWGiWQuwJK1w6NQRBBDK/CNlxWTu6/by8s
         6KqfaUVS1CXysjPSRRw0miUqB++goVb1AvlRYwbwUbjCd6YNDcJwgWKAliSUlPM4Srqa
         3efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=S/8U8Wqnz8DEcGGiOqsnrJd03FjrqIJ6MV2RgXvfHHw=;
        b=Nn/L2sX5sc5GQ6zWHKN8LgL3HfC0OyNoaegAoo4hVGv06w62Nesqh3JmUNYrD5WdbL
         R16q4tIU3IgysQQuYFiuUg0FhJaQRfwBF7eOdMvaVNw659lmZLE3IzNp0vH4Da/J2Xqe
         +BEWDq9cdvaK9swsF43vb038yXRw9m/kKkUzTJVQ4CN4NaDx34LzQRVSz32Xn1kRBENb
         EipIhCYTm5H3J/WYmLRa2wPnEVRg4Cq7Qn6EQFPn9BjBJEplpK0QvxirZYFH9n141zNO
         UN8Sv52hyTO+dhwfGY1vpjBDiCfsNqneS/j60BLdlC/Y9Bu07oFcL7QXlrd6v5nC9jL0
         ml+w==
X-Gm-Message-State: AOAM533Y1M6Az6P/ayQ/mNTvg66Z7dHX32kPUtnbGjD4eZhu+ghl9mgz
        cX1zC9IEE/s0fMHHUa0XjaoquaqZGGA=
X-Google-Smtp-Source: ABdhPJwRTQiqAJ5JI/0c+gXsHXlIYhxacBL2hWJrIemL9wBvY5jVOnTWKtM6UvkqYafnPR4cbDFWgKdmw7k=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:4155:: with SMTP id o82mr17218335yba.206.1607670710264;
 Thu, 10 Dec 2020 23:11:50 -0800 (PST)
Date:   Thu, 10 Dec 2020 23:11:45 -0800
Message-Id: <20201211071145.2199997-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH] usb: typec: tcpci: Enable bleed discharge when auto discharge
 is enabled
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

Auto discharge circuits kick in only when vbus decays and reaches
VBUS_SINK_DISCONNECT_THRESHOLD threshold. Enable bleed discharge to
discharge vbus to VBUS_SINK_DISCONNECT_THRESHOLD upon disconnect.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index af5524338a63..f676abab044b 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -725,6 +725,8 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 		tcpci->tcpc.enable_auto_vbus_discharge = tcpci_enable_auto_vbus_discharge;
 		tcpci->tcpc.set_auto_vbus_discharge_threshold =
 			tcpci_set_auto_vbus_discharge_threshold;
+		regmap_update_bits(tcpci->regmap, TCPC_POWER_CTRL, TCPC_POWER_CTRL_BLEED_DISCHARGE,
+				   TCPC_POWER_CTRL_BLEED_DISCHARGE);
 	}
 
 	if (tcpci->data->vbus_vsafe0v)
-- 
2.29.2.576.ga3fc446d84-goog

