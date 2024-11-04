Return-Path: <linux-usb+bounces-17040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654CC9BB234
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 12:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 965C11C21B92
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 11:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3BF81D95BA;
	Mon,  4 Nov 2024 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lis8H2+7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECEA1D90C8;
	Mon,  4 Nov 2024 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717639; cv=none; b=RGk2xJYTu7kwKuJwTtFNfCW1bxG2LFnC6Jf5fTGu0DnEdOAQqGFGwr6A6UQkzUePRuQA5VTSIAWoG95ox2pkXCjCICEKwzhUeiKaTFzNBw2tzVfgVlth1id0qzdeYape9lqnjF8dcZziNjeAg3Vwq5msG0rAI4JVVwdjOGxh/PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717639; c=relaxed/simple;
	bh=QpprjJzz6r7qsmzq8ofXoBAdYQ2nRpHb3oWF4+76lNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i8VKxsLEHFhOzkKx6kgClgI7f7RcG6a3VqZpvLFEZHA4mFpCyu3g1ulhUQ9M1UmZqq0pp5VDRp8+ozbAGuZRyapiRCCC7CP6y6Ppm1KwRwPhUjzL5RrFvw8d3+0C336VXcq1+s8SU/r0+3xQ6NPe2SBRZRmQWQBKg+6ljqIxZZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lis8H2+7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD34C4CED4;
	Mon,  4 Nov 2024 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730717638;
	bh=QpprjJzz6r7qsmzq8ofXoBAdYQ2nRpHb3oWF4+76lNc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lis8H2+72ju0YSFT3ZJ218LQbrfD3ujYuahhy02MMD/n9GfSigH0l5AerR9Q0ofdH
	 U9CBmmYYLbInMITRVvFqdmBTG/B5AJw8xOVDPrmaI3VIcYfRmmeaUbfFnOUkeguBzJ
	 FZqKzWh5QhAdzdimxlMkaJ+kTKrOJfLC1sc92IjPhEnhCfOvE4T2gpjGLd3D4GRUqL
	 ajXGU71cAEhT+ycsZpN3aoDlkt972l+pZhtLWAKNuGakUT7t7S5r7QBH1QP4OQ1EWC
	 yydmK8+jKsMyIGsTSdmhmwdS2g1TEe/ea4mcV3OgIvw5pniStqfKVVAJFLJRadjubE
	 4r9EyAuDSOtgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@gmx.fr>,
	Simon Horman <horms@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	bjorn@mork.no,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 11/11] net: usb: qmi_wwan: add Quectel RG650V
Date: Mon,  4 Nov 2024 05:53:09 -0500
Message-ID: <20241104105324.97393-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241104105324.97393-1-sashal@kernel.org>
References: <20241104105324.97393-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.115
Content-Transfer-Encoding: 8bit

From: Benoît Monin <benoit.monin@gmx.fr>

[ Upstream commit 6b3f18a76be6bbd237c7594cf0bf2912b68084fe ]

Add support for Quectel RG650V which is based on Qualcomm SDX65 chip.
The composition is DIAG / NMEA / AT / AT / QMI.

T: Bus=02 Lev=01 Prnt=01 Port=03 Cnt=01 Dev#=  4 Spd=5000 MxCh= 0
D: Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
P: Vendor=2c7c ProdID=0122 Rev=05.15
S: Manufacturer=Quectel
S: Product=RG650V-EU
S: SerialNumber=xxxxxxx
C: #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=896mA
I: If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E: Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I: If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
I: If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=83(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=9ms
I: If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
E: Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=85(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=9ms
I: If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
E: Ad=05(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=87(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
E: Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=9ms

Signed-off-by: Benoît Monin <benoit.monin@gmx.fr>
Reviewed-by: Simon Horman <horms@kernel.org>
Link: https://patch.msgid.link/20241024151113.53203-1-benoit.monin@gmx.fr
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 72a2c41b9dbf8..c12320e43da31 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1083,6 +1083,7 @@ static const struct usb_device_id products[] = {
 		USB_DEVICE_AND_INTERFACE_INFO(0x03f0, 0x581d, USB_CLASS_VENDOR_SPEC, 1, 7),
 		.driver_info = (unsigned long)&qmi_wwan_info,
 	},
+	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0122)},	/* Quectel RG650V */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0125)},	/* Quectel EC25, EC20 R2.0  Mini PCIe */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0306)},	/* Quectel EP06/EG06/EM06 */
 	{QMI_MATCH_FF_FF_FF(0x2c7c, 0x0512)},	/* Quectel EG12/EM12 */
-- 
2.43.0


