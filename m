Return-Path: <linux-usb+bounces-28843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED985BB19C5
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 21:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B1E84C43ED
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 19:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069FC277CBF;
	Wed,  1 Oct 2025 19:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LejC3s+u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83751266B52
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 19:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347232; cv=none; b=SISTbA8TgewMdEuhlxxf2NEmKhXDruQkhWQZCBNT2iVeCNvgfcxFyF87YevJhIXE8UB7M8NDpDqsx9fN5PIQQNOPayZzmN2We95ODis1heR/tPGtQGakkosJx2pDqnIykDK6+jK1ziEoZaqXY9abEqjo2mIPB8pw4qgHbmeyCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347232; c=relaxed/simple;
	bh=oMlT0rSozXjZZ7YPGdWknn8R0T/lM0GFdFoB9iHdVUM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nOOKw+5xAmjo3N+fD/nGNtTwUNX/dkA2vLQ6abmN1xGeufZhloyUS7UEragCm2YE/MZPRpLII5c9lhYrgGSkDi6agJ0FJ6R+2H3zyIR3Og9J88THzPL/knV04D2X9yJ2c0OqsJAWyMRG/P5dFSp+04olz2uga1B0khCIK2q0MF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LejC3s+u; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-269880a7bd9so1513865ad.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759347230; x=1759952030; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U7URaJzWJaVTawsdlY1mWcQUZJgD58fTnHuXHAWwV3k=;
        b=LejC3s+uHtSnFEzeeHpL9iqLqXA8OQXBRC5fSNx6qxigYGFHX0oIFLLie0La/6uYld
         1aAfIwlIFYhFWjRj8e14AASB75Y2/pNOCJN73b1Cq7WjaHki9Y9DwI/Pacw8Tj6R2RRX
         wcsbEqt16GgfQ6D3eEcxi1Gj/OM/KqzfMPeurVvnHif+dZOMlx66rM8C92l6hSLcU3g8
         qfgXAU2PEAKAvmImMhJtWccBIZAixKifx6d1YANZcEzwcAMjLdJSEgw8T4YcW96fOOya
         qsJSFCUsW7tBCmE97zDZUnsxH/21GXUk3W8myfqrUzJ8SWjnjUrSG8TMrKeUaR2GlEAJ
         P/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759347230; x=1759952030;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U7URaJzWJaVTawsdlY1mWcQUZJgD58fTnHuXHAWwV3k=;
        b=m4u+wTLPRxD2ivfUVLAk3dBwgu4oKxjJeTmQivdlF//pRHjL33r4J9VwrFfJYy/ElP
         q63Vj7VdS8jzERfkWqzmdO9p5mgGV3n4MiFqNeCJzI22Ve7I3T2eNImDa15C1rjosJtp
         AYkp20LG1b6zYUp34vHLzHxqB3Z/2PZ2olWulCvOVxs+riqabC7xGO5zO0RsBJs85Vcz
         99m2EInnjY2fDY0yeetngslznUfl2wDjB6I3a6tyO7jEvK+RN0vXvwvGfTo4ZHzObMxW
         zCFr/zUQZg9eFcMVlUZbhDuWasxLCFgEcaAEwhDH4OsqUj5yfFe/fEJvd3eXLCtMbsn9
         gGaw==
X-Forwarded-Encrypted: i=1; AJvYcCWdc5CySGVBSotLpromz9GymGcYJaGdsjR7vcEmwffWvwbA8I3iBTwGBRyA4lLXBdbWU0inA7kJw8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YykRBqxwzW45D8McyqDJSzZkS1JXjJigwmOgcQez1b8hLua/DxG
	cshAW3BzZ7sIOlZL2EYG92uUs9sB0iDcvpp0yBU0tjjwIthwfiH9QrvGQezY1bV1W/1gGpHdaoy
	Fv4+XVQ==
X-Google-Smtp-Source: AGHT+IGkH0qUr//bkgYHfKtx7Vcs5BLj3vf2rBk7ho44eq/0TLPPDY1HD1e7BnRuPnvuJrQBf8vM8fjNLiY=
X-Received: from pleb9.prod.google.com ([2002:a17:902:d409:b0:260:3d:8a7c])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a2e:b0:277:9193:f2da
 with SMTP id d9443c01a7336-28e7f27dab1mr62308035ad.5.1759347229875; Wed, 01
 Oct 2025 12:33:49 -0700 (PDT)
Date: Wed,  1 Oct 2025 19:33:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251001193346.1724998-1-jthies@google.com>
Subject: [PATCH v2 0/3] Load cros_ec_ucsi from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

The ChromeOS UCSI driver (cros_ec_ucsi) currently gets added as
subdevice of cros_ec_dev. But without it being defined by an ACPI
node or in the OF device tree, the typec connectors are not correctly
associated with other part of the device tree. This series updates the
cros_ec_ucsi driver to load based on device definitions in ACPI and OF.
It also changes the cros_ec_dev driver to block adding cros_ec_ucsi
as a subdevice if it is defined in the device tree.

For context, I initially sent out this series for review in March 2025
(https://lkml.kernel.org/20250312195951.1579682-1-jthies@google.com/).

Patch 1/3 has been updated to address comments from the initial review.
There were some open questions on patch 3/3 regarding adding MFD
children when there is no cros_ec_ucsi node and parents conditionally
checking if a child exists to create one.

The expected behavior of this series is to only add the cros_ec_ucsi
subdevice when there isn't a corresponding FW node because always adding
it would result in multiple cros_ec_ucsi devices and too many ports
being registered with the USB Type-C connector class on devices with
correctly defined FW nodes. It also does not look for a child node to
create a child. It is looking for a child of the parent EC device to
only add cros_ec_ucsi if it does not already exist as a sibling.

v2 changes:
- updated google,cros-ec.yaml to support typec ports defined by
  google,cros-ec-ucsi.yaml. Tested with make dt_binding_check
  and dtbs_check

Jameson Thies (3):
  dt-bindings: chrome: Add Cros EC UCSI driver
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
  mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI

 .../bindings/chrome/google,cros-ec-ucsi.yaml  | 71 +++++++++++++++++++
 .../bindings/mfd/google,cros-ec.yaml          |  4 +-
 drivers/mfd/cros_ec_dev.c                     | 40 +++++++++--
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 25 ++++++-
 4 files changed, 132 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml


base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.618.g983fd99d29-goog


