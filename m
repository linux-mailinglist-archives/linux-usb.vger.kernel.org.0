Return-Path: <linux-usb+bounces-29060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F8BC7094
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 03:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2EED84E21E9
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 01:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1BD613AA2F;
	Thu,  9 Oct 2025 01:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zxyL2Qxc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13342AE97
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 01:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971800; cv=none; b=BrKx++8OYviwTN+dMRMTAAyg6YJDWJtHPdu0oMjsaOpv7zLAog5wMnkxN4+rinclEZJcDRsuvjepr3o8X32/vBc9QNN3bBdihR45F6rxoLLlfWJbEzIyDBX9P4WSHe4fr+WWnAsw/c3uHmmhVUw0rX+pv3iyMXw9KZYG0lpPteo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971800; c=relaxed/simple;
	bh=UVEbaZKRJ1LV6jOrWQZHeNwiTFK7Bny9uchXuSQMfiI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LxQBXAwDYtQyxolPHDc0rDL9ax4R3KMZWXHcwuRGB9gmEbUVXm9NOeuRdyvy8J1DDLTgJDHw1V7i7zpN6yvHW6Yo5ZOtDN7y46RfgnJK7/rE1/VeUCLDgn3lW7wuXuhEdt/ElI9ofIzk1xybqIu7QWKkR4Pi3WF6ApOWLOTnSSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zxyL2Qxc; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b62ebb4e7c7so412170a12.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 18:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759971798; x=1760576598; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g+jfxdpog7qXbji4SutVkM+hfLqi/HKH+DHfYf9r2Ww=;
        b=zxyL2Qxcu57JqcZfvswZkltL3nLFJVxNShUcM7tvq/2HAAKuziTH5GYR4JCrzB3v3+
         8M5Y36r5CFsV/ufh4vwNfy2rPuq3BDZ6ZbC48VszZpn1hNm5xLcDTDum9yicpR3MmY5p
         wynSco+tcH1flHMf77Cih27sfGImmttstb6Mro86wFra+XcxnUbgmH5CMrPUHt+ONpup
         5tb6PG23cCC6LLMpt2geDZvvQqTZBrWmgk/Oo4XKILwR3z7UXoRV+Zexk5PhS57wqrmo
         qg3BpwMYvTT+svmLJJXKZf9pp2Qbmue/tH+2y+ipPuoZn4DDmoHv3+acKi4rAkpWIkiM
         Ljgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759971798; x=1760576598;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+jfxdpog7qXbji4SutVkM+hfLqi/HKH+DHfYf9r2Ww=;
        b=U16Faqi5vx17+lR64QSkiDjNg0pWf/91u6+QQCCCvVnWpybpTNtW1o9VW7heSI9PFp
         8WtUwU7gQkdPkXyIfHmQFIiuixrOSC7bGHXXyicPvxQatv4uwSdz9lMCA7fsIRRJAf6V
         mTk4uqapB1uubX7RRu5BCzrUqipPAbyNeCLi0Nu+sUVtYgwukqqssymWcdQt+CXp1KER
         A6AgzFzl3aO95fpnmZGuE+TgwH33pFUSuSi953EekfgT3N7zsj6X7UC6EIYhQ6mrnCwm
         rvy9RSh6wn4TMvu5Z2FNcmABSXDyiCayYitOdkPyCntYaEIrphL4LZK8jLIgbzRY/2vo
         Do+w==
X-Forwarded-Encrypted: i=1; AJvYcCUhJj//9awFFCbzlvDWKgEYYYQzllDwRCvYkPoZcCijio3mIHsAMIuWkaNK06LKEtM/TzRS+VDkAks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXc8duFIq6EOJcCMcLFI1+W1tPnntlo38zRYmgP7XAis357ESh
	BFiVB5R30asTYIBoI4qaGfD7PCkjCvjhkKveY+UW9KSbD2T45hwDasWupB2YSZOSgGBRnnyTE46
	DOWoDEw==
X-Google-Smtp-Source: AGHT+IFKeWug9rAoNWt532znqpIGqG7Ud1apMC9xL48ZMgTXDMtnDoVUWtywIYBEaSmh/SWSXS3sAjCWOc4=
X-Received: from pjjj2.prod.google.com ([2002:a17:90a:602:b0:330:72b8:fcc0])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d08:b0:32b:6151:d1b
 with SMTP id 98e67ed59e1d1-33b51105a79mr7357200a91.8.1759971797841; Wed, 08
 Oct 2025 18:03:17 -0700 (PDT)
Date: Thu,  9 Oct 2025 01:03:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009010312.2203812-1-jthies@google.com>
Subject: [PATCH v3 0/3] Load cros_ec_ucsi from OF and ACPI definitions
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

 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++----
 drivers/mfd/cros_ec_dev.c                     | 23 +++++++++++++++----
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 22 ++++++++++++++++--
 3 files changed, 53 insertions(+), 11 deletions(-)


base-commit: 48633acccf38d706d7b368400647bb9db9caf1ae
-- 
2.51.0.710.ga91ca5db03-goog


