Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2BC347A52
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236092AbhCXOLw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:11:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:41901 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbhCXOLf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:11:35 -0400
Received: from rpi3.fritz.box ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.113]) with ESMTPA (Nemesis) id
 1MAORp-1lUs4B2Pmt-00Budj; Wed, 24 Mar 2021 15:11:28 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Fabian Vogt <fabian@ritter-vogt.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/7] fotg210-udc: Fix EP0 IN requests bigger than two packets
Date:   Wed, 24 Mar 2021 15:11:10 +0100
Message-Id: <20210324141115.9384-3-fabian@ritter-vogt.de>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20210324141115.9384-1-fabian@ritter-vogt.de>
References: <20210324141115.9384-1-fabian@ritter-vogt.de>
X-Provags-ID: V03:K1:K93fe7jTGG7rbqYX10sDM6RHCFhmFa1GvxCcO6+n1J6/hs4B90z
 mkQhQDFWBOUHOtlmVcnQHvRM+BGKngCNup6zBvtOvIVX5NKzhwHpOCpFHnq0Ak3yIuWosP6
 nbjAiaQSUYzUHtWcgj/XGRF+r1NhofuqGThO8/re8dGbao+DXbjxtgI2dfdJ71dONbRqyuZ
 k+Orl3zLrshz1aRYFKqIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:60utlDjooeM=:f2HufU/O5XvHtjYMS4JSte
 eK5I1lsKMXTvloUpB8Dp7ddtWe7+A+J9BF5wvJnFgSXTVwA+1BktKaiPrBWqZZnz4vYEvRog8
 U2PiQSCGBukooTYPV0V/ucvs94RfEA9ODgZLucAHZsI28l+h5f53CR+sN6QoMRrEag38+iHj9
 QUcuB8RC97Q8FF272cX/W33kujhN+cnXEMUpPEXpJPOwekbYujsDIet6CiN9IWZ1DBlIx4zxU
 st6EkTZBg9lyEuWHnXcIHR8/46f863La/5Rq89G4Ea+EcafEIFiH4fodwZNgfdFRHmxqQmw7P
 IUzqX/EBsMQKCDPzGqWE3Tt4gYXkS+xKu9+WHZoEnIgD+4b7vMYhwL2VoJ4jkVDwFZxlH3PPF
 yOkVQeDNjdErsb016cNb/lzeTrzQP5P6WWVc/KcUrrUuY5/s+6qxBE3ZsIXjlcOzdHcVmvEb1
 50+13CVgPA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For a 134 Byte packet, it sends the first two 64 Byte packets just fine,
but then notice that less than a packet is remaining and call fotg210_done
without actually sending the rest.

Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 482d867ac96f..539808f62e2e 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -834,7 +834,7 @@ static void fotg210_ep0in(struct fotg210_udc *fotg210)
 		if (req->req.length)
 			fotg210_start_dma(ep, req);
 
-		if ((req->req.length - req->req.actual) < ep->ep.maxpacket)
+		if (req->req.actual == req->req.length)
 			fotg210_done(ep, req, 0);
 	} else {
 		fotg210_set_cxdone(fotg210);
-- 
2.25.1

