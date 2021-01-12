Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217AA2F2FCB
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 14:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405330AbhALM6f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 07:58:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:54632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405290AbhALM6e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 07:58:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28A392333D;
        Tue, 12 Jan 2021 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610456280;
        bh=593Ov2s48jo+63p0/6Mok/bJ1IvcTz5WKdv0LdHmgno=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iSkcaryDuq3ch5v6G/yxjsYg9Cu1TpMNa+lswz5IFAJkDQuHUnvU5u+bE9C+n6edy
         FP/lAc1/S7Du9MvnifI09W4wOpFUzyRKsU7r8ohWlrWt4gSX2GG7YzkJNcpRYoLeLW
         PEKDyN+aATjzAHBzSMnPeExP3kCOjMVzKPDvSQXk/XCzSn+kvtuKC+DqQUEthemSvM
         dCga6pJ0l5aGMXwJGTa4zUwwlNTA8/X3Jgel75U36wsYuEkZjwfgR1xgCiTKBjzIRx
         PsRogiHPGSxz8A7mq7eWnheH9ecSnPmfN4ID/tDo2o0xSdlCN66yffdr0e3bhPmL4z
         KS/FZVYZih1IQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Roland Dreier <roland@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 07/13] CDC-NCM: remove "connected" log message
Date:   Tue, 12 Jan 2021 07:57:43 -0500
Message-Id: <20210112125749.71193-7-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125749.71193-1-sashal@kernel.org>
References: <20210112125749.71193-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Roland Dreier <roland@kernel.org>

[ Upstream commit 59b4a8fa27f5a895582ada1ae5034af7c94a57b5 ]

The cdc_ncm driver passes network connection notifications up to
usbnet_link_change(), which is the right place for any logging.
Remove the netdev_info() duplicating this from the driver itself.

This stops devices such as my "TRENDnet USB 10/100/1G/2.5G LAN"
(ID 20f4:e02b) adapter from spamming the kernel log with

    cdc_ncm 2-2:2.0 enp0s2u2c2: network connection: connected

messages every 60 msec or so.

Signed-off-by: Roland Dreier <roland@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/r/20201224032116.2453938-1-roland@kernel.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/cdc_ncm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index cb4c9d419bd39..97c4c301166c5 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -1630,9 +1630,6 @@ static void cdc_ncm_status(struct usbnet *dev, struct urb *urb)
 		 * USB_CDC_NOTIFY_NETWORK_CONNECTION notification shall be
 		 * sent by device after USB_CDC_NOTIFY_SPEED_CHANGE.
 		 */
-		netif_info(dev, link, dev->net,
-			   "network connection: %sconnected\n",
-			   !!event->wValue ? "" : "dis");
 		usbnet_link_change(dev, !!event->wValue, 0);
 		break;
 
-- 
2.27.0

