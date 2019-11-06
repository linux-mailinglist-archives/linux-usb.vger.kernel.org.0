Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81130F216C
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 23:12:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfKFWMK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 17:12:10 -0500
Received: from gateway23.websitewelcome.com ([192.185.50.164]:48110 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726779AbfKFWMK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 17:12:10 -0500
X-Greylist: delayed 2088 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 17:12:10 EST
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 58DDC15D5AC
        for <linux-usb@vger.kernel.org>; Wed,  6 Nov 2019 14:28:20 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id SRueirO1jOdBHSRuei7z7P; Wed, 06 Nov 2019 14:28:20 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=vu8+QyuX0r7EXS45AfHRKbJH6xWvQlIw/EGzNaMwnj8=; b=pfLxpwjLuFV5YsbCsX0NeJNKC3
        tNQcacH44DKWtGMvizBQMz/ddtqJTs/c7+j3IzcO2r/mQZPjO9sAX244s1a0qwfpgJ5hl7rckhgWo
        5OzR+ZhaE0ww9EUiznSr6P8K2mxcvWyI07LvpzLWPvf8kQastVityR6G8ZdhTEKNi18iLu1VPaISE
        +a7BnrykFmYHMMjxE+MaIJ7W0tSxt1jiERGD7ATsN1eR+Ccrgvy3Tl7pZq3ijSsX9ngXK1Ichs2Oj
        a6gtEgFzscXrSVbVC5yQ8Vv8qvwCQ5rVMLlDE7z/vHoMFv4mq3QP6bMUlFilrw/7p2IwzdmZ4+p4M
        p2SPqu+g==;
Received: from [187.192.2.30] (port=34892 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1iSRuc-002xp8-S9; Wed, 06 Nov 2019 14:28:18 -0600
Date:   Wed, 6 Nov 2019 14:28:21 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michal Nazarewicz <mina86@mina86.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH v4] usb: gadget: pch_udc: fix use after free
Message-ID: <20191106202821.GA20347@embeddedor>
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
X-Source-IP: 187.192.2.30
X-Source-L: No
X-Exim-ID: 1iSRuc-002xp8-S9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.2.30]:34892
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove pointer dereference after free.

pci_pool_free doesn't care about contents of td.
It's just a void* for it

Addresses-Coverity-ID: 1091173 ("Use after free")
Cc: stable@vger.kernel.org
Acked-by: Michal Nazarewicz <mina86@mina86.com>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
Changes in v4:
  Fix line-wrapping.
  Update commit log.
  Update subject line.

Changes in v3:
  Remove 'td->next = 0x00' inside for loop.
  Remove unnecessary pointer nullification after free.

Changes in v2:
  Move pointer dereference before pci_pool_free()
  Set pointer to NULL after free

 drivers/usb/gadget/udc/pch_udc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 265dab2bbfac..3344fb8c4181 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1519,7 +1519,6 @@ static void pch_udc_free_dma_chain(struct pch_udc_dev *dev,
 		td = phys_to_virt(addr);
 		addr2 = (dma_addr_t)td->next;
 		dma_pool_free(dev->data_requests, td, addr);
-		td->next = 0x00;
 		addr = addr2;
 	}
 	req->chain_len = 1;
-- 
2.23.0

