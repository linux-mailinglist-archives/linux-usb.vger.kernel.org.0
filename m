Return-Path: <linux-usb+bounces-11268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF00906982
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 11:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 121E928519D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 09:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E851411F8;
	Thu, 13 Jun 2024 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VDSuFkkB"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11241411C7
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272760; cv=none; b=L/CRjogGkQ4HQ5ntPRIeirQxPewN058/SkcMIBNqQQ45lOXWxF6xclcAt9A+t6yJzSZluNnGI9u8rzD9TlxLEuVtgLgB3Nw2DMLvp0avRsZznRJ45zOSA5brvLdNzz14RKEVWmlVDklnG1Rae4fNblbHNHpzSU4BqEbgwmgPd0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272760; c=relaxed/simple;
	bh=jCiq080FY8/GLZ3f85CnJwt8lnALYICND+Kr+0wWgCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XeqEWj6eyddZ0r1oSP5HTnpC/QEzsK9BNfPsM92Qq4u+rgQgpzEG4WBEjM8YF1VnWZTRdI53Tuy5nJE8YO3h8jXKxfpeyOd0FUATw/ZsaMP7/YRxbbozzCfUJy6fzrzRwWrVr2Gya1Tlgv5oa6PSgb7HYhZ4yBL2qDIadFTrfLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VDSuFkkB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718272757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V8U7PlezzDV+xaQgoC4Cin990sme5WLS2JK3q11wSEk=;
	b=VDSuFkkBbd5EVen6sP7gfCOBXtuE3sCAaWIEcBaEsdJql7Z6+r5rbadP3KEqQ1shu8PQ28
	RYWrBqalsOAsNcow4qjMDCUMgrJCYM3VW+yOU9uqe9t8MJeWkV5jdH50R1z1PkIvHpaHME
	uQHK6hL6/r+EVsewBuB9sqpI7Lp7Ehw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-0TgEbf4qMsuYAn4dE498RQ-1; Thu,
 13 Jun 2024 05:59:11 -0400
X-MC-Unique: 0TgEbf4qMsuYAn4dE498RQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5510019560B5;
	Thu, 13 Jun 2024 09:59:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.157])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E389A19560AA;
	Thu, 13 Jun 2024 09:59:02 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: yongqin.liu@linaro.org
Cc: amit.pundir@linaro.org,
	davem@davemloft.net,
	edumazet@google.com,
	inventor500@vivaldi.net,
	jstultz@google.com,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	stable@vger.kernel.org,
	sumit.semwal@linaro.org
Subject: Re: [PATCH] net: usb: ax88179_178a: fix link status when link is set to down/up
Date: Thu, 13 Jun 2024 11:59:00 +0200
Message-ID: <20240613095901.508753-1-jtornosm@redhat.com>
In-Reply-To: <CAMSo37U3Pree8XbHNBOzNXhFAiPss+8FQms1bLy06xeMeWfTcg@mail.gmail.com>
References: <CAMSo37U3Pree8XbHNBOzNXhFAiPss+8FQms1bLy06xeMeWfTcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hello again,

There was a problem copying the patch, sorry, here the good one:

$ git diff drivers/net/usb/ax88179_178a.c
diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 51c295e1e823..60357796be99 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -174,7 +174,6 @@ struct ax88179_data {
        u32 wol_supported;
        u32 wolopts;
        u8 disconnecting;
-       u8 initialized;
 };
 
 struct ax88179_int_data {
@@ -327,7 +326,8 @@ static void ax88179_status(struct usbnet *dev, struct urb *urb)
 
        if (netif_carrier_ok(dev->net) != link) {
                usbnet_link_change(dev, link, 1);
-               netdev_info(dev->net, "ax88179 - Link status is: %d\n", link);
+               if (!link)
+                       netdev_info(dev->net, "ax88179 - Link status is: %d\n", link);
        }
 }
 
@@ -1543,6 +1543,7 @@ static int ax88179_link_reset(struct usbnet *dev)
                         GMII_PHY_PHYSR, 2, &tmp16);
 
        if (!(tmp16 & GMII_PHY_PHYSR_LINK)) {
+               netdev_info(dev->net, "ax88179 - Link status is: 0\n");
                return 0;
        } else if (GMII_PHY_PHYSR_GIGA == (tmp16 & GMII_PHY_PHYSR_SMASK)) {
                mode |= AX_MEDIUM_GIGAMODE | AX_MEDIUM_EN_125MHZ;
@@ -1580,6 +1581,8 @@ static int ax88179_link_reset(struct usbnet *dev)
 
        netif_carrier_on(dev->net);
 
+       netdev_info(dev->net, "ax88179 - Link status is: 1\n");
+
        return 0;
 }
 
@@ -1678,12 +1681,21 @@ static int ax88179_reset(struct usbnet *dev)
 
 static int ax88179_net_reset(struct usbnet *dev)
 {
-       struct ax88179_data *ax179_data = dev->driver_priv;
+       u16 tmp16;
 
-       if (ax179_data->initialized)
+       ax88179_read_cmd(dev, AX_ACCESS_PHY, AX88179_PHY_ID, GMII_PHY_PHYSR,
+                        2, &tmp16);
+       if (tmp16) {
+               ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
+                                2, 2, &tmp16);
+               if (!(tmp16 & AX_MEDIUM_RECEIVE_EN)) {
+                       tmp16 |= AX_MEDIUM_RECEIVE_EN;
+                       ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_MEDIUM_STATUS_MODE,
+                                         2, 2, &tmp16);
+               }
+       } else {
                ax88179_reset(dev);
-       else
-               ax179_data->initialized = 1;
+       }
 
        return 0;
 }

Best regards
José Ignacio


