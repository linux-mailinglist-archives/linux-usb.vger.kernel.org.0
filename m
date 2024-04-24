Return-Path: <linux-usb+bounces-9685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE238AFDFE
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 03:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C9D1F23525
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 01:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D3779E4;
	Wed, 24 Apr 2024 01:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o15AEUCS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A7C6FB8
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 01:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713923320; cv=none; b=B7zaw0TRvzlBStwsYyomGCeF5QKnZs/AteJXSS3QH0VSIOrwUqOEFRLwHulc9fXa6qREDmGinX1YCRPgcck+8yK8LtZBiQvGgSa8uynS2oBKY9QyJiApExcVWdzHmWIN5+zgU+oNIr0hfYxG+u5kfFvOXc6okHtC7dYkjKkN7zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713923320; c=relaxed/simple;
	bh=RdicOhedH6fXKExofIXMENzu6QODv5IBbyGEZIzzk0c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Iq9zmhF2r4doZyGgOFcHm+EC5eUG1pktcta1qi8o2u/E+HtKEMEaj7daUAHccMhPA4ROpb5e3UHmzo3Rr2Fm6s+Ad/Khvs5WEiW2pAqf9BtjAaYbAVMNO+Edu4bjLvMMF6nJ6Z64uZcIIFi6+sMpfFbKyf5bxyuerd4i6jdVt5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o15AEUCS; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de46f4eacd3so11955887276.3
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 18:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713923317; x=1714528117; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vldaUho7GHzFh6OYGKkRA+VFfgKnJ5o8UAUi5iDSbWQ=;
        b=o15AEUCS2uY6KFcqWTfRliIV49wh/PWm2HzVafsPn5+AQJ30lmTNZLQ5K6zyGFM81N
         zwdEaLVTdu1zbUby89qUOGkpz3x28+wDi8XnQaFNmjznWHQ9SMkgKrCgEG3zhy+2RuOt
         hxsHDUCVMDyU7rzOFyFys79EJgBqFy3x6BAfflzk3hHqbm9FOzRVRN01dmJnqBzETRdr
         S9hx+EciRk5viHRM9ZIoEIEIlu27oT0uTrwZgq4XB4ExtfKee81X/ctDRmrP2qOt3Roc
         RqW77eM2jcF1nQXjLWhC6RP7itfMGPUoZk5v8MG/Kbw34Jliog6YRsskGqQY3LniD200
         8DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713923317; x=1714528117;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vldaUho7GHzFh6OYGKkRA+VFfgKnJ5o8UAUi5iDSbWQ=;
        b=l1tNpSE9IX/pJXVW+iZcsOlNgXvs78bWYTyF+MOnIE1HcBoWJfhlLrky04ZUbD/zHb
         nCA16BYoxVODS2PYE84qPlzD0Yw4MFf9aarqrHJAeYrphfUn2KbFpT02eZFISmwgJgGW
         HmDIHicS02LF7j3aksBGpbSrvQfbgG8y6v5YeEENhV0lZMIgwMpWkSpW3jvL2vTOk+gB
         qTHpCY5LNih5xGOJdbJEIpeTi9vmJMlG3VCx6lakjuKI24503UDO+B8ZfG8IqBJ0Ae81
         Akt0AcWUQ/XfhIo70yHZN0i4/esUTWEP23Bn+uP4MtoNa+wKZEKAF43dQjsAuulhN8WL
         HJZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSTqdGRP2AtqcvACajLQnsJuOl6DOxgRS3L+9yGSQ1O3hIyoS/95U1N1oki0ZyBVewLj+rq2lyztGopAk2gHG/aPx7jiyzSENI
X-Gm-Message-State: AOJu0Ywa+c9SCNGhNgi5kNlUK8fX47qqWvKNMZwgQ5AOjIaYgLloY98Z
	EPfoF1n3pvq41jfY0GM6NwOC3GZjP5VRcpHlBnDi6+LCclSjEJFKzP4uHHB/28zUKxWgfkAb3mQ
	x0g==
X-Google-Smtp-Source: AGHT+IF0WeJbFdn6TbDUeZZI89JkTNRkPqdt5n7b0LaNEdfYTAFcNdaKWTEs+9w83/79o9wQzGCIGDYDxmM=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:154b:b0:dc2:398d:a671 with SMTP id
 r11-20020a056902154b00b00dc2398da671mr358141ybu.10.1713923317263; Tue, 23 Apr
 2024 18:48:37 -0700 (PDT)
Date: Wed, 24 Apr 2024 01:48:17 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240424014821.4154159-1-jthies@google.com>
Subject: [PATCH v2 0/4] usb: typec: ucsi: Update UCSI alternate mode
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

This series appliess some changes to the UCSI driver to help support AP
driven alternate mode entry. This includes...

1. An update to the altmode sysfs group after registration to make
"active" writable.
2. A change to the ucsi_partner_task delay when queuing
ucsi_check_altmodes to prevent it from running before other discovery
functions.
3. An update to always define a number of alternate modes for partners
and plugs.

Not related to AP driven altmode entry, there is an additional fix for a
null derefrence in this series.

I tested the series on a ChromeOS v6.8 kernel merged with usb-testing.
That build had some additinal patches to enable a PPM in ChromeOS. Let
me know if you have any questions.

Thanks,
Jameson

Changes in V2:
- Checks for error response from ucsi_register_displayport when
registering DisplayPort alternate mode.

Abhishek Pandit-Subedi (2):
  usb: typec: ucsi: Fix null deref in trace
  usb: typec: Update sysfs when setting ops

Jameson Thies (2):
  usb: typec: ucsi: Delay alternate mode discovery
  usb: typec: ucsi: Always set number of alternate modes

 drivers/usb/typec/altmodes/displayport.c |  2 +-
 drivers/usb/typec/class.c                | 18 +++++++++++++++++-
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 drivers/usb/typec/ucsi/ucsi.c            | 21 ++++++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h            |  2 +-
 include/linux/usb/typec.h                |  3 +++
 6 files changed, 39 insertions(+), 9 deletions(-)


base-commit: 0d31ea587709216d88183fe4ca0c8aba5e0205b8
-- 
2.44.0.769.g3c40516874-goog


