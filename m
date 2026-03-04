Return-Path: <linux-usb+bounces-33977-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OpEGSU3qGkTqgAAu9opvQ
	(envelope-from <linux-usb+bounces-33977-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 14:44:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA5200A31
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 14:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 335E330093B4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C23836EAB3;
	Wed,  4 Mar 2026 13:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Agl4nI8p"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD0F1A681F
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 13:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772631828; cv=none; b=tEgSWbJKoNbmD5z+00W1WtjZjrEAf8x27OvL+ATkEnz9qp4XlxDDs55/6++YycSefrkdQTyZCNHx0xsOhxhA1l10lpUAQ+g8PL0+oyJDURL9DOmV5A/jEvfvLxsiQkLkUUdLyexEPGQKH5YMJ1LFp7JqTyV/RmxSc++94AMuwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772631828; c=relaxed/simple;
	bh=iEr7a1FaNizmcVWs5IiokHhBFJTdnx5UZFnO+Jh4UeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKraZw7TYgsC4wSJ+MYfpIB0ilPjhHs9dbkDABZdlmA+mtfLeNPHG2XVC45Yg0dlbXZIViNSmvCysf8/2w32XFRDDeB2W2l4qTeCKDy4Am1Gb93vGiH53BlWsbp4T+EsJ1I1g9+uQOpfHiNbI59ZNvdbF+6g7Yl/KUwOFZqk4oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Agl4nI8p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772631826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VT7U0xbru4/tZbnrd2xzns4lwvF3UoTO5CKY7RnOgO4=;
	b=Agl4nI8p6I7vKKb/Ac6wT+OXrOSrKLAMGb/lpdkvNe29EO7ziOz1/o1UgYzb8RAge71J9c
	MpeCtdmli3dO1NrizndQkD1+mmxu+3nZ7vrfAdw4X7KcPWUDKSkUuSiVWRnRqEYs9SqpvO
	xXIJnGqOadV0jhfHgS1BYDgjQ26lgyQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-w5wiFDbfP3qdJA6QRW7PXA-1; Wed,
 04 Mar 2026 08:43:44 -0500
X-MC-Unique: w5wiFDbfP3qdJA6QRW7PXA-1
X-Mimecast-MFC-AGG-ID: w5wiFDbfP3qdJA6QRW7PXA_1772631823
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31C4B1956046;
	Wed,  4 Mar 2026 13:43:43 +0000 (UTC)
Received: from lenovo-t14s.redhat.com (unknown [10.44.32.107])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 54734195608E;
	Wed,  4 Mar 2026 13:43:40 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Koen Vandeputte <koen.vandeputte@citymesh.com>,
	Daniele Palmas <dnlplm@gmail.com>,
	linux-kernel@vger.kernel.org,
	Stefano Brivio <sbrivio@redhat.com>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] qmi_wwan: allow max_mtu above hard_mtu to control rx_urb_size
Date: Wed,  4 Mar 2026 14:43:38 +0100
Message-ID: <20260304134338.1785002-1-lvivier@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rspamd-Queue-Id: 78EA5200A31
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33977-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[citymesh.com,gmail.com,vger.kernel.org,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lvivier@redhat.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citymesh.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Commit c7159e960f14 ("usbnet: limit max_mtu based on device's hard_mtu")
capped net->max_mtu to the device's hard_mtu in usbnet_probe(). While
this correctly prevents oversized packets on standard USB network
devices, it breaks the qmi_wwan driver.

qmi_wwan relies on userspace (e.g. ModemManager) setting a large MTU on
the wwan0 interface to configure rx_urb_size via usbnet_change_mtu().
QMI modems negotiate USB transfer sizes of 16,383 or 32,767 bytes, and
the USB receive buffers must be sized accordingly. With max_mtu capped
to hard_mtu (~1500 bytes), userspace can no longer raise the MTU, the
receive buffers remain small, and download speeds drop from >300 Mbps
to ~0.8 Mbps.

Introduce a FLAG_NOMAXMTU driver flag that allows individual usbnet
drivers to opt out of the max_mtu cap. Set this flag in qmi_wwan's
driver_info structures to restore the previous behavior for QMI devices,
while keeping the safety fix in place for all other usbnet drivers.

Fixes: c7159e960f14 ("usbnet: limit max_mtu based on device's hard_mtu")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/lkml/CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com/
Reported-by: Koen Vandeputte <koen.vandeputte@citymesh.com>
Tested-by: Daniele Palmas <dnlplm@gmail.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---

Notes:
    v2: Add cc: to stable and Link:

 drivers/net/usb/qmi_wwan.c | 4 ++--
 drivers/net/usb/usbnet.c   | 7 ++++---
 include/linux/usb/usbnet.h | 1 +
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 3a4985b582cb..05acac10cd2b 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -928,7 +928,7 @@ static int qmi_wwan_resume(struct usb_interface *intf)
 
 static const struct driver_info	qmi_wwan_info = {
 	.description	= "WWAN/QMI device",
-	.flags		= FLAG_WWAN | FLAG_SEND_ZLP,
+	.flags		= FLAG_WWAN | FLAG_NOMAXMTU | FLAG_SEND_ZLP,
 	.bind		= qmi_wwan_bind,
 	.unbind		= qmi_wwan_unbind,
 	.manage_power	= qmi_wwan_manage_power,
@@ -937,7 +937,7 @@ static const struct driver_info	qmi_wwan_info = {
 
 static const struct driver_info	qmi_wwan_info_quirk_dtr = {
 	.description	= "WWAN/QMI device",
-	.flags		= FLAG_WWAN | FLAG_SEND_ZLP,
+	.flags		= FLAG_WWAN | FLAG_NOMAXMTU | FLAG_SEND_ZLP,
 	.bind		= qmi_wwan_bind,
 	.unbind		= qmi_wwan_unbind,
 	.manage_power	= qmi_wwan_manage_power,
diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index ed86ba87ca4e..b72ba0803392 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1829,11 +1829,12 @@ usbnet_probe(struct usb_interface *udev, const struct usb_device_id *prod)
 		if ((dev->driver_info->flags & FLAG_NOARP) != 0)
 			net->flags |= IFF_NOARP;
 
-		if (net->max_mtu > (dev->hard_mtu - net->hard_header_len))
+		if ((dev->driver_info->flags & FLAG_NOMAXMTU) == 0 &&
+		    net->max_mtu > (dev->hard_mtu - net->hard_header_len))
 			net->max_mtu = dev->hard_mtu - net->hard_header_len;
 
-		if (net->mtu > net->max_mtu)
-			net->mtu = net->max_mtu;
+		if (net->mtu > (dev->hard_mtu - net->hard_header_len))
+			net->mtu = dev->hard_mtu - net->hard_header_len;
 
 	} else if (!info->in || !info->out)
 		status = usbnet_get_endpoints(dev, udev);
diff --git a/include/linux/usb/usbnet.h b/include/linux/usb/usbnet.h
index b0e84896e6ac..bbf799ccf3b3 100644
--- a/include/linux/usb/usbnet.h
+++ b/include/linux/usb/usbnet.h
@@ -132,6 +132,7 @@ struct driver_info {
 #define FLAG_MULTI_PACKET	0x2000
 #define FLAG_RX_ASSEMBLE	0x4000	/* rx packets may span >1 frames */
 #define FLAG_NOARP		0x8000	/* device can't do ARP */
+#define FLAG_NOMAXMTU		0x10000	/* allow max_mtu above hard_mtu */
 
 	/* init device ... can sleep, or cause probe() failure */
 	int	(*bind)(struct usbnet *, struct usb_interface *);
-- 
2.53.0


