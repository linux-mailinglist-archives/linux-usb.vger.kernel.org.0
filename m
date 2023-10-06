Return-Path: <linux-usb+bounces-1201-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E207BBAE3
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 16:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 858C71C20A05
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 14:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8BC26E18;
	Fri,  6 Oct 2023 14:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2D11CA9A
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 14:53:43 +0000 (UTC)
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3BCEE4;
	Fri,  6 Oct 2023 07:53:40 -0700 (PDT)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id A414352050C;
	Fri,  6 Oct 2023 16:53:39 +0200 (CEST)
Received: from vmlxhi-118.adit-jv.com (10.72.93.77) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.32; Fri, 6 Oct
 2023 16:53:39 +0200
From: Hardik Gajjar <hgajjar@de.adit-jv.com>
To: <gregkh@linuxfoundation.org>, <s.hauer@pengutronix.de>,
	<jonathanh@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <quic_linyyuan@quicinc.com>, <paul@crapouillou.net>,
	<quic_eserrao@quicinc.com>, <erosca@de.adit-jv.com>, <hgajjar@de.adit-jv.com>
Subject: [PATCH v2] usb: gadget: u_ether: Replace netif_stop_queue with netif_device_detach
Date: Fri, 6 Oct 2023 16:53:32 +0200
Message-ID: <20231006145332.8739-1-hgajjar@de.adit-jv.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231006141231.7220-1-hgajjar@de.adit-jv.com>
References: <20231006141231.7220-1-hgajjar@de.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.77]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This patch replaces the usage of netif_stop_queue with netif_device_detach
in the u_ether driver. The netif_device_detach function not only stops all
tx queues by calling netif_tx_stop_all_queues but also marks the device as
removed by clearing the __LINK_STATE_PRESENT bit.

This change helps notify user space about the disconnection of the device
more effectively, compared to netif_stop_queue, which only stops a single
transmit queue.

Changes since version 1:
	- Correct Singed-off user name and e-mail

Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
---
 drivers/usb/gadget/function/u_ether.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 4bb0553da658..b0daee35b996 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -635,7 +635,7 @@ static int eth_stop(struct net_device *net)
 	unsigned long	flags;
 
 	VDBG(dev, "%s\n", __func__);
-	netif_stop_queue(net);
+	netif_device_detach(dev->net);
 
 	DBG(dev, "stop stats: rx/tx %ld/%ld, errs %ld/%ld\n",
 		dev->net->stats.rx_packets, dev->net->stats.tx_packets,
-- 
2.17.1


