Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33D4282506
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 20:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfHESsq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 14:48:46 -0400
Received: from gateway34.websitewelcome.com ([192.185.149.222]:34648 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728885AbfHESsq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 14:48:46 -0400
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 0332BDE4216
        for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2019 13:48:45 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id ui2GhZRnU4FKpui2GhhucZ; Mon, 05 Aug 2019 13:48:45 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZmIHx3XJdBaj7RV/vprnPWvpQjhw5au5H8dBkUDrmrs=; b=pEWHySVGZdwEQCJOFLM85qeI43
        oVziUhmZKzQ7l8EwanqLkBnE9dI9SRdvXqVG57KsXoGW4VXuACI7MNjh8eOsIlpP+KZQBxq5BJ2uy
        NiFTNGtExkxVOgaP/B29A7bFDsboYbrT64GubvieaUxil0LbDBTolT/aIJT3h5vjNi4SkB0ZjzQZ2
        n+f5N9NEvypwPfkKJ30n3ijiYXv3hhdJcEQHvjVH8KEqOcUgTLg1Zd5oHhnT8QYuxrhtlY9G4CTbF
        laka7sJP/Y+JJNVJJjZF3udsKIWoJgj5jrp665PYmEDnxAIxBUxwV8C86zdPduJ8c9uLkGf2xJIxR
        RyZWXYCg==;
Received: from [187.192.11.120] (port=37266 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hui2F-002sVJ-Lx; Mon, 05 Aug 2019 13:48:43 -0500
Date:   Mon, 5 Aug 2019 13:48:42 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] usb: gadget: atmel_usba_udc: Mark expected switch
 fall-through
Message-ID: <20190805184842.GA8627@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hui2F-002sVJ-Lx
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:37266
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: at91_dt_defconfig arm):

drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement may fall through [-Wimplicit-fallthrough=]

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 503d275bc4c4..86ffc8307864 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -327,6 +327,7 @@ static int usba_config_fifo_table(struct usba_udc *udc)
 	switch (fifo_mode) {
 	default:
 		fifo_mode = 0;
+		/* fall through */
 	case 0:
 		udc->fifo_cfg = NULL;
 		n = 0;
-- 
2.22.0

