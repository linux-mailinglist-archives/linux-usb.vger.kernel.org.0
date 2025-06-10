Return-Path: <linux-usb+bounces-24673-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F23AD3DBD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 17:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17361886D45
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 15:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732A0238143;
	Tue, 10 Jun 2025 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j8YNwhbG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8B9211A1E
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570069; cv=none; b=SWtPAYuqjrfV4DcGO+I3uu6oTgqmcofIfWzs6lB+jLylP1aGqZNT4keRmbMs3UIgbA/1WXtitGlfSF+w7wi40/4lpN4hwaggeZZtPLi3n2ASNG5uqctS6JZG+Y6N4idSuyvLQgYXNqtGfwyVDgFboCGzSV26bQih/ZqweitYKVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570069; c=relaxed/simple;
	bh=zqf8GLcacnKjJ/AoCG8d54bI1CWRF1G2wwbOsQiMpZc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i4z0pKU7K78XdPA1NvJtJbc0hvB7n07va4sUosnZW+vfd3D80eZs0qZBHRjCwCTjJElFi1bmXmBbcNnjlg13MqBYzKn/Y91wDTk7OYHesKptnOs5IZAvbUEo5fuEsAkJlf/nV20bxEVaGhA4nVro25vxijS5nCfH6dbvHE1T+Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j8YNwhbG; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tmichalec.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ade5013e0b9so184970766b.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 08:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749570066; x=1750174866; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hWoDsN/EY8YsDqOcW9EsViFv1XPUq7vijx49zRxtnfM=;
        b=j8YNwhbGeEj3WxkpyH8bHr3v1QZJets3yptlQAWrlF1dnOWvSnUUhjt8jtSlSSQRNm
         gD5bDjNjRqZaoSe40Nk/NhMFqa7YPlxexr0DuMmTM070iOYVToW+Yl7p9jrXAJMUvSbW
         MyRnuXiy2/LzQGDGakc3PrknfATxrmzU/fyTe6IQ6SCGXWBT7Hf0HpikVXYp/m8SwxN3
         5VimXReYRTLpcWE13wbQXpflax/99nG05bXajpcUBCtHa1pCuN8XdhdxfYGFubefNcJL
         bj2ME+n7v9NDUsrhB7JDm6tMh/aLCuXr4yJmHmvQD9NRzBHo1fU/xrbts8iteuP4+4Za
         dcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749570066; x=1750174866;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWoDsN/EY8YsDqOcW9EsViFv1XPUq7vijx49zRxtnfM=;
        b=XMjUobZ3AzdgMfHZtsswhP68SmHPmlWjeAGPORWllc/g0J3i/etZiV3s9omfulkKIq
         2ubwmU5gUkE4zLCtVL4FJ8nZRT8GcPKXgE4TBlZdjzHsLhTXQoS57UEppB5DCMVY+p0J
         rg0Iie/nQ+uEuJ4VcVUuahUvl3a2Ql+WsvQD++pPo2/KeNzNkYoqM83IsVDhIn/yVwEi
         WY6JuppFtXaJ11XEOIcVIeAIfUvzUxT3/p7zc6GSAZzTx0N2/X0HrO3XZlKx3KAVtkv2
         w/u+rRaUJSCAeqyc5ypaF2D1N8GfO6/M2VCXmwHFLUnTqCyNfcaAxOgQGSaHrZti09F0
         yMVA==
X-Forwarded-Encrypted: i=1; AJvYcCUwRTaLcP+zkMldtDWGRG4U7TOK9wiWZfYrlVj7OAhbAJGkNjn16sHDThrpnI4lS/ZFEcFqsO/GxOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YznY1LjPXhf48fRvulsiiElba7a3Y1xAAsvlJbOTfr/KquaIF9D
	o4xDclNxw9TNEjggVpzFV5ytdwWc9kSJ8qHKTrQsWcjIOO9sYECCLWXoQxakkpUEUyhTytKFgU9
	ZE9u5fdPBMexM2eU40g==
X-Google-Smtp-Source: AGHT+IFFmIF80oWRhi9QTdJwDrH/lMsXmzWSGM4rM4pruPyZM6nyadSsKNCDtHhTtcqohcsb4ljfEsyglqz50wk=
X-Received: from ejcrc18.prod.google.com ([2002:a17:907:a312:b0:ad9:a8b7:f7b9])
 (user=tmichalec job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e14:b0:ad8:a935:b90f with SMTP id a640c23a62f3a-ade1aa5c993mr1640676466b.7.1749570065883;
 Tue, 10 Jun 2025 08:41:05 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:40:58 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250610154058.1859812-1-tmichalec@google.com>
Subject: [PATCH] usb: typec: intel_pmc_mux: Defer probe if SCU IPC isn't present
From: Tomasz Michalec <tmichalec@google.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Konrad Adamczyk <konrada@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chromeos-krk-upstreaming@google.com, 
	Tomasz Michalec <tmichalec@google.com>
Content-Type: text/plain; charset="UTF-8"

If pmc_usb_probe is called before SCU IPC is registered, pmc_usb_probe
will fail.

Return -EPROBE_DEFER when pmc_usb_probe doesn't get SCU IPC device, so
the probe function can be called again after SCU IPC is initialized.

Signed-off-by: Tomasz Michalec <tmichalec@google.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 65dda9183e6f..1698428654ab 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -754,7 +754,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
 
 	pmc->ipc = devm_intel_scu_ipc_dev_get(&pdev->dev);
 	if (!pmc->ipc)
-		return -ENODEV;
+		return -EPROBE_DEFER;
 
 	pmc->dev = &pdev->dev;
 
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


