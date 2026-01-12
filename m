Return-Path: <linux-usb+bounces-32167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 261C2D1058F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 03:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 920383065DD8
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 02:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8854A303C8A;
	Mon, 12 Jan 2026 02:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b="UNWg8xv2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618F3D27E;
	Mon, 12 Jan 2026 02:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768185066; cv=none; b=KK6GNdTjpQq4NK7eDdXPDhA3q0Q4BQqxCccy/HN19i0DV/U7dTsnHTW/Cny4Hhto3aBOzQjHWgroIEefTrqjNbYSoHY8Gt5WGKb4luGui6czRXFNMigCD9AhrwW4tvLbBz73EX5LSSNEkX9ObidwTaYqBF2yjbO9bmMiwTFbo/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768185066; c=relaxed/simple;
	bh=fozumPmmdDNgXhaBk2CQrKxp0A6GmSKOSC3K4Rl3wXs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=A04ZIr5/5RpYGDW+FDSc2xfC8Rrz6zX8994+iRox6j1UyVLLq3BVkx6ltODRJGZ0S78q0vpQQdeQmT0BLFpYqua4bw5XS6QdIoOC3bJyzeCWfn43I6adKk0cb7B88jiqdn6lAs7mwyKFixlglZ2TS/Nnb/B46a1wfJoxbKQrxEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com; spf=pass smtp.mailfrom=airkyi.com; dkim=pass (1024-bit key) header.d=airkyi.com header.i=@airkyi.com header.b=UNWg8xv2; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=airkyi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airkyi.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768184928;
	bh=dIwuOx0WUbd44zBInbdsOb+naFLrWH7lMlUXQU5tjTM=;
	h=From:To:Subject:Date:Message-Id;
	b=UNWg8xv2Up28bfwnaf6z19yB2to6QtsBK0nPsPJ8NbMG1+i30GvOFD5W701gT7Ne3
	 YrMOzYcAV8XI64sbjw5kj6sCDnYrZ6DStHgj4QY3gG4xVrP9MkTEQC6ArX62avIc+P
	 e7nMgflF/CUYf7j37bWDUcXfgQfpVuXY+1abDOhc=
X-QQ-mid: zesmtpsz4t1768184925tcb527a87
X-QQ-Originating-IP: 0tv3P5whGV9rlRzIeJcvQZAVEBuNFG93s4wY/0BTbpQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 10:28:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 828163711076642900
EX-QQ-RecipientCnt: 23
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Hsun Lai <i@chainsx.cn>,
	John Clark <inindev@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add rk3576 evb2 board
Date: Mon, 12 Jan 2026 10:28:22 +0800
Message-Id: <20260112022823.91-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260112022823.91-1-kernel@airkyi.com>
References: <20260112022823.91-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MgQY1K25Ph0m69AjCHDG8dI2PsODEA/yqsdlEF/RoYHi8na5gLmR7G9D
	Cq6Sct85R+/PAQFJTtv5AdGBT3YuaJYoUYNtslj/uGK/cWQFt7OGa6lqVNuZQE8CrzK/Vxy
	1eR1y+ulqFJ3Xw+/LQceo3eFvMTz67ATLawo2cySQf29VJLuyKgrnAa18+KVciSZRy8tGyq
	UWxXg+rXGcGpt8iYiuOfbfJfDX9c8HLX+K/u2jU+aiGmhg0rTlB5gT6juU5qGQ/H79jnyMs
	Q7YBtJLdJgKTFGLYdgxkRhp8IjQDDxdWxrkm9cKjUctRlJ4J8q3Od7u3B5NWo7p1Zb9W1MQ
	yFM0b9CyvhywzaVrxRc7D8Kys5w1V35rYETOHx6ksbOZLW+1Sgr83g9xNpp1x19n+R/ZCPB
	jom/5saKmMHEZWxKrsltIOFNoW7QqhJ8EP38WNeVyfdrXMjAtEHteSuWYXzwoYnAiazuzR2
	VGz0ZqH4NawXfGipAv//KxK9fJRvdyrJ/qlh5uV4j06mGn6v3caA3yLykDfUgTMINueN5mh
	VzcOFpmQOt5dTVpyL5T0uAO4QNXjXHZx6mXVIxmNcCDoAm/jBq7O6nB5rdv09lrhP/99U/Y
	ubmbAJhlIYgyZEpzzMR+SQju6SY5+xbte62kGTY1EJ6SPapL2hJW7LQ0DLMsZW2mkj4OSWP
	EwYa62bh/5Oeyruy+YNw68Gr/iKkKEyjMDMf8Ojt6rd3Q+jzomix+WuoUkMAjm3Dqa8TxSY
	vyvkbgk6KWJIyRATJF9yevm7l4BEL3UJlfpX13S90KGafIqWD5Eop2crtiYTnRhh35fOe5k
	DMtD7+rWZGkA+NjUv11BM1s+zLY6Fi0dYWAtL9qIz7aE5z1oNCR3oC/249HHA5D1F2mbD1K
	KYnKQHUHCumwoYlNQCHnbDegOW/WvKq5RzmMO8FJT87egjtJGx/Quy2DtFi0LOsn6WLVXVq
	+HOPUPHlTxy7KzpWEDfPe7LERc1uCWRxK4hKSNc35hbrsQ32ldbkRX6MLHhg5xivGovWEaB
	3r7mzObwAYopFnGS80LCjTyb8bmgs=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Add devicetree binding for the rk3576 evb2 board.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6aceaa8acbb2..59ed57082003 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1136,7 +1136,9 @@ properties:
 
       - description: Rockchip RK3576 Evaluation board
         items:
-          - const: rockchip,rk3576-evb1-v10
+          - enum:
+              - rockchip,rk3576-evb1-v10
+              - rockchip,rk3576-evb2-v10
           - const: rockchip,rk3576
 
       - description: Rockchip RK3588 Evaluation board
-- 
2.51.1


