Return-Path: <linux-usb+bounces-20060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF4A26A37
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 03:46:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D164E165D9F
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 02:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A6314386D;
	Tue,  4 Feb 2025 02:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mDhHQJPh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEEB78F4F
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 02:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637167; cv=none; b=tXzofglv5GhNY1P3eXgTRmx1RMqNSvoquvekjF6pEoYU4ZGZgiWHVDoww6eco93NPsqFwIJnw6jMhPSTiV8k0g50yIJtLEfSde5Q5pk99Ps4hl8qbR6SKdW0WGiyRcvUtQdCmIidUnCimh+cIugr2/9ahw5SvJq8j24EIyg9W1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637167; c=relaxed/simple;
	bh=ABuYKdmygDmdT3733HlG4EilK132xFBMnWKfMpegqkQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bbX6QygToKtoyNqBbsfEEwEGu6EPcMG8W6HEu9adbk8VSwKBuiuR5t6u+7xkGP33Pq/RQPgk+jChRCySZuLEpW2Z3a2oe/kI9ho1BFq18mkBF6PEVlC/yQLDj5TmjKD0h3sVnyIZo4kI4Qk2SwO1ZHH0h5YInrJMf4dirFjKR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mDhHQJPh; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166a1a5cc4so108037915ad.3
        for <linux-usb@vger.kernel.org>; Mon, 03 Feb 2025 18:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738637165; x=1739241965; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3GH/JcRbNm1j2lYqDQd4skKZmdc2M9qqSzgaMnEvF+Y=;
        b=mDhHQJPh9YJepHIap1fPYZYYlA47xrrGfZ2yzvv/sYSwIVv21PxKjQ1A+nNjyFzgvP
         478/0FEbl2ZH0+t6m4qRUdCaowtcFdVElpspU5IllJ2pooYzPigbw5VBQoCeDJkQJDwn
         tcr3Nm6YfeXhNck1do77F9+4Am++99FpFVvKB5q09Y9Ic25xNBuGLgZ1WwqqEjt59CzP
         UPvUki5caDSmHkcTus+tn2KNfUxRiZ6a0mlUcXCm5jEHS+mFfiaOm5wmcm7rmNnu0VHZ
         xiPjFgntvTOUC00ftmAhfGWd9Z7uisouGM37MDefukr+Fx3aeyETfzr8USxTCQjMPjLa
         R0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637165; x=1739241965;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GH/JcRbNm1j2lYqDQd4skKZmdc2M9qqSzgaMnEvF+Y=;
        b=iljFBCL8rLeihwIw14RV6dHrbkik6X97o3Rsu2whH+xMn17v1224sbyLnVI0NI+lf9
         VsCpmtwD3dlsr+UeXWWQqzmI82N+/hA15JW4QGURAk6u2tlZ0h9iAYVZauYKl3NXpmGT
         HhnMM2rVcCyNdgNbs1qTH9GCXB6oCccDcT9Vmkfvn/QiXkG/LCdjROE+axWq/71nRqMZ
         k9JBc299h8Qq3kMzC80XFxXakVbNypgmTjMFCTnbCHV3PtwwPvydQ0Gkp8gPRafC6+da
         chwjfsZhJbEAWHRWdLHOZzFB9+LF+tEqZiXvGrM40GvlDIktlP9/m/kG8Ti3AeGe4z5h
         2P3g==
X-Forwarded-Encrypted: i=1; AJvYcCUc4sTDqkKHlMOJxU6UOb3www3roXfd768moyTMmFHK4a3qS5nA+Bty03xUmkFiVnzygwaQZBYqfNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQeOjR1exUv/+MhSJI6/R4TVnfU95bBsao0hKbSToaeuwtIZ2X
	TjRofaMHKkWCAd4luQ3wyaJSei9FsjasVQTviHFinu9fojGcd7io0hmG+s7D5glpmsQdVdpwK4w
	9mw==
X-Google-Smtp-Source: AGHT+IEx5DugYqKxLun2tNVq8Y8DNMHlAjnaumoC0xjZC4KgxaIFQeEzH5FH/HcJ6Zp+uFdtspbYxbCKsS8=
X-Received: from pjbov6.prod.google.com ([2002:a17:90b:2586:b0:2ea:5469:76c2])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce09:b0:217:9172:2ce1
 with SMTP id d9443c01a7336-21dd7d64c77mr426007095ad.22.1738637164915; Mon, 03
 Feb 2025 18:46:04 -0800 (PST)
Date: Tue,  4 Feb 2025 02:45:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204024600.4138776-1-jthies@google.com>
Subject: [PATCH v1 0/2] usb: typec: ucsi: Recover from CrOS EC sysjump
From: Jameson Thies <jthies@google.com>
To: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

An EC sysjump can break communication with the cros_ec_ucsi driver by
clearing any previously enabled notifications. This updates the
cros_ec_ucsi driver to monitor for PD initialization events from the EC
and re-enable notifications by treating the init event as a system
resume.

Jameson Thies (2):
  platform/chrome: add PD_EVENT_INIT bit definition
  usb: typec: ucsi: resume work after EC init

 drivers/usb/typec/ucsi/cros_ec_ucsi.c          | 17 ++++++++++++-----
 include/linux/platform_data/cros_ec_commands.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1.362.g079036d154-goog


