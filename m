Return-Path: <linux-usb+bounces-37553-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FeIgEs3fCWqvtgQAu9opvQ
	(envelope-from <linux-usb+bounces-37553-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 17:33:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49526561FF4
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 17:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF610301F7AE
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 15:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8033BBA18;
	Sun, 17 May 2026 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7x8m+/o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51763BAD81
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779031974; cv=none; b=azTrHI99CekS3DtQrclgHx4FRXnibk8jsszXxGa0cEvQZc2pv2i5JLzQAHuDyctysZ9Qv4pPGF7oGq1cfFtgnj0s/fADdYoNT3eG4WK/Hji6V+2exN8V6N/bjOJqhii43xq8ccJWqBsdSASWS8f+jndvXB5ttAgV0gPr73qaYFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779031974; c=relaxed/simple;
	bh=2tkufOR/jZKZCuzrYVZ9yOd0S0iuhquPk021GjzpyPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LU2ebC+Km4VXy58q2EEHQqmyQeSBAyGlndR7/fQ4MhDTE1TSK4+xSgbU3Ib8aVMAWClxi+jZlYGkMBQgQR2SeAKYdcZQZfQlZBp162P6vtJSjqg2HTcsaJcWPA6NYfDLqQP8JIRF6yPxarIZug4IoRxQPpzheaPYUllcIBr6pec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7x8m+/o; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso8094725e9.1
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779031971; x=1779636771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IBYS5kaBpkah/bhI00bNcuuOGJFf/yupomVsCsUVeo=;
        b=d7x8m+/oSOMfJ6omepMqLjcdURQiIt8C9q+HCee4V3Mjjl16gDeuNVyVTj0Yf6NdGI
         yEjKZACoyqftj39Dh5rAdh52fjmYDFleGLbGhd8O0lGaR0PX0ShFI7pPMUgBV0bC4owR
         nXk9oPN+yNl/DfuT2ascy79rnjFNteWw41sRRujd8UqOJlxznVPf+x9XwAeuA3GRVdS8
         rfUQtXNL24EJi2TyNxN/venQcj5mcj853ra6AgPdTf5aJvQvg67iW95ROLlK6NzNAN4A
         +TeWhu0aqZV652Wrs8OXtTjqJxqRQx81rZT/zWfADR69nxQeYf7ZWNIGL3EwioQou6cV
         hnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779031971; x=1779636771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9IBYS5kaBpkah/bhI00bNcuuOGJFf/yupomVsCsUVeo=;
        b=U1kBkab6Jw6WPRrv1LZO00pyF+jTbH1714f/EWzUx/1nUpU7qVo6rnON+l7q2I9UlF
         UXJHIcOa52TdlN7H7jDE/ZdzYuBkjnXbjnad9MUwz/lljPK62BzhyaRNu7ifs7OF2EiT
         FjOXb1hdPEdaFC+51F6zStEfce1/v7DdG7pUt1X1oASWw9sAScQD2EtVatpl2iJALHZ1
         JG5ee/TuKiTjZpExkBmrfqeb6WyEgoit4MwGSqfoQcmC3VALr2PKv5bVOnDHgOLhTjmn
         C1Baa6FjfouGq/Yw2n2JofFTGAl2EpxnWo6tXqpFOXvowdEwibR0YsiVqNTzICGiVhcF
         eCCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fRKex4vFfv8yll6z6y++hEo4FZ2nPufZrG39x3M2BpJ/hjTN74JT3tXTWUZm7AzgWlbiyRR65fU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3PyQfUUUZY5zRW1pkECsuY7dq+T7WGBdmryP2iaLUbKO9b+U
	Ue+1O0Zcd13k0k+AFq2MUuOYcexuVLXbck59AjVv8ta/BUf43CSJl9g=
X-Gm-Gg: Acq92OFDpLJF6XXI86yQQkQF3LVD36pgXHp/5W+Z7QpyJdSvKVHhSr8FgG6O8UzBw3n
	EM6jFWkZWqhjJ9VDlArv+AuWlyTA3C6bdbg5pXSoNSzPMvsZrX0/FnfITZKm5DlBA4avO2M9C3K
	y4mqV6oUuNW20B8zbbXpG+Cq0HqlCDgtl4KSt1pe2Bv5sYLHgc74GG0lzWhYEbFS1nd5DKUf4Ss
	P5+5tFOucRYueOUtR7ygUOF/qB4r+lmzFUO7TygZgtJYfjH7m/m4Ghw8hAD7otwTMMN63AeXPyD
	K3QrGyl4TDHA946Udf3CK0emC17xrktfYEZMBjW0gCxyihx/iE1+FqqjmoHGVICDz00GXvjM93u
	DCvPyr3E5SCszTcqPhxBwavaUKExYAkFfs+PrWqqVKB1cwuLwrjrVriiqOuYxjY89efEYDaRcq+
	zdSHTsEUELVFl2kWXZHNZl61oqEtnas86zE0eXVMjqXWmjGiZ9PCNgwRXx8hXoyM4YYTdHrL7Hb
	pLclstRAA==
X-Received: by 2002:a05:600c:4fc9:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-48fe60e368amr150797915e9.6.1779031971102;
        Sun, 17 May 2026 08:32:51 -0700 (PDT)
Received: from kestro-laptop-linux.kestro.home (94-224-231-213.access.telenet.be. [94.224.231.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab290e1sm95307395e9.2.2026.05.17.08.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 08:32:50 -0700 (PDT)
From: Jan Volckaert <janvolck@gmail.com>
To: bjorn@mork.no,
	johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan Volckaert <janvolck@gmail.com>
Subject: [PATCH v2 1/2] NET: usb: qmi_wwan: add MeiG SRM813Q
Date: Sun, 17 May 2026 17:32:36 +0200
Message-ID: <20260517153237.55995-2-janvolck@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517153237.55995-1-janvolck@gmail.com>
References: <af3nDLa1A1JcTftq@hovoldconsulting.com>
 <20260517153237.55995-1-janvolck@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 49526561FF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37553-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[janvolck@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add support for the Qualcomm Technology Snapdragon X35-based MeiG SRM813Q module.

The module can be put in different modes via AT commands to enable/disable GPS functionality:

MODEM - PPP mode(2dee:4d63): AT+SER=1,1

If#= 0: RMNET
If#= 1: DIAG/ADB
If#= 2: MODEM
If#= 3: AT

P:  Vendor=2dee ProdID=4d63 Rev=05.15
S:  Manufacturer=MEIG
S:  Product=LTE-A Module
S:  SerialNumber=1bd51f0e
C:  #Ifs= 4 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

NMEA mode(2dee:4d64): AT+SER=51,1

If#= 0: RMNET
If#= 1: DIAG/ADB
If#= 2: NMEA
If#= 3: AT

P:  Vendor=2dee ProdID=4d64 Rev=05.15
S:  Manufacturer=MEIG
S:  Product=LTE-A Module
S:  SerialNumber=1bd51f0e
C:  #Ifs= 4 Cfg#= 1 Atr=80 MxPwr=500mA
I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan
E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=82(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
I:  If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms

Signed-off-by: Jan Volckaert <janvolck@gmail.com>
---
 drivers/net/usb/qmi_wwan.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 05acac10cd2b..94cdb61dca83 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -1452,6 +1452,8 @@ static const struct usb_device_id products[] = {
 	{QMI_QUIRK_SET_DTR(0x1546, 0x1342, 4)},	/* u-blox LARA-L6 */
 	{QMI_QUIRK_SET_DTR(0x33f8, 0x0104, 4)}, /* Rolling RW101 RMNET */
 	{QMI_FIXED_INTF(0x2dee, 0x4d22, 5)},    /* MeiG Smart SRM825L */
+	{QMI_QUIRK_SET_DTR(0x2dee, 0x4d63, 0)}, /* MeiG SRM813Q w/ Modem(PPP) */
+	{QMI_QUIRK_SET_DTR(0x2dee, 0x4d64, 0)}, /* MeiG SRM813Q w/ NMEA */
 
 	/* 4. Gobi 1000 devices */
 	{QMI_GOBI1K_DEVICE(0x05c6, 0x9212)},	/* Acer Gobi Modem Device */
-- 
2.43.0


