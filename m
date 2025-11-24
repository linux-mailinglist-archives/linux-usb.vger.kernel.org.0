Return-Path: <linux-usb+bounces-30860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A2CC808E0
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C69F343BD7
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 12:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354DA3009F8;
	Mon, 24 Nov 2025 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Grt5m9cc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11AE2E091B
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988407; cv=none; b=K6Tpb9/3RsXoKbtzB6FoM/DgTvwbCplYMgAWXm6jhTsL7ZD7kDxfRw+YS0H0C6QPfbC+x2hHZN7k0bewuPLJHuR8bUqg8YVE7VH+/IdI1hmu2F66fvoO0ezkyqiKIezcy8Kx9pnnOOtdMq+7+8ONrmQ1oOW4PyMAMydhwHfXnuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988407; c=relaxed/simple;
	bh=sFEJLlSOGpwKWfJJy2xR7D3UVtXX3of8JgCShigAEB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o40KCl4U3VqPayzof13LyRpUJ5AQgz7d8U7pLi3MFOcRVuKkW7bwHamhZtPEvpqd5nfOzVQHr7/RIn/Pmg2TLBnNReDEHfz6RVoJcRBUrCqNdJiiAjolKGw8f/vk7sj1WZdwZOv4BpYMEmbobLbXZ9bAiVXfe0XTA56pVwy3Q2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Grt5m9cc; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so5829963a12.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 04:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988404; x=1764593204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uX9BpBCWDOrt5yS3IvVLoplqU11vV2sGXu4lJ+1vr44=;
        b=Grt5m9cc6S7lVMg/dYAP7p9QXpVm7Gy0klPDXRtvQXQWnHnB7a2gqOANaK7aXKs8vb
         DGgFxF6GKv9yCDh0Y6+hj1CjhlydzruLb/DaJIFYMCU8kMznDP3lS1qk2tPPQKMsNN3k
         qd99QbRh9yLmFQoQZDn7mkpAS1vVjrtaVHnu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988404; x=1764593204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX9BpBCWDOrt5yS3IvVLoplqU11vV2sGXu4lJ+1vr44=;
        b=p2I8Iz+c/XIypRKkvPS1TdjAQgdCQRlkQrJAQHqaROLeZCy7pxFKoCcodrSRzNfsvI
         HHWsA3qY4c0a7SNQl71rJZJfBf9Ar719OPn2PrV5kGe4khfGWuVqVUJYtcn+KeQ3MFyg
         FPngtE1nOvg9aIr8j/KhcyQIgLjRpIQGsWsK4ZE5fNeDWYLyCvyUFFP/uw22aEMvivcv
         33gMiFw2tRp3sf7ZChCmsp8xmwrXNRfIdfWeErTyeoJof4T2+bkPLtxaxZ/oxcEL2LRV
         BRHMUdMegopPtk4JL31c8pJRUoRghliChBVjnu6e8G6qMKr1LqizIKUIvLuz2mO8XFgt
         r56A==
X-Forwarded-Encrypted: i=1; AJvYcCW1GGLhPPU4gO8nsDE97XWm61orBcNGkppw2f2L7n4mItcs+tvVbxNH0ZVPi585eFgipzI21TVdBVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRSd8uAAREOROGQaP+h3VQnx0LVIb85VuzGGjxf0pPaZnF6Hg+
	PgjcSaFsAOnayW80TksfP2WzfLXmB+jOTb+a/qpABxBF8CNSYIYGZ/50iNKW6cpLlA==
X-Gm-Gg: ASbGncvXoXiYBMVahlSRM1vooE38YG5hL57sQA746wt86AzyPghXziC/KTS2RdvUjwu
	MJpSnF69amr+INBEzSvVXEJjmWeSzwL/vby/hLxex6nszSE5YAUqOg+hVmp3q1EBO+sOjQM8mzR
	5Uqr8gpFzhbXyPMW0CzLpGMQEJIHoyCdVm//ipIxPcMFdYU9BkU8OrwNNwyJJZtSJh/Kvcbmf39
	64/Y4MqUSpa6kGtVJ3keUmD42E9E9vAhjQcmAqHojJ93Kqhn9x1/aCQtQ3ijQ+RZL41Bl095bUr
	a3cqtf7kVHBm836ZXbamJsKuL4kE7BNV7r0wv3fArYDxDoK4tIycUZfHMvcuat+KKgSOchGNju/
	RYR17jdHGQXjkfXMukKXVrhl/BDyVD8ntB0sAXRYMCS7g59KbEaYcouqXIzKMLyg837iB5RiEgN
	BBVS+H+5eEwsGqk4DLsZf+EW08WRzo44w1C/t/Y9MLCEKSSRCkj8u9JczzGi2FrR0Ewy3C11MtO
	gw7hzaSsCI=
X-Google-Smtp-Source: AGHT+IFtjJzeAYjXZU1NGg57vdmYBz04gbLDWmTf1/B0FUQwt6XV+ifbJflV2nn+hc4IKrkRaRsb9A==
X-Received: by 2002:a05:6402:2116:b0:640:bd21:242f with SMTP id 4fb4d7f45d1cf-64554442222mr10334834a12.1.1763988404304;
        Mon, 24 Nov 2025 04:46:44 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:43 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 0/4] USB Type-C alternate mode priorities
Date: Mon, 24 Nov 2025 12:46:35 +0000
Message-ID: <20251124124639.1101335-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a mechanism for setting USB Type-C alternate
mode priorities. It allows the user to specify their preferred order for
mode selection, such as USB4, Thunderbolt, or DisplayPort.

A new sysfs attribute named 'priority' is exposed to provide user-space
control over the mode selection process.

This series was tested on a Android OS device running kernel 6.18.0-rc6.

Changes in v5:
- Patches 3 and 4 (v4) have been consolidated into a singular patch,
keeping the mode priority implementation within drivers/usb/typec/class.c.

Andrei Kuchynski (4):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: ucsi: Set no_mode_control flag
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec | 11 +++
 drivers/platform/chrome/cros_ec_typec.c     |  1 +
 drivers/usb/typec/class.c                   | 99 ++++++++++++++++++++-
 drivers/usb/typec/class.h                   |  1 +
 drivers/usb/typec/ucsi/ucsi.c               |  1 +
 include/linux/usb/typec.h                   |  2 +
 include/linux/usb/typec_altmode.h           |  1 +
 7 files changed, 112 insertions(+), 4 deletions(-)

-- 
2.52.0.rc2.455.g230fcf2819-goog


