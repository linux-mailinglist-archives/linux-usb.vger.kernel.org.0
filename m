Return-Path: <linux-usb+bounces-29244-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B9BD62A4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 22:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C76944F40A5
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 20:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452D730E840;
	Mon, 13 Oct 2025 20:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1qE19jxf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBE230E823
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 20:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760387659; cv=none; b=Sk8BIBh2l3ibZIUscWZbObeYq+6m9CvoPr7ex9FcsdNU4LBi1ogBqmOTUKz5VMiqaDccxAPNFhZ1xDZJMs/hCan0xW9stCaKcghbHtbqa27qT0RSLNm1bo5YzWSz8z3jSc53JG6aWnAY71WwguxKOqPi5L4cDegOhNYT1X+g0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760387659; c=relaxed/simple;
	bh=8DcttytX6iOcJih/ka1yRgr3crh9eIzrXQKR3igm7Lg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WqquneVbRQ/5MfGPCGtBJXp5GtQ5GUuMzgaBfPsUjpcsHyxeOcyLTvHhJG3wK/8k5DAwFx1uyXfE9YopETOAEToY3VoZZZL6b2GyshyUSWMsRrvje0mUMnz2sQPTTQg9kS0mXkW+kp7ylnwkGYqc6rbcESEEX68rFP3mnOcnrC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1qE19jxf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-272b7bdf41fso100323285ad.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 13:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760387655; x=1760992455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gzVF6HNpn2hAJ5LJ+570UzK5DdagInVxIleQtzZcUJs=;
        b=1qE19jxfDkGWqVjj/qhbeZ6i1gyQIliSL1QI4PAgc2WvpTQ0MWi5+DRk/fBMu/3CLW
         j89H8Uo9gAY03lzCRZswtCzbXGSdXgqUnOcoGGR3MG1qMj9GC8f1eoAvKvY1pDa6+fdu
         llVG9vPl6X1J/TuQzYgrRa3ePupluUyTbasDCTQC1OgkHj47Ad15UKcedGjnSUvY+VS2
         7EhKpqbLQ1K/8saBKZpBeE5X11kn+5FAiBIZompHFctyoGb/iRJVgSXF3ETbkjL9RI/3
         N6b9NE92wQHQmxloe+EvoyeuPyUrEmGFgyPdXEDKN7x/L9Q+fjUKLrY6FzoFeA6wxT7J
         +qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760387655; x=1760992455;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gzVF6HNpn2hAJ5LJ+570UzK5DdagInVxIleQtzZcUJs=;
        b=R/F+sesI0VvKkjZySaJYm9kNCcaa88W0hLhyA5ADZ++hCcf7FSkXdim2GnXnsOCqYr
         qcQpAzuBRnJDhMyMxdZpqu+YgootiHTgODoRF3k8qehhoWo8KgLfrO1/a9t4gIKe8hUR
         IK3Tf0qbXyHdUdr80RCUDkYXYIvq/lvoDfqVfDOvjxKt1aqbL7gownMRY9Zh7meVRugS
         5j66XQy6qZQHXyfT9qUPHbLrhD3zTd8l9Gs2n36OTUyxhVPgbuq/CBll6/4yQBEjCaDH
         pCxPq2SZ8pgkUylwCV2VsKMiVHlIYM2SmGorcoNe7Rg1v+HSl5pzmQRhSN1+rhPYN7IZ
         AsfA==
X-Forwarded-Encrypted: i=1; AJvYcCWKia3GZPIBSgl1e89prRpIWuRlCHmm6EZOL0mhmYJnte9DMpH8e1JyNAoqv6DQgfknZcjZS59pvuo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv5wKWpRfxUxDm1c2RoR+njtT1X7ZAtl17gGRfGU4Y7LzD39k6
	Nfc+cKpDLxRA3/Qwm7WOmFCF39n91FxWiza0K0Kye0YXAzaCFoBT1Lwl77pahiblZFQ1cBr3Yhn
	eMegBNg==
X-Google-Smtp-Source: AGHT+IEO0H8VOrl7rO9YgvD5W2tsbiRTiwbuvZNbI49DJaTkZ4i17mjzWbSsXh42QUoIRnQxN/BE4fZCes8=
X-Received: from plblq12.prod.google.com ([2002:a17:903:144c:b0:290:28e2:ce43])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2343:b0:28e:7f50:5d80
 with SMTP id d9443c01a7336-2902721336cmr301182395ad.7.1760387655190; Mon, 13
 Oct 2025 13:34:15 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:33:24 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251013203331.398517-1-jthies@google.com>
Subject: [PATCH v4 0/3] Load cros_ec_ucsi from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: dmitry.baryshkov@oss.qualcomm.com, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, krzk+dt@kernel.org, robh@kernel.org, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, ukaszb@chromium.org, 
	tzungbi@kernel.org
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

v4 changes:
- added comment in cros_ec_ucsi probe explaining how the parent device
depends on how the driver is loaded
- updated commit message of patch 3/3 clarifying the expected why
cros_ec_ucsi doesn't need to be added as an mfd subdevice when
an OF/ACPI node for cros_ec_ucsi is defined

v3 changes:
- adds cros-ec-ucsi compatibility string to google,cros-ec-typec.yaml
  instead of defining a new binding.
- updates maintainter list in google,cros-ec-typec.yaml
- cleaned up assignments to udata->ec in cros_ec_ucsi.c
- now using acpi_dev_found() to check for ACPI node in cros_ec_dev.c

v2 changes:
- updated google,cros-ec.yaml to support typec ports defined by
  google,cros-ec-ucsi.yaml. Tested with make dt_binding_check
  and dtbs_check


Jameson Thies (3):
  dt-bindings: chrome: Add cros-ec-ucsi compatibility to typec binding
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
  mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI

 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++---
 drivers/mfd/cros_ec_dev.c                     | 23 ++++++++++++----
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 26 +++++++++++++++++--
 3 files changed, 57 insertions(+), 11 deletions(-)


base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.858.gf9c4a03a3a-goog


