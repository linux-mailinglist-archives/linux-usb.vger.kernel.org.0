Return-Path: <linux-usb+bounces-16771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA01F9B2E1E
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 12:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0BF1C239AC
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 11:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B832038D3;
	Mon, 28 Oct 2024 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUOh814+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B72038BF;
	Mon, 28 Oct 2024 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112815; cv=none; b=o5GWgwVRWzOcDi7InBjJmrKL9w3ZVErsfa3LROdJioGUZTyp7nbxvdcCkiBd2QcnEQ8I+9mRMSwEMePuvx3bI6ype78HhjRj73h4cXiC3WaiU0fXGoERlG6CEARWhXii9GU6jImnI/fq0W5zQXEN8rL/QrCcVUi0weVWj0Ys7Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112815; c=relaxed/simple;
	bh=NcUkA5cfvb0pfMF3MOufdv8obnxCSpleuqmwojTi24g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdbMFKiQD/3Q0sRoqQAjiVB9/tJYRa4Hkp1mof76YE9TZlfRKoEsyKJ+pylID7qyKZ3g1RCtfV6Dkayv+SgkPwPmu8x9123NTIDDDdYNc903MayhAOp/im5h6dErQrjaUzpjcSuWZnPlQ6BwdokmDq7vlNrytKgl6qrQjxm86oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUOh814+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11C5C4CEE7;
	Mon, 28 Oct 2024 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112815;
	bh=NcUkA5cfvb0pfMF3MOufdv8obnxCSpleuqmwojTi24g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NUOh814+oa14DGHyTJqxIq4o+TJ4zRbRIZqo6VEfVfdJ0McJKpUV2uP3Gz/Ud+65X
	 AjGFQGKAsGcJ/TAecciwUnsrLsk6fL+ch66e7RWEa4nkiFLjqJHZGlNz5OglxhseQr
	 YOsY+Z9rAyNqS5o0qcM3oGPqLZjMSz93bmpF2D5rcKXcVy0Fj2krzxlxrQ3T4+axDk
	 YMHPrv5vycT4bEeWoBhgmxhLiAhGtc+8IR76h4JiwRXQkrP7xrKtM+4NlSEmu8syig
	 xXDeceA/5M400Ypm0jjN9Kr1USNJvUBE51OFDOiQsbjDo1IYy5TACQptqZe68RHsVE
	 dDL4duDdtnn4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Reinhard Speyerer <rspmn@arcor.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	bjorn@mork.no,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 4/4] net: usb: qmi_wwan: add Fibocom FG132 0x0112 composition
Date: Mon, 28 Oct 2024 06:53:25 -0400
Message-ID: <20241028105327.3560637-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105327.3560637-1-sashal@kernel.org>
References: <20241028105327.3560637-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.228
Content-Transfer-Encoding: 8bit

From: Reinhard Speyerer <rspmn@arcor.de>

[ Upstream commit 64761c980cbf71fb7a532a8c7299907ea972a88c ]

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

Link: https://patch.msgid.link/ZxLKp5YZDy-OM0-e@arcor.de
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/qmi_wwan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 0a1ab8c30a003..3b1076eea6702 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1360,6 +1360,7 @@ static const struct usb_device_id products[] = {
 	{QMI_FIXED_INTF(0x2c7c, 0x0296, 4)},	/* Quectel BG96 */
 	{QMI_QUIRK_SET_DTR(0x2c7c, 0x030e, 4)},	/* Quectel EM05GV2 */
 	{QMI_QUIRK_SET_DTR(0x2cb7, 0x0104, 4)},	/* Fibocom NL678 series */
+	{QMI_QUIRK_SET_DTR(0x2cb7, 0x0112, 0)},	/* Fibocom FG132 */
 	{QMI_FIXED_INTF(0x0489, 0xe0b4, 0)},	/* Foxconn T77W968 LTE */
 	{QMI_FIXED_INTF(0x0489, 0xe0b5, 0)},	/* Foxconn T77W968 LTE with eSIM support*/
 	{QMI_FIXED_INTF(0x2692, 0x9025, 4)},    /* Cellient MPL200 (rebranded Qualcomm 05c6:9025) */
-- 
2.43.0


