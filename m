Return-Path: <linux-usb+bounces-34912-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEgHH3QXuWlqqAEAu9opvQ
	(envelope-from <linux-usb+bounces-34912-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:57:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D82992A6185
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 09:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B9D5307C494
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 08:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E0939E182;
	Tue, 17 Mar 2026 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERmT7ZAD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EE730AAB3;
	Tue, 17 Mar 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737732; cv=none; b=fWDJrqU/5L1Vtu+ECOWZ+hP9P0DmKciIP56WRHovKgjP4KC3BkC1XgKT5RODQMrBzCULSOYNsTN1yySt3UvDocLXRtY0oUWQLoMWcDuzVa/EPg/k3XZXov0pwsBMc1tESWf0AV2bfDyBafVkOYGtwdvcos9W15h2Dpec+6sfTWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737732; c=relaxed/simple;
	bh=ytoYg/NELikz1d2oshtt+Emu9o8xfwPr7dAsClVpNDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oPBhjo12eXt+YjKVIHOC3MUttK1lO1KJWDIWQi4Ub3g0hxaVv79Xt4b0L232LCzL1f+GZLhi0/qxnKs3n5i6F1ZqL8DWt63vTRU6sWTNgVm49oHYEWhf+GXUfAm2JaeHK2cXz8K6YxJlJuuSf2XWDcWjXZ97vuRAM4wGWgmEnyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERmT7ZAD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53164C4CEF7;
	Tue, 17 Mar 2026 08:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737732;
	bh=ytoYg/NELikz1d2oshtt+Emu9o8xfwPr7dAsClVpNDs=;
	h=From:Subject:Date:To:Cc:From;
	b=ERmT7ZADERBraK8UWXwBgl+DEk5ed9UdCeCBcL3/8nsbf7GHj7Yh6xEa1Rx/Prhj/
	 0ic04lphya6O6lRy0tImauKx2fHWDVYzkhwt1oJqX3ZzalnQNDQ3XkqofC1OTx0mDr
	 +UhpV33bkTXUA8IDzujoN778OumduGju6VX3wk9wUse45pk2/57aL3+u/V8tPhJGSt
	 idv2Q0eH7q3JHVbm0Kd4etuZPvkmFXgKtvVAEQLMZSvL7hD5zzvF53xM57hs2msyNc
	 eNKs0raVLO2IB6yXQ3wdPl0XIEixLynL06CHPwJ2AcEskz4MttCujsuP683Js6jGM6
	 l/arqzuJfuQSQ==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/3] usb: misc: Add Terminus FE1.1 USB2.0 Hub support
Date: Tue, 17 Mar 2026 08:55:01 +0000
Message-Id: <20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUWuWkC/x3MQQqAIBBA0avIrBvQTIuuEi20xpxNhWIE0d2Tl
 m/x/wOZElOGUTyQ6OLMx16hGgFLdPtGyGs1tLK1UqsepcaSPcbiMZBCbawj1/WDMx5qdCYKfP/
 DaX7fD5scpq9gAAAA
X-Change-ID: 20260317-03-usb-hub-fe1-356aea478a5b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, spacemit@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=dlan@kernel.org;
 h=from:subject:message-id; bh=ytoYg/NELikz1d2oshtt+Emu9o8xfwPr7dAsClVpNDs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuRb1lXawAneOeo4n+uir9a02827DSaIjL4x9a
 jLxGoAQgSKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCabkW9RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3GKg//WrOgLfvIR3ATlKLNvmUVAblVUjWr9gkERwMBgZsxHTIJjOJ8qaPnh
 /5SM26rlQCUaCByefyWBWvuSNJJHoOVsatKYOO5eJGRdtqORzNk/b/zhxd1Hr+JiaPTJESeEs1j
 IucO9EpK5cjmBd2Xv/5A9DVhwfQznFxlfW/U75q5KCr33pgyvS4+3VM2DpaBngZJDgyoQNVu/kD
 aT9F8Nnmz9O908sN607ETxo1Cv7pgB7tOXPPDgbpWPrkoFPf74UhiyQpZwwY81MTL5Nwmr9HhT2
 j/dXWpeV7wCIgrOceS3zrNhu9bA2rKaodrox1a1t+XetaCy+WcGC7ueHJJcGpuwcoVgxxEXAld8
 e9skIc/pysI0nYGmrVW9urFEZT4CRZKk6P2XbWhJ+Z/ohf90IUwnT51/EPrXzDU7aX5DjaR8z1L
 1fjlDnOMIuHkX6LQ9DQxNlpy5EGp36xh7s3vCvM8l4GeICWaryFRfVJ8nsmSiC7zY3UwYoEN76F
 OxIXFSThYvrM3lLosxRDDrdaLg/jVxNJfrc4zDpDLXVW4HA7WXud8K9EdOcUhMEKNs+pQPklhqL
 vKv9heS+UT5B53d0RZu37xQGjklqMSqxtgGrY7WGasj3AF6dXkxofFe7zCkjqARFe/O8E1ylcPt
 UYs+GPBfImqS3clHmuxcUGcpRhAVMs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34912-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.spacemit.com,gmail.com,lists.linux.dev,vger.kernel.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	HAS_WP_URI(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[terminus-usa.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D82992A6185
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series try to add support for Terminus FE1.1 USB2.0 Hub.

The FE1.1 Hub provide interesting choice of selecting power supply from
either 3.3V or 5V, if need to use integrated 5V to 3.3v regulator, the 5V
supply should be used. Otherwise, 5V pin can be set to NO-Connection,
and use the 3.3v external supply source.

Link: https://terminus-usa.com/wp-content/uploads/2024/06/FE1.1s-Product-Brief-Rev.-2.0-2023.pdf [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (3):
      dt-bindings: vendor-prefixes: Add Terminus
      dt-bindings: usb: Add support for Terminus FE1.1s USB2.0 Hub controller
      usb: misc: onboard_usb_dev: Add Terminus FE1.1s USB2.0 Hub (1a40:0101)

 .../devicetree/bindings/usb/terminus,fe11.yaml     | 61 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 drivers/usb/misc/onboard_usb_dev.c                 |  2 +
 drivers/usb/misc/onboard_usb_dev.h                 |  8 +++
 4 files changed, 73 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260317-03-usb-hub-fe1-356aea478a5b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


