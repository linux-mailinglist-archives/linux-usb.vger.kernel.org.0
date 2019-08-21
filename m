Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15E4A96F4C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 04:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfHUCQc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 22:16:32 -0400
Received: from gateway34.websitewelcome.com ([192.185.149.62]:25133 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726512AbfHUCQb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Aug 2019 22:16:31 -0400
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id EAE483070B
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2019 21:16:30 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 0GAoiQDkviQer0GAoil8ZD; Tue, 20 Aug 2019 21:16:30 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0+iQb8olkCCmveYCwGlywQYawyBRRIxSwndogIaqQ6w=; b=bolcoLQXm633fxCXN8Eio23eEC
        vMRn+bUr57rvQjBO+vW+4MDADvf6Vtbs0oJsayU6/GKalI+UthEDpUA6+3YDs2//IOIJqFXtP0Nex
        MzWHCtKAzAv6vypR8dw1ivprC3VY3MsTARtSBeLCPJPYjQwgUSXISEGXmhzZpulvDBVGrKKXGC/aH
        S/qcBA7iWs1hsDssQN7QwXHedaFlIGAJ0muKOv59tE3yucp06E5bKmwnu9YPluMpNAGexzuHvTCGW
        3y4WTwrk8gTmXLloBIZrJ3RdVg+Kd0dOLZX1vVByjCDUt/VMejgKcqoE5WLQaRd52HzzXYg5XGVaf
        3Tmgr3/A==;
Received: from [187.192.11.120] (port=52370 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1i0GAn-001KA5-4q; Tue, 20 Aug 2019 21:16:29 -0500
Date:   Tue, 20 Aug 2019 21:16:27 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] usb: udc: lpc32xx: silence fall-through warning
Message-ID: <20190821021627.GA2679@embeddedor>
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
X-Exim-ID: 1i0GAn-001KA5-4q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:52370
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Silence the following fall-through warning by adding a break statement:

drivers/usb/gadget/udc/lpc32xx_udc.c:2230:3: warning: this statement may
fall through [-Wimplicit-fallthrough=]

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index e3f67023d935..606c8bc52db5 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -2264,7 +2264,7 @@ static void udc_handle_ep0_setup(struct lpc32xx_udc *udc)
 		default:
 			break;
 		}
-
+		break;
 
 	case USB_REQ_SET_ADDRESS:
 		if (reqtype == (USB_TYPE_STANDARD | USB_RECIP_DEVICE)) {
-- 
2.23.0

