Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96D846775A6
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jan 2023 08:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbjAWHf2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Jan 2023 02:35:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbjAWHf2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Jan 2023 02:35:28 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2F5166DC
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 23:35:25 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id mg12so28100287ejc.5
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 23:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Yo8oFr2b2jeh/cQuJRHXKOZjoBylcQDCtI9YMOmuU=;
        b=xUfTFqcSZBjl3PgkFWBey8fgMKX9eXj9qPwFii2zQBgOqVIvZMrOugRs6+eBdeAhJ4
         AXN/bdadVWFU/rOwl5uDIn0MqThxhFs1t49JLaJZ6yXquex4plRrhusqouGsSkOzbOvt
         gCatuJJ8ug4SheyD/k8PPfM+XHMLejN9EOKXG3sIupfli3Z1usqW/IHjiVHrw8eC+edN
         kpn4o7PuT7S52khSs6bXaXujRxUF8uiKtL8tx0H7HeGBC+RzVvbZtHZxmPmq4NZJz7UF
         ueVewQe5y0t3z4xcIU/0yNy6sWc7DCDSbnj7cKgRmoMbErTEXQJAoZgm+Zbb2C+hIl7C
         AZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Yo8oFr2b2jeh/cQuJRHXKOZjoBylcQDCtI9YMOmuU=;
        b=PgobBDKJ4C+7c+nMCi977D+IhwCssgbw5JHuLf6Jk/+85X2VHRVpVo9CyRAzDid+QJ
         7Iloq3Okg5g4TH4NVClZgLfdsABP3mfi0FDmNP94dnjHKT8xP2SjumVselT0DAU9tYZ8
         vPEDtLFLLPxA4s0tSYJq4v9SR6OTTQ3LVjvUT2e7dR7g6LfLUOQ7gT+1DalC01LZIgBu
         TJPrDIamfyZdjjUmoeh7B+OxktE3ajj+CqonsVGRH+r5EYaXIjnrCEWef7fqWVUx0UqQ
         HFazNDCYdozEaKccdQ7TXqNMwfanHnUXeHMblshjZka5jWgZEyx+yg5CPIbbEtUGLCtL
         uoqw==
X-Gm-Message-State: AFqh2krlhdzck2r+v05Mv3IJF98hEb7H4fyqxG5xffdPKTW587hjlKq2
        vZ6rfMqo7EUNPU9UMPQDT6C/HQ==
X-Google-Smtp-Source: AMrXdXsBdsoko8zoSna3PxoTY+I4U/dPr9KpZeQt8cPONFIPwHvD1gOBcB3BiiCzUhK2urwmk9p08Q==
X-Received: by 2002:a17:906:fad4:b0:7c1:2529:b25e with SMTP id lu20-20020a170906fad400b007c12529b25emr25495354ejb.43.1674459324240;
        Sun, 22 Jan 2023 23:35:24 -0800 (PST)
Received: from localhost.localdomain (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id c23-20020a170906155700b0084c7f96d023sm22104821ejd.147.2023.01.22.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 23:35:23 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/3] fotg210-udc: Add missing completion handler
Date:   Mon, 23 Jan 2023 08:35:06 +0100
Message-Id: <20230123073508.2350402-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123073508.2350402-1-linus.walleij@linaro.org>
References: <20230123073508.2350402-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Fabian Vogt <fabian@ritter-vogt.de>

This is used when responding to GET_STATUS requests. Without this, it
crashes on completion.

Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/fotg210/fotg210-udc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 754429553f61..029b31c3107b 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -709,6 +709,20 @@ static int fotg210_is_epnstall(struct fotg210_ep *ep)
 	return value & INOUTEPMPSR_STL_EP ? 1 : 0;
 }
 
+/* For EP0 requests triggered by this driver (currently GET_STATUS response) */
+static void fotg210_ep0_complete(struct usb_ep *_ep, struct usb_request *req)
+{
+	struct fotg210_ep *ep;
+	struct fotg210_udc *fotg210;
+
+	ep = container_of(_ep, struct fotg210_ep, ep);
+	fotg210 = ep->fotg210;
+
+	if (req->status || req->actual != req->length) {
+		dev_warn(&fotg210->gadget.dev, "EP0 request failed: %d\n", req->status);
+	}
+}
+
 static void fotg210_get_status(struct fotg210_udc *fotg210,
 				struct usb_ctrlrequest *ctrl)
 {
@@ -1251,6 +1265,8 @@ int fotg210_udc_probe(struct platform_device *pdev, struct fotg210 *fotg)
 	if (fotg210->ep0_req == NULL)
 		goto err_map;
 
+	fotg210->ep0_req->complete = fotg210_ep0_complete;
+
 	fotg210_init(fotg210);
 
 	fotg210_disable_unplug(fotg210);
-- 
2.39.0

