Return-Path: <linux-usb+bounces-14879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B3972ACE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 09:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44E85285D6B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 07:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E9F17C9EB;
	Tue, 10 Sep 2024 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="iHUWrIUr"
X-Original-To: linux-usb@vger.kernel.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8616552F71
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.30.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725953482; cv=none; b=rtSZshZ9hG+cu/+Rj+rPlajuVzPhdAsPkNhkj7uME4fLtrh3Xua3YZuMtBr/MnlDl/qNgxbgZxAu8IGfvf2Em7HW30gczp7w/+VZsL8xmhKwhYPv9rD1xFRQYiZQEYgom+Lrl06GJ6B0/ZAVdWjlinr+ehyz/YTLCc/bRB735XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725953482; c=relaxed/simple;
	bh=8cofkmCq7dqA1taowLt9kl0V78YG5C3uOW9gw/PMHPc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZWppKUdSFPO3lkRTAo+qj3qmN5kvfWMlzJ9EvpgcPCl+sz3Ac2SewH/P33aA0maNzkVj0mH6swOsZa3fDGihOgJQ+PMwdfNz8Zo0uLOBXzQ+Mej47p1xwLEgcNzVxKB3A3alQ0KLRSOJWu4p8JOB3VNyhMcEmW1YsD9VIe3qOOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=iHUWrIUr; arc=none smtp.client-ip=188.40.30.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=atESwYaRQBYrvn2R+xblv9DMu+fN/o2RgLu6lY7fIQs=; b=iHUWrIUrkdtUbZgsJdi7CdVtCW
	h9dSjxdvFJk3f5/9/q4ehm2mmuGEKw0/qtbojDy+TvmZmFpALZclEjN5uLs+Kg5pDWj7HuDCk9l+r
	jETXCWjFu4wekwePz4ap6gEC/YlFjRv+SF6GmHWhaeV5QNn8LyQ7UYnjo8eIszYXbpthNakUYn3Tn
	IPgr/foZkiTuDe+hUOpUNUEie9yRQHvoLCxYJNUKUFnNKHzVTVdwe3Ir7Phk0uTrzNIqlpNSZFbsZ
	c5wQFpDO+mjfVCzahgWv/tKOgIZkNFTkE3U6E5j7bYD5XmliB4DytATM7kUZzN7BVTJ3DymQgBIhS
	SJmJi9hw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <benjamin@geanix.com>)
	id 1snvLK-000Atp-Bq; Tue, 10 Sep 2024 09:31:18 +0200
Received: from [185.17.218.86] (helo=benjamin-ThinkPad.geanix.com)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <benjamin@geanix.com>)
	id 1snvLK-000LeN-28;
	Tue, 10 Sep 2024 09:31:18 +0200
From: "Benjamin B. Frost" <benjamin@geanix.com>
To: linux-usb@vger.kernel.org
Cc: sean@geanix.com,
	martin@geanix.com,
	johan@kernel.org,
	"Benjamin B. Frost" <benjamin@geanix.com>
Subject: [PATCH] USB: serial: option: support for Quectel EG916Q-GL
Date: Tue, 10 Sep 2024 09:30:50 +0200
Message-Id: <20240910073050.2619669-1-benjamin@geanix.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: benjamin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27393/Mon Sep  9 10:29:16 2024)

Add Quectel EM916Q-GL with product ID 0x6007

T:  Bus=01 Lev=02 Prnt=02 Port=01 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=2c7c ProdID=6007 Rev= 2.00
S:  Manufacturer=Quectel
S:  Product=EG916Q-GL
C:* #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=200mA
A:  FirstIf#= 4 IfCount= 2 Cls=02(comm.) Sub=06 Prot=00
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=82(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=84(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E:  Ad=86(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=option
E:  Ad=88(I) Atr=03(Int.) MxPS=  32 Ivl=32ms
I:* If#= 5 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=option
I:  If#= 5 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=option
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Benjamin B. Frost <benjamin@geanix.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 176f38750ad5..8ff9f1435c2f 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -279,6 +279,7 @@ static void option_instat_callback(struct urb *urb);
 #define QUECTEL_PRODUCT_EG912Y			0x6001
 #define QUECTEL_PRODUCT_EC200S_CN		0x6002
 #define QUECTEL_PRODUCT_EC200A			0x6005
+#define QUECTEL_PRODUCT_EG916Q			0x6007
 #define QUECTEL_PRODUCT_EM061K_LWW		0x6008
 #define QUECTEL_PRODUCT_EM061K_LCN		0x6009
 #define QUECTEL_PRODUCT_EC200T			0x6026
@@ -1271,6 +1272,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EC200T, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG912Y, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_RM500K, 0xff, 0x00, 0x00) },
+	{ USB_DEVICE(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EG916Q) },
 
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },
-- 
2.34.1


