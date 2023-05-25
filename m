Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23278710FC2
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 17:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241546AbjEYPis (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 11:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbjEYPir (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 11:38:47 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2329CA3
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 08:38:45 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so3763455e9.0
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 08:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685029123; x=1687621123;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ViAjcjtsfDoFKXKSJ3cJEJ7NDXZzNYfQtt5Kb/3P/+w=;
        b=CgoK4GviG131uj619Y9xyuXh0pQZFPhsIXacQP0MxCDyMKE1/ms0lv237rN/rNyKv3
         N2SSP6ijMSj3O1x9YL1yZ9hw4HyQupnF8RBg1eYPEU2dQHI93gF8h0oJe6eduzH/AnF4
         oN0kJb+890cfo2qhWvPuGeL90XvanWMarQA8DXPJHZddx52rohzYCYeklsiCis9noHr7
         PiNUhNVj+t0WZ2hdrcAdPfo+pKPBi5ZjDoaMayGVkKxL/p4Hjq3N/TPcvoTyDfLZ9cIv
         v9nF8NJoobbNfbo+sjaejTrAIbH4wZPOhsqVV9SL1C1yKXTgcHIxK+g8CVEef7Xzi9FU
         aQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685029123; x=1687621123;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ViAjcjtsfDoFKXKSJ3cJEJ7NDXZzNYfQtt5Kb/3P/+w=;
        b=icGrEZ0XB/PK4L1yXixp5togTeEvadsFai3hzmo/HIPL3cqvF7BZg8yV+hNQsG+Owz
         hKYAw4Hx0ASxPeFKBYPdEoPnhxlRTmxhyMXwJ+BL4k85i3LFCzAILIYydJd7iMnFDwup
         vnvjFDD2WNFknjQ+1NRVWCHpcue/W4i2kHwRMnpP9+CF2h4NpqaUpk/XhX51ECfOKWXD
         8VnZhtjnnZa4G85N3k51jX/B21AHl0Mxxa9CyqrrnMHDe3taB5k50Kp6e8PIdqKJQCEQ
         KX0U11+PSoTmkNPDqj+CKhTMJmXg9ws+kxSglA406vIBAPZHUvNl5qWVT0LQsjEilizV
         OiWw==
X-Gm-Message-State: AC+VfDy9v6ZcoWtaTL76zafdV+kmicVDlHcSMotybEgxyqHTLrjv5DVb
        O97RJcg/aYnCmfU+PQrkiOnY0N8avYsY/ZVPGKQ=
X-Google-Smtp-Source: ACHHUZ4T02fMIl2HNUangLGDmcFcniOBW7c472wfdeCybtytDzrlfTCgWO2oLCOLi39BEq6NomkBbw==
X-Received: by 2002:a05:600c:224d:b0:3f6:ad84:e603 with SMTP id a13-20020a05600c224d00b003f6ad84e603mr2926993wmm.28.1685029123569;
        Thu, 25 May 2023 08:38:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003f4ebeaa970sm2465178wml.25.2023.05.25.08.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 08:38:42 -0700 (PDT)
Date:   Thu, 25 May 2023 18:38:37 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: udc: fix NULL dereference in remove()
Message-ID: <ZG+A/dNpFWAlCChk@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The "udc" pointer was never set in the probe() function so it will
lead to a NULL dereference in udc_pci_remove() when we do:

	usb_del_gadget_udc(&udc->gadget);

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/gadget/udc/amd5536udc_pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/amd5536udc_pci.c b/drivers/usb/gadget/udc/amd5536udc_pci.c
index c80f9bd51b75..a36913ae31f9 100644
--- a/drivers/usb/gadget/udc/amd5536udc_pci.c
+++ b/drivers/usb/gadget/udc/amd5536udc_pci.c
@@ -170,6 +170,9 @@ static int udc_pci_probe(
 		retval = -ENODEV;
 		goto err_probe;
 	}
+
+	udc = dev;
+
 	return 0;
 
 err_probe:
-- 
2.34.1

