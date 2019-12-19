Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F03A12614F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 12:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbfLSLya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Dec 2019 06:54:30 -0500
Received: from dougal.metanate.com ([90.155.101.14]:56605 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726692AbfLSLya (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Dec 2019 06:54:30 -0500
X-Greylist: delayed 1185 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Dec 2019 06:54:28 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=metanate.com;
         s=stronger; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=+t6meyLimxsT415ahj+53VXcHIGJZ/WJo/94BvkPdTY=; b=UlGRgHp21+xHu2nMO7AWkfEW4A
        mDEXjAbJflenPqPZLThzcCYXiA70nWlPSpejUMm9Jcsvml+WyBVWjOXD4eosyP1uYGWuIfROYCC06
        zinHZgjgBhQZ8WcGHE9c8NQFqbilFl5FGF0sw/lZ2Jz4+g0cjJ7j/uqu2LweRSCoDVfh3rVBC+WaU
        +IJcBeNvDZdbOKOxBKpBKKrt8BHf4ED2A1yj7UuBgrSv41+HDCpDl3yOZxjAc3dGQ+24A9z5DnVnW
        JrY93X8Es0bzPFnrils6GJxnstoRzH9Q96pgh2vwsV/ruk5O8m67ERaGHKMPgjnKNvhri5baM3skh
        ZrRIiehA==;
Received: from 188-39-28-98.static.enta.net ([188.39.28.98] helo=donbot.metanate.com)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1ihu4k-00024T-7h; Thu, 19 Dec 2019 11:34:38 +0000
From:   John Keeping <john@metanate.com>
To:     Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        John Keeping <john@metanate.com>
Subject: [PATCH 2/2] usb: dwc2: fix debugfs FIFO count
Date:   Thu, 19 Dec 2019 11:34:32 +0000
Message-Id: <20191219113432.1229852-2-john@metanate.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219113432.1229852-1-john@metanate.com>
References: <20191219113432.1229852-1-john@metanate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The number of FIFOs may be lower than the number of endpoints.  Use the
correct total when printing FIFO details in debugfs.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/usb/dwc2/debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/debugfs.c b/drivers/usb/dwc2/debugfs.c
index b8f2790abf91..3a0dcbfbc827 100644
--- a/drivers/usb/dwc2/debugfs.c
+++ b/drivers/usb/dwc2/debugfs.c
@@ -183,6 +183,7 @@ DEFINE_SHOW_ATTRIBUTE(state);
 static int fifo_show(struct seq_file *seq, void *v)
 {
 	struct dwc2_hsotg *hsotg = seq->private;
+	int fifo_count = dwc2_hsotg_tx_fifo_count(hsotg);
 	u32 val;
 	int idx;
 
@@ -196,7 +197,7 @@ static int fifo_show(struct seq_file *seq, void *v)
 
 	seq_puts(seq, "\nPeriodic TXFIFOs:\n");
 
-	for (idx = 1; idx < hsotg->num_of_eps; idx++) {
+	for (idx = 1; idx <= fifo_count; idx++) {
 		val = dwc2_readl(hsotg, DPTXFSIZN(idx));
 
 		seq_printf(seq, "\tDPTXFIFO%2d: Size %d, Start 0x%08x\n", idx,
-- 
2.24.1

