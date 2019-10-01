Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9870C3D5D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 18:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730867AbfJAQlV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 12:41:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:52866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730844AbfJAQlU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 12:41:20 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2F7FB20B7C;
        Tue,  1 Oct 2019 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569948079;
        bh=Q+BxTpxl1yyf6CTkUQrsfcgTDYJOqPZL8IcLXQm2SYI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WuG8RNxusGFoWOk78fjkI1Upva8VoBTkVCFIQ4CFmDlYtckaeHdjfG6D9fwvvZS3O
         xrnVl7YTslmQDmVPNTmgWr8Y5l0MDVOIZNXF4roQ+6W3JI5En49C4it0j2CtZ67oGo
         jZX/HBMVABPm0qlpgv3FsbFYqKRxauaq+U1eHYs8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 69/71] usbnet: sanity checking of packet sizes and device mtu
Date:   Tue,  1 Oct 2019 12:39:19 -0400
Message-Id: <20191001163922.14735-69-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001163922.14735-1-sashal@kernel.org>
References: <20191001163922.14735-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Oliver Neukum <oneukum@suse.com>

[ Upstream commit 280ceaed79f18db930c0cc8bb21f6493490bf29c ]

After a reset packet sizes and device mtu can change and need
to be reevaluated to calculate queue sizes.
Malicious devices can set this to zero and we divide by it.
Introduce sanity checking.

Reported-and-tested-by:  syzbot+6102c120be558c885f04@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/usbnet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 07c00e378a5cd..ef1d667b0108b 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -344,6 +344,8 @@ void usbnet_update_max_qlen(struct usbnet *dev)
 {
 	enum usb_device_speed speed = dev->udev->speed;
 
+	if (!dev->rx_urb_size || !dev->hard_mtu)
+		goto insanity;
 	switch (speed) {
 	case USB_SPEED_HIGH:
 		dev->rx_qlen = MAX_QUEUE_MEMORY / dev->rx_urb_size;
@@ -360,6 +362,7 @@ void usbnet_update_max_qlen(struct usbnet *dev)
 		dev->tx_qlen = 5 * MAX_QUEUE_MEMORY / dev->hard_mtu;
 		break;
 	default:
+insanity:
 		dev->rx_qlen = dev->tx_qlen = 4;
 	}
 }
-- 
2.20.1

