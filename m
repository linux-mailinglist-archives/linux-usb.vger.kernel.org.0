Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0D025FFA4
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 18:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730872AbgIGQgB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 12:36:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730867AbgIGQfz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 12:35:55 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 011D021941;
        Mon,  7 Sep 2020 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599496554;
        bh=0xZQn08ge8u1b7LENZ75nSqgq2FnbOiaRR1KLQ2HahE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l3toXp60rJyWmUbe32NOMHgwOx5oMwi0Q7IdW57Lx7WKp5j8Ap/D/Lc9G6px4998i
         cJe5xYRt4m2L0VYPnqcuX0hEbu5pZBUImqNVF6mX7O905GpMyhDGjuxgO8XptMfTtZ
         tADDJwvTmCPlvy3io+gkgAVUASrMH9BBOJfR8InI=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kamil Lorenc <kamil@re-ws.pl>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 08/10] net: usb: dm9601: Add USB ID of Keenetic Plus DSL
Date:   Mon,  7 Sep 2020 12:35:41 -0400
Message-Id: <20200907163543.1281889-8-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163543.1281889-1-sashal@kernel.org>
References: <20200907163543.1281889-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Kamil Lorenc <kamil@re-ws.pl>

[ Upstream commit a609d0259183a841621f252e067f40f8cc25d6f6 ]

Keenetic Plus DSL is a xDSL modem that uses dm9620 as its USB interface.

Signed-off-by: Kamil Lorenc <kamil@re-ws.pl>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/dm9601.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/usb/dm9601.c b/drivers/net/usb/dm9601.c
index 0b4bdd39106b0..fb18801d0fe7b 100644
--- a/drivers/net/usb/dm9601.c
+++ b/drivers/net/usb/dm9601.c
@@ -624,6 +624,10 @@ static const struct usb_device_id products[] = {
 	 USB_DEVICE(0x0a46, 0x1269),	/* DM9621A USB to Fast Ethernet Adapter */
 	 .driver_info = (unsigned long)&dm9601_info,
 	},
+	{
+	 USB_DEVICE(0x0586, 0x3427),	/* ZyXEL Keenetic Plus DSL xDSL modem */
+	 .driver_info = (unsigned long)&dm9601_info,
+	},
 	{},			// END
 };
 
-- 
2.25.1

