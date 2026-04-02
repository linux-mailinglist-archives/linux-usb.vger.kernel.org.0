Return-Path: <linux-usb+bounces-35848-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLiPJtkrzmnIlQYAu9opvQ
	(envelope-from <linux-usb+bounces-35848-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:42:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D9386367
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 10:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0038330FD7AB
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 08:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286813A9626;
	Thu,  2 Apr 2026 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nz6Hna+2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A0A1EE7D5
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 08:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119051; cv=none; b=OD5g5KpQ2CNVTok/rumydMw2WXYVfI3d2j3U9QPHstuAt+04+ftr9STEtU26vAY4RyHGz0GE2pWyqtxJwfKNNv0v7+f8PkZ2xZLE2+KKDrNLUs1MUYppi+1YcvddxCkfPsdkQJGf2i1B008QOy5ACus625quVq/kHX4qtN8AVRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119051; c=relaxed/simple;
	bh=sjNHI0SqRG1xFTfbqXbfYmiraZhzljPHPeE0rBZzwcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nrrRHNU03ZvMO3d0MtrecwNha0fPXLMVloaHaGmf66MdZmMGDsbNidGfNRUgXAxrB/Js46d/os/Vt4v1fPT2Je1PNC2mJNwAzLjMDWDEcn9iBwBMdWZIp8TOKb88fIxwAnN35ITwd16f9Jq0n/r1cIcLmU35gZjQFtZjpzVEniQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nz6Hna+2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so5227665e9.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 01:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775119049; x=1775723849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OS1+Hv6V68sWUSaQ2t5yVzr46ljjcx27+0z8+uJDDlM=;
        b=nz6Hna+2NkBlljTkewYWtQBU3IhbVmLZ3QUNwz4FDkjFtGiZU4ghU0+uCFyEAhWMQf
         fjAP/P0DiICtcnLWya9G3D2QOT/r0hLs/F3Ds8OgbVpiIDD97pwY79fD+UYq+uR6bJCo
         eyTeJSRO/ul1oLOvkpqh8NB+yMjhVWUcuuEAegB6jii6FvWYWfN8JJYr0ScAt5YOtrGL
         996yfAetkLQ8UjOzo5TpmM+u7pbXM0VbJ+uh7OkIa+OYlpDFouGv/aCGyhMzdrRqaV13
         rzqQMuKOXAPYm0pnEI99VslcfVnIQXXYPnr41KGUu9xzk008rBYMxua2oGydvTmf/VlR
         uoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119049; x=1775723849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS1+Hv6V68sWUSaQ2t5yVzr46ljjcx27+0z8+uJDDlM=;
        b=UQv9+AuHARV9aq513RNX3QPte+qdAE967VRI1Djfz44tD+WzMEmYUnDkClsMJZji9Z
         ujBm5qB70F7++EoshnWhgfx/bUlBylDQEdVHZ3JnlRDA9Z1RHpsH9LYyK6y8XdWDUxBy
         gK+r+z3hxb14vTaZhL3yJFWdsxDbJqz+el8ageDydRwXMX2YG2vOke7sLSbcrkxhSQYg
         /Ndm/FGa+YeaPyYQG+p8/8AWffaWOfQ5mYTQDsWoEkMV42cqsMgcTtsG2/stqmfJ5snR
         eLKuQu6Wv7iBS1QLxf55I82SQkrOm2kvoVceTQMJjC0vuuaWMyezr3lFfajbIFzs9IRn
         9uOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfmK2A/p//GAO+TQeX9SYY/Nq5DypO8GAc7qjVjm+/5/357uA5ZzPWr0Z5tIARLuEg9MAZEQfIQ8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRIZSaIGIydZ+TaxbViuhad/30sMfbWVawYrEr7bcpeghK2e2/
	Rx3q92sLYWzP59Y0uvuWphymWuO1ZYkydCXsGI/OFp+aI8FRoGaxYZwN
X-Gm-Gg: ATEYQzwMYl3EzuXe/s7OMCq0RcyaG+5WAeY1RUi9ggOnEt252TQWSTvvEhldDK3XsJW
	QB3e9cpUQYAi3pgbAzwctTIS9D1aVvwY6iys+6v1t8u86tkdMCCxNWenDLg6chXZZjV8r2F5RD1
	TLAj6rQgh3SfTN2o4YZRFGElS/cQd6aOsFUXbMc6kSGtrZ39cUzV4SWdmADgfXmWtdccA+vrU0b
	HbtbkWtC5hbryQ4/v9q6gxPGW/MVQePEKd9esbgjj5spSV2DwlKBvY4lzdzm4GrFbVQlgChg0kW
	5aPRcBFpmIPEuqvHo0V86jtqdyNtcYIXxVOeiDRWphAqdiMFS3OE+L+hed8I5UXvtlIoPJk/nXf
	u67rAbwVzO/RodCAxqrDzMN4nKK7VFX7gyxzicLSJaRk+Mlc88i0+BbdHy4Kfgh2fV/2lgv8hj0
	RwBZHSsk1DEnEBY/+CTYfdXiNCEpFRWFS07CU2IioKktL18bRPAgopzChJUmgqqnxee5Tg5of66
	D9+4qaHA2hrcdIksoVfE3re+Eg/Rz/9AlJrsNMEeA==
X-Received: by 2002:a05:600c:4a18:b0:488:90fc:82cf with SMTP id 5b1f17b1804b1-48890fc877bmr10691015e9.22.1775119048772;
        Thu, 02 Apr 2026 01:37:28 -0700 (PDT)
Received: from labdl-itc-sw01.tmt.telital.com ([2a01:7d0:4800:7:a04:488a:882a:de93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5883101f8f.12.2026.04.02.01.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:37:28 -0700 (PDT)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] USB: serial: option: add Telit Cinterion FN990A MBIM composition
Date: Thu,  2 Apr 2026 10:37:22 +0200
Message-ID: <20260402083722.100973-1-fabio.porcedda@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35848-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B3D9386367
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the following Telit Cinterion FN990A MBIM composition:

0x1074: MBIM + tty (AT/NMEA) + tty (AT) + tty (AT) + tty (diag) +
        DPL (Data Packet Logging) + adb

T:  Bus=01 Lev=01 Prnt=04 Port=06 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=1bc7 ProdID=1074 Rev=05.04
S:  Manufacturer=Telit Wireless Solutions
S:  Product=FN990
S:  SerialNumber=70628d0c
C:  #Ifs= 7 Cfg#= 1 Atr=e0 MxPwr=500mA
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

Cc: stable@vger.kernel.org
Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
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


