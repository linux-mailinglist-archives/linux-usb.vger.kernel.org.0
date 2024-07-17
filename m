Return-Path: <linux-usb+bounces-12235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D992E9334D1
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 02:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 739C5B217DE
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 00:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCB4EC7;
	Wed, 17 Jul 2024 00:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1O/OR/Pp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A48816
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 00:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721177481; cv=none; b=XPmejlHysSz/Rcp/0sQYVrKZowc7KYfy4vjWFUDW3VkWGdZ+u3IQzuwYs9zGFcFg3IfizDKYuejH6p6u78Qb2RJiXJU+BmJBZZtZtI0zj61CZ60z+OlUi+/8qsHV4TpCV0jyrnMf21YqQVsRhAeDZ5Kvg5FKm0PjvZKK2IoFIg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721177481; c=relaxed/simple;
	bh=00c/6Hu/VMmGNGj5jwxf7aeNIVvqXIit8nGgXRltjY4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dhRUwcI+ltlROhiYdlWbiFbXRPupACtiHDqPykS65yTwwfXYfFDtNGJ6EirWY836Ft91a+F9r9dmls85LcpsB8hiNm5UWIjZyxIIGPdtr1rhyd/uplo9MLzNZehMLewKrFo1R00leY4+3VlCBMtYNwKCD3uCro4A8TWdb7+F/tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1O/OR/Pp; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-664c185a606so7685357b3.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 17:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721177479; x=1721782279; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=USGuaXbHalGF3ffZqdVeAiMU8bBfEfYeWE9i0qzNZrM=;
        b=1O/OR/Pp8fJq/rHxw1uIskZPn8rDAe4IhPm5+6bWDlWJvKq3lF4VhZ6oncFCCVu7GJ
         kZgB8RMFzDKMF+VIJomceuoZa2M1agBJltYBNSR6Vk2/VS21rAtOKk/PZg6lqUtW4aEd
         dd74owfRrsDoYmyGbL249jf03gAEM1btMKdXIUhBvIARm+ZOoI1/jCxBzRWc6arKEuOv
         9YM0GyKoHtHAKVEjF0+39LUAFCs00YriNluDCSWj3w614hnnfjrF6HPmXEGYk2tbvce5
         JG7Yk7yr2TKLur955E40ivtmkMVtIirMOjHwvffrRge+hXbxOpwjP7z7grrVFtNSJN/F
         WNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721177479; x=1721782279;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=USGuaXbHalGF3ffZqdVeAiMU8bBfEfYeWE9i0qzNZrM=;
        b=hUkaO+daOypIBR5IWn3L4Cp4EvKF+y9fJjH6YjKTn3EfSIJxPTZfwaXyCU1awM2i0g
         DbDyiI2KgdOCPI/rjAydsgcerm2nf7ptFVdA4Tc+/kCsNWeb2vbFFPy/qZ3LjMx5XDb3
         1t96ajc11z/JkW/pVd1eEYLvYyltV5/KoAioO7tPnf2999IV2uirJD4BzRhn1BhavOHd
         oWyXshVa7nfkEXymPOB3YjBRgUekjYSZouuxulycoIEcnm7onkZNEPLpkCnDMGhuLATZ
         wbh/ZSdgWMKuSPabMKuCfbaRvmjfuSDb3O5+KPIS/K7UfGB/J/LYTxJWfFV01TIAHGmd
         2g5w==
X-Forwarded-Encrypted: i=1; AJvYcCV4S6wFzuaQmwjXHATvPtOo7Y53aVaJs3WA5QNXNzFDJ67ls/IQnE8qIQX/2+ziBrK6ox8s5jSGeikTwxNQlTHLySNZrobHDULD
X-Gm-Message-State: AOJu0YwkR4S+McD+29oPQY+wdRRRTUZDKW0omjXiQk79hApn7lIQcw/V
	tpOCBAaSQ9ijeCQiWIU9Ei5MI3Y24I1zyHgAMIhHB18n+BmaP8pcUL3c0gjHn8ImmtRN/Ey/tC1
	pJQ==
X-Google-Smtp-Source: AGHT+IECFPngWcF2111XBm2otUMdnHCiAUfI6a+UYxtQKU5ZCYWLRUViB7etayGZOZDru24zxZDQrBXkq3E=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:102:b0:62a:4932:68de with SMTP id
 00721157ae682-66500a4c606mr94777b3.8.1721177479405; Tue, 16 Jul 2024 17:51:19
 -0700 (PDT)
Date: Wed, 17 Jul 2024 00:49:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
Message-ID: <20240717004949.3638557-1-jthies@google.com>
Subject: [PATCH v1 0/4] usb: typec: ucsi: Expand power supply support
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

This series makes the following updates to the UCSI power supply
driver.

1. Adds support for the power supply status property.
2. Updates the driver to distinguish between PD and PD DRP power supply
types.
3. Adds the charge control limit max property which can be used to
request a PR swap from sysfs.
4. Fixes a simple SET_PRD typo in the ucsi.h header.

I've checked that the series builds on top of the usb-next branch and
manually tested functionality on top of a 6.10-rc5 ChromeOS kernel. Let
me know if you have any questions.

Thanks,
Jameson

Jameson Thies (4):
  usb: typec: ucsi: Add status to ucsi power supply driver
  usb: typec: ucsi: Add USB PD DRP to USB type
  usb: typec: ucsi: Set power role based on UCSI charge control
  usb: typec: ucsi: Fix SET_PDR typo in UCSI header file

 drivers/usb/typec/ucsi/psy.c  | 72 ++++++++++++++++++++++++++++++++++-
 drivers/usb/typec/ucsi/ucsi.h |  2 +-
 2 files changed, 71 insertions(+), 3 deletions(-)


base-commit: b727493011123db329e2901e3abf81a8d146b6fe
-- 
2.45.2.1089.g2a221341d9-goog


