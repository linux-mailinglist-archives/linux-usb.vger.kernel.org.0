Return-Path: <linux-usb+bounces-8432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFCA88C95F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 17:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4550D301C1C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 16:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4197916427;
	Tue, 26 Mar 2024 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eEARvs+O"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB5C3217
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 16:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711470719; cv=none; b=S+gHbz2VUFlLl+9QPAWWJECJldLaGazC5FrcRmy/iYENH1NOu/FoIYmVw9pr7L0LSsLK7QzHwktfmQYb6v19Y6X2KYiiGZRLy2cJa9D/4YgZLpD+S3nAloQ1pBc0F2m31nzsnwzt2qsUnkKqLeeLJkQgT4dHsbnsiZ+tHb+77lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711470719; c=relaxed/simple;
	bh=+zJiSFJrk/XKOS5ppHx/5iDVjPDpD/O/rYYxY9qcQBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7HrZ8TSgNdbEK+zrxGUIJiv3lC0jQ+Tt2va+/5B0B2858zUFgRElqTMpF3wkj85oiV2arqUCujQHnyxbd4yLw7HQx7EYxjBBVVtA2G47BUvief4ZlZVgH1jVLeAPo/K6BQAd5c+gslVOkhb6IgosOrGxbLOFY4+PIYrcAh0lAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eEARvs+O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711470717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIMLqIfssOdXqJZFHxIfokX5il4SRVSK3jc88qoSirw=;
	b=eEARvs+Om2Pow+R66sF9VmfemBBv3ZAVjh5aMkwgjDdnETThryBEQqZoggSOzIgl1niDqE
	8xHHoziGMmyYcV/AA10sLYLmGaqKyoNciemvbL4aqVj4RJi/mLxEO8cgE3UjCAN98fq+aH
	NIW2s6leIaV6lPHGC8Kz4QRuagwzReY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-ol52tx1iOu-jYNW4xbojQg-1; Tue, 26 Mar 2024 12:31:55 -0400
X-MC-Unique: ol52tx1iOu-jYNW4xbojQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C29A800274;
	Tue, 26 Mar 2024 16:31:55 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84280C15772;
	Tue, 26 Mar 2024 16:31:52 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: horms@kernel.org
Cc: dave.stevenson@raspberrypi.com,
	davem@davemloft.net,
	edumazet@google.com,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] net: usb: ax88179_178a: non necessary second random mac address
Date: Tue, 26 Mar 2024 17:31:07 +0100
Message-ID: <20240326163107.306612-1-jtornosm@redhat.com>
In-Reply-To: <20240326092459.GG403975@kernel.org>
References: <20240326092459.GG403975@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

If the mac address can not be read from the device registers or the
devicetree, a random address is generated, but this was already done from
usbnet_probe, so it is not necessary to call eth_hw_addr_random from here
again to generate another random address.

Indeed, when reset was also executed from bind, generate another random mac
address invalidated the check from usbnet_probe to configure if the assigned
mac address for the interface was random or not, because it is comparing
with the initial generated random address. Now, with only a reset from open
operation, it is just a harmless simplification.

cc: stable@vger.kernel.org # 6.6+
Fixes: 9fb137aef34e ("net: usb: ax88179_178a: allow optionally getting mac address from device tree")
Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
---
V1 -> V2:
- Split the fix and the improvement in two patches and keep curly-brackets
as Simon Horman suggests.

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


