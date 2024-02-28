Return-Path: <linux-usb+bounces-7272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F2986BA6D
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 23:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E137283955
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 22:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C69773509;
	Wed, 28 Feb 2024 22:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B9o/Wdi2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F67292E
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 22:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709157736; cv=none; b=VPOA8MKtqLDqJ6hTkzYiK5NIaqGdP0cDNFZiHD6bpEHgLvTcSspo4B4k8fAKRzD9AZ59NJuB80QWCxn4lgcEXUrVnvCfmm1nhlcBVTQGjeSfSP3w7G2Rd0qb944jzjBKIB1WsHavFoe5zrAFKf8daYvSgTlh0nP5X/+FFLZo1Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709157736; c=relaxed/simple;
	bh=ijmSe7JaAS7eKvk4tMf+4mE9yp7UgVaz2NKNY/+4GGo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=iJOdUaJ3GmJyEbMFPsLEV6qO91HoxMed6w21cMXhBfw+yrHN/HS+VEKLqyTkOTm9l/svLj+Ea5sZCg1vDN2kAGq9O2uxV+q1Fip8GiAM9azOlhRpgL+9ApG476x7ibzrm84niwLaSIUD65W/OF4t8laxAfP+IWlAHPTBstCtEsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B9o/Wdi2; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-607e8e8c2f1so4049667b3.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 14:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709157734; x=1709762534; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D65CC32zUpBbltLOcsmZ8xhT4b9R1Hbo9FgNWupbcZs=;
        b=B9o/Wdi2QmhQNMrEBNp6/vewJav5BnylJxlRwyavKdR79INwNHlPl7VqyCtgtjlJko
         L3FGoj/CjypcTc1AIGdfm38mlYhKW0rr9z7jBSkoi3U0/8LCQS5OX45Ve8LlSUoauZem
         YuHBas2ge9eRlOf1naFYOuFxc79Cm2rVxienL8xddNQPOm625aIhDnpbFRzS0f5XeoDJ
         z2qvEvjc5MwaXJkT/t5DY/GhHs/0nEkndmmEcWd6CmwRYS8oSQyKSMSE7i2qmQMD2yqh
         bzZR9GgZSHC5b5fbJflpyIq7U29cyXQmoMnTo9YEk4vRvDuy51qzcVVc0TZhvwl/8/ON
         GlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709157734; x=1709762534;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D65CC32zUpBbltLOcsmZ8xhT4b9R1Hbo9FgNWupbcZs=;
        b=jxL/zveRMy6bgsK56UlD6tm6XHFLpe0PWOINyg5ib6Jw0AUKX0weEOje/25GUAl7SL
         SUchMX9gfXYi8ZGH0o70OdRBXV+QMfV8IrCPYLwiR1FuVaNiN761qUmmrXkEaDa2guIc
         g2MmiVOEOW1IuIirfDfOUu2GP7cw6i/G+VZ9EI5FnqHXTmhRgeCxkWfVnQ4YOC+yHII/
         VWo2n7Q70ru88aJ62ESIVTESVOva+VFR2BBeDmC0SFNTJAeHBD3Kgg25iRcdDw5+tUGy
         98OH71CZQs36aFSqHRGNPp91VvpVa+BLauC4+0RAOEz4KvrQBMDnfK+CtZn8szhfCoki
         oBcA==
X-Forwarded-Encrypted: i=1; AJvYcCVgzr2kfvxoRTSsFuBaPB8ySnvkkicOHMexAUlCPifbgdH3HfabhLqHpG55MbHXOZORYrQOVnzQpjZT/OJSdzNAmSS2XjBhQcDh
X-Gm-Message-State: AOJu0YynqA3f3nDoJDDrQQW2nUwtKcUONRzTmaWkeTd5PlGeWblXSMdQ
	HEcACkPW6SiXpuZk2gSf6hbo2M32shipRdtd6J9Y3HQbhtg82+DBkWT7aTaabTajSCgNaAArWWn
	EnQ==
X-Google-Smtp-Source: AGHT+IGsRoITHTDIrsTvSNqIlV+OxL7kqRWqrTQKq4WY06qtmBI5oiuXDBXTcr5GcdOhwSQINcvHwE/4U7Q=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:6:b0:608:ecf3:ef8 with SMTP id
 bc6-20020a05690c000600b00608ecf30ef8mr66333ywb.0.1709157734117; Wed, 28 Feb
 2024 14:02:14 -0800 (PST)
Date: Wed, 28 Feb 2024 22:01:22 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240228220122.3612647-1-jthies@google.com>
Subject: [PATCH v2 0/4] usb: typec: ucsi: Expand SOP/SOP' Discovery
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


