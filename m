Return-Path: <linux-usb+bounces-34922-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNCXLclAuWmB9QEAu9opvQ
	(envelope-from <linux-usb+bounces-34922-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:53:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFF62A9476
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 12:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C40AD3028614
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 11:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679BC3B47ED;
	Tue, 17 Mar 2026 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jq1vwglx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A673B0AE0;
	Tue, 17 Mar 2026 11:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748420; cv=none; b=SbzVNaCNiIctPtSsqOVHxfXjEp+KwKtb3GwAUoR6BsK+osnn8HnEwIw443wbZWHwH7rGVN5g1xS5Cf9BbOCIv/SyTehtSwftpfr84nw1JhZPCO49J4PgAK6p+iXcb7BT2XHpZ7MJsHwvvLy/gyjT/hxeF7GQ+0gVNN7dTE4AW24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748420; c=relaxed/simple;
	bh=+wB0nGlH3b98xGNxnLGieC5pTIclHz8kRT9qETUs/0c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OmUzRwTNTxb6Ua+euNpMp5X/aMS0ReYJv7e8KzrIyRtKP7Ss8iwd43rmT65Of9YZWp0Io7dxfKMDnDPwmO8VwbVj01usTpK/rtwPiw9SDWq8or2BoNeGa+zSoMsAe+66CUjb+U+DeYMtP0WknAQJ8NfVIbfECBFTralTQ/3U6hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jq1vwglx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70ABC19425;
	Tue, 17 Mar 2026 11:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773748419;
	bh=+wB0nGlH3b98xGNxnLGieC5pTIclHz8kRT9qETUs/0c=;
	h=From:Subject:Date:To:Cc:From;
	b=Jq1vwglxOtlUBYjWwJ5bIKm8Q/z0TEN383Polxq5j8jMCK7IAuZ60OOppr7pv1KlH
	 AIWALVG5OVxid3z5P01Ca01vSQjYhNhkCFbrAYA/wdvz83x+pAqxqMG66bm9yacJRb
	 GEeR22OVcAD1je0lFoOjeTRNBNvgZ61oHkb1EPkVDOyuPGdShxx7RgwO/IcvAa3Abf
	 BTPeiDuUl3IQuOM7rz16bY97caG39wKohNb84dLD+V6TsLV3n50nYDFFYwEFJWqH2t
	 y/8cbmC/spPavVMEFw6NN/NJsF70FDz8nqlppRtRZcgTZrm40O6S3dGocGrQm+CtTJ
	 9iSupeQJU21Yg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/3] usb: spacemit: k3: Add USB2.0 support
Date: Tue, 17 Mar 2026 11:53:01 +0000
Message-Id: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ1AuWkC/x3MSwqAMAwA0atI1gbaFMV6FXHhJ2oQtDQqgnh3i
 8u3mHlAOQor1NkDkS9R2bcEm2cwLN02M8qYDGSoNM4SGsLV4ak9GdQzhD0e6DtbeVcWBfsRUhk
 iT3L/16Z93w/szAejZQAAAA==
X-Change-ID: 20260312-02-k3-usb20-support-9a1893655e9d
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Junzhong Pan <junzhong.pan@spacemit.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1617; i=dlan@kernel.org;
 h=from:subject:message-id; bh=+wB0nGlH3b98xGNxnLGieC5pTIclHz8kRT9qETUs/0c=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpuUCwZW2UlGpYgBrQH8C3+68w1GroLUHKcSLj0
 XZAoRkZb+6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCablAsBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0hCBAAhKhdNqfFymkohpiwXtIs11IO3/6AVb0PeoU/nYJlSqpJtBgGDwbvP
 ZV9XFtXt/iX7fl2g1ESc3XzfHW6lQSUzT4chacU6q2xHRGoIVhI+tGQyemcVJbR7tw98lfoaJZt
 z/uUZVbl+Gi/XmpnURT8L7Q/a/7HUGHQBVjXvdNM+SO1qe0H2x83khTyrBMVUymNzSFl04+59sr
 NyDLbc57RYeXZAMRStpOJkr6zY9rcjY2it8b4rkiXO8CefBRRxZRqgLpQnML/5gOTp0qoCaFHai
 CR1zO6htjU92YKEGF/LRfrJov2mIp+jOoYbNIAQDtnZ9JLwGviEL+DKJXsVHXXX5ASDwfjczAwu
 6ee093nJuPgrOljmKbap+tzhLQFXdBsVLnLGg5twm0x9JQLTBmaJCtk0RmaTecMa2uLM1fQHWF7
 437V1erwPXCLWiyyiqOpqv5ZGgcgO0iPqHEJvRPlb6JRLUhvlye8S8TFC9pDpr7FRQ1PMHPS8+G
 XQRXiOEK4h9Vfo++PgEqfb/N9WdVpK3hJlRUB8an9ztQ+tjDjbpLIp0iChuttONVevLJoBokGDw
 QMohqT/jJMago9zTuN3PzFlP9cmnoNBjg69bj04W0xl4CSwa5tPeFA/HSW7D8H9dEnhsc92NAva
 cyDeEGCltMt5Lhv+aj3OM3SYUsd1Zs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34922-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[esmil.dk,spacemit.com,gmail.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlan@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BFF62A9476
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is one USB2.0 host in K3 SoC which actually use DWC3 IP but only 
provide USB2.0 functionality, and with only one USB2.0 PHY connected.

This series try to add USB2.0 support for SpacemiT K3 SoC, and also
enable it on Pico-ITX board. There is a run-time dependency on USB phy[1],
Hub[2] and reset[3] patches, but each series should be quite independent,
so I intend to not add prerequisite id for the dependency here.

For people who interested, I've collected all patches and put a complete
branch here[4].

Link: https://lore.kernel.org/r/20260305-11-k3-usb2-phy-v4-0-15554fb933bc@kernel.org [1]
Link: https://lore.kernel.org/r/20260317-03-usb-hub-fe1-v1-0-71ec3989f5be@kernel.org [2]
Link: https://lore.kernel.org/r/20260314-01-k3-reset-usb-pci-v2-1-9dc0976d524e@kernel.org [3]
Link: https://github.com/spacemit-com/linux/tree/WIP/k3/usb2 [4]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (3):
      dt-bindings: usb: dwc3: spacemit: add support for K3 SoC
      usb: dwc3: dwc3-generic-plat: spacemit: add support for K3 SoC
      riscv: dts: spacemit: k3: Add USB2.0 support

 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  |  6 ++++-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 24 +++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 31 ++++++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c               |  1 +
 4 files changed, 61 insertions(+), 1 deletion(-)
---
base-commit: c4c6e209dcf903ada6ddb4a0baca01ce8459a379
change-id: 20260312-02-k3-usb20-support-9a1893655e9d

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


