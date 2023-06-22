Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B15F373A440
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 17:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232284AbjFVPFk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 11:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232267AbjFVPEx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 11:04:53 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD03199D
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 08:04:47 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-573a92296c7so24765527b3.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687446287; x=1690038287;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6msxjfGSl7/M9KTU2PiCryY5ju9+3DU82TDMWlxq2Cw=;
        b=u81k2ossffJeZlh2McBdWUMdmw5bSOOZ9+IZJXixIWqXinaFFtEvowwVnYqexAoXBk
         FKSwthoF4lqXQhJRcE64mXqPCsSfEoloq1p1ijm5if8G9ZnZaMusJzj7ZUX70vpiCBvR
         aaWr+3CjEpVy9JX88po4lTxc1QERRtodUS0jbPkfOfOv4agfTfCY86oMhxjCxZligekm
         a54R+an15LBK9YA1IQyYvZclaXk2HDro/gsGvRKfpjVClBdYSJVyZEOs21cFoK9zzuqU
         ZPHedBZgEBxmh6sT0+4z3YgTW5br1ZoGph3VNpo1KUejbQyzKDejqDJSmFZDlvoffBgL
         QAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446287; x=1690038287;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6msxjfGSl7/M9KTU2PiCryY5ju9+3DU82TDMWlxq2Cw=;
        b=GsArx+b+OtYfY9CNGBt3tE5G6kS+8Hwx6/kIBeWoZtQjuTdNj0JNJiCp+UlGEb4yPi
         5f1illacpfh899KD0w8lgvkofqgdNg92l05jW+wgE3HxR4bGzrmxAHkQYA+BEVolWlWO
         jTdTItmXlOrEZoUJZlndkbB2XWsJZ8mv9nnum7hBi9P+g680Tzta5CfbQXgjJM723MAw
         JBo43J7ZB2wwbxBOHHa6QlQmV84RUHpwIjz5L8bLlYCfreP27LKJRMbXT0gol5wR942B
         eXJgHCksVwYZFKaUKgoejERjtGw+qd+LFgiCUR3tRVAgi4sa5vq2VBflcZ2bIAoGKVgL
         AKrg==
X-Gm-Message-State: AC+VfDwFQ8qfe8eCL6YsGVzZOnX2oHtJa5F3uVUO0m/cLSuwOp6TU9vi
        GM65vr/PtNjJO5qXWZU25dMNn4XyPiwn
X-Google-Smtp-Source: ACHHUZ7Xn8kcYYlAhb46y9g1ZnLqOGI6n5PbyVRrSXY2TCNhq9gefZuSqICs3dtSotmutG2sKqA5u5vFj3/l
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:b1ba:4098:b043:5e54])
 (user=kyletso job=sendgmr) by 2002:a81:e24a:0:b0:56d:2abf:f0c with SMTP id
 z10-20020a81e24a000000b0056d2abf0f0cmr7755784ywl.10.1687446286806; Thu, 22
 Jun 2023 08:04:46 -0700 (PDT)
Date:   Thu, 22 Jun 2023 23:04:21 +0800
In-Reply-To: <20230622150423.3726894-1-kyletso@google.com>
Mime-Version: 1.0
References: <20230622150423.3726894-1-kyletso@google.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230622150423.3726894-2-kyletso@google.com>
Subject: [PATCH 1/3] usb: typec: Set port->pd before adding device for typec_port
From:   Kyle Tso <kyletso@google.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When calling device_add in the registration of typec_port, it will do
the NULL check on usb_power_delivery handle in typec_port for the
visibility of the device attributes. It is always NULL because port->pd
is set in typec_port_set_usb_power_delivery which is later than the
device_add call.

Set port->pd before device_add and only link the device after that.

Fixes: a7cff92f0635 ("usb: typec: USB Power Delivery helpers for ports and partners")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index faa184ae3dac..3b30948bf4b0 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2288,6 +2288,8 @@ struct typec_port *typec_register_port(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	port->pd = cap->pd;
+
 	ret = device_add(&port->dev);
 	if (ret) {
 		dev_err(parent, "failed to register port (%d)\n", ret);
@@ -2295,7 +2297,7 @@ struct typec_port *typec_register_port(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
-	ret = typec_port_set_usb_power_delivery(port, cap->pd);
+	ret = usb_power_delivery_link_device(port->pd, &port->dev);
 	if (ret) {
 		dev_err(&port->dev, "failed to link pd\n");
 		device_unregister(&port->dev);
-- 
2.41.0.162.gfafddb0af9-goog

