Return-Path: <linux-usb+bounces-23288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68834A9623E
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 10:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C00617FC93
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 08:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC72E296150;
	Tue, 22 Apr 2025 08:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kGFAXBPf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89772957DF
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310611; cv=none; b=RYVwVOxGW6MExZG1qsNDzsmS+Q8v0EeZ7mECfulQpC6AsqDoSEfG6vEWaRe0pYJP4FivfJ3sNSXnNNCElZsv9eoZ2C1ZGyBP037iDYMW9Kx2VV4ukRMTR+D7WGjdA11fcGykTZx7Jbrq1nbAYCgHz9LOXVZ7FZ8bhVo2TcxXpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310611; c=relaxed/simple;
	bh=wpLvYJ8h+2gdD8KlovfRp/KEYqpjX5R39eBimYEADQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NURcPUIVekDqct+k19nQoufob1R+czVOjk7vllQbn1Y4ddfuTykz+Mze2eWQ5okVR0GXKG+2iKFxHg3aT/+aOxCfX7wRhbd2SFwkuEwc4yOCqMp/lRd+P9r2VOaRgnKE0sGGxpWxEb58hgvAp+l1bIQZdXN+0csG9+kMoMiirRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kGFAXBPf; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7398d65476eso3835284b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310609; x=1745915409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suVeEV15xn1TJzAA78ITbkuezXgamtF49ziPRPaA7d4=;
        b=kGFAXBPfkCTyYBf4lAmBXiDYLKXdHMyuQGbr3NYT7kRjdMqCFpVt+3K+V4aq6r/lDb
         V9zyb9ptPR5RVeBg6Gy63t7rnVLay1vAU6lE1Gcj6v6vI/T3uc6oSMpdMnmn6i/YxYQU
         0Llf+EzBbXiG08xRrcbbkDpPhzSdnIlV0A0/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310609; x=1745915409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suVeEV15xn1TJzAA78ITbkuezXgamtF49ziPRPaA7d4=;
        b=JW7cNMNx4A/CG9OI+/knIRwuMWAr8I8jQshL42LivRHaPvOOiazU6iiN/CwWHk+kHS
         zFp66DiblCG6GYMHxMcZR9C/FX6a5m3VtVTPj+2bwZLzrpDm7s6k1O/VaQUo7+AjBBxI
         ENrj5Bl30YXcbQgUp7Ai3i5FJoFvbHcm2WRMLObSVr6xAnceiYQjeZ59WVrxdU3W7ahB
         c5+7u1TzhCqnZ5tzdfYYWPQxU3k2IDzl7jG4H4XhU3JvAe+GsTJTeCMgumeYM6fU8ir/
         THoGc5AyShLpeMb8PNAVP3lSIJYREs+eHSDOm6n+Z1F8nfnTY5SaP05PQAXoNQmdAtle
         161A==
X-Forwarded-Encrypted: i=1; AJvYcCV1vAcBNObNWK9p4JiqaAHcxnwdAbWarKm63yMb0KlGjLeYEMzXj9rcWU6sMHY0Zdd3ZKXHjbKsqs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgHSKpNteF1AZ9G8o12XjumNVkZCMib25ieHSGmlBo0cco+yx
	MOpGtAXUUamMv0qcAWMttSugVq+FBlVZmgQAg+H2isdmAZdA24r4C4hr020xfw==
X-Gm-Gg: ASbGncsgMukkcW5HyR06YcvwhX+YUfvVYWlfax+RwdpZzVauYb+0aKYYbzw2hhV+exL
	QrqZo6PxhDGo+D7Kyl6lhg47tecmMvXLk9+LeHngfNQa4cO9heiQvk0KpJM4jiYueBJhM/f4Ibf
	IZMswqbApi8wmLnjA5Uov2SUBz92lIvn4J9cI2bP8H5iO6Rwgnz3X3kn6Bb3+dzlyACFPbWHBO+
	OSkLQfrf6lyfhMGRCVHMA4McLLigJ81OVUcL+Ss1IRuaS2WeGKSA9bsd8/ywZoAINzF7xDIzYpO
	yiRHPQMUDLH0TRJsPnt78j4cJGbZahQkp0t2vZb7Uu9KHrsUt/EDaVMKicLI82QB
X-Google-Smtp-Source: AGHT+IEU6I61PKdSk66ALyW1SMKYEj8C6WoYl+I3tAab8Ss6BHWGapI8IPOL/MGB4xnrLL3uRQKw6g==
X-Received: by 2002:aa7:88d2:0:b0:73c:3f2e:5df5 with SMTP id d2e1a72fcca58-73dc1b5a716mr18751882b3a.9.1745310608966;
        Tue, 22 Apr 2025 01:30:08 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:08 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 0/4] Introduce usb-hub.yaml binding and add support for Parade PS5511
Date: Tue, 22 Apr 2025 16:28:26 +0800
Message-ID: <20250422082957.2058229-1-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series introduces usb-hub.yaml for on-board USB hubs, and use it for
the newly-added Parade PS5511 binding and the existing Realtek RTS5411
hub controller.

Also add support for Parade PS5511 in onboard_usb_dev.c

Patch 1 introduces usb-hub.yaml as the bindings for on-board USB hubs
Patch 2 adds the binding for Parade PS5511
Patch 3 modifies realtek,rts5411.yaml to adapt usb-hub.yaml
Patch 4 adds the support for Parade PS5511 in onboard_usb_dev.c

Link to v1: https://lore.kernel.org/all/20250328082950.1473406-1-treapking@chromium.org/
Link to v2: https://lore.kernel.org/all/20250415094227.3629916-1-treapking@chromium.org/


Changes in v3:
- Remove redundant schemas
- Update schemas for downstream ports and devices for ps5511 and rts5411

Changes in v2:
- Introduce usb-hub.yaml
- Modify parade,ps5511 and realtek,rts5411 to use usb-hub.yaml
- Minor fixes on parade,ps5511.yaml

Pin-yen Lin (4):
  dt-bindings: usb: Introduce usb-hub.yaml
  dt-bindings: usb: Add binding for PS5511 hub controller
  dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
  usb: misc: onboard_usb_dev: Add Parade PS5511 hub support

 .../bindings/usb/parade,ps5511.yaml           | 108 ++++++++++++++++++
 .../bindings/usb/realtek,rts5411.yaml         |  52 +++------
 .../devicetree/bindings/usb/usb-hub.yaml      |  84 ++++++++++++++
 drivers/usb/misc/onboard_usb_dev.c            |   3 +
 drivers/usb/misc/onboard_usb_dev.h            |   9 ++
 5 files changed, 217 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml

-- 
2.49.0.805.g082f7c87e0-goog


