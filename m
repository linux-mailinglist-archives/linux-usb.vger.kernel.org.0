Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6B7347A57
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236098AbhCXOLw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:11:52 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:34129 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236081AbhCXOLg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:11:36 -0400
Received: from rpi3.fritz.box ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.113]) with ESMTPA (Nemesis) id
 1M1YlB-1lM2MT1g5r-0039CJ; Wed, 24 Mar 2021 15:11:30 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Fabian Vogt <fabian@ritter-vogt.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 7/7] fotg210-udc: Complete OUT requests on short packets
Date:   Wed, 24 Mar 2021 15:11:15 +0100
Message-Id: <20210324141115.9384-8-fabian@ritter-vogt.de>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20210324141115.9384-1-fabian@ritter-vogt.de>
References: <20210324141115.9384-1-fabian@ritter-vogt.de>
X-Provags-ID: V03:K1:gXze9JYrTRhG3mLTX6PQa025GuPBasoBCV2n0NSKY6bgscUYKOa
 +n6/pXvOPSt2p4EcdcpYcqenCNkTgOy+CiVa6UaRF0qvIu52WnLA7iel0e4pMtzt3hY72Du
 EA18V/bHaYhBFwP8nbFeu4+Ga7Aahzj9sokqLgZZfLacC8OGTTN7C6X0r7tHZ1gn0nPp9/N
 Zho0WtTxqRUyqLwFBkAsw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:u2t0OAREHSk=:4P5amG3ZmO8NNwGzCPhTl1
 m2C2aQzjhiX+k02MrA0r7ypq1bYCDSXiYoI2+Ulq/xvQBDgik0qny2KPHevUNpnhfAClehjDh
 hXGbXR6mbC3yAAnmq7LsLviPaNVlAQcH0W14SJJJYUgLFytuz6CPYPxWDhnqZ9PCdUbHuqFFr
 3ueqnlrMbezvLOAXhCOcypG5mbQYxu9o6MavOgDJZ2nRAUcCKwDWfzGNlSUEE0In8SZQQ2PGI
 s2MYhFwk1aDvOyw16eXBfnkzyXiDSlBY7uoDPXhrzc14Cc1N7ZyfP5uU4OjnLZGtL0fMxPAl3
 /bATjbPQQg0gCjH/r5bzPNYHtM6KclCI1/54MEaLrYSKCu5NF5khL4p5Og/ko2HylvCewYV6f
 FnGRWZNDZHGSCHtpRdp66hjwao1fuIQ6Q2eNafhX8VZ90b8hu1Y+Fk474p494sbcwRLPbirz4
 zNt1GmypBA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A short packet indicates the end of a transfer and marks the request as
complete.

Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 7716bd1c8753..6cb7daf725b9 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -863,12 +863,16 @@ static void fotg210_out_fifo_handler(struct fotg210_ep *ep)
 {
 	struct fotg210_request *req = list_entry(ep->queue.next,
 						 struct fotg210_request, queue);
+	int disgr1 = ioread32(ep->fotg210->reg + FOTG210_DISGR1);
 
 	fotg210_start_dma(ep, req);
 
-	/* finish out transfer */
+	/* Complete the request when it's full or a short packet arrived.
+	 * Like other drivers, short_not_ok isn't handled.
+	 */
+
 	if (req->req.length == req->req.actual ||
-	    req->req.actual < ep->ep.maxpacket)
+	    (disgr1 & DISGR1_SPK_INT(ep->epnum - 1)))
 		fotg210_done(ep, req, 0);
 }
 
-- 
2.25.1

