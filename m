Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E823A347A58
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236097AbhCXOLw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:11:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:56925 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236067AbhCXOLf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:11:35 -0400
Received: from rpi3.fritz.box ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.113]) with ESMTPA (Nemesis) id
 1MN5W7-1l8EKr3zQT-00J2SH; Wed, 24 Mar 2021 15:11:29 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Fabian Vogt <fabian@ritter-vogt.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 3/7] fotg210-udc: Remove a dubious condition leading to fotg210_done
Date:   Wed, 24 Mar 2021 15:11:11 +0100
Message-Id: <20210324141115.9384-4-fabian@ritter-vogt.de>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20210324141115.9384-1-fabian@ritter-vogt.de>
References: <20210324141115.9384-1-fabian@ritter-vogt.de>
X-Provags-ID: V03:K1:o7rQAzrbX+MaovA9pnERyxbwGl7qxIhi0dSc2LU6eF0WfIJzhfI
 fwrsTsUInjVHM3lQIaI3+tRqXnIA7YBHLC3qAYPHEU0QzbFxt8LuWhDfAGYOu/z82+Fyd8C
 e2AlePrPpOCnoP0KRdO24NNHXHClQU+l10mXffNTuc8BGBbkp8edXloS/XGRwh15yZQaif/
 PJi1vzO/7FOK70mGf8ifQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F3+MT+cQBzs=:qFacNbuliAPNGL+Xcnf6IG
 aCtdU2tzGoJBlVqAt6kkfwUMkC9Kfw2Ka/DaVjpNz2ckxZgSaUrQId296lUU8qIXXpPFBOWtk
 qdwzTpsvVaQ8gtjnjDM96h/Paj6IpzRj2BAcjzXmC9VPHHigF3xv+OqjUvVhHZ7TFxx07xu6w
 qgZp0dHNwR9z5ifKlVY46pXxkpruknGvGWRKOp8GesJn79liTpitZXmxAbUcC3Yj3+cImsLHu
 Y33RUXOtBoUkI1TSgrqygqjn+K6eHyOCjWgZmc72Kk+lDdAcdPaX1Bc9rEQA2CH2Ogn2ktHNl
 byGkoToNugREHRyXd76RFxDbjTS1OYGVZXrwyNauDzgZJ6TVx3ncOR5y7fd9oQIIEH+1F7bt4
 YTNU8y/tRGOO9K4F9YWeKC0UK5tFrLGCLSyMGUw3YwFjG7zbgTZsH88/R73anXnmFSO2dfsqs
 oFB/8LnDPw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When the EP0 IN request was not completed but less than a packet sent,
it would complete the request successfully. That doesn't make sense
and can't really happen as fotg210_start_dma always sends
min(length, maxpkt) bytes.

Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 539808f62e2e..911f1a5cd1f4 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -379,8 +379,7 @@ static void fotg210_ep0_queue(struct fotg210_ep *ep,
 	}
 	if (ep->dir_in) { /* if IN */
 		fotg210_start_dma(ep, req);
-		if ((req->req.length == req->req.actual) ||
-		    (req->req.actual < ep->ep.maxpacket))
+		if (req->req.length == req->req.actual)
 			fotg210_done(ep, req, 0);
 	} else { /* OUT */
 		u32 value = ioread32(ep->fotg210->reg + FOTG210_DMISGR0);
-- 
2.25.1

