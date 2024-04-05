Return-Path: <linux-usb+bounces-8985-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20689A537
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 21:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC68F283CB1
	for <lists+linux-usb@lfdr.de>; Fri,  5 Apr 2024 19:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B5017334E;
	Fri,  5 Apr 2024 19:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/kq2vIh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49FA17167F;
	Fri,  5 Apr 2024 19:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712346661; cv=none; b=EDJyCOgfdDaKMZwwJrVio96OB7Bn0EsKDahqQN2fCrQj/6+pZht0KRcxV8i1u/S0pfZg1L2eZr1xpJYvxDjm63C0/mGCcrYq5LWCyCsOmucNX4vE6wMqcH2RKQesGDARSxipFSElmGmOjRQrex4nDYjKJIAnU9XsRBMm+wnc0DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712346661; c=relaxed/simple;
	bh=sXc+Xujowt+5AorOt5TyuNImN9/Mwwb2LKUzeqHkFiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WYnYzbS5JQuEEy0a71tQ9bgFrl7Wmq7kpWBBt4JzEbS46nGVzSnesgulNwNRAPad9YxYxz4Nnjsf7QLghfoQw1BtF+tMMUuSSPsnvt2QiZAZRCSQU1VWD+8qwKrtQcetC4RW0n+77xqOVe/P8RzmE1IDhfoEXeI+v9WnE629dlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/kq2vIh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a2d37b8c4fso510431a91.1;
        Fri, 05 Apr 2024 12:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712346659; x=1712951459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wu7FXkYKhNByOhKVW18rWhEudbVzX2aW/UZiggMJp20=;
        b=g/kq2vIhe+wJlA+lj73eecEvHSLnTCpxtEYAQwLxtXSCXGG172R9n0y9+7Ns/+ZNEn
         YGDq0/T9buspZ7/dOotuZ1xG+Plzm/QbHn8ie4LxKHXHeJ/A6uqeZimOzrBJmbSjSOc/
         gUTjaK1eL1bim3ylnnjQfLo42sdK+Vxcxci70TxESg8IX7MFZqG0UxXJLP4YxYpx4nn7
         WuJYwSYKkYXUEoC4LwW8gz2KuM7hmC9vr7Tcr8AeqDzytNCJcCSvvuqWaXEQXQrAUdxA
         87nCD0PutiENBMIjMwHYuPtFTZU9BECa9MXwPMJ4509EOQH7YcpWXNrVvjA6SO2BkleQ
         NV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712346659; x=1712951459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wu7FXkYKhNByOhKVW18rWhEudbVzX2aW/UZiggMJp20=;
        b=swVacEPy05mkIFiVH+s8yuxjt5u0cCkw0755NPG+d20yevxX8YouB5ci6IHRybg5Ta
         h40+0bOK3wGBfSEreL8TO1jidSXBJdJRvSMs8sOAX5+GEK+/ogSnDYsbxmXunT365eA+
         A6tIIgKSqMoYtnYGIkv48GUwn00WW9qh02M1+rCeEDmm9ON0k9u0c3LgSZb8/2gMIBZO
         wvMjUs7btq+Hu88vxnCUrMEQRDyU5LSwM6o9LipLvo6UWmp7JQfoa8J4JJVL0oNU8/j+
         amZq2hS4EBzwQilT+SWdR/8xrek2/wD/25eBAz1Zr8UiGav870ZEaXNwT4RAq3I9igpz
         KyeA==
X-Forwarded-Encrypted: i=1; AJvYcCWNCIK8zF1hvP+Al7F5QiKcjAckfqHBdpB7nwZMWUhp7ci4vg6IwGlWpnIeKvFZDIaAOmUMdYcEPXWuiTzA+ydPGczm1LxPwheUsqzAlyqQndhZJLmKh/1rHGWrxw6g1++dQKq4yA==
X-Gm-Message-State: AOJu0Yy5yc7Gubh/QTwzVjVGddENn/fqUoOEQ5+4IjkdYOaYa0yjJ6mX
	Hf33ONePKjFSRxO1VYdmTdUePxY+OEzbeMMuqcFYDX2RmFziHtFnD1gvOTlK
X-Google-Smtp-Source: AGHT+IGhe0VhnqoPmmUpkCRmghPZb1LfBjehS57Yu5iOq+PFfd4hdswGKjprReGmmWLkukGk9HmXbQ==
X-Received: by 2002:a17:90a:7448:b0:2a2:6757:1de0 with SMTP id o8-20020a17090a744800b002a267571de0mr2327182pjk.4.1712346658840;
        Fri, 05 Apr 2024 12:50:58 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:1a99:dd72:cf95:e04])
        by smtp.gmail.com with ESMTPSA id a21-20020a17090abe1500b002a09b929f88sm1879012pjs.9.2024.04.05.12.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 12:50:58 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: usb: hx3: Remove unneeded dr_mode
Date: Fri,  5 Apr 2024 16:50:51 -0300
Message-Id: <20240405195051.945474-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

It is expected that the USB controller works in host mode
to have the USB hub operational.

Remove such unneeded property from the devicetree example.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 Documentation/devicetree/bindings/usb/cypress,hx3.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
index 28096619a882..e44e88d993d0 100644
--- a/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,hx3.yaml
@@ -51,7 +51,6 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
 
     usb {
-        dr_mode = "host";
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.34.1


