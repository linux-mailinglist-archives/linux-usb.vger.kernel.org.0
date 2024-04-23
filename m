Return-Path: <linux-usb+bounces-9664-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 431758AF7E0
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 22:19:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D1111C21CFC
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 20:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E795A142910;
	Tue, 23 Apr 2024 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHIaoAWX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0222D142636
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713903589; cv=none; b=ZefxTWtSBbx5LFBRhZ0J0qT9BQb0z4VA1EmWwNGbLy0U7CxVmlkKFVW7XZzAdDAy4P5Winu0YkRFYVZ13UO6c2PBFGKeCaTsFug+LKZeBKKwwwhtamUzQ1SP3AFwYAicQ8fKxY+D8GI3EEB31tfAHaBeWGFN4NzqSOfAO62dOP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713903589; c=relaxed/simple;
	bh=3O7BXnUsDX8ukBf3kywe0wHWEfDlM8avhl1AO6/1pQk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZLhAAfhcHeGJIiA5frxwD+h8zS03SRlTrA3nwf4IngBl6r6ySINwM51XVVwvtEhFgeZKKeobR8pAT8P/vgXKXz2OcbV4ub8ODkHXE2hGgOJ10Aw9UzNW+13lAqSE9TFsjoARFFFAmm83f/P86E8tF8uUgEYYCuFcG0fAVpEqSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHIaoAWX; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a58872905b5so79786466b.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 13:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713903586; x=1714508386; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+do+sS5zXVZ8W0CIVva6X+uSo3qaE6aX4OfqXyq/5zc=;
        b=kHIaoAWXwvRM6APjvVkAUXYSh7D06dZ1Tzw0y8bXwmN09rtaS8GBCfije4zJdjT4at
         9cQN33NNDWbM0mUPBq1sDQ2qrnpPEN9di00vIy9PdGRQCZ3Lo7AuqqXpuFyqibAkbWtU
         xz4Oq0CTiT9/Ag8PFdNIWB2CwlQFjAVtQqMWj+DF2mG7sg+QgGHxfhxBPWvPPFr7Jxlh
         Yk4WfpsJirMpAwoqn8jAidq2uWBR56fSXKTOujPnKQsixSM5BJLL7YlxhNxEHoloC8uC
         w8azOL4lOpWITfG422dfVgtaHsaZ7HkPRkXuBFJv+efXNpCeo+6tyj/2Wkt2a6waXcRy
         xUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713903586; x=1714508386;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+do+sS5zXVZ8W0CIVva6X+uSo3qaE6aX4OfqXyq/5zc=;
        b=jIQ5Zf5yIIJQ+YQ7yNPtoYzvHWz6fKsxhEqMoJ3TnGNT0Tg4zWSFrzbSmC1hZdgrM0
         m5PImodkO7PMpm9+VTVGOkipCghE/SJaZFu+xYCo/7PJdgglg0yIKfeJFNks+2KJKjsw
         xbUbeUwsYcCK7VnBPV0QOYINqvRElKrNv5HensXjZkdalJfr8gJFLDdP/fHaKECgVtP2
         +n0827UyeFMa4KUMY3JCpul9I6cQWcON3aP8CpKxpCGCzlOSfcVJmAy/P9rZSltYAv/n
         184ROKNMLHzZwsi2PurUMZboQi8muhPYU3Uha9bdghgYqFeHqG7206FUMe8K/Zcn7w4N
         iI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWewDJ2PtFUBUT5HkP0bwFe85rxo7+1MvU8ugY5fFGWesputzsY/rEG/lqlzWgfSGB4X9M4qmsvXwoKc8PQCgBFFF1XlmsyGQBS
X-Gm-Message-State: AOJu0YzCLxff4kSJBCklpbdbpY//6rk2oi2EPM/kljj52RsODo1Id2Mc
	0rRDpcNAQAyTZXjW3LpYmRz96EfW5bepr9rH/pCQOppecVRDsZWeefTJnGZzMyE=
X-Google-Smtp-Source: AGHT+IGdOsUjr0vw61OFmMtWTH1FBxLLoYGz76G1VI9CIdDARt2oojq6AQjBqT/RxUpia0y4IXYtuw==
X-Received: by 2002:a17:906:7c56:b0:a58:832d:c3e8 with SMTP id g22-20020a1709067c5600b00a58832dc3e8mr228603ejp.58.1713903586261;
        Tue, 23 Apr 2024 13:19:46 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id i7-20020a1709061e4700b00a52244ab819sm7552431ejj.170.2024.04.23.13.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:19:45 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/2] USB (dwc3-glue) support for Google Tensor gs101
Date: Tue, 23 Apr 2024 21:19:44 +0100
Message-Id: <20240423-usb-dwc3-gs101-v1-0-2f331f88203f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOAXKGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEyNj3dLiJN2U8mRj3fRiQwNDXcM0UwszkzQDs+RESyWgpoKi1LTMCrC
 B0bG1tQC5VkjRYAAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

The Google Tensor gs101 SoC embeds a DWC3 USB 3.1 DRD controller.

This patch series enables the existing dwc3-exynos glue layer to work on
this SoC.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (2):
      dt-bindings: usb: samsung,exynos-dwc3: add gs101 compatible
      usb: dwc3: exynos: add support for Google Tensor gs101

 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml   | 18 ++++++++++++++++++
 drivers/usb/dwc3/dwc3-exynos.c                         |  9 +++++++++
 2 files changed, 27 insertions(+)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240423-usb-dwc3-gs101-1f5864f06ca9

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


