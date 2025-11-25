Return-Path: <linux-usb+bounces-30910-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C02C85690
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 15:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 096DA351869
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 14:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2780325700;
	Tue, 25 Nov 2025 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mBTkLSKR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39813246F0
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080749; cv=none; b=ubu5qzJONUASCcGsgl7suyNhXlqClkytx5CY+KpVQLsVuPt/PvJ9ytQCzZCxNPIY1Yb0coctxCjHaR+55tpsnli8pvZ/zMJQF7iabjz9xfGteUqlis32QHTE0OktSSCD3S4gdKdn3343gE3gFXV4VWEdpXMZkFn4dVlCn1KR5kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080749; c=relaxed/simple;
	bh=saJM5fRCWG3+NOi7j7I4uYx+KvEM/StRjmywDdED/DU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HRzVbx6xMH5SIBlgmtI4sI81b2CA+S/rK3NQ7vxpsVXVPxi0/SWa4BFSr6mkZDefDJKqhEmrDCsQC1ikbOuqNVENKY/N/hDTJv8sCg05FPBLscxfnFQtl6NCDuiqvVxC6gUlfTY9NLGLdmCjz5y7tKm9WFr8R/mx0z2JnFob2tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mBTkLSKR; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso9859616a12.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 06:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764080745; x=1764685545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=saJM5fRCWG3+NOi7j7I4uYx+KvEM/StRjmywDdED/DU=;
        b=mBTkLSKRVRy9fISfOmAIOce2I2BZ/6dZbADlFmx1Y/9AEGwHas7TXdPPeHjEP/cTWz
         yMsWfGyzlDi1R6kzDYVvRQOCs4xQwZ6mP0F88t1026+8ynb0pMD7yvdyMMpvoLHVImRT
         XmPhN8YYUdFG7oKsVOBB7an/plVTRlSVF4WQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080745; x=1764685545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saJM5fRCWG3+NOi7j7I4uYx+KvEM/StRjmywDdED/DU=;
        b=nrD9ty9YFPbQfn8NzrRBStEOXVBB/SPHBAeREdZr1A/DZ2RkmXRco4xV+PnAbFqsiL
         YrwmOYRmjOL0e2t2P9auH8PwGlVcsolqTvREkpu5y4+EO3fhdiYyl4dfK7by7GlwaS34
         cP3/hYtVykgQwsUYxUx0ikPhN86Xnh3mqdBaNKdpLp74w0kHz9JJ0yUnBnDTDLXIB9+p
         8L4tTDu/5T49BnJUxIrimKgeTZawpJcAlGMSrygNOduKQOkv5c3ivgeOS7JV8uRBYReX
         yQhRyGLJTEKAqq4lKmAjbMTx1q8zGc28ULVekiD8TyGxg0QCw/AHYBJJpbZ6ntqAsMnF
         soow==
X-Gm-Message-State: AOJu0Yyih2ZnxWV1Je3EXkcuW9nNQMgW7fckCxhAmEhM4ZzyNu1sKBPb
	BxnkMH6K8uVR26adC5voZ8LDrtQzapdbrs5is93udrG60YU66LhpcRU+kbKzy0Crks8NEVlP0jr
	m17GS
X-Gm-Gg: ASbGncvVPyzI74wrIR6kQ/5P4NgLM21WN1fKGjpoibVmz9Sjf5sFO17AbwK8holV4As
	wTANYwib3qIPD1NNWWAvsFaishiK5mzmaViSAlDPqM3jlAq0kddxySnsUcV4F8mSo7cmFLtbvcq
	SMP1B3OzHY+/maQJl68MiwHe9jDt9PjKG/iXSAbdUYrsq3p8qyyTXeptYMBjPdGQWfOG8EPFlJe
	nHgBB9EG7vhlxH+wEv9x8I72GqgHINv1/fp/QbkAlPlxPeD7uuS30fp2kouInOGEy2RPCxUQGdX
	gY+lhqYTTi00m1YNoZCmHQGMS9uiahwmbBsjvEs6H1FUKgj6yDoNmBEU9yZ9GW/CCqwBK76mIXE
	FBWzVh+fO1uqWySkFldctpL8+PKE7gX4XJesZaMl6P5ubccX7tvT/OUqGd6Y+0Wa9fhD4LVobib
	vm0YlaxD6T2MzV1MqREUZrVYc+k8CF32rI5dzi8CW8aJukchHyekE13vmcdILXTNE=
X-Google-Smtp-Source: AGHT+IF2jbJIsj6BPc2ZnsSzGCybzZ6PKL9280i2xSLtJ0hgvln0Vzn6dfnnSytVKaTUzFrENGvS1A==
X-Received: by 2002:a05:6402:2354:b0:640:9eb3:3673 with SMTP id 4fb4d7f45d1cf-64555b87582mr14790746a12.4.1764080744904;
        Tue, 25 Nov 2025 06:25:44 -0800 (PST)
Received: from januszek.c.googlers.com.com (5.214.32.34.bc.googleusercontent.com. [34.32.214.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536442993sm15859924a12.27.2025.11.25.06.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:25:44 -0800 (PST)
From: "=?UTF-8?q?=C5=81ukasz=20Bartosik?=" <ukaszb@chromium.org>
X-Google-Original-From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
Date: Tue, 25 Nov 2025 14:25:31 +0000
Message-ID: <20251125142532.2550612-1-ukaszb@google.com>
X-Mailer: git-send-email 2.52.0.460.gd25c4c69ec-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

When DbC is disconnected then xhci_dbc_tty_unregister_device()
is called. However if there is any user space process blocked
on write to DbC terminal device then it will never be signalled
and thus stay blocked indefinitely.

This fix adds a tty_vhangup() call in xhci_dbc_tty_unregister_device().
The tty_vhangup() wakes up any blocked writers and causes subsequent
write attempts to DbC terminal device to fail.

Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Link: https://patch.msgid.link/20251119212910.1245694-1-ukaszb@google.com

Fix typo indifinitely->indefinitely

--
2.52.0.460.gd25c4c69ec-goog

