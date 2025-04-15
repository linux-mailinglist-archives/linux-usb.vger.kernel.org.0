Return-Path: <linux-usb+bounces-23069-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F2DA89871
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 11:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3F2D189DADE
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 09:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4783428DF07;
	Tue, 15 Apr 2025 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QPSqwTMl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5D288CAA
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710158; cv=none; b=fFiDTEhh9BaCOLxqMHO+ANqMmlxz9ahOOWDl8PaK+SDtrMrDxoduIfnyfnQhb3rzzzDc8g5bXx4bQ7wTX2F/yNPl0aVD3D2+wTKAH7qgf7gI6T3+sOb7ANmTEcc335uyPjL5rgf4KSO/Gqcs0MQkJktTeVqM9UxKmYjzYpkshjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710158; c=relaxed/simple;
	bh=rvPK/Dg5T2im/RIHeiod+rLhyhXLcDICeW5UPJLeBGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uqmFO05H28IG0Iss9daGrGZX6mql0Daxe5VULXL8uz5+g7t4glqJGKgFuSC0cM0Lp3A0uw0srORm/vlLuqxdpMKte4TJiNA9FtQP3QdZQ5vMVfWtq3l59cy0h+JVYqN/hXYCYyOuOHaEirdBrxQJjk4L+1fSg6pypbi++gQA6F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QPSqwTMl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2264aefc45dso78324205ad.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744710156; x=1745314956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cBaoORDclgJIxRjLsgxp6IQxhEhL0T0NDAX9n9Trx5U=;
        b=QPSqwTMlDFRxts7YsVmvtlCYyL+FG21cZwk9QQjNa4t0acDmb9K7+z3LKF4O0waP5F
         +I+jQjdiPNtuD7dMOdxp6N/jgThFN+AGECXxYOtc0xqPnTYWAM6gezu1le95d9B6Mb6P
         +NAdHqFJaWO0irvmasbaQhn0tGuLNl0xV+9C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710156; x=1745314956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBaoORDclgJIxRjLsgxp6IQxhEhL0T0NDAX9n9Trx5U=;
        b=n5qyvZHdgenTLdxfmsskJIUhGKj2Uv4lvTfKqlf1R0ns1fMlWBQheYJWY08p0degD6
         hYxOO/UmDrTXBy4reVJtoghh3epNbVkP9peQhZTvIzgsAeKNJPcDFfbkwLFUcLplK4wg
         jtEDGsG4GJcr49t+dk9vYAOBg0sngcfCyKiTRzUoX2azyOKXaqYOXV5bsWtm4ZriYJKW
         m6dLzP4MD17ogDZ8VGorOx4Vck70fRgWoIvF6NYeBvR64R8oUJUN7dMOonQbCBpRf87D
         F4/i7J3dw7fvhUSR26DhG5SWyVPG3CQ68iAd3XN9YDOrrxmYTP7dIrtpQ6zmow41v3Iu
         R3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXJfYLhyTHcWuWVAW202DEWtUJPeaGtI0IyrNqW6oP2mMFdYUnWNZQ8kImSoIoiL6IVlWofwMvipQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyurYLfSgLtluPRg7Y0HSMVX5e+Whxsx5jz7iJTsXhKKxxCa/y
	tQHdZ2/5e/iyKcpwklTexeb4TA4CHa5kTyLB3paMK6JaClf3hjz2yFpGyHSykw==
X-Gm-Gg: ASbGncsNmSl3rgUgDFN7x+k/aGuc8L86VAXK20+NtXHgE0Hkgh4c3+h6DbGkrG3Q/Y3
	VpJP71XAJCN/U8f8+6C11iFNLwzSDPG7FxzGLm1iV41SOsrh9U1vuHMuM9oT5PTTl0x7D3ZZDao
	NCknzmg357ZATGAuT9SaszYRV4qioKuWjNOtqgMj6QSHDXbu15VROhN/Du3s94TKsR2zqxUZUin
	uWe8AYNv4hT8BFC78YwZMpnqXinCZNy2GoZJV7g4HvREdosbyn5fuMvKuTCK4Z6xt2BeiEUOrJ5
	f7F/6ZGfncSLkwmwolfFC+sFjbgR1hlOttRruMOnPub8ZUJt8vweJSBOT35WvIYP
X-Google-Smtp-Source: AGHT+IHVvAZ1ygtLt+QZlSxzIJDMWWSa3m/mDTZEHZmrVvlbbotGb9BvVB2zRgsynJ3aC8i0qEwfeQ==
X-Received: by 2002:a17:902:dac3:b0:224:f12:3734 with SMTP id d9443c01a7336-22bea4bd79bmr179704025ad.30.1744710156249;
        Tue, 15 Apr 2025 02:42:36 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7d0d:86ea:ee84:cd08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca5asm113135215ad.254.2025.04.15.02.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:42:35 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/4] Introduce usb-hub.yaml binding and add support for Parade PS5511
Date: Tue, 15 Apr 2025 17:41:57 +0800
Message-ID: <20250415094227.3629916-1-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
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


Changes in v2:
- Introduce usb-hub.yaml
- Modify parade,ps5511 and realtek,rts5411 to use usb-hub.yaml
- Minor fixes on parade,ps5511.yaml

Pin-yen Lin (4):
  dt-bindings: usb: Introduce usb-hub.yaml
  dt-bindings: usb: Add binding for PS5511 hub controller
  dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
  usb: misc: onboard_usb_dev: Add Parade PS5511 hub support

 .../bindings/usb/parade,ps5511.yaml           | 115 ++++++++++++++++++
 .../bindings/usb/realtek,rts5411.yaml         |  47 ++-----
 .../devicetree/bindings/usb/usb-hub.yaml      |  91 ++++++++++++++
 drivers/usb/misc/onboard_usb_dev.c            |   3 +
 drivers/usb/misc/onboard_usb_dev.h            |   9 ++
 5 files changed, 231 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/parade,ps5511.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/usb-hub.yaml

-- 
2.49.0.777.g153de2bbd5-goog


