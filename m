Return-Path: <linux-usb+bounces-35034-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KbhNk14ummTWwIAu9opvQ
	(envelope-from <linux-usb+bounces-35034-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 11:02:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1FB2B9992
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 11:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B3A530797DA
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0FF3A963E;
	Wed, 18 Mar 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="fsekIUmB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7083A9D95
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825843; cv=none; b=VuT5cnmayupfyKwxHWgpTnOVs3HCKXH3RP+sf9om+eRsSDETICUrmHtRZVLlCY8PUb2ap136T9QPJDDLasHPBrl2nKLltDDKhy9dOJn+UF1qOva+4jlaURWfwPxRm/WA9rFzQVg77RFVjXze3MrCKQxoVqTdLbF6hkBLRNopDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825843; c=relaxed/simple;
	bh=m1euI3OzDSYqWkr5qaNDN3Ad/VkhEYdMthOwLK8X2pM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GCiMQStjRnAnyFbebpl7FZCJ//AQlKkzuRLJA/+XqEQ74djxfGzkqXSXqq1LPRXXRdvXBDDPW30uT7uSKVxOCIncFux+HuQl75A/zPBtMAB3gyp+vTCcLJDKFS/Yny0+Eg+nXotFZ70VFUyNrmCVKluWH6TZpnoFWOrWjPnx2ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=fsekIUmB; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66732a99928so3054398a12.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 02:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773825839; x=1774430639; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TqI8+D40aH/N6fVzTqh+I1qp6sgd1qUJ6jWkp/VQ26M=;
        b=fsekIUmBjNr+BbDdLGCXpeiocV0kX0OPFI8+yTAGfPbTDsuqb0vQXqR5SBK02VVsq1
         b3ORFbKKS9+J41BANdkC4qB29hgVyd1XioKBvnwIlVQ8kARBFcgjW5aVXS0BDeEQTr6I
         eRbSR7Ue/kHDcGiGhBnp144ixip7nbFhzKeGLz14P9UdTitcvHIezyDb1B66VR4d1aHm
         maECTsZLGVETj400z1mQVdoBIO+w/MQfsesxdhzXfIOxF6n6JqwBRB3NloLRwUmyfNBw
         RTgDlQo76V0R7YhhqK34sKMJohQJhoNMpjHpLKHwwdpt8ASgAjEubrOo5caAWmTLEjTa
         7amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773825839; x=1774430639;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqI8+D40aH/N6fVzTqh+I1qp6sgd1qUJ6jWkp/VQ26M=;
        b=p6qza2oLzG++D5gdSHR3kPb8Lgbh4heoe531IUc7ZptWapBg4kmioeG61AMMlQxKOB
         5e7nuApR+e5JSzOROPjSZ6a9LFKtERMN8rdGEPSeKKZqH76O5DtXied+sxXMTM7dGNkD
         rfveJkjhQStiIF0d+UlQpC9ms+UqxH1pxUy8JeHRgF357kgfKvt1Utxaixow9TXxH06V
         K3BEhGsYKwrBAOSqUadgToEiunm9E5X8YQ+KyxdfyxMCO0tu0ZaNjaIsObAePAImkC7L
         JENUHhxEcBCaSzp8En8oTCDiPdZ9sPPlvxV2spXPh0wWbvw1ppvPSjJjc5Slb5kPDFup
         rBZw==
X-Forwarded-Encrypted: i=1; AJvYcCXm9qXouuyTAu+8N9rYRnznUmR+P5ZY1Bdr0KT9kBQzE7NxKq4b5DfETpfmvn1gAJg7QGLwoHvg7sU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LfUHehKnlgg+MpDs5u1dY6Y1kORJUdAieyGiT+mF+6Dle1gT
	IZSe09zGegeWbRyMSSiXRRiZ9Ol0ELGcGHQD5P9jmbq+1yltreEYfuJymQP+gapjTvY=
X-Gm-Gg: ATEYQzyKFnnI3PhGHfyVTbIWzRvsTEjsH1ru4ii/cvUsgkoohFDYIw4AmiuCHK5FRgL
	fMoD3kW/uNGCRbTQaHT2Ose1N5dwsYGBPub2p2riSCIm4AXQZLufAXJSUGlIr3R0umBP9kbPRII
	1+gRluAnrePSNwXL/aHNlnol+3/agZ4MbyCkQX7f0yvnY27PJHV1IHZa56SXZwJX0dvBqVro0d5
	qEhKtlrLu7ZORC0y7ljc6vfNbhOaxW2lSN++ZXefRqTJfMUy5SXj42+0RA+XSKdoypO9aSarSxu
	guLHrVkImkg4hibuiVluovYVyERpiqwvHgFmYqxD39cPdz6ZwUbrtJ1SCUdYBKSbO5Baabt455B
	UwDvBsVJth+HeIx6fGj2xIY8TcCd0Z5u3wO5E49t1Ny78MZRenIe8bgFaJ+rtCGMvJ5l8l582Kf
	Krf7ZzQIAfvcHS5SeYGd67wTUsTUAPhNnLMggfRCU306U=
X-Received: by 2002:a05:6402:5188:b0:664:4ea1:78bc with SMTP id 4fb4d7f45d1cf-667b2c0d425mr1636856a12.27.1773825839226;
        Wed, 18 Mar 2026 02:23:59 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.212])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667afb4cf11sm1309970a12.13.2026.03.18.02.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:23:58 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v3 0/4] Add HUSB311 Type-C controller
