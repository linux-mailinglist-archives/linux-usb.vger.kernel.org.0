Return-Path: <linux-usb+bounces-8691-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B38938E7
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 10:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D550B20E75
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 08:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57F2DF4A;
	Mon,  1 Apr 2024 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BDVImgV4"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B910D28D
	for <linux-usb@vger.kernel.org>; Mon,  1 Apr 2024 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711959629; cv=none; b=BXZhCH5NijP5psEXulGgS/1/wgliGQIYfKfqg+nimu8VDmToELxaB9ult3AVQ8KHpXLP+SPTwC2Vk7qQxCBp7mcs+MK5KEEmN/knMlcCXDnWvyaPPD9VX2vI+5cnBiMWYHJnpw6mUGKiN68rlYpijaVLsg8QculYSQPPgBznWio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711959629; c=relaxed/simple;
	bh=AYfbXjqn1csMfWieLVj4OX3kYZy+q/Ro04Eoi583V2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H1L/USu7RtyHnj5v+hmi7swr2XNyROSwFJ9u/vrpoMkCG7SgapupkjrzsrGfpfW/thXQfwAm53gKNBrbyDZXirTMXOatiiYyUpxX/4VzE3Si9xEn3EsvSxYMZQ55eqJJ244x8GLzmw5vmootLGMUaBMhPLtuX3P8tVgQRMpdMUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BDVImgV4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711959626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ykcYgNvqI+rrvzzN7v7HbAkkijLEL7CWTEdxTlOuJ/U=;
	b=BDVImgV47seDmWU7geWKUcf71c/GcCe1MP/EMPMxTxP5eiB4SP2HGwji410/JYPImqiBnC
	W/3bNnNXu7z0yIsdzjm6S5CVKoaDtCczwgmVQk4fWWqPSNrE0F6LugXp8RVBPZ2mrcKS/C
	vzn0mSdELNyA3nHKDJM6nSnsRpSfg2M=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-h5FlAcv-NCW53rjv43MBeA-1; Mon,
 01 Apr 2024 04:20:22 -0400
X-MC-Unique: h5FlAcv-NCW53rjv43MBeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F49F3C0E641;
	Mon,  1 Apr 2024 08:20:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DB778173;
	Mon,  1 Apr 2024 08:20:19 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	stable@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH net v3] net: usb: ax88179_178a: avoid the interface always configured as random address
Date: Mon,  1 Apr 2024 10:19:50 +0200
Message-ID: <20240401082004.7412-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

After the commit d2689b6a86b9 ("net: usb: ax88179_178a: avoid two
consecutive device resets"), reset is not executed from bind operation and
mac address is not read from the device registers or the devicetree at that
moment. Since the check to configure if the assigned mac address is random
or not for the interface, happens after the bind operation from
usbnet_probe, the interface keeps configured as random address, although the
address is correctly read and set during open operation (the only reset
now).

In order to keep only one reset for the device and to avoid the interface
always configured as random address, after reset, configure correctly the
suitable field from the driver, if the mac address is read successfully from
the device registers or the devicetree.

cc: stable@vger.kernel.org # 6.6+
Fixes: d2689b6a86b9 ("net: usb: ax88179_178a: avoid two consecutive device resets")
Reported-by: Dave Stevenson  <dave.stevenson@raspberrypi.com>
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v3:
  - Send the patch separately to net.
v2:
  - Split the fix and the improvement in two patches as Simon Horman
suggests.
v1: https://lore.kernel.org/netdev/20240325173155.671807-1-jtornosm@redhat.com/

 drivers/net/usb/ax88179_178a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 88e084534853..8ca8ace93d9c 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1273,6 +1273,7 @@ static void ax88179_get_mac_addr(struct usbnet *dev)
 
 	if (is_valid_ether_addr(mac)) {
 		eth_hw_addr_set(dev->net, mac);
+		dev->net->addr_assign_type = NET_ADDR_PERM;
 	} else {
 		netdev_info(dev->net, "invalid MAC address, using random\n");
 		eth_hw_addr_random(dev->net);
-- 
2.44.0


