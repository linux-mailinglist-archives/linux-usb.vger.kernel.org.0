Return-Path: <linux-usb+bounces-15807-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9B5992DE6
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 15:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4E41C22EA8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 13:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9A61D4176;
	Mon,  7 Oct 2024 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FWNIV/FU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30A1BB6B8
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 13:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309318; cv=none; b=QcpjGI8SocaacBpMz4lceqYRKvI4aMaLUxt0sJS9acCoGguhoBx7tQ6Kc2BNYdM5I/uLYezmdhB8nM7j6IO7MXuoioxROvsLMSDZK/qtCupsI9p2P3pLi5mT4eGipQPC1l5i3DB1SRnmrnW6uJ6cdOnRAtil6iPibuN35qBKkCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309318; c=relaxed/simple;
	bh=zMkYuC4k53t/2vYMskqXDg4dImpJ3Zc8B0tIY41PagU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iocFFCwV5QuNM1vH7cup6VLFcvD/3RobkB00cTk2k3qmsfm7joCuEuxl4ONosXUISRv4brhNnhfRJD9zLYYHIN7Ncs1nh4Dx35pAIJRvebfIoHJke4wjCoAa5nXkKh5nnGaXwsl7jSu6GK3YY/Klh7sO075YuFMMokArYsTz1wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FWNIV/FU; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e20e22243dso14337367b3.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2024 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728309316; x=1728914116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jb+jaPaOusLrFyoBjXM/LeuJGBrvwQ1D0bf5dCdvEsw=;
        b=FWNIV/FUyq9ISqgJykEqQP6QRV1Z5HnWlz4ju9k/WLvcnoBXx6UuL2IkOHK7EJ60XM
         hOPRvS4rG3dmt0NP2tytQQsfCsJJFvxuZvjacDXnyz+8hcAtafmMiEw7bLgN3DZzrDiY
         V21N3pKf6gudq4R3obKmm9yZdqpjPRahMJZp6QsFaLEGvXbaLb5GonHKMsnuTilb89IU
         AUqJSGFCinshurWAx2YtaVPpp3DiGHKDw1p6Wi076JWvFyehde95DaKOBJ8S44637IXB
         H0wvKLPKosd0yVBNgaVB3yPUtTNeQuMxiyrgARPu6eJzLP/rLYPUvKbgeLtLeqacKUP1
         wP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309316; x=1728914116;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jb+jaPaOusLrFyoBjXM/LeuJGBrvwQ1D0bf5dCdvEsw=;
        b=aDoZNdkFdIgiYU48Km2ZAm4d6Lto0qMcnHLrghwWVWPmGYQQmtxRbIdxHrtRYRntRT
         E8ZC4kkyPEFAcdf+0IlQIM3Tv4EG/0DIOaY+3FKQ6wxdJnT7/2Cz8J3Huu1hHsjgOgHE
         TnU6K1J3Mr7WqYcWBe+wnED5GyMfCLLWwMk5fLpER4MSGtE9r9NcTT6j2KOX7dIaFGlG
         s5iNuVcMgqtT42gs6gPjWjwXTKRM28fUUNHY4ul6Ujn+V1bkdtz72Ym5tIdVsFHs+tiL
         IUXw6HAj0OdaujJU6xPGbLvAAa7wa3GgYaG4sDo5faiQnyG0EcvC/pNJeEjSG9Q6ExO/
         4ICw==
X-Gm-Message-State: AOJu0YzwmxObkc/u7ajXn1p9yA/acciCTgKHvwX57PGeu3Qpq+/EeeIu
	wiyBA/77i02rGeOPVxyZzWICem8jiO5p/nDag3LzOuJndzLSOutiT9Zn78YjwydW3La0+M9VJnC
	UsUxvLC3dHg==
X-Google-Smtp-Source: AGHT+IHVs/zdYgZDtbB6oc0KAm4aIUJok5s4kXcSvZw8LKcF+F+T7+c3qaXBYpFFqVndgkIcTG22DFH5Nkh1uQ==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a81:c746:0:b0:6e2:1713:bdb5 with SMTP id
 00721157ae682-6e2c729b1e1mr413977b3.5.1728309315945; Mon, 07 Oct 2024
 06:55:15 -0700 (PDT)
Date: Mon,  7 Oct 2024 13:55:04 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241007135508.3143756-1-joychakr@google.com>
Subject: [PATCH 0/2] usb: dwc3: Add USB3 Gen2 De-emphasis setting from DT
From: Joy Chakraborty <joychakr@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

This Patch series adds support for setting 18 bit de-emphasis setting in
PIPE4 spec from dwc3 Link registers based on quirks passed from device
tree.

Joy Chakraborty (2):
  dt-bindings: usb: dwc3: Add binding for USB Gen2 de-emphasis
  usb: dwc3: Program USB Gen2 de-emphasis defined in PIPE4 spec

 .../devicetree/bindings/usb/snps,dwc3.yaml          | 12 ++++++++++++
 drivers/usb/dwc3/core.c                             | 13 +++++++++++++
 drivers/usb/dwc3/core.h                             |  6 ++++++
 3 files changed, 31 insertions(+)

-- 
2.47.0.rc0.187.ge670bccf7e-goog


