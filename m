Return-Path: <linux-usb+bounces-33743-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +B/bAgFuoGk3jgQAu9opvQ
	(envelope-from <linux-usb+bounces-33743-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 17:00:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 631251A95BC
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 16:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09B7D32F150D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 15:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752893D6470;
	Thu, 26 Feb 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GSoBSH89"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A2840FD80
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120380; cv=pass; b=UNE44axjC3URymAK+uBXubh9MkeH1B/1yEQYi27LIvbIX20XwzxTTxb5cyTFFoxqFPr+WYgqYdcrNny7ckOZ7XuPoE9uslRHe4sjct89egvzRlAvUpakSn4Y3g9JI26NsqJsg+bODK0FC4eNNIfqHo8hdYR2XmS3B48dyLESjU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120380; c=relaxed/simple;
	bh=8xptqJuqr6y/XZ8cnubujeOx86XkzhzmPx/rVf1SSn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JdAHFdLaeA/D1SVPgRyLZJzkz4DgTdsc1HHVcz7xoLfdmrxs+gDlxLL2+jb9YvYeXI/gOHeb/Ed7vcMOxP7VbZKNUBIrt0UUwm+69Hq/bEVTG01EhY1b6iVVVmmRPFRGd+aneLcJF6AYoLX13aCmzlgiYCuDn7lVlGdlbLtQ/TY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GSoBSH89; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120361;
 b=dswsB7z+F9tcx+7VZJHADReWBM7/H08Z/ckjsbyZ1wMI7bRcoOo27DTJxfCN+VMlo7ZgrJpy
 HD7ef4XxS3CLb0HeQ60dkgQm9JRuDICtByH27XfqICl9tKgdyTQjVm0NFQWg8UIhWHqGtgFrN8O
 oHj2DwNB/dlN6VQcnjEJme542SWLBQPcyIV66HOh9g3iR0nJCdXH+JDvhqRKyKmp1EJsF41wBAD
 gxm/QgnxKw/8j+kI5f5eNfXbDKFe2m21nqitj/nK0A6P/lNZDY/eeTerJGTGnWNTu3XjBEfjPHI
 LsiyzR5Z+hr9EAmlhRkbD4i76N4AQsujDyZul4vb3YGyQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120361;
 b=WB+5y5JYLNsjS87KM8SNmXZfJFwXmiBJ4TnSrzq69C01y3GVvCKDZmMU0s83zFhDs8FDbc/H
 iYF5rJ6dcyJNCovzZTgZvqbQh98NG2QVV8aWszXAslceLfxcXt4svwPWkPrZaHmyx+zEljog7R2
 3XTfNMF0uj3fzULYM07J8nGFxU10G6THMTJEOBnKP+w06RiJFjVhMVPF+7TUIZcUdIHKSC3kq7Q
 Kd2HTsEH/sET2JhqgUZ9shdwOW4LWwYymwXh7+dBCrT80O9cgUwHSl19cdNlq7VkizRNIk/4WX+
 nm4IAcKvaWo4Tm3gm5EKZjNGysZ+lRqpC+o09mPg4dqOw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:21 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B4D43A40F28;
	Thu, 26 Feb 2026 16:39:02 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH v3 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 26 Feb 2026 16:38:50 +0100
Message-ID: <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fMFxN1L01z2nGBP
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:99766f1dadc9c0fd76839a32754897e4
X-cloud-security:scantime:1.750
DKIM-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120361; v=1;
 b=GSoBSH89gFsTfU/C9MD1/IEMEiZ1mi3v21+rOmdrx40OZt1VAikdTbvQGQ/ZeAF6gVDPIUHg
 d3llBrMOaw/bCYa8kYslGsrW3VFPiR0ZZ/inekkAyeT4HMkjLFGyJA3ivSW8gR4UeuFRYVZu1K4
 7Ym0XQaJSY5bV5mR+CuD8BPZ+0ZUOm8ACLz8RIc42nSLxdGjbFDBDEnKBQArcuM7KHb3xCaG1Mz
 jj4Fszww8eyac4KQfnZ8xTT6q8ZumEGzqZTXeuWZM82G1rpw8wAteODviZxYoXWDrvNazbf3LsI
 IzrEyFXdQvaR1PbSmhcjWD0IMRro9F0vnIdUs3gv3gVog==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33743-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ew.tq-group.com:mid,ew.tq-group.com:dkim,tq-group.com:email]
X-Rspamd-Queue-Id: 631251A95BC
X-Rspamd-Action: no action

Reference usb-xhci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Fix commit message typo

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..a199e5ba64161 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,7 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0


