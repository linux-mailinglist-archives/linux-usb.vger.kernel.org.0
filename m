Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97E6E4CECD6
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 18:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234063AbiCFRwm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 12:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234023AbiCFRw1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 12:52:27 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DAE4132F;
        Sun,  6 Mar 2022 09:51:28 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id d10so27427109eje.10;
        Sun, 06 Mar 2022 09:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+laazn1CopjYa20d+WHM4bkWo61KY20pgKEJdkgNZoo=;
        b=J3rodyH1WlYVoUO0kqbj9dBFM00KrNZIc2lpsI7rqSFubeDQjNO5bv1Y/HdeakucFf
         2DrG2YBBiPJxoL/CLyneZwoUhrgBDS+lVxn5oSfNNhWKoIJwj5qP1EM6OK1bu+wFlYwr
         WPOanxP6W8nMvnjnMgMD+EXwoM5O2u2mwP4VpjAWrNSSZyI7DbeF/dlFTTx+3LdB/GiF
         p0RLfQy5VJf2SkhJm9hZZMvYzcSZ8G8Ym/KnY63tos1H36uHzK5NlzaL08XHRR1OPfuo
         itI54Bv+knGvasu1kDkRt+82Pc5I+KQlg3JAkozyxzFcXoMYcQz+7+COwWdap223YLwI
         GwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+laazn1CopjYa20d+WHM4bkWo61KY20pgKEJdkgNZoo=;
        b=N+a0zC2bVUiUGOiW2EukvBGlxxIG5MaKdIoVRZIdg+ZVmFsV43Iw5rKkzSSnPI4l96
         3ZtJ2p8BEwoxG9keNruGjPookFWDg02h9glyw38DsOSGgmq0bgjVOmYAKDO5H3CcvH4L
         Ts+r2JZ4T9YQLut2nAZDCQKeJNEPHe5bBlUNxEOYmpgsDeqBiutB1VpSgCnbPXfXRoYg
         gQuFmiv7jQTNIYhEOxCK8mb3tTnLSzFkNsRm1kqIqlFawoIZjFRuQyXxabqu7phjIXUk
         wnDBaAhy33jIZ9XTJZOuEyU+26VqzUwkA55xUGeLpPPqXVnXunsckdy2Yh0YCTtlt4zu
         ioSw==
X-Gm-Message-State: AOAM5332lRmZttwVIY/cYuvVUCpOS2sX7hGFmB2wzcWHaW7NodcL0M9h
        qwkOR24RrtzM52MZKkgeZUQ=
X-Google-Smtp-Source: ABdhPJxhoEeJNQ0cMQH5hmQKGphrFV8eRPY932fnE2Yvg6TjrjBkipqTZEj0B1kYEbqYyNX9gxOrLw==
X-Received: by 2002:a17:906:6a81:b0:6da:d7e5:4fa with SMTP id p1-20020a1709066a8100b006dad7e504famr6311763ejr.223.1646589086810;
        Sun, 06 Mar 2022 09:51:26 -0800 (PST)
Received: from localhost.localdomain (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id 20-20020a17090601d400b006caff964e30sm4052606ejj.19.2022.03.06.09.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 09:51:26 -0800 (PST)
From:   Jakob Koschel <jakobkoschel@gmail.com>
To:     Greg Kroah-Hartman <greg@kroah.com>
Cc:     Jakob Koschel <jakobkoschel@gmail.com>,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-usb@vger.kernel.org (open list:USB GADGET/PERIPHERAL SUBSYSTEM),
        Mike Rapoport <rppt@kernel.org>,
        "Brian Johannesmeyer" <bjohannesmeyer@gmail.com>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>
Subject: [PATCH 14/26] usb: gadget: s3c-hsudc: remove usage of list iterator past the loop body
Date:   Sun,  6 Mar 2022 18:50:22 +0100
Message-Id: <20220306175034.3084609-15-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220306175034.3084609-1-jakobkoschel@gmail.com>
References: <20220306175034.3084609-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the list representing the request queue does not contain the expected
request, the value of the list_for_each_entry() iterator will not point
to a valid structure. To avoid type confusion in such case, the list
iterator scope will be limited to the list_for_each_entry() loop.

In preparation to limiting scope of the list iterator to the list traversal
loop, use a dedicated pointer to point to the found request object [1].

Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/usb/gadget/udc/s3c-hsudc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/s3c-hsudc.c b/drivers/usb/gadget/udc/s3c-hsudc.c
index 89f1f8c9f02e..ddfc30b1d248 100644
--- a/drivers/usb/gadget/udc/s3c-hsudc.c
+++ b/drivers/usb/gadget/udc/s3c-hsudc.c
@@ -877,7 +877,7 @@ static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct s3c_hsudc_ep *hsep = our_ep(_ep);
 	struct s3c_hsudc *hsudc = hsep->dev;
-	struct s3c_hsudc_req *hsreq;
+	struct s3c_hsudc_req *hsreq = NULL, *tmp;
 	unsigned long flags;
 
 	hsep = our_ep(_ep);
@@ -886,11 +886,13 @@ static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 
 	spin_lock_irqsave(&hsudc->lock, flags);
 
-	list_for_each_entry(hsreq, &hsep->queue, queue) {
-		if (&hsreq->req == _req)
+	list_for_each_entry(tmp, &hsep->queue, queue) {
+		if (&tmp->req == _req) {
+			hsreq = tmp;
 			break;
+		}
 	}
-	if (&hsreq->req != _req) {
+	if (!hsreq) {
 		spin_unlock_irqrestore(&hsudc->lock, flags);
 		return -EINVAL;
 	}
-- 
2.25.1

