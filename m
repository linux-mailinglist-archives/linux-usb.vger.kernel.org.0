Return-Path: <linux-usb+bounces-36499-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN0mJc4D72kj3wAAu9opvQ
	(envelope-from <linux-usb+bounces-36499-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:35:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4B46D9D4
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82EBE30039A9
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 06:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22DD37D138;
	Mon, 27 Apr 2026 06:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+ait0+i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BF237DE9C
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777271735; cv=none; b=mTcooS8sqZ4MgFJ2TFoa/SRWH1Ne+wrz2w7Vf7xebpHif3OMHXd33z27WqwXwFLnIM9B8xYJlsJXNqulONYkivcocUJTSDM5rSJfgtSbTp9JKQnZJplj6WDyvBhbPdx1taOBV3ZM6hM0rH40Mx6YjUP4OatN7F3IZx0RVtHsc5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777271735; c=relaxed/simple;
	bh=83kGaKxHzSO8hHoFuPeKCYAcFLsQi0uBaeCr/GadHns=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nNBGZj9CLHmstOw2mrvW9vR3F2zqtAG54ir0xRPPqABSPB6Gax+KjYa/w/n9fHupkfZ0fKVlmEZVhwPSCf0AbzyoLT5MaoUc40BW0f2GozLQzDjbTlE4X7mwosQsCqARvOq75Y+G++2JrTiK3blL5rccVRLvxdV0z3lUhsa29Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+ait0+i; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35e576110adso6705636a91.0
        for <linux-usb@vger.kernel.org>; Sun, 26 Apr 2026 23:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777271733; x=1777876533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ns52I0KO1Mcmsyv5tl+0F3WvrsFMKPBrKCKAz24hMk=;
        b=G+ait0+i14kr1MLn8YpBH1/Lb7Ts6v0bR1XDI6+nonowYef6Gd2zrqc+uaT7aCDBiQ
         3kTHbO/g7ShBv9/JE0RngQXNqMhFnLieTDBejkvAyv25C6pi6so3V74tGbIIgaJKCUxj
         5HQZT31vFbeCdFMI+M4JTTX0ZHbUvWnlQzP2FbOpu9/dJi5LaM3hntAgDaQxLpcfQK+b
         eVmiYvcUdX/81hcFeI/0FPRm648Nm7BuMAzcy9MrRjBdEYs2Jj+sjNovA3/DFaFhtSV4
         UjBwuWikS8WVprtkq8c2Dy9L9eK6h4my7m0HGZC/JNzYTFiYaV+1DcD0b/3lWG+1gmYE
         gBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777271733; x=1777876533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ns52I0KO1Mcmsyv5tl+0F3WvrsFMKPBrKCKAz24hMk=;
        b=lkyFXkInJtBxBpqjy3aUsy19ZHGr/p6IdmwXASghBTIPigzhaqccAO2Gs+rjKhyyYY
         LdhCLSOYYVpnZU3VCBhGg1913OAv4x/dgONldGyETaWJfb6eQpsf4yCfDmjrJjuwYW9a
         on0NbK0iaWje0a+/j+uqCNffOVFIuszbeQqaZd3Y1DsGWTh8VpwLhgzP4/cDOtep2MKj
         tqRv6LVP8zYKK4fbmMyT+1n9JB1xd/ZPTmQc4i+9mtvsGZOhxP5o2VRmjAPI4p8w+axW
         4MQQJ86rfe1IIjL58sPZsDBnbFEUE1dER8/UsaiuFaqUPoAiB5GCw+CDopS6trJbrI49
         TBMg==
X-Gm-Message-State: AOJu0YxakrpZLAWk6YkWo3+EZkpYT4u6Sbyh+/NW7oMg4yTy8KHJykXZ
	eazVTQb2U7np9WZYOaxfB59tMU5pdquuaifcwt3GZ5+to/XWsOlbtzX7
X-Gm-Gg: AeBDieuWrwuSovVGUIbQaVFGNjDnOYvGPchy9hCmWodnMcn8ZDHOmPc99p9MWwQCIvS
	mnUdbTHz188i0/WM2YI9PNpPWLeJsQ8JyTKs9/ntQ7+UQwZFArRilQF3F8VTv9llUHRYt9CXjTa
	Fa1wDZ79QT+5HqOD4S/paxoazrkeNLvZ+XcwDtNQ1fW+xodAFFxoyrR20kV/R7BcpNQ03uFfy/x
	gQC/MU49nHGZDCAxx+Mrx53al5i6p76BQ1E/jTZCeOb2faAsHRYk6PeXNEXV3MXyZVLU/jOiLre
	UoYVboGh0RrfOjOEWM0bz9qq2FUi3xeHj5HVMMxOgfIZStjPgBnQM6Kv7iySENtNLp8cQolX8lO
	TqpQ2ukNbEIMvDneJn7fd1GgdObeqnOjxwzH/aNViG+1MCRMz7SbcBO+KGQ/FdaTfNkgEOO6VSH
	oYMpYC9smvqTEHsiX+d4bFXDZSowhiInNxPDXAmoXaxrqGPlGnfhatU/PqMcdcWmtw
X-Received: by 2002:a17:90b:3ec5:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-361402ee818mr32903461a91.13.1777271732777;
        Sun, 26 Apr 2026 23:35:32 -0700 (PDT)
Received: from localhost (61-219-108-167.hinet-ip.hinet.net. [61.219.108.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm29987454a91.3.2026.04.26.23.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 23:35:32 -0700 (PDT)
From: Jack Wu <wojackbb@gmail.com>
X-Google-Original-From: Jack Wu <jackbb_wu@compal.com>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e-m
Date: Mon, 27 Apr 2026 14:35:02 +0800
Message-Id: <20260427063502.2314843-1-jackbb_wu@compal.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 42D4B46D9D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36499-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wojackbb@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,compal.com:mid,compal.com:email]

Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea & 0x413c:0x81eb.

It is 0x413c:0x81ea
T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=110 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=413c ProdID=81ea Rev= 5.04
S:  Manufacturer=DELL
S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
S:  SerialNumber=358988870177734
C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=qcserial
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=qcserial
E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=qcserial
E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

It is 0x413c:0x81eb
T:  Bus=02 Lev=01 Prnt=01 Port=05 Cnt=01 Dev#=109 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=413c ProdID=81eb Rev= 0.00
S:  Manufacturer=DELL
S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
S:  SerialNumber=358988870177734
C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=  2mA
I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=qcserial
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 drivers/usb/serial/qcserial.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
index 1a930dc668e4..7322a984509a 100644
--- a/drivers/usb/serial/qcserial.c
+++ b/drivers/usb/serial/qcserial.c
@@ -188,7 +188,8 @@ static const struct usb_device_id id_table[] = {
 	{DEVICE_SWI(0x413c, 0x81d2)},   /* Dell Wireless 5818 */
 	{DEVICE_SWI(0x413c, 0x8217)},	/* Dell Wireless DW5826e */
 	{DEVICE_SWI(0x413c, 0x8218)},	/* Dell Wireless DW5826e QDL */
-
+	{DEVICE_SWI(0x413c, 0x81ea)},	/* Dell Wireless DW5826e-m */
+	{DEVICE_SWI(0x413c, 0x81eb)},	/* Dell Wireless DW5826e-m QDL */
 	/* Huawei devices */
 	{DEVICE_HWI(0x03f0, 0x581d)},	/* HP lt4112 LTE/HSPA+ Gobi 4G Modem (Huawei me906e) */

--
2.34.1


