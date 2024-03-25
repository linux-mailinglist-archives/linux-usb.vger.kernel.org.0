Return-Path: <linux-usb+bounces-8315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033D88AD17
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 19:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C12711C3AB8F
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 18:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D60612FB3F;
	Mon, 25 Mar 2024 17:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5n8YM+t"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570D7128377
	for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711387934; cv=none; b=YHC994WuOfr4nLDvol2LJUXtCsRK96DugPQFFClbMElj9DLhIgvZ9HCzDb5+c9UN98AZezwPR6uBCeNtNtvNXE0NbL5E535/86LUmHO5QN6Et27rxPN3jIGYHx7zlqbf0aKnfEXd/mJ8vgK5WRUgV5eyx+7jpOL+KR8/4vDiI34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711387934; c=relaxed/simple;
	bh=FXyxlmR8zNtiu+7xjerTxt2yhCla7s0tw3akNUSkR0A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gWwd17wNqovZuV7Z0poMbGaX/jy6nXm4e6QZ8RNLVnDxxzBEUuAR6gfmoK6SZzdUNCBfgE9PltS9/PNpsAwF+3w5S88oSjsSbE4ylatCr9IY+/wtCvBG74MGegUkuXr8MQLB3PH6idD8Db0RMRejGEHx1/TahdyirGXi2Lf8iXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5n8YM+t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711387931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SoW110bKeKqtboiHE3EMW8oe9lEUvToKDhKmlYc4Cz4=;
	b=J5n8YM+tQNBX61V4LnHfSdKdqcQnNASSdvVjYu619rMP2hqLuFRNPIaQ9Nsl3fsnk3rhrQ
	rokx+Z4HeIhpqHjU9on05YCiNFkvOIVmnHHjtnHnYsDTbloLVqjzmk/nsXU8woeizqPus2
	k+u3dQoxZy3ntiMXzkzGPDg0c5/og1M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-XgOVaw1bOr-paKfqaXxd_A-1; Mon, 25 Mar 2024 13:32:06 -0400
X-MC-Unique: XgOVaw1bOr-paKfqaXxd_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43BF0185A786;
	Mon, 25 Mar 2024 17:32:06 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 976372166B31;
	Mon, 25 Mar 2024 17:32:03 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	stable@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH] net: usb: ax88179_178a: avoid the interface always configured as random address
Date: Mon, 25 Mar 2024 18:31:50 +0100
Message-ID: <20240325173155.671807-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

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

In addition, if mac address can not be read from the driver, a random
address is configured again, so it is not necessary to call
eth_hw_addr_random from here. Indeed, in this situtatuon, when reset was
also executed from bind, this was invalidating the check to configure if the
assigned mac address for the interface was random or not.

cc: stable@vger.kernel.org # 6.6+
Fixes: d2689b6a86b9 ("net: usb: ax88179_178a: avoid two consecutive device resets")
Reported-by: Dave Stevenson  <dave.stevenson@raspberrypi.com>
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
 drivers/net/usb/ax88179_178a.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 88e084534853..d2324cc02461 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1273,10 +1273,9 @@ static void ax88179_get_mac_addr(struct usbnet *dev)
 
 	if (is_valid_ether_addr(mac)) {
 		eth_hw_addr_set(dev->net, mac);
-	} else {
+		dev->net->addr_assign_type = NET_ADDR_PERM;
+	} else
 		netdev_info(dev->net, "invalid MAC address, using random\n");
-		eth_hw_addr_random(dev->net);
-	}
 
 	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_NODE_ID, ETH_ALEN, ETH_ALEN,
 			  dev->net->dev_addr);
-- 
2.44.0


