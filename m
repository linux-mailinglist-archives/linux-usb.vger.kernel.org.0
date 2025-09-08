Return-Path: <linux-usb+bounces-27719-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14402B49520
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEA181BC6004
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A19D30FF3A;
	Mon,  8 Sep 2025 16:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DnNBF3xV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C409930F950
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348477; cv=none; b=qB4v6BU82Fnnv4JeF8h+YaUCn1xBbwSduizpfm78zgrZ79a++jclSv8JHgyAzNwmnrwgQ2WMevQIatfStdpFz2Y1l0nMLB/lxIW/9dau80MnoE+7u4ahBy4hI0Y+NWvo6VJ9r8bcuaBwvolUStD5hPC7tyyXq9QqwhvB8cwPwag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348477; c=relaxed/simple;
	bh=Jw6IsKNrpsMFU9GuROwZE4X6mjU5ZWFBpwrLBHpZx/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exeM00dzwZtIEg70LLLh8guiAmgc9FA49YQISpRO/jk3MXeT7FWyH9TGNJHk9PFayA4MKAFOBHPZ3VlfjJtZUTMEEg5l7YfmhO+DZC7wMFwXnmx6B3rateJXDGLFh3zlXjPG3ARup9D/SvD1/hAmO1aldxrNhr30lG9ppD4i0PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DnNBF3xV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 79099C8F1F9;
	Mon,  8 Sep 2025 16:20:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19A466061A;
	Mon,  8 Sep 2025 16:21:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A0D3102F27D2;
	Mon,  8 Sep 2025 18:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757348472; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5dU3nNv2GWlrx7YqQ55TmDyusvkJ/gsQeOjrPzRly/w=;
	b=DnNBF3xVGwHt20SRUkCHpBQmkGuIGVl806i28wavQMSl6Fovl1qSBpU55ifXHF7celZtsB
	gOgJlq9X+3Sm6Oa6EUlJpVvmEF/X16LCQE5Lfhbm/E5ien45rqMrMS33JGDdoMWz+YHXPa
	c8WF3YypvcwOxoSZxDA6pM1BDJj6BK0EI14UHBaAJTndUz8XdsnwkS9od7FkQLbYazYXIu
	cyB6DUyxf7PWMUt+XOCh/H1SwMyERhnEqlmwK4vpNP8cQF5v945/llvarN8XyAgINZ1+Z3
	HO0x9ddDXrmqvYqTapTcJgxYi8koyYM6w2MQQIMZ847HD9jlG4BvuBPTBESbQA==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Aswath Govindraju <a-govindraju@ti.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 1/2] dt-bindings: usb/ti,am62-usb.yaml: Add ti,lane-reverse property
Date: Mon,  8 Sep 2025 18:20:51 +0200
Message-ID: <20250908162052.355341-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250908162052.355341-1-richard.genoud@bootlin.com>
References: <20250908162052.355341-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On some designs, the D+ and D- lines are swapped (on purpose or not).
The PHY can handle that with the LANE_REVERSE bit.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 Documentation/devicetree/bindings/usb/ti,am62-usb.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
index f6e6d084d1c5..ba894d610af0 100644
--- a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
@@ -36,6 +36,11 @@ properties:
     items:
       - const: ref
 
+  ti,lane-reverse:
+    description:
+      Should be present if D+ and D- lanes have to be swapped.
+    type: boolean
+
   ti,vbus-divider:
     description:
       Should be present if USB VBUS line is connected to the

