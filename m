Return-Path: <linux-usb+bounces-38007-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAguNLUWFGqFJgcAu9opvQ
	(envelope-from <linux-usb+bounces-38007-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:30:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 382EC5C89E2
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:30:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E0D0302C5D0
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C368F3DD513;
	Mon, 25 May 2026 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7qC440Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B191A3E639F
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 09:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701344; cv=none; b=hMltEmFtdYytrtSNVjuEQwJm2/vjkxvhKY1YkesY9F+VYvGtBtzOS4nlRufKWzuPZwT4XhiKuR/kwBvk5ko30/nSIE1FZaSpUN1MD77NJmXlA72s5gRdpCThbt6AMP8b43+z5eMojvPaobQKwIYgB8+0jouEofLq39x5rnw05tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701344; c=relaxed/simple;
	bh=aSVYpEez6Aw3aMw4yoHZCiaTJpswyN4Tsnuhzn+aSKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ntzf2rXfPiPM8XheVGTAWk4D0Y+bNmf2PIkZ8wFldXHcSbTLTMmUf7wCLGdxeQMynl6ILLlcWY/Hd+cNPpjccanLOqYjsS3Kr3sW7bzWznbydz51KgKOBPt/H7gDW+OzLuK6kKOHtzX+UFugv5hARyUq9JqFB9hA80Vh1LGh/po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n7qC440Q; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b74b460d77so129656506d6.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701342; x=1780306142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/u6dFLgaY7n68TYn6Ld3RzN6PYRAr2JmUCcJULqcT0=;
        b=n7qC440Qy4xRfoZEOYrH71Zxu15QxQsQzAEeakQyYCxS3jEOTYf5wX9ud4yifTPIFS
         bu8aI3cpZFgJUS+8xPv9VJyCoLWMVyMaABtMklzW2EAPHqyrXwXfOzOMWITXwor/NMhh
         5aIK4GXoMCda5RZgTYySKwkeCTY6pR9cF4lFjG9TD5x8+ZHR5MDSDukWDToXRImfQ/8N
         1ZixY9KCDJxurZyN6/c6CWDqIXQW7JafHcFe3henWvSNijivcz4wZu9/qEjnCjDD13AL
         NxlHTXPTX2KsVH2FTZx0nG9N3IzswW3LzgqyT2Ss1MshyHwqdDLnPYmpfvTNbXRB/rX0
         Hulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701342; x=1780306142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/u6dFLgaY7n68TYn6Ld3RzN6PYRAr2JmUCcJULqcT0=;
        b=LYnD20iLcRCzhEOMK1Z5C2PlLkZS0277h4KFL6LgnbZhWVOIm0gDiWKAkZ0wOYUGYr
         OVmulhtKzpJ1DPcYIrp9zHpng/9Mobs78sfqjDKt8uHxD0uq/O0F5aYS5lw4XkYJZS+B
         3XEDmlmt9I91K3jM9PX9zwyPBLYy4C/yf1h2j1IK+1scGnLzFgTKNY/jCVRhAUTNI2hJ
         MVi5b9OML6JDGdWIaP1fIcX5qF7xuw2ELu4HjHIflchtRCk2TtS4UUescs+xq6u7EQo9
         fTBWXtiYjcbhEZCysp1tjtReegfW7gfsvhkp6A7qeb7YlqfOHW0wAPXktE5sxzNbgfGt
         5nSQ==
X-Gm-Message-State: AOJu0YxtCxbo0qpS/sWpjEN1lNENlud93rNUXAmUAFA5JVr90cgMq0FY
	4VqRfkzuhe5lYac5S25oPtFxcmGAvWtut3pYQC1Ta4mI/x/nydJid2DN
X-Gm-Gg: Acq92OGPLEvJMo9o7RNpAaC7ur0VMomG+Ds2nUhZ/JUbTdNpkQvW4ZpKMhaVv71WzFC
	E0r8Y8ebqx+oa934UZLDz/+tWeYinn4WKoafFGc66AUMCm47vH1/35U+9pt+YijwNS+jBlsRI7h
	at9wKaVk7F16t5uztER7qvQKsRVvKWyKi9zm3EV8vwpghCzXePJARVPEOKD30I2lgI4yXOqRMj/
	TmNXcUbNOgvTFC4SFe194o/FSIvbkG6XpRYsO8EWbTJ5eMjtynhGrxqnjdlsCiGNd0kX6rdxZDk
	qCDaaz54rIPH4FhBQIbPsA6SO4JLAY501Nj7jzi1ef448314JUU84oZCugsbQpKdrdOzLd+tmZB
	7aXPoI1yTH69Ec6Bmg7t7vSStc+6SLpHw/rWsbBP9sF6CFNkdfTqn2Po1r8TEZSk9mjDwEItRr7
	b1RWfvDStrRmowS44K+BgNhZ5hG3jgQZxsrTNBrHrv3t1tOPxY4BsmFtn7cJFa7/k/ecX+T0yJn
	6TUR+iTDVYzK8QJuZnlt70REiarbw5OiTbrSoySUfBxtYlaTxeHHQ==
X-Received: by 2002:a05:6214:3d88:b0:8cc:6b85:610b with SMTP id 6a1803df08f44-8cc7b5ff8f4mr230230136d6.47.1779701341602;
        Mon, 25 May 2026 02:29:01 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf4a9sm104255826d6.2.2026.05.25.02.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:29:01 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] thunderbolt: clamp XDomain response data copy to allocation size
Date: Mon, 25 May 2026 05:28:27 -0400
Message-ID: <20260525092830.735472-4-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525092830.735472-1-michael.bommarito@gmail.com>
References: <20260525092830.735472-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38007-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 382EC5C89E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tb_xdp_properties_request() derives the per-packet copy length from
the response header without checking that it fits in the previously
allocated data buffer.  A malicious peer can set its length field
larger than the declared data_length, causing memcpy to write past
the kcalloc allocation.

Clamp the per-packet copy length so that the cumulative offset
never exceeds data_len.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
Confirmed over Thunderbolt 4 cable (Framework -> Dell, stock Ubuntu
26.04 7.0.0-15-generic).

Also reproduced with KASAN on QEMU (7.1.0-rc3):

  BUG: KASAN: slab-out-of-bounds in
       tb_test_synthetic_overflow.cold+0x131/0x29a
  Write of size 192 at addr ffff888002110200

 drivers/thunderbolt/xdomain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 754808c43f006..4099419c74795 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -393,6 +393,8 @@ static int tb_xdp_properties_request(struct tb_ctl *ctl, u64 route,
 			}
 		}
 
+		if (req.offset + len > data_len)
+			len = data_len - req.offset;
 		memcpy(data + req.offset, res->data, len * 4);
 		req.offset += len;
 	} while (!data_len || req.offset < data_len);
-- 
2.53.0


