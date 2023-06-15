Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB9E731CDF
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jun 2023 17:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240942AbjFOPnP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Jun 2023 11:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237737AbjFOPnN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Jun 2023 11:43:13 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6929C2728
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 08:43:12 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f7378a75c0so19719885e9.3
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 08:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686843791; x=1689435791;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qydN/5Q/zK0+0NsOM7BsOFTds0yN1FMGooMMlcPLCTY=;
        b=DA7zhKLvj7aLHjSQVhWTKpNciU00a3Pe8BTbDvJ/dan9qCrR5GV5ayjkiONsQB5HBt
         HyuVzkHhEGVzBO+M00r499NnIK3SJmSm5Zyyj2uDiM5B3rQvdPRbC1WKhH7zF6oaYHV3
         zF1tyK/ylFckcfzPX+KIBo6XTV98s0RlhgEMNStWgmGTl3UlRM1WjSoMao8sffEK25nd
         dD3WrF9OwAwUXPfLorxN/gC7MB0BXinU6NXLz4JEt0+1PdazFUQIKNBo5HWEhqWGb2Ur
         J6n+wQZFXkXUAsEdhrxko3RZLvVuVBQG2CZdTYvQZxU96k3lsATdd9w9dm3Xg2JAVYhx
         wHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843791; x=1689435791;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qydN/5Q/zK0+0NsOM7BsOFTds0yN1FMGooMMlcPLCTY=;
        b=V3D/1tya9ZQSx/R0L+w+S2D9WONbGDJftQ9tadSC5KmfO/QIiOWqj0GHoA4AXDoX9c
         q/WUhdGbhTrmXFLdjpKBMUM2MaEQ1n6ieEV24+B/OG0lc6Mv0zP/b4pj583VvlLkhZvc
         JBXJJjOWkQY18kJNLlijmbOptBnpNtv6z9lt2tqefYskEnMQDNJNQERoqGj5J9BlHQml
         xI+6W0BPBh96o2fiaZYlA595seMm23o18LB1iktacaZiFmxHT6FR8abvHp1mQ3W+rwov
         A10LzDFsNPJEotvAnaz5oKGtpNBPa5q74C8FMYifamKVKmg+RcLx0x/FW18sJ6S1r/IL
         hgoA==
X-Gm-Message-State: AC+VfDzVaYTUq/QOmLz/dBJGbTqGFAv7YxQomMrwFIu/4EwsgvkW9MTf
        H/LqACWdJzK/KdReMI44YUEKXA==
X-Google-Smtp-Source: ACHHUZ48pVMcF75tZ+Y6sJSjcXHGMpBKWAYqBUgg4bJrNoFHto/x0TIdqxuuepgsT8iR/QnPTpd3dg==
X-Received: by 2002:a1c:7414:0:b0:3f6:d2f:27f7 with SMTP id p20-20020a1c7414000000b003f60d2f27f7mr13437656wmc.17.1686843790721;
        Thu, 15 Jun 2023 08:43:10 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c378600b003f42d8dd7d1sm21125474wmr.7.2023.06.15.08.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 08:43:08 -0700 (PDT)
Date:   Thu, 15 Jun 2023 18:43:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Elson Roy Serrao <quic_eserrao@quicinc.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: udc: core: Fix double unlock in
 usb_gadget_activate()
Message-ID: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Do not call mutex_unlock(&gadget->udc->connect_lock) twice in a row.

Fixes: 286d9975a838 ("usb: gadget: udc: core: Prevent soft_connect_store() race")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/gadget/udc/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 83fd1de14784..d58640a9d0ca 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -878,8 +878,6 @@ int usb_gadget_activate(struct usb_gadget *gadget)
 	 */
 	if (gadget->connected)
 		ret = usb_gadget_connect_locked(gadget);
-	mutex_unlock(&gadget->udc->connect_lock);
-
 unlock:
 	mutex_unlock(&gadget->udc->connect_lock);
 	trace_usb_gadget_activate(gadget, ret);
-- 
2.39.2

