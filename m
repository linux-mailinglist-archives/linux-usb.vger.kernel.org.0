Return-Path: <linux-usb+bounces-18776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 248789FBBCD
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 11:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 699611887244
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 09:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9EFA1DE3D5;
	Tue, 24 Dec 2024 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="HlfSvl5/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m127215.xmail.ntesmail.com (mail-m127215.xmail.ntesmail.com [115.236.127.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC331CDFBE;
	Tue, 24 Dec 2024 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.215
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735033789; cv=none; b=f5WaWP6bWK6bAvPHS0Sk7TDYN0pHIQJzTflyWGejBsTZItqAr+XKf60vIW1CpBn785XWJACoivkXzQnSOTpeYVE2CZPFR7dlo3oHL9JK4osAIzl+52fpNIPQxflmj+ahWRU78lFkkk3Jt8Gm5rW2r0uvAw2W/4Kr/uvIVZH4bzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735033789; c=relaxed/simple;
	bh=cHLUqHGkKDoJ0mL+61QqCJNO8UunlVhfzuPKNlSkGQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ePokThT9NpQM/iurOt3AdR0d4G0Hq5HDiP+j1WYAvIQL9Di9RGe+V07+pLv3AjjmUwLGAgst0XDroS3GNzhMNg0xRROQXznUVZmrQ8IahdajaPiEsQeQGqQwhIAtUOVDkW+9d2WurSJnORic+n9yA3IDzxpjRN1M+Y/IFcM78yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=HlfSvl5/; arc=none smtp.client-ip=115.236.127.215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aad4f59;
	Tue, 24 Dec 2024 17:49:37 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/17] dt-bindings: usb: dwc3: add compatible for rk3562
Date: Tue, 24 Dec 2024 17:49:13 +0800
Message-Id: <20241224094920.3821861-11-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGhlIQlZNSk4YGEJNQx1JSE9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f8126f1e03afkunm6aad4f59
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6Izo6GjIJPkoWLEsLLCE1
	FxUwChhVSlVKTEhOS0hITExCS0NIVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSkxLNwY+
DKIM-Signature:a=rsa-sha256;
	b=HlfSvl5/UF4BxSCe2K7AJgdps7uY8ZjKeF60whpmphLfqs1dXG8m0vwT4jRHjuMOp+EsHrDbh5El5/tar0koX5MfIzdbYkoU+N/sCV1crnlTwsn8ssTQ7Ld3Zcoeo3NcLwNT7oKF8P6Za1UXSuc+fyUZUWQw3T4fYClKTspwgoA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=68ftBDlYO9wugDwPKtS3dP5ZbdpY5EAp5ZhhRM8+9lk=;
	h=date:mime-version:subject:message-id:from;

Add "rockchip,rk3362-dwc3" for rk3562 SOC.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
index a21cc098542d..999f704c3ec0 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
@@ -26,6 +26,7 @@ select:
       contains:
         enum:
           - rockchip,rk3328-dwc3
+          - rockchip,rk3562-dwc3
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
           - rockchip,rk3588-dwc3
@@ -37,6 +38,7 @@ properties:
     items:
       - enum:
           - rockchip,rk3328-dwc3
+          - rockchip,rk3562-dwc3
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
           - rockchip,rk3588-dwc3
@@ -72,6 +74,7 @@ properties:
       - enum:
           - grf_clk
           - utmi
+          - pipe
       - const: pipe
 
   power-domains:
-- 
2.25.1


