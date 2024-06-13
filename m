Return-Path: <linux-usb+bounces-11267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77593906934
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 11:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 221592862B1
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 09:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BA61411C1;
	Thu, 13 Jun 2024 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F5c4pI2A"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20713A41A
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 09:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271963; cv=none; b=kVXhJbT2uXPIcdtBA7GWtxP0RkllV5oC/UhelATTfRlXyfXvyNXPyNXE0vEckGQPootQWvOUsSLIA7xcUjCVuFV4RJNOrZXT4oU5+vVqawmPwn+4VyGwWCBr+sV9pJKqRYIW1udgaWAOlGdasGBizHiqO8LuZNYxOoXtNGictD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271963; c=relaxed/simple;
	bh=HBTxYj7hSb7vADSO2DhC2kKfnMQmixkYdyntaGXn0JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jb3OpuI3qNoThSZRub8eHaOSUvsfFCLcFiNAV1Y1GEEqr88pBdqGa8TV2NXNaM8LI6Ib/z+BZmUoighWUdnYOFl7SwekNkII0LN6PnZtAyiVkswJ4M0QKfP0zADlRmKmOjmUrToZlwbCcT0LuUOdy6LWvZ9YHiKmpUdjnJ9sIkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F5c4pI2A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718271960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3tyKWNDm8K+z1bqT8uezMkjcvOydkUdTtsMuG8yW+Z0=;
	b=F5c4pI2AzLxJbA6JfeOYSF7O0jQduEtDiqmjaGCwehtQd4F+fbLS5LrHc4YBK6EpDpUqfS
	d2DWKjTLS+CmgK+YAAoTdJfFhxhkjayxSWfcXylqIFQTNg4wShCXa62d5YMYBc0g+/tf53
	aVYqIbbKY7kqP6P47OyP0YQsiyQuwvI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-hOchQgmBMNu8Wpx5P95fuQ-1; Thu,
 13 Jun 2024 05:45:56 -0400
X-MC-Unique: hOchQgmBMNu8Wpx5P95fuQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 85EF719560B3;
	Thu, 13 Jun 2024 09:45:54 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.157])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 906DF1955E91;
	Thu, 13 Jun 2024 09:45:48 +0000 (UTC)
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
Date: Thu, 13 Jun 2024 11:45:44 +0200
Message-ID: <20240613094546.508121-1-jtornosm@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hello Yongqin,

After some research  and testing, it seems to happen that if initialization
is slower the second reset from open is needed too.
So, I have been working with some reproducers and I think I have the
solution for detecting when there is a problem.
If you can test it in your real environment that would be great.

Here the patch on the latest version of the file:
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

In addition, I have fixed the logs to show the link correclty.

If this is ok, I will submit the patch.

Thanks

Best regards
José Ignacio


