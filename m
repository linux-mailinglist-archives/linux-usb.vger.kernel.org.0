Return-Path: <linux-usb+bounces-8692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22B893905
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 10:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2595F281C24
	for <lists+linux-usb@lfdr.de>; Mon,  1 Apr 2024 08:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D83EDF46;
	Mon,  1 Apr 2024 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M7e76Uqi"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575C7CA4A
	for <linux-usb@vger.kernel.org>; Mon,  1 Apr 2024 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711960085; cv=none; b=iVeS/HF2J9B/BEFVNc+T6rijFv3kP4ZSWFe0zf+U7iAag0Ci8biVIK4EjPZhazmTv9YQ2RxFHaw2mzH/z2bZ3MTBEjCWGwk60SwV5sIFA6jB40NooHPOKFKZhV+LPQNxRaavDocMMA1U007NbSyQo7vd0dPAKG7UopGiR15/xv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711960085; c=relaxed/simple;
	bh=agXxZwKpjsRdYdSSi+1mbrytFe5+985cFwiZHMvbFRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITw0BzQOJTis9I3g3l4T9yZ/eu+ubmI4Td8ZSfmL11dPSb7uAFLvN18HwFC2EWuzcLNKn7a/DYpAmwJMPTQzwjNWbHY3T1GHEu8S82iF1RhfYC6fBzNJ5tVPPWkdoNhqnHQub+FCvzhdJU1lH8XSJQQZKzLoulGPE35/Cl2aGaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M7e76Uqi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711960083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tSr/lVIfIGvT1+aJOWWnrxhQC1YOeeTlOj48kgZP5e0=;
	b=M7e76UqinuoXARlgGDY9cepAtQZ+7IBm1eTq9tst0aMicMYi637JgsJzUmgMdwgmtvDluW
	xk3Q4OdaWoIgvq/b+jhN733FmZFxH6y7zLCEVMOFngsucpvj+pKQuAXgUxPEvRmJ9hSy/I
	74deSQZL0xY7p4NC6fNCw+trzfxmZVU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-3vQyGHplM3Gu5U3S2v6uwg-1; Mon,
 01 Apr 2024 04:28:00 -0400
X-MC-Unique: 3vQyGHplM3Gu5U3S2v6uwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C26F3802124;
	Mon,  1 Apr 2024 08:27:59 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B11C112C5;
	Mon,  1 Apr 2024 08:27:56 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH net-next v3] net: usb: ax88179_178a: non necessary second random mac address
Date: Mon,  1 Apr 2024 10:27:25 +0200
Message-ID: <20240401082746.7654-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

If the mac address can not be read from the device registers or the
devicetree, a random address is generated, but this was already done from
usbnet_probe, so it is not necessary to call eth_hw_addr_random from here
again to generate another random address.

Indeed, when reset was also executed from bind, generate another random mac
address invalidated the check from usbnet_probe to configure if the assigned
mac address for the interface was random or not, because it is comparing
with the initial generated random address. Now, with only a reset from open
operation, it is just a harmless simplification.

Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
v3:
  - Send the patch separately to net-next and remove fixes and stable tags.
v2:
  - Split the fix and the improvement in two patches and keep curly-brackets
as Simon Horman suggests.
v1: https://lore.kernel.org/netdev/20240325173155.671807-1-jtornosm@redhat.com/

 drivers/net/usb/ax88179_178a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 8ca8ace93d9c..08c9b2ab9711 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1276,7 +1276,6 @@ static void ax88179_get_mac_addr(struct usbnet *dev)
 		dev->net->addr_assign_type = NET_ADDR_PERM;
 	} else {
 		netdev_info(dev->net, "invalid MAC address, using random\n");
-		eth_hw_addr_random(dev->net);
 	}
 
 	ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_NODE_ID, ETH_ALEN, ETH_ALEN,
-- 
2.44.0


