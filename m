Return-Path: <linux-usb+bounces-35854-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P+HLwY/zmkImQYAu9opvQ
	(envelope-from <linux-usb+bounces-35854-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 12:03:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25588387697
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 12:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3DAAD30DE6E0
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 09:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5810E3D4131;
	Thu,  2 Apr 2026 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEMRxWp9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225543D7D67
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123859; cv=none; b=K3vl/cGwSPM73x2/Y57YuthGQDYUgZqwIF/jXIiO/iFPCB9wWj19KFQY08I+owxhNyU86x3WvQJ4d8CwTIfMCXT6CXH+nJWKt+JRW+0PnEAzYcjqISVhYamYxZz5F62Jy4xWcuOxYcgFtE3jX5k6qTU2WASBPOAzQ55ujFHMB8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123859; c=relaxed/simple;
	bh=hFc5qT+pzq6zVqM4JVuL0l/SocpzXAqe7/MCTUBmG2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMNKhrR+6VIZ1+pVKs8JwnYNnSfSJz2kum9zkxs3GOXQQ1scRTLShoyrRRH9mwj+/GPHdziu9yWRzBqgaRDciw0P1eXMv+CHFrIBjR7Zar2UOzXmBDAOqLmdQfNLLrqqBxo8/+hLSt2LKyW0kRL2GmNdEKXMxyoC7FXqEpJQd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEMRxWp9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso5718325e9.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775123855; x=1775728655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wumiiHljhQkv0Ig3s6QkasvoFus7w+8XuMvX7YrvDE=;
        b=aEMRxWp9qC4DfLszkBu0Njs5Yp7jpsunR7UVE1Z1WV9oHd82ZQNOZTtq2Zi5kRfoXr
         JWzDKhMTQU960uJGSd5VBat9c58bNYZs/omLONhRU8iQcqLc74amekMduTVXf0I0X/6z
         xtPDbWYFmlizddCwFHwht30hn9LHCXErc+Xq/EdFAQpCvMPW5SlLvh4IHqTBe5DAAvAC
         0k5/Ie0vr/YR35MjaeTJpsFVjj+DHepZD5FtmShXnJivV5z18H6hsiDdMZ27qdxoINaa
         fkGSSe0SI6w+sW6uZDHOWvcIVYHV+Z10HaNSHDL2hWU8Cu+tGJz6EiJmsx/0CfG31NNn
         ciiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123855; x=1775728655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wumiiHljhQkv0Ig3s6QkasvoFus7w+8XuMvX7YrvDE=;
        b=WJMhibks5RkvwIoK0Bgl/+AzhjNOWviXi87gT8ci4AkCZCB5E2BYbqliLBRXwX35SG
         2fqr3TxoQGxEJzWoW2M5k892oMpSWyIRQNNuHUnEw9ydT70pXX3waGDIxhRq1hGwOk0q
         NLu5LTCvramvSz6j1/CXVvzE2xzZvhK4vWjznOsqQAIH49HKBeMhmGO+DrD79zJCZzhW
         /M3FJkV8fHaHuaAE60mG0wxh3STM6K7PAB6z3VVAioxqpY76I7fqqMgeh7sa+Jc26ARa
         Df13/J3J6lKEGFIpMmbK0E3zFFj34QSRNO0vqZNyTlJDaWb8TF2uf12Cbyp/WjTtT6sI
         bBBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUw2j0kKTsGwE0Vv0KsuYpzso0Y3pBXjTdLcmjR9DdDVsFySs0vzq6w6jda+PKVwbXs5nehxPD0g8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9BD4scwXwP3xgOUalGI1FKR9bGzoxsgVkXoGh4YkhM7Gs8tPj
	7sLo/IEFICo2JN0OkmST19JhAKDORZeJF2sx74yo/4lNCA1tdtIOC5Qq11o2MGdo
X-Gm-Gg: ATEYQzwesuV4Ehkb3pHTm7VSuUy1ZduixClmGIXWb8G2WzqEZ6kupHBQy5QfXbyJ45R
	v8Vr5EYdoH8OelTHv1Tyd+JOLvPgnWsOuMAfbuG4d2SP9oSk6iuv851W4A61ycbodEIMXRwsT7z
	BXd9YTZvcir6u3XMVnU9+o89xR7aXzlraXzpDhZ0vqHFmHOeNM4LZbsOv6Xjbsiy8gnwrkASGzZ
	krYBgx4ltD6tSOrhET5/0hpHah1FqAwdQa8oxe6bofpWYD5lteLEXaKiLTgnamK14usyJ/uOJJI
	bydTI4Ec3fBpdY2lopZ6R4Y0vbdRPKnAXqCc9kRVnLrcbBgdlHIcYdQrhqXteDLvlXwXXXFsQnA
	oiq2rxjmYE1ykHeUIx5oICKfEcl2CTCHJOIbwUYR+9eHlNfNJEMj4XOTZDYa4JaWFq9kJZ73myL
	A/YqweIRXDYoZ5aMN/wnx6CwYOrgaWuyYl4foAIk9chjTsBTC8X2VWRdNiwHmQqXBGgY3x7r622
	IVU3DWYzVLN9UREW1odJnlV2v9UTHZkIgBLgUy8fg==
X-Received: by 2002:a05:600c:4707:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-48883595dfcmr119730095e9.25.1775123855051;
        Thu, 02 Apr 2026 02:57:35 -0700 (PDT)
Received: from labdl-itc-sw01.tmt.telital.com ([2a01:7d0:4800:7:a04:488a:882a:de93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d282esm6757296f8f.18.2026.04.02.02.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 02:57:34 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] USB: serial: option: add Telit Cinterion FN990A MBIM composition
Date: Thu,  2 Apr 2026 11:57:27 +0200
Message-ID: <20260402095727.108281-1-fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35854-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabioporcedda@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 25588387697
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the following Telit Cinterion FN990A MBIM composition:

0x1074: MBIM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (diag) +
        DPL (Data Packet Logging) + adb

T:  Bus=01 Lev=01 Prnt=04 Port=06 Cnt=01 Dev#=  7 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1074 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN990
S:  SerialNumber=70628d0c
C:  #Ifs= 8 Cfg#= 1 Atr=e0 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
E:  Ad=81(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 6 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=80 Driver=(none)
E:  Ad=8f(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 7 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms

Cc: stable@vger.kernel.org
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
v3:
- Added the full output of usb-devices
- Link to v2: https://lore.kernel.org/linux-usb/20260402083722.100973-1-fabio.porcedda@gmail.com

v2:
- Added "Cc: stable@vger.kernel.org"
- Link to v1: https://lore.kernel.org/linux-usb/20260402082747.98441-1-fabio.porcedda@gmail.com

 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 313612114db9..c71461893d20 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1383,6 +1383,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = NCTRL(2) | RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1073, 0xff),	/* Telit FN990A (ECM) */
 	  .driver_info = NCTRL(0) | RSVD(1) },
+	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1074, 0xff),	/* Telit FN990A (MBIM) */
+	  .driver_info = NCTRL(5) | RSVD(6) | RSVD(7) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1075, 0xff),	/* Telit FN990A (PCIe) */
 	  .driver_info = RSVD(0) },
 	{ USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1077, 0xff),	/* Telit FN990A (rmnet + audio) */
-- 
2.53.0


