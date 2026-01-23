Return-Path: <linux-usb+bounces-32642-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGsSMhQec2ngsQAAu9opvQ
	(envelope-from <linux-usb+bounces-32642-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 08:07:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59107716AE
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 08:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5303330162A9
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 07:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6BE353ED1;
	Fri, 23 Jan 2026 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIu7WVb8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CEE357706
	for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769152015; cv=none; b=MvJR8HHnc47v6z22iwmaLyqXE86FUXcQEdLmkYEteVcEWmbgZbGcTnIQRi2021lxo1S3cboArR8LJsGQFcw2Ed0mNExtRhMI5QNS1AMzRbWWeRmuOnb5g5VFly/CkSxwo7ZcWEEs7AkntCJ2bHPF5buIy1TdvBczoe6aORtTCjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769152015; c=relaxed/simple;
	bh=nRuwA/HjFmC1QvODakZXV6SP7R5eka53nrtg+1WYZOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+uiNDSskHFqFtmEscWMf4af8jeoKllNFXruvQF5tAtiJo+Cg71Fbrn1l1rp//LbrJrVCsi0QnBJEzSOfJDOa/CyS2whz3L4sYLvMvM9pc9H0S5MVuy4e+544qV3YdZYJD5fWExhPuD7I8Cnb1KwAT8IY+LRJf50Ac5lCBwNQuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIu7WVb8; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2b0ea1edf11so2737676eec.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 23:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769152009; x=1769756809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lr7fGbT79MwqhEN9UzJDCx6G/YlhqboOFm4Kaoo4cBE=;
        b=BIu7WVb8GosVYoKDDPmZMBSdIc0DyAvG42YgeU0DqZYF7p4smfXgHQ25iTrs001CHF
         686KtfP6AAcWi7oRq7oIxW5VhPkDziOFJiatoTZK9VVYLVRAUucaSsuhhyuIUDnFVYVj
         MwRgaRgykfHZiHhmTRarkA7U9K/2INEB2uEjcF3gekbqeCF6rIY2bcZQUCI6BElNqnd2
         vmVeyKbBjcGvDSn0iks2EzpF+6sPRfWo6cj/vW/G+5F6eeZZZ/nGQ4r8S3yiKLVqadPV
         dGhH7k1a9hHmTZ9RHUPywsrL6nnvsBcs8NvgG7b8ZQcbojEzvWsLD89okkntI153JVTN
         lLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769152009; x=1769756809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lr7fGbT79MwqhEN9UzJDCx6G/YlhqboOFm4Kaoo4cBE=;
        b=jR6aVk7bW42+034GrUhNhHXy2m8xrrdiAB2wGdHTFyitMOaDPprBIj5vW1Pphw33Xy
         jTX9t6wRB9oscMxZEaK+c6SujuDS0ys8u74UWgtp1EAiWfUex3u83bsyqLB3d5WLCBUG
         /5/cbUMkqNRQyR8IJiicxNutrJ4iG+7QNO8wVpMZszG2jcG8jy86zWEvAT2ly0rwJOHZ
         iIo7VQ2E4QlTLr1TmhaNPMuflGu7ehmfUiZj25A56YzNhoHTSYXnCH0cgw/fyypk1Ua4
         ZzA/d5he7CQZiwauK2Oto2w0nFqNymbr6cKQF9FSz5lU2zLSaDHmlgvShODJSDPiFL8t
         QE0g==
X-Forwarded-Encrypted: i=1; AJvYcCWQD10Xx3wu1HJ3Xrg4f5oPXkknpIENRlEL5hF8REw3ho3jGo46Buf1dt9IEDcnS2AJue3zZeSdlYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn25JwaHhF1FzojLAtcSp8IUfUJEfMJoHhQi2rmap2ENgDzcN1
	C0SveL05xvU9yBKXT7MTMqIczb8cc95Ok7FtF1aufxSwbDVe7p7keVO0
X-Gm-Gg: AZuq6aLbLjkKTzyOSVQcwAJNjlx2/4QvFfoKAw5au2OD15TnR4Qy0d2Z08RvSU1TJOR
	NHMmFwJVdi4WpUPMIAT7+PMLWH02FSzfwMzes7J59g9vHh20VlAIorTut5da3phWSTBu1QVZiCB
	c3bk5Yd+xAJ0t+3wiWPMbO5a8eRYwMxnNOo2+QjjhUzUBZiSyMxLRTvaZGU3ux0RY2zJAC1uUtN
	y/FpjwQ5nsLJcuhDOkCcWPOD14ObaNVmTg7IZZLyqsz770NObMawDeill2+iDL7EevLg+x0Yhf3
	d8dV7fVu5aLDsUqv6fj1wU6Uc7QPbxKJrZE6Xg/ilaIa345sKCckwylHVKy5XTDD7f5oYCNsawv
	+5yVRqSWhgrOsC9/fjTgtxoTRk+3rdV9vPt57dHXltRObddGSn3JdEn3bdkqyLN/p0HgXniRxIF
	N+iKUSY2yruHXYHRlPuG1i1ttoTB0jVYeO1uvXte0DBcw19B5gDrLzEk8trYFXBATxS2yq6GzOF
	yYzmYL4twr4xQf2s05H26sKaGp8154bjNg9b5yc47nHqFo72OOvokd/GvuvZa0/9RJYu0FKb8qf
	3p26
X-Received: by 2002:a05:693c:2b0f:b0:2b7:1abc:a6d2 with SMTP id 5a478bee46e88-2b739b8d7b9mr939700eec.20.1769152009408;
        Thu, 22 Jan 2026 23:06:49 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6b6227sm1992802eec.8.2026.01.22.23.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 23:06:49 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Korsgaard <peter@korsgaard.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next] net: usb: sr9700: use ETH_ALEN instead of magic number
Date: Thu, 22 Jan 2026 23:06:39 -0800
Message-ID: <20260123070645.56434-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,korsgaard.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32642-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59107716AE
X-Rspamd-Action: no action

The driver hardcodes the number 6 as the number of bytes to write to
the SR_PAR register, which stores the MAC address. Use ETH_ALEN instead
to make the code clearer.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/sr9700.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
index 9c7cd0db1768..446857de8e15 100644
--- a/drivers/net/usb/sr9700.c
+++ b/drivers/net/usb/sr9700.c
@@ -271,7 +271,7 @@ static int sr9700_set_mac_address(struct net_device *netdev, void *p)
 	}
 
 	eth_hw_addr_set(netdev, addr->sa_data);
-	sr_write_async(dev, SR_PAR, 6, netdev->dev_addr);
+	sr_write_async(dev, SR_PAR, ETH_ALEN, netdev->dev_addr);
 
 	return 0;
 }
-- 
2.43.0


