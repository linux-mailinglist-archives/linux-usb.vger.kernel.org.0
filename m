Return-Path: <linux-usb+bounces-36912-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH3/K3FJ+Wmf7gIAu9opvQ
	(envelope-from <linux-usb+bounces-36912-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 03:35:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 153EE4C5C63
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 03:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 761E03024977
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 01:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FB6535EDBD;
	Tue,  5 May 2026 01:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2G4r88I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A5B2882B6
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777944919; cv=none; b=Lh5lQIjqavoqhaZoSbYazkx5PpazqsUcLxYcgtNOgpiFiTSkEoLq+w/cv8xujrhNVxWAiFiq7iOusCnPryt5IjjvMD9icq49SIPmMxVdyOFP5BUzzQAxfCRsLhtsF60Ey0yoBuaVYhjxItGb/uh6cMKs3mTq9JYVSeXXy6k3oXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777944919; c=relaxed/simple;
	bh=gkSqGkPoZiTjgnu7piJWoaM8fKp/u8+FLLv5jMQe39A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hkiM8bPWC5Ij6UqjvYhJP9nQf0EunQuQBtgkFE9qbN6PgIJowFmfCowZeIkzxewz3E+PmD8mb7I7+fv7/etV/4fetAXIbS5jZTdt4QItjPbXgharkn7Cu9kKkik2dLHDikjS4QMtLf2iN0kHv47IZOl2Sb0mbi4ZHrR83E2EeZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2G4r88I; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso6632196eec.0
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2026 18:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777944918; x=1778549718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8OFsxADoA7gkvZcph0omtjSJLQGedzy00oxzP4XU5bM=;
        b=W2G4r88IzMViglAi3AVhFzusdXDvo41RbTbRCUhVWyvmhlxz7/U1acX7rAxtw98H+/
         KRgVq6vCyS4Zt7TrGa6/N2tzjJDcNUgxkJMIgX0wDf7io8jDdGuzsaQTUDkU1R6PB3qX
         o1/DYgJr/Sp6DGHtFb9UbFOtAO33itzBVRT43pAsKQfXWafZ23eE6mJO9ImowKHEIqQq
         G3q0NmOOBIyeJeFkO+2VQVs60e8IhwUGfNiMhxrTGwVLn35H+8uBV2PZ/JLVbq2BVSu4
         1ER5Vcs8W70P/fLmQaty+m9pMHTrQzH/C1IO6j+xJ4OkhZzgXeD9XRhnLh8ko4M0XiXY
         kS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777944918; x=1778549718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OFsxADoA7gkvZcph0omtjSJLQGedzy00oxzP4XU5bM=;
        b=rFfK6OfmINjlhQ7FjCGJ+dOx7GDsbSGaHxwMLWIUVFRWOHXWdTRtplnMqQrTGTQuzG
         XW+t9mQxB5aPFfWMCTxAGBe8mSjqU0u5xTXLLsSheFqFHqoBaWVsR7kSbJL72xmvUV8F
         BkS3XyKS4xpFkO02ZZUvOs13qaoPoErxOsVA0iTeoZNKx7mE3DJokk0aYzTzzqiQuBsE
         KMjdzvPR/NwkW9ivaNkiouobBR+vcVP2OGucJThxYyEHMWkbNoDmkG+kDQEQcB8mnr95
         LzONYjkH3MwfoLddOXjX1+mS/Vg35oC9LEUCmtHvGXD8GmKbBp5S//t4nPXTCA6TG/TW
         OlAw==
X-Gm-Message-State: AOJu0YxZqWlMLx51tilcZKjQ3JAI8pzicEuh5610QILyIQQtk0yeW6yv
	/ELZLgdN8xOEjVQRbDzNKiLmZMtihnJtYtLpxaaogNdFtbgaMyCAjuJMlzHdlMdE
X-Gm-Gg: AeBDieuwNPG3WGC0qJ8IqFe4EKYz1t9n6nepUoCzAxX509pFPfskurq9p7zKC5vEEa6
	WlopByLlP8thxVn3FsMdK+2QycG1thLXDEeXnQxECrBh6FDycOFXnGnupuWPQ+WX5FMmoTIHvhd
	WXG685wuO/4dgDuM1flAjZ/Yw/xrB6R/U/mp5WggQYfBN0+ak6gfH8leojte+g6Djf4HsT6uj5k
	ugyT+AB1ozCbprV9ipVAkct3b9mhQo9C6OvhJBRY3vlROZSScmV88D2UCNjNsbkkEjOZcQ0spWA
	I543kJAwFV0nQ+uHDGF1WVMuDHqfNpWgTZ//clSQIgow/+mmKUQ0Be3wwuDYXE0PP1sCNdQSTth
	JsVCsKz9oZ+qbxRqhcVgy3mGNJn5fDF+KRIdKrAsI1xtY73H6pLohUhnc0jZf5lq6Qf6xLyP8xs
	nIDk4OmZbGMn1VBhj7+fsioCGvGdniTZM55bUJapj7so6/yiuoDAYP1sx3XFrmBE010qFxxMs/h
	HgMpz4IghwpzsyrD/w6fBIrDHX02wNO6AOnmKcqV63Rv95GnkWfOOYgg1sArTP9D5mYEwCfedwo
	bF3G86nqYcWxG78P7x3gcV3z4C9U
X-Received: by 2002:a05:7300:6412:b0:2d1:299f:521a with SMTP id 5a478bee46e88-2efba292fdcmr5542488eec.26.1777944917720;
        Mon, 04 May 2026 18:35:17 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bf67a3dsm18429004eec.27.2026.05.04.18.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 18:35:17 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [PATCH net-next] net: usb: mcs7830: fix typo in module description and clarify it
Date: Mon,  4 May 2026 18:34:59 -0700
Message-ID: <20260505013504.45975-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 153EE4C5C63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linux.intel.com,linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36912-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

The mcs7830 driver's MODULE_DESCRIPTION has an errant parenthesis
and does not indicate that the device is an Ethernet adapter. Remove
the parenthesis and improve the description.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/mcs7830.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/mcs7830.c b/drivers/net/usb/mcs7830.c
index d6698f30218d..161f021ed419 100644
--- a/drivers/net/usb/mcs7830.c
+++ b/drivers/net/usb/mcs7830.c
@@ -626,5 +626,5 @@ static struct usb_driver mcs7830_driver = {
 
 module_usb_driver(mcs7830_driver);
 
-MODULE_DESCRIPTION("USB to network adapter MCS7830)");
+MODULE_DESCRIPTION("MCS7830 USB to Ethernet adapter driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


