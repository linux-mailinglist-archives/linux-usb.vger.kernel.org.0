Return-Path: <linux-usb+bounces-2378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABA87DC56A
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 05:41:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B02F1C20B52
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 04:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8A9111A;
	Tue, 31 Oct 2023 04:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tH16I95C"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ABF3220
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 04:41:09 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90613C9
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 21:41:07 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d9a541b720aso5225927276.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 21:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698727267; x=1699332067; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vprtd1rnc+6PWmI9YtTse/TMvnp22Nc9rwicgWr4RkQ=;
        b=tH16I95CKUfZ0YPNmD9HKsUuvHhLNsh+jN2rt+vlfjj478qUaPAJjSISkx4kug3/fU
         SJhkFNm0l0hg3ubN6Mb49G5I1D3+MOvjyhMCt7OBfhouADE2xUABTncaXmC41GGg14JK
         mDrtrx2aa9hQfGQ8lNNL2184bTpx0L5dJb0mVE8yLPnuZpeEM2dxRfTHuxeABieMRwO6
         VsWMaUbTnxPwmEFVx6x0rCcpZmcrH5qACG6y1WWRvMUT00RTGaDl+oQYJIreaFJ/HRna
         tGn4CVF9GwJ8YnNRg9deK+IGQSNunYCiAopomXInRszq2PbjTbnLaNm/1LKTiJ5f0A95
         ESzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698727267; x=1699332067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vprtd1rnc+6PWmI9YtTse/TMvnp22Nc9rwicgWr4RkQ=;
        b=BXnPJWN9pWvbgXNlERB3dEmWqYtBgWn/ry6B4O7flZtc14y9x0txdjOaArM7ZWG0mT
         XEryPCXALfbLHPm7D8CMdZbcIg0u4nsaAX8N9RjQSSSyKoH9BelH8T2+B2q7Y8FpwsCC
         uwaRyFGornuybfIOZEzXe4oputCu7En1gzrJOjy33XIA8+3VB2gBix48dvQ/h+fDSA9r
         cQtODQMgr9V6Me2/2VUjt2A7u/ZYQ338nvQc9ushCUpzrhaOHvOLkIt9lX8BUX3m3PiX
         kuslOHpjSqcpD/DitfGPb3/n3z+yZoYTdVmji0TeEffWkLQM6tlrSM6QE3CnN0UDIn06
         3JOQ==
X-Gm-Message-State: AOJu0YxQHXQlYBXEfq6Qs7ZfB1sPwurx3XT9a6OGRJf9WL1KDeZZkK0z
	FGSxb4PJBXrgkE0hzNNmPyU4rH/xal0P
X-Google-Smtp-Source: AGHT+IEWTHudUpZ0bOr4errsoYCA6YThAwqSHURzraWyydGu8fZqxl0t8CFXT5EE/124DtjvNQ2jO0Q7WScX
X-Received: from mnkumar0.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:313a])
 (user=mnkumar job=sendgmr) by 2002:a25:d754:0:b0:d9c:66d1:9597 with SMTP id
 o81-20020a25d754000000b00d9c66d19597mr211275ybg.13.1698727266148; Mon, 30 Oct
 2023 21:41:06 -0700 (PDT)
Date: Tue, 31 Oct 2023 04:40:21 +0000
In-Reply-To: <20231031044021.1162403-1-mnkumar@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231031044021.1162403-1-mnkumar@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031044021.1162403-3-mnkumar@google.com>
Subject: [PATCH 2/2] dt-bindings: usb: add no-64-bit-support property
From: Naveen Kumar <mnkumar@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, royluo@google.com, 
	Naveen Kumar M <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Naveen Kumar M <mnkumar@google.com>

Add a new DT option to specify whether a host controller is able to
support 64-bit DMA memory pointers

Signed-off-by: Naveen Kumar M <mnkumar@google.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
index 180a261c3e8f..20dc134004f3 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -25,6 +25,10 @@ properties:
     description: Set if the controller has broken port disable mechanism
     type: boolean
 
+  quirk-no-64-bit-support:
+    description: Set if the xHC doesn't support 64-bit DMA memory pointers
+    type: boolean
+
   imod-interval-ns:
     description: Interrupt moderation interval
     default: 5000
-- 
2.42.0.820.g83a721a137-goog


