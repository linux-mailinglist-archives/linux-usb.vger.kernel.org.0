Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10F5347A5A
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236104AbhCXOLy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:11:54 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:51963 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236086AbhCXOLh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:11:37 -0400
Received: from rpi3.fritz.box ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.113]) with ESMTPA (Nemesis) id
 1Mbj3Y-1lwkYe0AxS-00dJMQ; Wed, 24 Mar 2021 15:11:30 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Fabian Vogt <fabian@ritter-vogt.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 6/7] fotg210-udc: Don't DMA more than the buffer can take
Date:   Wed, 24 Mar 2021 15:11:14 +0100
Message-Id: <20210324141115.9384-7-fabian@ritter-vogt.de>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20210324141115.9384-1-fabian@ritter-vogt.de>
References: <20210324141115.9384-1-fabian@ritter-vogt.de>
X-Provags-ID: V03:K1:m0trjvSgkX2KnYa3zh9mU4XWHGFoauJhqT1RxZWS6ZdUWtsjCua
 eNhm3L2R+fPagi46OGFRWSSW14v/Ybr8SvB+qOdxprppYRfQy2ZlRZu035QidMRePX32K9b
 0pO6isY7paiJkgjYMC78AdDxmSV3tjN6YWiDltXE+8rxQWQhTjL0PlHZyBaJp3QWmkyj7E7
 csih5gkehPcrp2gPY9ktg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:b6JzW0xpk+c=:4Q+kcEzCrTzD2Fc1OyhW9W
 fWdxmhsTJ1lbaK/vlQyaxVCGA1LIcjcyIK24JqPlO3pXej7cFzEcBc/ar9JeADIkHCF9Pb/gc
 sgmQPaNKnVLsw/B7WeT967/v2Sp1D+ImmbO+raij9KKdVBIhtdOSQz301XahkTHaJ8xQcIonk
 kXi142pR1v9z4F3y+rWX9G3uZnZTV/8kys+cq2K4VW9h4wdagc8MmtvKRdDy1tOATBVqZC4RX
 6GOHwGZa5iA1TR57vPWjeGLek9T5Ez80SxFSRUgS4b5e7AZ4SjtlGzfkpkV7bGrNZzd171fz0
 tjxhiwzYWRvyMe/plAfJNLUomsDvE2XdGoIqUkCK4YucN4w8vFOKD7dIQDqNJkOVeO0vMCTHT
 GVbyJf/Ogp8bXFNLhDWv7Dn8VZGvSgdQUEfp5mNp95HLeU8q74q51APeDRWPWzT+uCt4xRWtR
 UaKOZSi4pA==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Before this, it wrote as much as available into the buffer, even if it
didn't fit.

Fixes: b84a8dee23fd ("usb: gadget: add Faraday fotg210_udc driver")
Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>
---
 drivers/usb/gadget/udc/fotg210-udc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/fotg210-udc.c b/drivers/usb/gadget/udc/fotg210-udc.c
index 6a4c60d5b2c2..7716bd1c8753 100644
--- a/drivers/usb/gadget/udc/fotg210-udc.c
+++ b/drivers/usb/gadget/udc/fotg210-udc.c
@@ -338,8 +338,9 @@ static void fotg210_start_dma(struct fotg210_ep *ep,
 		} else {
 			buffer = req->req.buf + req->req.actual;
 			length = ioread32(ep->fotg210->reg +
-					FOTG210_FIBCR(ep->epnum - 1));
-			length &= FIBCR_BCFX;
+					FOTG210_FIBCR(ep->epnum - 1)) & FIBCR_BCFX;
+			if (length > req->req.length - req->req.actual)
+				length = req->req.length - req->req.actual;
 		}
 	} else {
 		buffer = req->req.buf + req->req.actual;
-- 
2.25.1

