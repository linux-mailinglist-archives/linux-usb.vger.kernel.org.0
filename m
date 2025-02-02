Return-Path: <linux-usb+bounces-19948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8554A24C8C
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2025 04:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FCF33A4E84
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2025 03:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B70B3B2BB;
	Sun,  2 Feb 2025 03:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EM6ChZcQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426371C6B4
	for <linux-usb@vger.kernel.org>; Sun,  2 Feb 2025 03:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738468265; cv=none; b=PwnOMQTRepVgoLbXOTm65Oe/rB+AcFVEbF8tjTUcVvfBei/OeyFb0ls/wv1YwgZKlwgGQNdlr5HGTF4pMpJS9PzLG3NDnR2nva8T3BOj4C67XBi8wqXvRORMOC3be5JCzXctgn3Ce+HUDcOyjKdQuVQV07cGSFkbXbdtWoY/MMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738468265; c=relaxed/simple;
	bh=ThuQSdfaKBpcDXqt8wGsv78oL2BN2jQmseobtTxhhbg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=goYbHrs2NmcDe0mCZ7MdGY9sggL+QclmPs9A7HqyIfdt3c49q/mWFBj6DrsW5uVlEML5lDzYLuzTN6Z/gXyd+sdis8L48a3gkVAv5+w5oKhzdeeKpk1kp0c+QpMun6XnXliuKxK0oys4psQDSYM0WJqtjGnXQrIGHcN9zBmJWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EM6ChZcQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so9466206a91.3
        for <linux-usb@vger.kernel.org>; Sat, 01 Feb 2025 19:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738468263; x=1739073063; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tLQvG5TnFcXOemXaUB33YPT8JnYY7IUsNv0/RBB9dNA=;
        b=EM6ChZcQDonl4Hau+k1dDHSCiLC/vmWxDa9pKY5GXQ1YfZhRK0b7K7ZoW258jhP9fO
         y5tvEv6NigLAQd1B30gwqxfXHBOUWv6OoJ4DNdIfYqxFcG94hlDLuI8Wetb4eRCIr2EP
         fGq2fi6FND0nPRncVVA7ZdqqGo6VshVuDOYO9qa2aSYs8q5xN+Ie5/OeArsXAZNWMtgD
         A5qgtNHEA4hyOXmC1Hu9QZF106jK0+7GO0CFva8kTxWPFNlCQOV2A8JzvlsD5PDX92qp
         HNs/wl1XpsU7ehlSVIgaPEpC/jmCl5/29RXYQmR1t/65i9lKc0VgNS9LtuZHHGlRGkvD
         vnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738468263; x=1739073063;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLQvG5TnFcXOemXaUB33YPT8JnYY7IUsNv0/RBB9dNA=;
        b=erm6sFde4CSt+3T2QiSQWW3bKPCamOuW2XFYzKo8d6/DL6DODj6Yw/oPZkNnyu2jhh
         3EPSq6olLLAxAZMshinZo4gFyv9qHDYj0t/CC98U90x3q08iM+b3+aBMk7YaBu25I1Ie
         NGkTWRBHudAGkcTSNBLlU3b0Nku5AhB/tbL8+cx/Qdnjc3JUi5A6mHjrmG3mnYb9GZwP
         mPErDw+X+0xJrQs7gPmMoGT1nDSkzFjBCsUI/EztTWxAO+fFHf73zFkbzWKgKxqo6oJm
         w48Ujz6+sxdBgL4icI9q9wBip6oQvZjL22eR3ygbW8o83CRxvxxsCBkuYxoWYY3pYGvw
         JPcw==
X-Gm-Message-State: AOJu0YxFIilk5iDPZZX35uW+Ic339h0uRUmsKA78jG/2oNnpgKm2+DdD
	IOiPXP4ZRJAC7rxXB91uSLOBV5SGej0Q0z42s5g7xIzpC0T8Y4OhkQan6Nr5LuNRBR5fALk0A3+
	MKQ==
X-Google-Smtp-Source: AGHT+IEiw45d1/cmdFgJV1d7Z6blmkpea4G+wd4Ucnyh5wS54em9mWU7qFTZa3sEXs/P4HN3AUDWT8EAxCU=
X-Received: from pjbnc13.prod.google.com ([2002:a17:90b:37cd:b0:2ea:46ed:5d3b])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:37c3:b0:2ee:8ea0:6b9c
 with SMTP id 98e67ed59e1d1-2f83abda22dmr29831867a91.12.1738468263511; Sat, 01
 Feb 2025 19:51:03 -0800 (PST)
Date: Sun,  2 Feb 2025 03:50:59 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250202035100.31235-1-badhri@google.com>
Subject: [PATCH v1 1/2] dt-bindings: usb: snps,dwc3: Add property for imod
From: Badhri Jagan Sridharan <badhri@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	felipe.balbi@linux.intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, johnyoun@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, jameswei@google.com, 
	Badhri Jagan Sridharan <badhri@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

This change adds `snps,device-mode-intrpt-mod-interval`
which allows enabling interrupt moderation through
snps,dwc3 node.

`snps,device-mode-intrpt-mod-interval`specifies the
minimum inter-interrupt interval in 250ns increments
during device mode operation. A value of 0 disables
the interrupt throttling logic and interrupts are
generated immediately if event count becomes non-zero.
Otherwise, the interrupt is signaled when all of the
following conditons are met which are, EVNT_HANDLER_BUSY
is 0, event count is non-zero and at least 250ns increments
of this value has elapsed since the last time interrupt
was de-asserted.

Cc: stable@kernel.org
Fixes: cf40b86b6ef6 ("usb: dwc3: Implement interrupt moderation")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 .../devicetree/bindings/usb/snps,dwc3-common.yaml   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
index c956053fd036..3957f1dac3c4 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
@@ -375,6 +375,19 @@ properties:
     items:
       enum: [1, 4, 8, 16, 32, 64, 128, 256]
 
+  snps,device-mode-intrpt-mod-interval:
+    description:
+      Specifies the minimum inter-interrupt interval in 250ns increments
+      during device mode operation. A value of 0 disables the interrupt
+      throttling logic and interrupts are generated immediately if event
+      count becomes non-zero. Otherwise, the interrupt is signaled when
+      all of the following conditons are met which are, EVNT_HANDLER_BUSY
+      is 0, event count is non-zero and at least 250ns increments of this
+      value has elapsed since the last time interrupt was de-asserted.
+    $ref: /schemas/types.yaml#/definitions/uint16
+    minimum: 0
+    maximum: 255
+
   num-hc-interrupters:
     maximum: 8
     default: 1

base-commit: 72deda0abee6e705ae71a93f69f55e33be5bca5c
-- 
2.48.1.362.g079036d154-goog


