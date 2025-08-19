Return-Path: <linux-usb+bounces-27000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65965B2B570
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 02:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C068168EC6
	for <lists+linux-usb@lfdr.de>; Tue, 19 Aug 2025 00:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A641AF0B6;
	Tue, 19 Aug 2025 00:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBzpY4MH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B200513FEE;
	Tue, 19 Aug 2025 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755563976; cv=none; b=T69QfULUyONSxfLCdMhmvNQNDYdyJT7pb7uBGirIk2F5sMj9oo1LfRL2C/RsrgPvvshZjwf7mQ1vKmqKsEyiS39frW96RQ558UV76Qpwa77Ci8egDY1N6O0B/Y+85a/6FPpk0EqXe3HYklujk2jPBSyhC6JMvPFUIpGa8rN0L5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755563976; c=relaxed/simple;
	bh=C03dOmNnOqBE2+8uBcpUMnixcBGRIOifUTQNa6baHCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H21+K+uT8xYI6WjytYe1bKhHTD2r29cpxGlHQbo5agLRFtYvILYSBeASNZ13hCXMtmB3Z45+HwAPgc0umyPgJjJvSbD/PYsJ9ip0txROvI5Hoi6ddQPOffOMndiiGT2qHPvOIQ5U71RBKP5CSJ41fN5JaBihbHOfs7Z2h9VhRZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBzpY4MH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 652D6C116C6;
	Tue, 19 Aug 2025 00:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755563973;
	bh=C03dOmNnOqBE2+8uBcpUMnixcBGRIOifUTQNa6baHCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JBzpY4MHrQlFe68cYlLf7omHHC16oQw0iHDVVWPlJBG1NQl0rtIuPbwtQwc16a5xo
	 85AV4++AAJfo/pkyeWfZeH/wfFE+PkkE4iSjMEfuGAK3y2QkZgLj4cdQzu3rhcqP40
	 7sGFGndkl9UIBBC+5iCUJX2dvelo1BzaGVfflZlwz29HBOFzI06YoZT8Va/mDtTEKX
	 vrN2bdxQWwIDMF/JILXanEhlKvrBglhC77SpToFumYQPGQ0Yuw8Lzkqcr32gexxIBX
	 5am0IeQJWv5fHfEY1NMY1I21LQ45/660yLjm0vVjzXD7BOhpc5oHHkr2OQnhTXW+LH
	 xInER8ufkrx7Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: usb: usb251xb: make reg optional for no I2C ctrl use case
Date: Tue, 19 Aug 2025 08:22:15 +0800
Message-ID: <20250819002217.30249-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819002217.30249-1-jszhang@kernel.org>
References: <20250819002217.30249-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make "reg" optional to allow the driver to be used to manage GPIO
based control of the device.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/usb/usb251xb.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.yaml b/Documentation/devicetree/bindings/usb/usb251xb.yaml
index ac5b99710332..4b676c010f3e 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb251xb.yaml
@@ -240,7 +240,6 @@ additionalProperties: false
 
 required:
   - compatible
-  - reg
 
 examples:
   - |
-- 
2.50.0


