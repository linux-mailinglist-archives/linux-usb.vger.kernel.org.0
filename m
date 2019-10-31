Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97AB2EAD0E
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 11:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfJaKFZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 06:05:25 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33370 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfJaKFZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Oct 2019 06:05:25 -0400
Received: by mail-pg1-f193.google.com with SMTP id u23so3753843pgo.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2019 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=chz5iB65DqrwGbK+ItDsKGOYvX2GWH9VfCGfaBavzZE=;
        b=X8faQDgSzMmDSSQJ7v/APF2W+NvxIAebiv0dWZXgAkAagQGwohtE8kQkum/lZyAxaP
         uktQcCX/ErRg9eCl5+yGB+4VrSyzl9QEJHIspUvak+NM2SWgS5L5lqUf0yirQtrLr34c
         JpKbVWLBisdd+ldGqLL2pia8nfaMr/rPA2CZq5NB4PM7wG7ok5qGWUhFPGghJnrDpzhk
         m42vsOXy3MvFWAcyOp4V8ZIMUFp+ys2amMG97KbsOifqAj4YppyHZZXsiBsm7tg/lXmZ
         cdekXN8nnTNu0iELNY8EA73+NEx3zimIwlLKbgIP1tNhHsimS3M77AN4DAjMIxQVj/1w
         6gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=chz5iB65DqrwGbK+ItDsKGOYvX2GWH9VfCGfaBavzZE=;
        b=KdSijGXLNynHMlUwtsv01H7nhWYHb8UG2Wc4VjN8V2C4z9LRevbBUSwxZzKvzofKVb
         56RreCVJsoIcIxHn83bDP0Te++jOmD6tKN3OhHfpGXtXPG/r0kN5elrn3N6UeuPwa4GS
         dqnRkCSiVzz/HhB73x+pKBWmrf2TLMQ9oEpkR+w2FxBcyrgdAMqDlvTd62XevGtOFejz
         7ghf6T9Imw/E5wO1tQvMFNFFMLhaIh3BULQL659RX+u0e4s5IR7tL/niM5jdmkHoI9Ou
         hH2xl1o5FBq1gi4YQNJoRrC+sPdXaIY5h5AyQHIA1qIAmphUjKxxisYVtfcg4o+MZo9a
         yEdQ==
X-Gm-Message-State: APjAAAW7uy2ez53L9frNpyTmRmKwKoFlSJnF/nj8JDsKWqKlAPMoMMgv
        T9uPvvePDIUZmy2AmS4TAKZ1mC60EAk=
X-Google-Smtp-Source: APXvYqyl2TnPk7Zk9PX7HX0L4FVbbWJVOUhjUKHvnVvJrtgPHp+9dk/M+leyVUobcwmR69572970EQ==
X-Received: by 2002:a63:b24c:: with SMTP id t12mr5765640pgo.340.1572516323938;
        Thu, 31 Oct 2019 03:05:23 -0700 (PDT)
Received: from localhost.localdomain (114-34-112-171.HINET-IP.hinet.net. [114.34.112.171])
        by smtp.gmail.com with ESMTPSA id e71sm3590871pgc.91.2019.10.31.03.05.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 31 Oct 2019 03:05:23 -0700 (PDT)
From:   Jun Chen <ptchentw@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     hminas@synopsys.com, Jun Chen <jun.chen@vatics.com>
Subject: [PATCH] usb: dwc2: gadget: stall handshakes returned by control pipes in status stage
Date:   Thu, 31 Oct 2019 18:04:52 +0800
Message-Id: <1572516292-23969-1-git-send-email-ptchentw@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Jun Chen <jun.chen@vatics.com>

According to USB2.0 spec 8.5.3, "If the control sequence
has no Data stage, then it consists of a Setup stage
followed by a Status stage consisting of an IN transaction."

But when doing control read in some HOST (like MS Windows),
after a SETUP transaction with no Data stage, the sequence
stay in the Status stage of an OUT transaction until timeout.

This patch Stall both IN and OUT on ep0 in status stage,
fix the unhandling state when we got an error command
with zero length control read request.

It's also based on the USB2.0 spec 8.5.3.4,
"The protocol STALL condition lasts until the receipt of
the next SETUP transaction, and the function will return
STALL in response to any IN or OUT transaction on the pipe
until the SETUP transaction is received."

Signed-off-by: Jun Chen <jun.chen@vatics.com>
---
 drivers/usb/dwc2/gadget.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 6be10e496..73b5944 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -1853,23 +1853,30 @@ static void dwc2_hsotg_stall_ep0(struct dwc2_hsotg *hsotg)
 	struct dwc2_hsotg_ep *ep0 = hsotg->eps_out[0];
 	u32 reg;
 	u32 ctrl;
+	u32 direction;
 
-	dev_dbg(hsotg->dev, "ep0 stall (dir=%d)\n", ep0->dir_in);
-	reg = (ep0->dir_in) ? DIEPCTL0 : DOEPCTL0;
+	direction = ep0->dir_in;
+	do {
+		dev_dbg(hsotg->dev, "ep0 stall (dir=%d)\n", ep0->dir_in);
+		reg = (ep0->dir_in) ? DIEPCTL0 : DOEPCTL0;
 
-	/*
-	 * DxEPCTL_Stall will be cleared by EP once it has
-	 * taken effect, so no need to clear later.
-	 */
+		/*
+		 * DxEPCTL_Stall will be cleared by EP once it has
+		 * taken effect, so no need to clear later.
+		 */
 
-	ctrl = dwc2_readl(hsotg, reg);
-	ctrl |= DXEPCTL_STALL;
-	ctrl |= DXEPCTL_CNAK;
-	dwc2_writel(hsotg, ctrl, reg);
+		ctrl = dwc2_readl(hsotg, reg);
+		ctrl |= DXEPCTL_STALL;
+		ctrl |= DXEPCTL_CNAK;
+		dwc2_writel(hsotg, ctrl, reg);
 
-	dev_dbg(hsotg->dev,
-		"written DXEPCTL=0x%08x to %08x (DXEPCTL=0x%08x)\n",
-		ctrl, reg, dwc2_readl(hsotg, reg));
+		dev_dbg(hsotg->dev,
+			"written DXEPCTL=0x%08x to %08x (DXEPCTL=0x%08x)\n",
+			ctrl, reg, dwc2_readl(hsotg, reg));
+
+		if (hsotg->ep0_state == DWC2_EP0_STATUS_IN)
+			ep0->dir_in = (ep0->dir_in == 1) ? 0 : 1;
+	} while (ep0->dir_in != direction);
 
 	 /*
 	  * complete won't be called, so we enqueue
-- 
1.9.1

