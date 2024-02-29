Return-Path: <linux-usb+bounces-7283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 151CB86BE42
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 470C71C2145B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92FE2E413;
	Thu, 29 Feb 2024 01:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Aau/WyFf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F32D048
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709170180; cv=none; b=b6PybmLplJ1EIO+Nmc6XLJ9C+m9nPNA9zt6yLRt+NN0+0gAVyvXWSHrUyvGrIHMATPucDqqPJHWr6uVumTXQTuKopEBoOTnxc/tLAUqbh2ecIXqympPQfwYeDQ6ehwO2/vuGSgTTgo/LqkF3SgJtXVhdkuVCMKysTyCUmy28X3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709170180; c=relaxed/simple;
	bh=llgycK0vel+ByZjq2S4bsIYLpr53VlV1dYeH2+0LRo8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MRXnBJ1h/ZOwWdCsychvIIIhBPwbQjZnHCBmpbndrRdby+T8aNXiTaptkSQ0/b5xYq7uTfo7i0wNEFdQxvfMwGTeJAP+0nVL9z229PwJHH+HJoi/hXD2GCBQm3ylGZulFquvhCPhhA5Du1bI3mq0UJ2SQOXSQvrRsYqtqm6MTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Aau/WyFf; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60904453110so5295097b3.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 17:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709170178; x=1709774978; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HO7sM+79J6T6oYs6iAIAH4cbr3Ct/U7/pkBJr2RsBIQ=;
        b=Aau/WyFfgTze7Ys0WKXUOHDcaw+D/kRiQW9u5mna5u1/omAtu2Key38j21vQN/hJkv
         yfnjaLCHnhdTlcNwE1y+dZRGn87XjNbep++yN3LFFTjjn5P1BxM0c8YdolYMEv6qkkOR
         ko+LTVY/LT/qIBypg9202D4dPyoxf/Rl0vBZi4plvcEVLqJpluL5ynnFlX35WHKIA8Ej
         1Tw9JODBfsaOdQhDa53TPb21cXpgNppbDXuRN+abLJxh3J/OduDP+G9KIaj7/9MyLkjK
         YHfPCnvRQIFgYxqojOj17KOKKES2LEO7QNHI2+i75o8rKFsrga5PinS0rYLIGZqRErWp
         WkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709170178; x=1709774978;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HO7sM+79J6T6oYs6iAIAH4cbr3Ct/U7/pkBJr2RsBIQ=;
        b=j6P6AEFDxCnfcm83F6htC3wT1ir6T7/IrsekGnh5CYlofOrHIGpFJbpkR/AireuLG/
         3qeUKEEhh+wsh1OcohOiZzeJEYtFkIeaLw1DyfNi77XH8h24sLyUve6uSs9//0cSZrFR
         Y/ZwF4//nmCePgqAgKIwYQls64RsumIpDN2V1mMHBCqKnIqQp7EOafmtLIfsWm04UqQp
         vg19XxnRflC5QvRy3eX3jrgwuFolWqdd0MiOFzRhthy96SRrMHYdKJp3w5K+7XbUtZfN
         vdwWQF2Q8CAoGXH717eo9rEcrjquUB+GpBTok/qxHJ0Zf2tus1cyBv2ddI00C48XPVPh
         iv9w==
X-Forwarded-Encrypted: i=1; AJvYcCUoglxFxwWOnAHMUT7USddohJO3ARmH3qsMDSbw9Mtq6ycOmCn+aASUcE58Qktp7EGX8t1uQIyAUjNOzM2qoB7NzGi0DW+kR+Td
X-Gm-Message-State: AOJu0YymrULudRO5OP6FLVZlHlfr2TVsyuYL74KKck6KMPS9zkfDxoRW
	e9NaRoKAX175ec+2HV3ePgr6+P7OmN6s40G2jCW6uIID8cSWB2fkos3rSGEUUgW8xmcX00nF8jW
	ITQ==
X-Google-Smtp-Source: AGHT+IHAW0GcwvXl7ty+h3b4veLMGBLsR+JYhHrZjaoUwLnx5kWFpxkZrOKkIVQntygOusU16/Q3kY2Eds4=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:c0d:b0:609:3834:e0f4 with SMTP id
 cl13-20020a05690c0c0d00b006093834e0f4mr192674ywb.7.1709170178031; Wed, 28 Feb
 2024 17:29:38 -0800 (PST)
Date: Thu, 29 Feb 2024 01:28:54 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240229012858.3663833-1-jthies@google.com>
Subject: [PATCH v3 0/4] usb: typec: ucsi: Expand SOP/SOP' Discovery
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

This patch series expands support for partner and cable discover in the
UCSI driver. There are a few pieces here.

1. Some cleanup of the GET_CABLE_PROP definitions in ucsi.h.
2. Cable discovery and registration with the USB Type-C connector class.
3. Partner/Cable identity registration with the USB Type-C connector
class.
4. SOP' alternate mode registration with the USB-C connector class using
a cable plug.

These have been tested on a the usb-testing branch merged with a
chromeOS 6.8-rc2 kernel. Let me know if you have any questions.

Thanks,
Jameson

Changes in v3:
- Fixed CC stable.

Changes in v2:
- Re-ordered memset call and null assignment when unregistering partners
and cables.
- Supports registering partner and cable identity with UCSI versions
before v2.0.
- Shortened lines to within 80 characters with the exception of two
error log lines with three indentations.
- Tested on usb-testing branch merged with chromeOS 6.8-rc2 kernel.

Jameson Thies (4):
  usb: typec: ucsi: Clean up UCSI_CABLE_PROP macros
  usb: typec: ucsi: Register cables based on GET_CABLE_PROPERTY
  usb: typec: ucsi: Register SOP/SOP' Discover Identity Responses
  usb: typec: ucsi: Register SOP' alternate modes with cable plug

 drivers/usb/typec/ucsi/ucsi.c | 258 ++++++++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  40 +++++-
 2 files changed, 296 insertions(+), 2 deletions(-)


base-commit: a560a5672826fc1e057068bda93b3d4c98d037a2
-- 
2.44.0.rc1.240.g4c46232300-goog


