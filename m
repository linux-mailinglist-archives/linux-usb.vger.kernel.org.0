Return-Path: <linux-usb+bounces-35952-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I30ErVB0Gk45QYAu9opvQ
	(envelope-from <linux-usb+bounces-35952-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:39:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC0398CDE
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 594F130E4397
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 22:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410073264D4;
	Fri,  3 Apr 2026 22:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gkh/xu+U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577C3309EEB
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 22:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775255654; cv=none; b=oO4VnLOYIXmMojXBRQR97Isn4Qs+hhVBn9ihCgQb37Sm795trS5DRvRIjtefxGdyoC1IWgl87DKydTg9p3okIWjkRlLEVljAGPekldApE8ZXKy54F3sborFlUzP1bNdvypiFWYppgatXeXE5mHO1fn+tQFnkgh1kmWF66YC3D1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775255654; c=relaxed/simple;
	bh=/qTb5D8k5mJijhAYXco0XNumuwHJi4yRgl5gjCxIuIs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gsjyTebbeofGHGc0rdDSd2g4RMQl923lryCc4s+RCJIgCGTFE7Ab69NTF1qcSJ6YA8dl+FUqsnoPM5SyRYLIOGkLaqm83H4+KY97FAZKUrgcLL9rFKd8GZtKV2i5e0BHjm30hrtVuEChkV0Y+k8AqOAGuaDdIbQD4SZ6IEZRBG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gkh/xu+U; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2cc75e79b97so5325615eec.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 15:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775255651; x=1775860451; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xp7Dbgf5b3g15NbF7ANO4wBuM9L4b5vcD63pgQCNCTU=;
        b=Gkh/xu+U1WWrUL/cwgkssoUREbl9f+3skQbqChkFiS086roysz3EK22zcwvEg9178a
         a3EI4YLcxqMU6MQEFXxI/JOEdbDkdFa1A6bLsrBuyHYj8G0sD5wj1RPVDOv4Gnk3Zjk4
         poaw37uoZ1q+OVY9+44MakJuVLiNX5IbmwVhvHa09q+3hhA5/4BSK1Yy9PmQYLEwdXvv
         eGSawOfh6yAz7EwZUGEpG2KOfS9MWVq0avaB23dYAEm7NR53OTN7ZBhYnww2me2coGkJ
         DIJxiFSvD0VfOLW+s8LIFGo7Tr+vRZkrnzaQamYF+kYJ94YhAz1p/XFcJHfbOMhCpjYw
         LDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775255651; x=1775860451;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xp7Dbgf5b3g15NbF7ANO4wBuM9L4b5vcD63pgQCNCTU=;
        b=dSqr1vDy1yuoDsCigjaZM9QEzv1/IX7TiBoe9y3FOMe7+cjJQzBi/kUqvtxwG8CSIO
         f7s2T4SpxaPQKf6mifL5L9PgPAd8O7reI1hoceB2KX109jZKzH4VL6cPEsoFPlizbJd7
         M4Th7n95eydzwA7yMc6LlS7MfAB2RgsOSp1A3udKWxOYQpgC3YiExWkZvXENyR3pRHoO
         BoL5OSP/Vt9FajoMq0tXxvLWTnbb5VegqIBkMOEM3+ly7ALK1lccs74VhKLOZR2yaHFT
         5W4ds7jh3rUeEflIiOmOv8YsnR3YPF+cunTo1EV43N8D/M0Ag/F65eMPVRVqRG9IUKMz
         79SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXKEa5BaYovH+vcSYuQ0uOV7t86ek2lSqUUBGXTi7C1ZnQ9DovNMJC+s92jpPhkKmxJN3HvaNDVXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCjawwKh4b5oajZ9bGqhhOqutgsXU8/UaeOzUfj7LEJ/ndY55z
	6cankaop7IZOwyN1aPPTl1LkJG/065r3B1YsfoH18H5VpA/bQOBJtzUrVvwQZFel/Z71LCY0LAX
	+cEuYAQ==
X-Received: from dyz21.prod.google.com ([2002:a05:693c:4095:b0:2c8:6bd1:63ba])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1288:b0:2c7:11f2:d081
 with SMTP id 5a478bee46e88-2cbfad9a862mr2379820eec.14.1775255651164; Fri, 03
 Apr 2026 15:34:11 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:33:25 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260403223357.1896403-1-jthies@google.com>
Subject: [PATCH v1 0/2] Load cros_ec_ucsi from OF and ACPI nodes
From: Jameson Thies <jthies@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	abhishekpandit@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35952-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jthies@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7BC0398CDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hey everyone,
I sent these patches up as part of a larger series in late 2025 which
hasn't mergerd. The initial series modified dt-bindings, mfd and usb
subsystems, but had not been reviewed by mfd maintainers. Additionally,
it had not been acked by maintainers all land through one development
tree.

For context, here is the previous series
https://lore.kernel.org/all/20251013203331.398517-1-jthies@google.com/

I've split the series up, this is just the usb and dt-bindings update.
It builds independent from the mfd change.

Given the time since this was previously under review (~oct 2025), I've
cleared the exising review tags. Please take a look and let me know if
you have any questions.

Jameson Thies (2):
  dt-bindings: chrome: Add cros-ec-ucsi compatibility to typec binding
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions

 .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 26 +++++++++++++++++--
 2 files changed, 39 insertions(+), 6 deletions(-)


base-commit: 81ebd43cc0d6d106ce7b6ccbf7b5e40ca7f5503d
-- 
2.53.0.1213.gd9a14994de-goog


