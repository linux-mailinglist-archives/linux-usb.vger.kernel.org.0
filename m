Return-Path: <linux-usb+bounces-32633-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKE0CB5CcmnpfAAAu9opvQ
	(envelope-from <linux-usb+bounces-32633-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:28:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E9068CB7
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DE0D300073B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 15:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33C13ACEF4;
	Thu, 22 Jan 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/ZeHFdc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F73A7F44
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095080; cv=none; b=d0eC1uy32RDPpb91ZdQJAWeLJLoivFmobfcqhccFHVtUNxFyUc4X2G+x8o9OoCoqUUtqELmG+7oRBjnaHgzofNHP1DDD9cQzniyyvuK5kWu+Kjh14zS8grsIdsgtVaMJtj7OBBlBcG4j7iLVn4NzovZ/xfw3eCpOHzno5wpA09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095080; c=relaxed/simple;
	bh=hc0UwRAXUgdhkEFLx6v/oECQPoLrimEK0i4Waw7XdZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dcJiX7k8ow+Ld8zldmydTSis54RTf+63JTkYduleGEhOZ+PmRL4uKu2K/N5QHYBzcvjizTY2qY06BQLlZxOrjk6hb/Y4koEkJncodVqdiaK2ak+mfT47nf+d2RXVz6citmyWyRh/OOl3DevDpmfp7XRjHK2BRzfPSnuQdCSAB1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/ZeHFdc; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so11140985e9.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 07:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769095077; x=1769699877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRt+ytQYDTko8T5osM+fVBmVCbbb9bOme/5TmuAk+d4=;
        b=J/ZeHFdcqmW4/f7PRlh5xKUpSLQHyiPNSEUjLS1R2dz2j66XxzyTOZtSCJH9svhbGh
         Ptq49ZvmS/Yr94ysfMSFhaKLYhtYFC2hssd91uRuU5iHr7g1xLUsBJifs4S75IT/cAcV
         2K8DWLfTc7etq0yveq7S+r9Gk6ZHQH0LXkgdNNl9v1rzsjptQmMuLTLTWZbtbF3fyfRL
         IuNSw3W1TpYPnNbCVDn9DLW25VIbGA+H1tpNVoLCQUuaHfQF7DBAC/K1+6mkCefYXAKa
         RJOvIFmr4yB1Jzqc5LcoJVOxXs/Q5khpfOTxRJsuk2kThcaXTgTdYy9XMBK1yI4rBbCV
         Zz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095077; x=1769699877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LRt+ytQYDTko8T5osM+fVBmVCbbb9bOme/5TmuAk+d4=;
        b=Tvu92bgrkxhACVLXY5C4lTzjnexwWiNQyLYyzUXoipZKVPSNsR/jWM/D31mVEBh5tC
         B23cf69NMtjoMXkr7svfY4IA3fFmKU2LcJitUetAfSJWKV4xIktbe8dm8WTNDKXejfdi
         grfFJqa6S8XAK3fPmCTGXDWfAqkvEs3sA28Ud2LivUSqC47Hftbovi1RH+X/jKjnfVsG
         o+myrKZwryE0QPhtNft4Rf4naEM4oobHsKEMf/ITPXq07VDwEB8IbwzsZz5U1VrLoKYm
         KOR77Xf0SlsWO5DIaiwkC2llp47/uu75kxRkLNpDo7xF1WavBJ4pE8ln4SjUevBdlsZb
         Cihg==
X-Gm-Message-State: AOJu0YzYLR7UdXSF0nE0d5z5V8VjCiBFgOjlZYmVhF2U3b80fli6fCs7
	HYeQ7VYTRcj8Mb9XFW2GJb2ng231c5RuZuEZnhxikA63M+Au2vKZ6ORE
X-Gm-Gg: AZuq6aK1nMzv+NwNVVCY7a+Y2xMeVL4TtR3Xq9i33zcK3qjKOuaGxpxCA8cHfB7Bo+9
	tJBklmYpP2AIO3Awkj1Gb7v4EMBrW8OebiC9IJkuAfnWp6SdCUzzRBcoZGQJreBa3SpSdIOekTM
	/Uj0QCzULz3/ziXE7M03eoWWg1lmhDuwIYKzyRk1htHEJUzd8X+9oQEWO+draRxfqH3SraCTyOb
	ae3BsDQPHSpKsjMhN8h6QM+GI5fDxR9qrzrjPfHOXOJ8hh6cRHaR1Il3YXENhcx2iuz0pWTsxL8
	Wjk0/npzdBa+jTuQD+7jEIa/gp/EupvKaIPk7gpqNYBq+pQYwzoMiprc3sGKK8S1liaPVKQI+qt
	OWYbM13+sjRoVyzvgsyi9iwQB1JaQ+4zCXEw6QAXe2+sGCtH96tca+CbCQd+bcE1qqtp8dbDw0k
	tl
X-Received: by 2002:a05:600c:4f90:b0:480:3b76:6b92 with SMTP id 5b1f17b1804b1-4803b766c41mr181452225e9.29.1769095076648;
        Thu, 22 Jan 2026 07:17:56 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804702fadcsm80395865e9.2.2026.01.22.07.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:17:56 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] usb: csc-acm: add Infineon/Comneon modem support (1519:0020)
Date: Thu, 22 Jan 2026 17:17:46 +0200
Message-ID: <20260122151746.7745-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122151746.7745-1-clamor95@gmail.com>
References: <20260122151746.7745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32633-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[suse.com,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C8E9068CB7
X-Rspamd-Action: no action

Add support for Infineon/Comneon XMM626X modem that used in many Tegra30
devices with GSM capablities like LG Optimus 4X (P880) and Vu (P895).

The Vendor Id is 0x1519
The Product ID is 0x0020

Output of lsusb:
Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/usb/class/cdc-acm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 73f9476774ae..2bb84b261239 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -2024,6 +2024,10 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = SEND_ZERO_PACKET,
 	},
 
+	{ USB_DEVICE(0x1519, 0x0020), /* Infineon/Comneon modem */
+	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
+	},
+
 	{ }
 };
 
-- 
2.51.0


