Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F11B2CD78A
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 14:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436741AbgLCNat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 08:30:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:47840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436675AbgLCNas (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Dec 2020 08:30:48 -0500
From:   Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Yves-Alexis Perez <corsac@corsac.net>,
        Matti Vuorela <matti.vuorela@bitfactor.fi>,
        Jakub Kicinski <kuba@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/23] usbnet: ipheth: fix connectivity with iOS 14
Date:   Thu,  3 Dec 2020 08:29:22 -0500
Message-Id: <20201203132935.931362-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203132935.931362-1-sashal@kernel.org>
References: <20201203132935.931362-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yves-Alexis Perez <corsac@corsac.net>

[ Upstream commit f33d9e2b48a34e1558b67a473a1fc1d6e793f93c ]

Starting with iOS 14 released in September 2020, connectivity using the
personal hotspot USB tethering function of iOS devices is broken.

Communication between the host and the device (for example ICMP traffic
or DNS resolution using the DNS service running in the device itself)
works fine, but communication to endpoints further away doesn't work.

Investigation on the matter shows that no UDP and ICMP traffic from the
tethered host is reaching the Internet at all. For TCP traffic there are
exchanges between tethered host and server but packets are modified in
transit leading to impossible communication.

After some trials Matti Vuorela discovered that reducing the URB buffer
size by two bytes restored the previous behavior. While a better
solution might exist to fix the issue, since the protocol is not
publicly documented and considering the small size of the fix, let's do
that.

Tested-by: Matti Vuorela <matti.vuorela@bitfactor.fi>
Signed-off-by: Yves-Alexis Perez <corsac@corsac.net>
Link: https://lore.kernel.org/linux-usb/CAAn0qaXmysJ9vx3ZEMkViv_B19ju-_ExN8Yn_uSefxpjS6g4Lw@mail.gmail.com/
Link: https://github.com/libimobiledevice/libimobiledevice/issues/1038
Link: https://lore.kernel.org/r/20201119172439.94988-1-corsac@corsac.net
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/ipheth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index 8c01fbf68a895..345576f1a7470 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -59,7 +59,7 @@
 #define IPHETH_USBINTF_SUBCLASS 253
 #define IPHETH_USBINTF_PROTO    1
 
-#define IPHETH_BUF_SIZE         1516
+#define IPHETH_BUF_SIZE         1514
 #define IPHETH_IP_ALIGN		2	/* padding at front of URB */
 #define IPHETH_TX_TIMEOUT       (5 * HZ)
 
-- 
2.27.0

