Return-Path: <linux-usb+bounces-7279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1BB86BC12
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 00:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083B31C20990
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 23:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8458813D308;
	Wed, 28 Feb 2024 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nT+1EYjQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3C613D2F2
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 23:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709162409; cv=none; b=IiWHfsvzFplqCQ2t5TAesOwu2f5wcGXPE3Ac3gsd832mfNMiq5dKH3G+0qw4EErevXw+A78MNfzAB7/hnTYzCGS2E9ctqMQ5Zz3QB0Cw+ZeLGC2tyM7COR91NlI8eyOzUBRx3OBlwVmQjo4fIfW1TdOcglojpu/P12FoI4theMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709162409; c=relaxed/simple;
	bh=llgycK0vel+ByZjq2S4bsIYLpr53VlV1dYeH2+0LRo8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ZMRPmrhos67ZbFzbaTh7wT6gZbA3a9Ftaqt7prPp9V0Vb7y3wP5u1nEakeBkWjOfybrdvTELz4MUswsrObBe0QpxhU1kKmuIiqaXAnOCS0xwDmtBQj/+6VWG8NtlMEugS89rWuzcFxps0zhIKg3zR9aEqN3Gt7WC9r5Bf0nR0yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nT+1EYjQ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5efe82b835fso7225557b3.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 15:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709162406; x=1709767206; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HO7sM+79J6T6oYs6iAIAH4cbr3Ct/U7/pkBJr2RsBIQ=;
        b=nT+1EYjQ/IuCda/5VAVkArtGh/UMRM5ZRfleJNvx6XDbXfGcVYyhISf0nA7iG6vrrA
         MZ4gJnKjD1+4jufFPCNcQA3brRShrzOjPh2v3EfwniokKdimoxdcaD6A8uyQBwkBFiX3
         kD32gwXOrj9iXoElbWDNDzHikmfq2/IVu8sOkq5yl0g5vm9W5hf5Pm9s29nXbu/nzDD8
         VmPqZY/Re2NWYGRcQRO4XBC+mbZSjX+4FF3Ny9tDNE7UxXCrcq2e0eYuNjfoociK5hN8
         B+vJtuE7FvqyffytAbdH4vr0Gz99GuCvW5CbUyCPPw74QfdTttM6OomPVK4E5d9O40fH
         ZVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709162406; x=1709767206;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HO7sM+79J6T6oYs6iAIAH4cbr3Ct/U7/pkBJr2RsBIQ=;
        b=PmPt+8hfHSazkXWa9t2LfIrPvqUHRH/+g/WmvF39KdbvmBKcd73ysMJ1kxH2iu4+LV
         n2QQrV2n2LG1GlD4hCW6i5NvYhoCmDXHOAfTAIZLsww4iHPvR3iOMeQXo/bI2LJr0ycD
         ttJMvws694Yuy9ifv3oAdzy8jresoLP2s6C7dw5uqxnNWYT6W4eaNGzOAj1jR2qiYlDF
         Xrx77lr1Xz03o7xkkr6YVc+E4eRkOY2oSeIK9P3qDSjK1nHAjPg4KlMW6wkrk4QMN0lj
         vnA97kUX0+4YdzyhXUmoysUvvcpFdLde+v3kV1SSrA4Sz9aCEr8gTLmRRb9jLga32ziy
         +eFw==
X-Forwarded-Encrypted: i=1; AJvYcCWkXFtqIuXAbug7peCU1CFnqrL8CfzsVWtkfP7t0efqDj6FQkHSXyMz2tWofMuGkj7frBWT3cU1T7p3xk3H1RiFzLLFwR9U31bU
X-Gm-Message-State: AOJu0YzWTnmtVQlfbrNsyv32NpqQQKvPKaFM8JWLeDuthdxhFlTKaaxn
	ibKKMr/8wUF4YlIoPbikDEdPmvm0HQmEeb9RNgUSmqmd3dti2BMhp4R6nEfRt9bsRfM7X0VYjUX
	TGQ==
X-Google-Smtp-Source: AGHT+IFC5t4aU/Evh4n/DZ8Liy+KNZMybm9yxbJgphM1sinVr9qHkBww87AD06ruSQtVQu/vAaA5SnnI3LY=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a81:9a95:0:b0:609:2cab:1bd7 with SMTP id
 r143-20020a819a95000000b006092cab1bd7mr132765ywg.1.1709162406681; Wed, 28 Feb
 2024 15:20:06 -0800 (PST)
Date: Wed, 28 Feb 2024 23:19:46 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240228231946.3630390-1-jthies@google.com>
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


