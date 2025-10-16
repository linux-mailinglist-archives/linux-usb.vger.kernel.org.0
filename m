Return-Path: <linux-usb+bounces-29387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2310BE5D69
	for <lists+linux-usb@lfdr.de>; Fri, 17 Oct 2025 01:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BBCB3A9186
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 23:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7312E7F3A;
	Thu, 16 Oct 2025 23:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SpHCaxLJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380E22E719B
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 23:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760659156; cv=none; b=mQFtJhxOyzf+mTe8IQ/HxenV9/ru2rSvAQlU/gN1eXGJaVBUOGVNVVaGK1QNMS4PM/VT68ocCHl8PSKjfnRRu6U1IhWYMhaoSq4zOkep2IX+SBVp7K3CoPPABJ4lc8j6JuCg64spcZsofmtSsjbV0lrFQJVWw4s+cEyw1Mn6vm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760659156; c=relaxed/simple;
	bh=HBiddadU9m7kjU0oqtk462Jkzkl4y5+s8GpBQ6GxRKI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qycohaLQREEeYLsSE0j31uYpFDmZ4aM9VCfZLSnJWWiCIqCNfccWIuV3JA/ZLaHJMwRkOPf+y1Vm08NRBvp+sYJLRekDGZnkhmxgB7W9NnkAM+yTVCQb38U+78jJC25x30RKoyoPnPBfmLA9F+f8KBo2l6VmGPP7EHZJ9ZhGDbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SpHCaxLJ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-28c58e009d1so24869535ad.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 16:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760659153; x=1761263953; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WawDHA60a6s4raK4N/aQLo6JOofQaLsnvf/pVAIpEpk=;
        b=SpHCaxLJBSgFjbCHaYFI1lIvy9zyL4YBTBpYhjvmdpqBXxX5fMb0r5ET2UphM68pWW
         Cyl1N8Efb5Nb2v0+ZUYUrk0CmpQqcdhOqZKJHrT5ym3Kv1FSJXcVVRWJOQ7nf3vD8EsR
         /ZGAaHmOdF+mUjet9r5hOEPGpa5+7xrZyqiXn2RP5H9Xog129+8M0bmurhcvaAKSRkbF
         fpvtWfjf7I8ycIYVssxxxC2EpA9ksMC7PhSwl5l5gS5uh7+PDmGTcE1GHIYeXFJlvAZe
         /m5V/sVZ97uvBQgOyJchO2uCdZ5+IMZtmUpgsLI2fetziBrD788N8nY5lYUlI93ua1EP
         FSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760659153; x=1761263953;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WawDHA60a6s4raK4N/aQLo6JOofQaLsnvf/pVAIpEpk=;
        b=lDxSD8i/sOrQGxthiVGX5fVrfYeRQcCQ9YcTk4ZRCg5/mNbDQT5yqi9HcBjQi5AmbL
         Bd080yqxm/4FEdLKvF9Ku86ttXbTGCI2GmyHKW4mi9FmnLVqBS9jg0FvDEE0D85G7kub
         HHtkl9xagLKmLGKG/fBXEOb8O1VMOqlMwCgLTsI8J8jShy2ToMtaAqgCT7uwzqC6i7yE
         of8+L64w2yKho8dHRcWKFG8ey9LBPXEPulVpJjvwrgocfDi2nSTxyCol4+eq+dLzFLxo
         w42nB3tORnq0ijP2YatR+We7FBzGsKYKxdvinyndHtDEKGamrNTM3miTpE1fLWy9WA03
         srkw==
X-Forwarded-Encrypted: i=1; AJvYcCWyj/JeTjiCsvxCpMVLosAt80lVRQ416eNd5kfqFTOmk2WaXI88rKnUboKU3xlbRsz70f3jjQKrGnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmdS/bwoYDyllGtGt5yscYu88AD1wQZnskbekg7LDTFTdgAhVn
	SpKJO7SdcgcoQVAvZwwL1v6t6ngI2vJ9ryc+X7qMnIcpl64ITfWIphR8zrpS33R/YrWI0mO6ymq
	q7llucA==
X-Google-Smtp-Source: AGHT+IEU+N5aH0xxOsEz+DyPSJOr/pus0xHhiIOJ6c9Ask7TcSZD4nSQ/AeRjmE0UAo2XpRAtOkANqnYu1Y=
X-Received: from plrt13.prod.google.com ([2002:a17:902:b20d:b0:267:fa7d:b637])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:138a:b0:290:567a:bb98
 with SMTP id d9443c01a7336-290cc6da1fdmr19433285ad.57.1760659153500; Thu, 16
 Oct 2025 16:59:13 -0700 (PDT)
Date: Thu, 16 Oct 2025 23:59:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251016235909.2092917-1-jthies@google.com>
Subject: [PATCH v2 0/3] UCSI Power Supply Updates
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, kenny@panix.com, 
	linux-pm@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

This series includes the following minor changes to power supply
handling by the UCSI driver.

1) Adds the "Status" property to power supplies registered by the UCSI
driver.
2) Updates ucsi.c to report a power supply change all power opmode
changes. Currently this only gets reported when opmode is PD.
3) Updates ucsi.c to report a power supply change when the PPM signals
a sink path change.

v2 changes
- Removed patch adding support for reporting DRP power supply types.
  It led to spam in dmesg and needs further debug.
- Removed patch to report 0 max current when a port is not connected.
  This is a bug fix and should be reviewed separately.
- Removed patch to refresh connector status after PR swaps. This is
  not directly related to the power supply and should be sent up
  separately.
- Updated patch notify the power supply class of sink path status
  changes. It now uses a single bit mask for checking both sink path
  status changes and battery charging status changes.

Jameson Thies (3):
  usb: typec: ucsi: psy: Add power supply status
  usb: typec: ucsi: Report power supply changes on power opmode changes
  usb: typec: ucsi: Report power supply change on sink path change

 drivers/usb/typec/ucsi/psy.c  | 26 ++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.c |  5 ++++-
 drivers/usb/typec/ucsi/ucsi.h |  4 ++++
 3 files changed, 34 insertions(+), 1 deletion(-)


base-commit: e40b984b6c4ce3f80814f39f86f87b2a48f2e662
-- 
2.51.0.858.gf9c4a03a3a-goog


