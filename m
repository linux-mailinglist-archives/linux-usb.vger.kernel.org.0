Return-Path: <linux-usb+bounces-29061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC311BC709D
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 03:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 997CE19E0FB2
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 01:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB27156661;
	Thu,  9 Oct 2025 01:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TPoyhliH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49C3A1DB
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 01:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971802; cv=none; b=qOZANup8phu7uUPGzinUD7PHgK86Oz0w156BgfjEaMmMn7jzpj72YXcPOy4lELpAebf+c50Y6YI9sRHUEqbwIXrMnBltq5xI4fKDgLlwH7pU47A55vvGgJA5GAI+xHG0tBWFa23JpDHeJ3vV7srswxHz6Ltz/b70yX6+lqdNlQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971802; c=relaxed/simple;
	bh=FdWz06FUR8AR1uAl3wTfj9n2BioEbn7zOnkyos3KuZY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b0wzr6z7GoIxYeLyICTj35xZ5v05WofBpKMctGnjbpAlMFvgwPIeJU34dnfdAh1YunpgsiHR5B8MtgWMtVnKyHb9WOBrBG8wtpJRzSwHz8kWKCVby4GfayDzzXsMcAucpfeSzOswz38eDm2sb2eijKgjSmkPtcTEhwhrpUEJtNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TPoyhliH; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-27eca7298d9so16187745ad.0
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 18:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759971799; x=1760576599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PK081DUWtNx4HfeEFM5F2Wg1a6MRRDecC9Tgqx96lM=;
        b=TPoyhliH6s3vVXATVGDvTYS4a/CIb2j466QNwaJwD785TmxC2XPWSei6J4ogSBkhq+
         U2XmK4MwkCKAMNXNp0uyRuKvVgjYPe7BPZeGFIHd8dY4GuO+IWDU6YzJ2n395QeiguXG
         AoRiB9oAv8fGzgx5vnkC3jSsw9rxZnf6KITAdhi4CoKkY5wJEQZmXru8nr6nPN5tKtxy
         XBq8pAa1g2K+x6T6Z0wl+4S2I7AhQLmjy8bkiNjJKSZG/mi6JDNzBG8BUM7jHDTobvlx
         9m7eZSP7ZOJm6csQMjl4r88bHj2DLU8xICCqSIFXGj/cARaUzA65XtnjFVDRulfQzBUP
         UubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759971799; x=1760576599;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9PK081DUWtNx4HfeEFM5F2Wg1a6MRRDecC9Tgqx96lM=;
        b=JHyIWVCQeSbm2mM6mfr5sws7+Xr2ZRcDQnUwdgvaPLJnYLKRQBexLqR01aZryGNrS9
         augZibdVThNjc1LvavUlejlU+8s5Fy+XOcbjufDfj/8nsoualolUAXWdpcNgLfxqWsG1
         TCKXIfi0NEpDevjqEqzenPIl7t9f7irbJgKSryVyD/ckeZEpFHvAkzbDQ5HiJPRRSuON
         XM/4DtgqHwrPrx/5cX3bd0/ks54H2dEVazSyhXVpQW6AqZudgr4A69MiJQ8CDKpizcPx
         U3chZJw1dZryRH48RqknpjNXsXdM5xprqY3QO24nTq6VjAQtZQazhzYnL6Tr/Uo2P1+h
         dJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlClpEhz9lXCWYBenIWlSaurl4QHK34LZvX8fMs+uJyCxNu6GLjuMTpvOBPBiI6G46cNzBjxSTBWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdZP0aeJRV4UC6Ycf/oe6nDgXYqk9IF/Flw7j8fVQ22oYZ193h
	QkksVhVjJOFfBeIGJSaiPUPNiN9Q05UBxM07lcWM0GMDR+gBK7VsP5BvvchlNlPArGmYmJ4aU5N
	f2KHMUw==
X-Google-Smtp-Source: AGHT+IF6Ef5HS/jsjPnjXWi2U116WXq2EAEcLkV6Ztc8hjYkYYaXlariTxuV8NKw8zY9XwFYXy1JjMx6vIg=
X-Received: from plnq5.prod.google.com ([2002:a17:902:f785:b0:267:ddd1:bc97])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c4d:b0:267:44e6:11d3
 with SMTP id d9443c01a7336-29027379986mr72867335ad.21.1759971799367; Wed, 08
 Oct 2025 18:03:19 -0700 (PDT)
Date: Thu,  9 Oct 2025 01:03:06 +0000
In-Reply-To: <20251009010312.2203812-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009010312.2203812-2-jthies@google.com>
Subject: [PATCH v3 1/3] dt-bindings: chrome: Add cros-ec-ucsi compatibility to
 typec binding
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chrome OS devices with discrete power delivery controllers (PDCs) allow
the host to read port status and control port behavior through a USB
Type-C Connector System Software (UCSI) interface with the embedded
controller (EC). This uses a separate interface driver than other
Chrome OS devices with a Type-C port manager in the EC FW. Those use
a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
compatibility string to the existing cros-ec-typec binding.

Additionally, update maintainer list to reflect cros-ec-ucsi and
cros-ec-typec driver maintainers.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.=
yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
index 9f9816fbecbc..fd1a459879bd 100644
--- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
+++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
@@ -8,17 +8,28 @@ title: Google Chrome OS EC(Embedded Controller) Type C po=
rt driver.
=20
 maintainers:
   - Benson Leung <bleung@chromium.org>
-  - Prashant Malani <pmalani@chromium.org>
+  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
+  - Andrei Kuchynski <akuchynski@chromium.org>
+  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
+  - Jameson Thies <jthies@google.com>
=20
 description:
   Chrome OS devices have an Embedded Controller(EC) which has access to
   Type C port state. This node is intended to allow the host to read and
-  control the Type C ports. The node for this device should be under a
-  cros-ec node like google,cros-ec-spi.
+  control the Type C ports. This binding is compatible with both the
+  cros-ec-typec and cros-ec-ucsi drivers. The cros-ec-typec driver
+  supports the host command interface used by the Chrome OS EC with a
+  built-in Type-C port manager and external Type-C Port Controller
+  (TCPC). The cros-ec-ucsi driver supports the USB Type-C Connector
+  System Software (UCSI) interface used by the Chrome OS EC when the
+  platform has a separate power delivery controller (PDC). The node for
+  this device should be under a cros-ec node like google,cros-ec-spi.
=20
 properties:
   compatible:
-    const: google,cros-ec-typec
+    enum:
+      - google,cros-ec-typec
+      - google,cros-ec-ucsi
=20
   '#address-cells':
     const: 1
--=20
2.51.0.710.ga91ca5db03-goog


