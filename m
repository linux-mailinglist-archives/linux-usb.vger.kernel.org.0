Return-Path: <linux-usb+bounces-21692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3CAA5E4E1
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 21:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D8AF166EA5
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 20:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37F81EBA09;
	Wed, 12 Mar 2025 20:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QQiioHf3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5E71D7984
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 20:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741809614; cv=none; b=KHw3vTMojWFIWQ+MLNuH2cDORs79ItEaoZRSbV+gnL8oeuTfR7M8ZdBQYxWcUuGoWq0XQXeCVKFcaBd2wf59XGffeBnxbcRsQaYFQTE05QJHmJwj9QiArPnvjbxaHkvWYm+YYiptkR7YcCfeSJVbvjyAHOYwg55n7n/2Mn7RTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741809614; c=relaxed/simple;
	bh=P5NZbbFKye8GqSKijmH2j8hmBxSuTTWkUAi9/ZWgQC4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aFl+RvJIHRdFtzarprz1vw0MabpNJyRj3Rki1XX9xuxxXItJtcLJ8aH8w48uqLW3JnOYJZWPUapSCJw7Hmdfe18vwbUZ1E0EY62QHOk0ZzQ+psVRuME1HiGr2/u2V4Ife4Cpidm8CcmyEKPMmFVddpDkPqDo3A7mk0o3L18LyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QQiioHf3; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-300fefb8e05so376367a91.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741809611; x=1742414411; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GCtXfZQjeCD3fq5iyjoL5SOi4U37CC2OFkybAtefkLw=;
        b=QQiioHf3Zbd/ixAEVGx7t8CgLaW3qGOaz8nWs6arKhsX32hc3Ifvg5R/aGCAODnTtl
         KX0yW11TGIUBTXULeuMY4BZnzIgZIlIO7CCOtsCh4FJt8yP6b8p9cnsCa2nZzeqwULPt
         pY5G3vV8dK+wBs3Lj0a+E9dvQT5ibWdwZDiMNkseLg0Vk5pbOd6H2xnaNX4EPdiKjndn
         Maa3zJeGWD3aT5sOp0KmlPAHBJDgSBX4S5vRABPbUsEsK2l1fSk5te/HnvsZj8bBOss0
         cFrJHp6vq80ioSuoAxmR5ZuE4CoN1NBqQUU40AEOqYs4fpFBr5iCMZk024gjKVxyxTYe
         lYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809611; x=1742414411;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GCtXfZQjeCD3fq5iyjoL5SOi4U37CC2OFkybAtefkLw=;
        b=quq4lucGv7M50DuKHWhdhmEtjbKBA9CKijoNDU0GW8mj7OPlvK5bNOsFYrgW0FMujm
         CoBG+2TZGncY6mwqYQ6EfxWlDJ7+Nr9VUDRZ3JP265D5TWipIE9dL4ifbRZfS6jCtuiY
         dO2WHqKYtZnWG3Ck5BjfzDAbgRq2pkCBBso/G+L6R9l8VKlnK9VH/1gJOGSmqzpZVnco
         9N7FPfuBxpYY6xdt+OYUBCkznYYfrHLGO/vyfyADV8symXez04d6HgYXap1m/q/S+SPh
         AqF+xnvjmR9jugVm4l6RK1Fo8wjCFn+TBHe+yBjeA/7RvTz9hUMbNS/QJKf3DG8y24iI
         f3yA==
X-Forwarded-Encrypted: i=1; AJvYcCX1s4GMN44+sINbjTxMW+MxBOIP9S9rhBLHIddj8Cy9jtz4qDAeibHATzqiel6gqMVUoNH0VisBKZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPiBJYK9duW0SeoowjBqhRYFsgpa8zGqPrTjJYvdtVyNRPwG3f
	kvNvRW6/TVh5KqjUCbf39oCBS+pM+qMI7BYt6gaSi56vvRvMAAfggEsFHE/D4RGVkBlyXoqPFlA
	h1g==
X-Google-Smtp-Source: AGHT+IHv0lWNMl7veaoEBiVdC1it/rtCEXkxkD7IR0gVxFD7q3EHrQjh4nCeL+gbO2bxgEmR+LqkqRyXAro=
X-Received: from pjbpb8.prod.google.com ([2002:a17:90b:3c08:b0:2fa:15aa:4d1e])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3fcd:b0:2ee:aed2:c15c
 with SMTP id 98e67ed59e1d1-300ff350ce7mr11396305a91.28.1741809610712; Wed, 12
 Mar 2025 13:00:10 -0700 (PDT)
Date: Wed, 12 Mar 2025 19:59:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312195951.1579682-1-jthies@google.com>
Subject: [PATCH v1 0/3] Load cros_ec_ucsi from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: tzungbi@kernel.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, groeck@chromium.org, swboyd@chromium.org, 
	akuchynski@chromium.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

The ChromeOS UCSI driver (cros_ec_ucsi) currently gets added as
subdevice of cros_ec_dev. But without it being defined by an ACPI
node or in the OF device tree, the typec connectors are not correctly
associated with other part of the device tree. This series updates the
cros_ec_ucsi driver to load based on device definitions in ACPI and OF.
It also changes the cros_ec_dev driver to block adding cros_ec_ucsi
as a subdevice if it is defined in the device tree.

Jameson Thies (3):
  dt-bindings: Add cros-ec-ucsi to cros-ec-typec device tree
    documentation
  usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
  mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI

 .../bindings/chrome/google,cros-ec-typec.yaml | 13 +++++--
 drivers/mfd/cros_ec_dev.c                     | 39 ++++++++++++++++---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 26 ++++++++++++-
 3 files changed, 68 insertions(+), 10 deletions(-)


base-commit: 9fc83373f0ffb8834da48b1446a5c2fef9525bb1
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


