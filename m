Return-Path: <linux-usb+bounces-37260-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGAzM1ThAWptlgEAu9opvQ
	(envelope-from <linux-usb+bounces-37260-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:01:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EFD50F8E2
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDA54306367A
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 13:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2A83FCB03;
	Mon, 11 May 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oqztsxt0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F17F3FA5D5
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507852; cv=none; b=V4zlQWaE7MT5UBkC3Q6qwY1/hrxvwQhLWWAvtAudYPts/w5VKf3ax0YnwtFkvPjo/rCcAjL8F4FxTOTPrICj3ssqMreb1SbVRhfJpa6Sl5W79vENbj8dWR9NzSNFH8KHsmkn+/9NXoIEpG/gbBmOoaw3p17eQssrGQuwM+5Yr/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507852; c=relaxed/simple;
	bh=ibm/ZDHMWfIYB/a+JVogHL3zgQTqT1cxj2txge0qJK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8K/ogJPzEnIN9/XhQMrIvZ4tp4x3HlGWXKZWinOqbIz0cJROsYyoCkFqeahTEZ8m2GgoDry2Ea1eh1WeikHArqf0aKUZBXVqwVfWts5AYBHnoXwbdWOwhGw30k7TEbs6mYQOBzNStLahxo8T78dNMDuUNzLFsp7GgGw7ZAujZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oqztsxt0; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso5340511a12.2
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507844; x=1779112644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yZ2RV9klSfc79KrOIT+9nKykbDSPRLRaZkXlnlwwJM=;
        b=Oqztsxt08VSED0yBq9y7gCvbNeIQsWzh6qCP6bEWpOdaH42iP9LOw/D6fGAQi8O7pP
         8+T/5rP9lXkGXz2utuy3yO0zDbfmXhzJypfb6BgwM6PSQX0GCpNEM14v5BFNjmOov3Gn
         vxaPdFefs6gvL0p3aCWOocLQqQo5BTYQrDwktwEq8VWzDpzN8toh2+prb+Ng2NNrP0xz
         XhX00H0+39dIbVI/dH+NyThiFKEqNozZZR3B+4A0iu+cG+u6cxhhiHfjz21bwZ3E+ghv
         4ZmQ7dgxb+4CkXeqhSUYaY50vct0v3vg3gyhxjPtxPBDVISq/a2x1EKKCpekXefD/C50
         KmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507844; x=1779112644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+yZ2RV9klSfc79KrOIT+9nKykbDSPRLRaZkXlnlwwJM=;
        b=d1T9brXI70J9GGoASNzyOHTxtTpXscxIa/UieeJaMmxaLj7S6+hVREzWxy9WUisSzF
         B4SBIjev9UTciXFrbvNvXfhLzE8VMazd19cJ0Lr/YngOgDhRjAr+oDTFItrvR5F40JEs
         BlS/JDh85i0p3WQKq//Jn0SmY7OPYjFraTJTEjsuP24E4Fikw4LAiTvSh50fpnJwaIYr
         9fhBFZ/buev/17rl7OzQybrby9TMJqXg0quJDY7Wl/64lcnv3pmcPTzohYEetbnDzHuJ
         Nzx5q2uOal7iGdQvpM1IZM1lvSrgXlPCMEwlqlP3cLwBZ14ze+rScX36KVFbn0rF2rnm
         4K9g==
X-Forwarded-Encrypted: i=1; AFNElJ+tWKRPf01qSihpbeS0DHAaPVMbPH229yuICiLcl4ydBWRLt5Eu/fKVBP8TggXxljqTl4fHvkLZkfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2V3OU6jghh73iaQNAxszzgTEZkcg2AVZO4xV86xk5IzkPQIMq
	gaSH/SqSH8vEPpxJC46uo4CCvqIu4NSMPoVeGMyBfGmvtIE9DvPyi9ru
X-Gm-Gg: Acq92OEZbfCgrwzahFzm2HdhRB+ltwFu2G+B0l3Ynv8gn2WchAXkCGxMtbjWreEFVhn
	txHw572Rx9EMTdE3D0wAv1NSsvTXF4ndVtwgPUTPD2MANMI6gPoyDoQF6Ac2xSd9cK4eSQ5xBmM
	6r6DWveKG776IbFsL5TFPCuYtJsP9GaCYHREZ+OpMSl5+916CPqFxJObmoDG0u+BQBy2WjKnl4/
	M4IjbZP6vO0ULioYJjgsJz8YmP0HLgwkr5vZx8ryuC6cbiFZCe8E1hFS6jeteSGL85QNRSWLfgu
	ewqTxNesfz6Mxpha+QRPT3kcxk9j/MGGXLVgii9EdaEqlhf9ZYNeWWaj1N4StnnPJYz8g8hnaBt
	z0E5LLsUNq3B4gAH2+ArlK5hwzPoDXdDZz6XY5addmWH6/UyUxWG9eBe6HkLcjcDxPiBc5YhL1g
	MDqOhmJxmODSBB
X-Received: by 2002:a05:6402:5297:b0:67e:2498:dc7e with SMTP id 4fb4d7f45d1cf-67e2498ddc9mr9228829a12.11.1778507844261;
        Mon, 11 May 2026 06:57:24 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control property
Date: Mon, 11 May 2026 16:56:56 +0300
Message-ID: <20260511135703.62470-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511135703.62470-1-clamor95@gmail.com>
References: <20260511135703.62470-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 42EFD50F8E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37260-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,linaro.org,nvidia.com,linuxfoundation.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,netdev,dt];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Document the nvidia,external-control property required, for example, for
USB lines in HSIC mode connected to a modem, where the modem requires
precise control over the USB bus to properly enumerate all its stages and
intermediate devices.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 691d6cf02c27..a13c1ef49a57 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -75,6 +75,13 @@ properties:
     type: boolean
     deprecated: true
 
+  nvidia,external-control:
+    description:
+      Indicates that the controller is configured externally and that the host
+      should not attempt to touch it. Usually used by a modem which requires
+      precise bus configuration.
+    type: boolean
+
   ulpi:
     type: object
     additionalProperties: false
-- 
2.51.0