Date: Wed, 18 Mar 2026 13:23:42 +0400
Message-Id: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB5vumkC/1WMQQ6CMBBFr0JmbU2nBAquvIdx0alTaWKAtNhoC
 He3YIy6fD//vRkiB88RDsUMgZOPfugzlLsCbGf6Kwt/yQxKqloiVqK7RyoRhWqRiNBorWvI7zG
 w84+tdDpn7nychvDcwgnX9d1Y3U8joZDCqYosVY11Th/dzY8jh33PE6yVpH5N/TVVNmVpUdu2q
 Q3xv7ksywsHKOPF2gAAAA==
X-Change-ID: 20260115-husb311-291bbb1a7776
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587; i=alchark@flipper.net;
 h=from:subject:message-id; bh=m1euI3OzDSYqWkr5qaNDN3Ad/VkhEYdMthOwLK8X2pM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTuyteoXhdV3Wgdflb+NO/bf/kPSkz2fLhfle4m9WtFy
 D6VNpMHHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEw1rx4jQ0fxP9cLvL8nez1d3dpxU+XGV+97h55umH464lt/d6y8zEVGhpNcK9d
 /unC9yGb9n9Nq2fd6Hqh5cE5053qdf9nm9toX21kB
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [4.34 / 15.00];
	RECEIVED_BLOCKLISTDE(3.00)[193.32.126.212:received];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[flipper.net:s=google];
	TAGGED_FROM(0.00)[bounces-35034-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[flipper.net,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[flipper.net:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.748];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid]
X-Rspamd-Queue-Id: DB1FB2B9992
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HUSB311 is a drop-in replacement for RT1711H, used in Rockchip RK3576 EVB1
board and some other boards closely following the reference schematic.

The existing RT1711H driver seems to work fine with HUSB311, and publicly
available documentation does not provide enough information for HUSB311 
to identify any meaningful differences, so this series wires up the
existing driver to treat HUSB311 in the same way it treats RT1711H, by the
way of introducing fallback compatibles in the binding and removing
unnecessary VID/PID/DID checks from the driver.

Note that patches 2 and 4 are on top of commits by Yanshen Cao which are
currently in next but not in master. Maybe they can be squashed in full
or in part to reduce churn, if we agree on using fallback compatibles.
From what I can tell, ET7304 can also be used with a fallback compatible
alone and without driver changes once VID/PID/DID checks are removed (I
don't see it used in any DTS in either mainline or next yet, though)

Signed-off-by: Alexey Charkov <alchark@flipper.net>

---
Changes in v3:
- Dropped the DTS change from this USB-centric patch series (thanks Krzysztof)
- Dropped commit references for patches not yet in mainline to avoid confusion, as
  they will change upon merging
- Link to v2: https://lore.kernel.org/r/20260317-husb311-v2-0-03c17c986abe@flipper.net

Changes in v2:
- Changed the binding to use fallback compatibles (thanks Conor for the suggestion)
- Rebased on top of recent next, thus also adjusted the binding for ET7304 to fall
  back to RT1715. There are no in-tree DT users yet
- Removed the VID/PID/DID checks altogether instead of endlessly multiplying the
  list of matches for new clones (thanks Conor for the suggestion)
- Link to v1: https://lore.kernel.org/r/20260311-husb311-v1-0-f25bcb58cff7@flipper.net

---
Alexey Charkov (4):
      dt-bindings: vendor-prefixes: Add Hynetek Semiconductor Co., Ltd.
      dt-bindings: usb: richtek,rt1711h: Switch ETEK ET7304 to use a fallback compatible
      dt-bindings: usb: richtek,rt1711h: Add Hynetek HUSB311
      usb: typec: tcpci_rt1711h: Drop unnecessary VID/PID/DID checks

 .../devicetree/bindings/usb/richtek,rt1711h.yaml   | 16 ++++--
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             | 59 +---------------------
 3 files changed, 16 insertions(+), 61 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260115-husb311-291bbb1a7776

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


