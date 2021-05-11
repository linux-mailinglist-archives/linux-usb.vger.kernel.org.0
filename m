Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67FA2379CDF
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 04:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhEKCVz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 22:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhEKCVz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 May 2021 22:21:55 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671DCC061574
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 19:20:49 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so364396wmb.3
        for <linux-usb@vger.kernel.org>; Mon, 10 May 2021 19:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W23ObM8Ma0ntVg53K0smv8vrlGJXPYTsjBh04HGSNjI=;
        b=Igo3R3O6zXLwvmdUj81Jy4Hz2V8Rq11zX/01ZC/cwKdI47E8QFfMJReBr46pwXyrDB
         Cwv+QDcpluJu01r3vIiblbAFSY3BP+zrgsOFEPz9dd8iq2TdASYesuXRuDCTypePABT5
         RXWYT6F8vzAVHVk4dF+ZldPKd+b+bLDmAKOBmt4ZN0U8dV1bJ8Fpfau+D2aywvww0wyQ
         0i8qzuo6fnE9/WQdwrmsyDx4RzGsJf0N7N0O6AaFzbSVWm0Qgq4uyOH0pmM84ussAFc+
         vwb1koBn0IlRiDbABicESc+UbTaYNgqdkoT5ffBqyVgh89Wxm/6eApxC1YuqHwM1I4+U
         Kk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W23ObM8Ma0ntVg53K0smv8vrlGJXPYTsjBh04HGSNjI=;
        b=i7GxzK5JmyjpF0pDPWIURH+bkP5KjCmmDXjxSDhBybWbCNs8y6PUdSZDvS6DbMlcVL
         5Vc3Cvg2qMsuo0CNwWhx9fjt3TXrgKkIBKAzgU5O3CfXQO1gb6q6V9+OW1Qro2OxGv+w
         Y/NsalcKokewhTOoQxH86oScWeh4HWpe5l08YgksBcv7gTcJ4M9NEr0sTBv7ZFHTYwpN
         2LSQk+wckpNVXXanf5EWgJNbTQ3EN1HooTGTlZpUgU6/pJkN9WzlgwQxjW1mWx7bLl3g
         OS+kgmozkL7LyjfmMOA/6V4el9OLgx70MQvL+FwIO38jUC3OF+GLu3MFcI6KI/KfvY2n
         c8Mg==
X-Gm-Message-State: AOAM532tzIsWrVuG9scb9J7OlHtctGu1vc7s0AE9d3ZltnCRbQmbViIx
        yixmKvkDOC/PqIqchLAPL39pVQ==
X-Google-Smtp-Source: ABdhPJy2K/fSJdLgRjoR27W5ltQ7Mvmosdr/2KgGAvHzbVaG7AyjfudpZhU702fdvovczE/7HZK3Fg==
X-Received: by 2002:a1c:e089:: with SMTP id x131mr28966676wmg.102.1620699648199;
        Mon, 10 May 2021 19:20:48 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t18sm11792981wmq.19.2021.05.10.19.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:20:46 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 1/2] usb: typec: tcpm: Call init callback only when provided
Date:   Tue, 11 May 2021 03:22:23 +0100
Message-Id: <20210511022224.1309077-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
References: <20210511022224.1309077-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The tcpc_dev structure lists a number of callbacks as required when
implementing a TCPM driver. tcpc_dev->init() is not listed as required.

Currently tcpc_dev->init() is called irrespective of whether or not the
callback is set. Let's conditionally call init() as with other non-required
callbacks such as get_current_limit() or set_current_limit().

Fixes: f0690a25a140b ("staging: typec: USB Type-C Port Manager (tcpm)")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c4fdc00a3bc8..355067e6d420 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5657,7 +5657,8 @@ static void tcpm_init(struct tcpm_port *port)
 {
 	enum typec_cc_status cc1, cc2;
 
-	port->tcpc->init(port->tcpc);
+	if (port->tcpc->init)
+		port->tcpc->init(port->tcpc);
 
 	tcpm_reset_port(port);
 
-- 
2.30.1

