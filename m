Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E383A1089
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 12:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234463AbhFIJuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 05:50:24 -0400
Received: from smtpbgsg2.qq.com ([54.254.200.128]:44124 "EHLO smtpbgsg2.qq.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232867AbhFIJuY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 05:50:24 -0400
X-Greylist: delayed 77913 seconds by postgrey-1.27 at vger.kernel.org; Wed, 09 Jun 2021 05:50:23 EDT
X-QQ-mid: bizesmtp47t1623232098t5dm3y2h
Received: from localhost.localdomain (unknown [182.148.12.106])
        by esmtp6.qq.com (ESMTP) with 
        id ; Wed, 09 Jun 2021 17:48:16 +0800 (CST)
X-QQ-SSF: 01000000007000207000B00A0000000
X-QQ-FEAT: zqIuYHvuydxzkEdvYoc6NyZRcS3yR/bOPKdePmVgf3PadKVkKS0SylSZUQN1D
        9Dnw2mz88GF/udNJeT5jItFVX9Ojo4lcOUBb2pVmHJrMC6VKGrikV5/wRSPn5xMp6W9RtNy
        QTIlIUJqDeJk/8b6hvkYddXprsbmyS/TlhzsvjlMjpISwPSkO9u2VVWRLn0WUWocF6Zdw6p
        l/u2GhLyjdhLD0qXu6gKM96/l39fbVRSREE1nMv+21fVgFQpK+5BShLhrz/yan2oolXe10m
        KZEzqXMGe4bJTzumFbTx1TLQUPDqm5XaGJXi/2lNp5C4SZo88heSp+GP4=
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     stern@rowland.harvard.edu
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] usb: ehci: do not initialise static variables
Date:   Wed,  9 Jun 2021 17:47:26 +0800
Message-Id: <20210609094726.62459-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Global static variables dont need to be initialised manully.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/usb/host/ehci-hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 35eec0c0edcd..36f5bf6a0752 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -76,12 +76,12 @@ static const char	hcd_name [] = "ehci_hcd";
 #define	EHCI_TUNE_FLS		1	/* (medium) 512-frame schedule */
 
 /* Initial IRQ latency:  faster than hw default */
-static int log2_irq_thresh = 0;		// 0 to 6
+static int log2_irq_thresh;		// 0 to 6
 module_param (log2_irq_thresh, int, S_IRUGO);
 MODULE_PARM_DESC (log2_irq_thresh, "log2 IRQ latency, 1-64 microframes");
 
 /* initial park setting:  slower than hw default */
-static unsigned park = 0;
+static unsigned park;
 module_param (park, uint, S_IRUGO);
 MODULE_PARM_DESC (park, "park setting; 1-3 back-to-back async packets");
 
-- 
2.31.1



