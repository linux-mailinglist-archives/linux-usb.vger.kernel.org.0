Return-Path: <linux-usb+bounces-16433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 214069A48CB
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 23:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50AC21C23052
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 21:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEC218DF7C;
	Fri, 18 Oct 2024 21:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b="xdkWELzP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mr4.vodafonemail.de (mr4.vodafonemail.de [145.253.228.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D469818DF71
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 21:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729286130; cv=none; b=QcsWr5CgeSSEuX7ZwvV/msNgt1AEuvgs3grxqzEChhsVdEq9vODdoDUC5LO9wLxXS1/agrL50lH/7+/TsFmtUyJLuG4OL7rrHGMI8xNFAdkmAmtmqI4A1LcnVqPn0istAZUL1acmxTOkQrMq+iO/Uo0hyU8VDIaX1nKO4xFWKU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729286130; c=relaxed/simple;
	bh=KzvAb7w5HrPlphyMTJpPmFzu4EatsvJt75TwNDsd1vI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jTJKuF5GD9KpT1Qul81tjDfrpN6tHanPyimhulofR3N/Zwo1WpK555TNnhibpHTSB+JdQhOWPYLa3fYqzlu5s2Qi84a4lfPeZUYgAxhcMSWnD5FrjJixY6hsI0MoqALoZF9jEclkcyqk9nwhG0DkkZoV0B+5BWzYX7q4PfcNYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arcor.de; spf=pass smtp.mailfrom=arcor.de; dkim=pass (1024-bit key) header.d=arcor.de header.i=@arcor.de header.b=xdkWELzP; arc=none smtp.client-ip=145.253.228.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arcor.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arcor.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
	s=vfde-mb-mr2-23sep; t=1729285642;
	bh=au9LnIOagWT+Rv4GMpuAaBl2WcqmbrBiV9qebnRTTng=;
	h=Date:From:To:Subject:Message-ID:Content-Type:From;
	b=xdkWELzPalpwkiSzOPDwD+lal+/OoQuFL075AlOEGF35gecaYoDWwmotx/e/8spaZ
	 ed9ARBIWqitHP8vH/4fFnFDmMcceBXgj3Qfs7wi4LCAwk5Vc1p5ZROGvnbN1gr9Tk4
	 HnYMJuiKqHuTsgVBF9y/9D3cW/QKHq53320p80vk=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr4.vodafonemail.de (Postfix) with ESMTPS id 4XVcj637mfz1y4J;
	Fri, 18 Oct 2024 21:07:22 +0000 (UTC)
Received: from arcor.de (p57a23786.dip0.t-ipconnect.de [87.162.55.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4XVchz1H8sz8sWs;
	Fri, 18 Oct 2024 21:07:12 +0000 (UTC)
Date: Fri, 18 Oct 2024 23:07:06 +0200
From: Reinhard Speyerer <rspmn@arcor.de>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: option: add Fibocom FG132 0x0112 composition
Message-ID: <ZxLN-sb0ujuap36t@arcor.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 2183
X-purgate-ID: 155817::1729285638-48FF8441-B011F77C/0/0

Add Fibocom FG132 0x0112 composition:

T:  Bus=03 Lev=02 Prnt=06 Port=01 Cnt=02 Dev#= 10 Spd=12   MxCh= 0
D:  Ver= 2.01 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=2cb7 ProdID=0112 Rev= 5.15
S:  Manufacturer=Fibocom Wireless Inc.
S:  Product=Fibocom Module
S:  SerialNumber=xxxxxxxx
C:* #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=84(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=86(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms

Signed-off-by: Reinhard Speyerer <rspmn@arcor.de>
---
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index eb0731992ca9..756a6ba06ec2 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2312,6 +2312,9 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x010b, 0xff, 0xff, 0x30) },	/* Fibocom FG150 Diag */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x010b, 0xff, 0, 0) },		/* Fibocom FG150 AT */
 	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0111, 0xff) },			/* Fibocom FM160 (MBIM mode) */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x0112, 0xff, 0xff, 0x30) },	/* Fibocom FG132 DIAG */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x0112, 0xff, 0xff, 0x40) },	/* Fibocom FG132 AT */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x0112, 0xff, 0, 0) },		/* Fibocom FG132 NMEA */
 	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0115, 0xff),			/* Fibocom FM135 (laptop MBIM) */
 	  .driver_info = RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x01a0, 0xff) },			/* Fibocom NL668-AM/NL652-EU (laptop MBIM) */

