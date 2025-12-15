Return-Path: <linux-usb+bounces-31469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0681FCBFED3
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 22:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04377306901E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Dec 2025 21:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FDF327BFC;
	Mon, 15 Dec 2025 21:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVImDoQh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE0C3090DC;
	Mon, 15 Dec 2025 21:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765833922; cv=none; b=GNYBpgKVSBkZNch63sIr//PQS33gWNrUAOdOhDkuWQUbNSeAORZ6cZcjSWc9/Xh5FnSqvjQOTya3Zn9Cfu+dAMT7ZrOVoQAOMkQnny4PfglxZ0PouWDEIJNLRJBu9HIaaXHhBoXqrjc3sZplpICrIWwbHbJdL4qq2enR4mUwmLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765833922; c=relaxed/simple;
	bh=O5xOuOer/BKVANynXgkmYNDM7fkR0s6xfvoMucdEqpA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gq/GwZezpA/PaeZMmm/S9HzKfXQpBq4nI5YpfFLWtnCCIJG7ibptaylgNpiIFI8FBTpOcHblycI+svHK8wpjxwDP3sVnn6aT2AmLXSsw8XC3z3tocAaff+JwamyQm67XUQdCoQy5o6WYb+RozYFMuEnoDKUy6X+d6UZLpqUBtmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MVImDoQh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59605C4CEF5;
	Mon, 15 Dec 2025 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833921;
	bh=O5xOuOer/BKVANynXgkmYNDM7fkR0s6xfvoMucdEqpA=;
	h=From:To:Cc:Subject:Date:From;
	b=MVImDoQhnmuQxL3hJb+vg5rvuTik/NbexeeOq53iqIUPCQloCsUVP8HHu9+hvfYUn
	 o5mj8vI1GnyscgSO26LOUBN5L79/mcd9JhzG16CNlaV8BIwadFlYqb3Bv5eblCVp+T
	 Sn01zdbWjA10bd92UkdReP721ztCsEQouYNX4G903S+hKfWbtvDATevBDROQ48huC5
	 3+ZMK9aOLeXIkUHHD6sk+W9vbUpyw5jPqZ3yUPLhx/z+Oe753OWho8hbl0p+j0iFqX
	 3TzjgOjm3cIC4ANOtNrWI/AfCOT4t8hqoY1wtGjHK8EU8qnZhjvbFpX2OlRV4AqU3P
	 LDHIf15fRCvvw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: ehci/ohci: Allow "dma-coherent"
Date: Mon, 15 Dec 2025 15:25:14 -0600
Message-ID: <20251215212515.3318052-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EHCI and OHCI controllers can be DMA coherent on some platforms, so
allow the "dma-coherent" property.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 2 ++
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 4e84bead0232..601f097c09a6 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -93,6 +93,8 @@ properties:
     minItems: 1
     maxItems: 2
 
+  dma-coherent: true
+
   interrupts:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 3ee1586fc8b9..961cbf85eeb5 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -64,6 +64,8 @@ properties:
   reg:
     maxItems: 1
 
+  dma-coherent: true
+
   interrupts:
     maxItems: 1
 
-- 
2.51.0


