Return-Path: <linux-usb+bounces-2782-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF4C7E7CA2
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 14:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2E90281458
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 13:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427111A72B;
	Fri, 10 Nov 2023 13:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/krW53+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DB719BB9;
	Fri, 10 Nov 2023 13:48:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E63DC433C8;
	Fri, 10 Nov 2023 13:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699624095;
	bh=pZ8aJuV2KsVuZiJJPUJVNZcJ8el4lhhalq2w7PkrUTo=;
	h=From:To:Cc:Subject:Date:From;
	b=W/krW53+BRT4JGtLpBr/mvjqVWq/HeHSW3CWLLU2YXXobeSJErYVhIR+0Fo5phhZH
	 J4bpH/qH4etORqvKrXNo068V+oWzF+E64/mBvzUyVGJlU98Ry2ZoT8VYA1Sp5VzdeX
	 dlLSEZVOf+GvWYjbznn750a/9SpB6BXdfXuH4PsTi1jwWENcV+MaW+GOI/cbBNAU7L
	 ITvEUqraOEAS6hKbor+6W8zO+WdXmYsGYNUG2m6qq1aAT4DtDa/RxTocbiAT6MMjxL
	 ciPBHSa43/qzSB7sfkyCwJN+7SpCPw0oBx26Pfd2yOfwekyXiNNCJozTGJKza93RFB
	 8FsmrF9WY5KnA==
Received: from johan by theta with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1r1Rrl-0008LS-2n;
	Fri, 10 Nov 2023 14:48:09 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] dt-bindings: usb: hcd: add missing phy name to example
Date: Fri, 10 Nov 2023 14:48:02 +0100
Message-ID: <20231110134802.32060-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.42.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example host controller node has two PHYs and therefore needs two
PHY names.

Fixes: 3aa3c66aedef ("dt-bindings: usb: Bring back phy-names")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 692dd60e3f73..45a19d4928af 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -41,7 +41,7 @@ examples:
   - |
     usb {
         phys = <&usb2_phy1>, <&usb3_phy1>;
-        phy-names = "usb";
+        phy-names = "usb2", "usb3";
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.42.1


