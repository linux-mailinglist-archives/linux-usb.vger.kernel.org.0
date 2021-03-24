Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D66347A56
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbhCXOLx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:11:53 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44987 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236080AbhCXOLg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:11:36 -0400
Received: from rpi3.fritz.box ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.113]) with ESMTPA (Nemesis) id
 1MFbeC-1lRrn40rcs-00H7hq; Wed, 24 Mar 2021 15:11:28 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Fabian Vogt <fabian@ritter-vogt.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 1/7] fotg210-udc: Fix DMA on EP0 for length > max packet size
Date:   Wed, 24 Mar 2021 15:11:09 +0100
Message-Id: <20210324141115.9384-2-fabian@ritter-vogt.de>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20210324141115.9384-1-fabian@ritter-vogt.de>
References: <20210324141115.9384-1-fabian@ritter-vogt.de>
X-Provags-ID: V03:K1:njokoTjywUJuwr3Ml/mPN7yDZLeWlkmx0ufXomwVLJGYhG54TrX
 A9YoiyRSDr2xRfHU6gxcHi4w1eXfaSxdAr6WFtsO+Dv7wb4iMP/ggwTVhj+qGDW8TFbDk3M
 Qz4muhYoZx83pd6+nXC/QVfypjkEdABMPtE81ZGxW16S8AKd4tA5Cl5OSWgij2jy19l09kc
 zsUUfyVfONvcFX3k92uOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/jzd01Z/Zq4=:PHbBBdjPradQpDkV1w2ANW
 NHu7tmp6+xHO6pM4YIz56HiI0O+/PFfMlL63P9HEbt54SWhXs0Hm7YkX12xp9WC1OoqToXUzP
 Z620/u3KicVV0D3LrdYzCU9RJ/eqcsTyxrGBRzB9vH/5cZOMwJE4oPXrH6gaXclxJKaw2sSGh
 +GCaVKu5lVxCWlis6wUyApAZDWCpXog+vN/XWU6z1YSyEA/SaVPq8qjntZ/fV5WLcow0kDJ8G
 OdrW3C7wuMNUZI6dwySdV3RBNr0ShEZ6Ve+LNj+iNR1N0+VRHZCZ8tMXcuG493RgfUts75ugN
 ooJ4WOGaGc61JhtpPFcixrOdDUoseUPtQpHXcnqe8YjZK9FeqrpAteHYPqfgJukAT8c6UKpN6
 Q7J+FATM3MenjAuEd9y43IK2uOAeTBNDgNY3+Z89tsAwhtYOX5IsOEE7ZsapbN+xpTGJfmWhW
 9DN7bYGj6A==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For a 75 Byte request, it would send the first 64 separately, then detect
that the remaining 11 Byte fit into a single DMA, but due to this bug set
the length to the original 75 Bytes. This leads to a DMA failure (which is
ignored...) and the request completes without the remaining bytes having
been sent.

Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 596fe26a7c56..482d867ac96f 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -346,7 +346,7 @@ static void fotg210_start_dma(struct fotg210_ep *ep,
 		if (req->req.length - req->req.actual > ep->ep.maxpacket)
 			length = ep->ep.maxpacket;
 		else
-			length = req->req.length;
+			length = req->req.length - req->req.actual;
 	}
 
 	d = dma_map_single(dev, buffer, length,
-- 
2.25.1

