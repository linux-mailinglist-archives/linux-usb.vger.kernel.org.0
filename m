Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB47482562
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 21:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730310AbfHETO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 15:14:28 -0400
Received: from gateway34.websitewelcome.com ([192.185.149.222]:46865 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727802AbfHETO2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 15:14:28 -0400
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 21CEB4A45D
        for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2019 14:14:28 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id uiRAhalLl2PzOuiRAheizj; Mon, 05 Aug 2019 14:14:28 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dzFv/IwO8nS0LzTNEOrjXf+xKsPETwh6M5w7aEBoJKo=; b=CkqNqbpnX5kbciEOmfZEuJEDIu
        5rBhPk5WDDEn7Wf6XcIVb250/7QVs3mt620PZ66j8+3MOZn3aUN2Vz5ztGMQ/Kzfj1dcR7+gkQrq1
        nnptPu3LDK2/Pl/+kZxunxE7rPvclO1axBmRunNcsq0Rxn5HhaIfY04ivVXJ00b72SyjSPhkHpciQ
        yHUEEdy2ahhmRyK2VE3d1A7Jz9PQ+ovpz6XQtsY9vHJknXd6+gOKoXIoqU7JFaQgiJfBsJq09x7fl
        Rzi5u3Rzor1kVm7y9MGDiepmcUvOvnKccPPXJEjRiVTVoPaNZvl1XubYQUQ2FnBYxQ2mogBjQy60W
        o2ovT6/w==;
Received: from [187.192.11.120] (port=37378 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1huiR8-0037a8-QZ; Mon, 05 Aug 2019 14:14:26 -0500
Date:   Mon, 5 Aug 2019 14:14:26 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] USB: gadget: udc: s3c2410_udc: Mark expected switch
 fall-throughs
Message-ID: <20190805191426.GA12414@embeddedor>
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
X-Exim-ID: 1huiR8-0037a8-QZ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:37378
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: tct_hammer_defconfig arm):

drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may fall through [-Wimplicit-fallthrough=]

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/usb/gadget/udc/s3c2410_udc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
index af3e63316ace..f82208fbc249 100644
--- a/drivers/usb/gadget/udc/s3c2410_udc.c
+++ b/drivers/usb/gadget/udc/s3c2410_udc.c
@@ -312,6 +312,7 @@ static int s3c2410_udc_write_fifo(struct s3c2410_ep *ep,
 	switch (idx) {
 	default:
 		idx = 0;
+		/* fall through */
 	case 0:
 		fifo_reg = S3C2410_UDC_EP0_FIFO_REG;
 		break;
@@ -416,6 +417,7 @@ static int s3c2410_udc_read_fifo(struct s3c2410_ep *ep,
 	switch (idx) {
 	default:
 		idx = 0;
+		/* fall through */
 	case 0:
 		fifo_reg = S3C2410_UDC_EP0_FIFO_REG;
 		break;
-- 
2.22.0

