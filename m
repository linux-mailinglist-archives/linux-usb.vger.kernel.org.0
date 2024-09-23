Return-Path: <linux-usb+bounces-15334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF563983A62
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 01:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CDF7282B4E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 22:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038BD85931;
	Mon, 23 Sep 2024 22:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xqkol/wg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD962907
	for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 22:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727131265; cv=none; b=mNxNYp+ccLK8BSWqvOPaRdKqFbhSd3Xy9n1YI8GrTFOCFZBE4Eyk6mQzA0G7zJR0lzQpu2IihjdfYxRcJsKiJE/WLryw4puj1mhSc2SepFNwTpZ5VDnkASCutFteEX9/jw16R+MpHQWqiAxZOnR3gnPsdZPG0THbY04urNZidfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727131265; c=relaxed/simple;
	bh=GSCd7C/d+ylgtXrc9F7rTXAgFQ4kzwVOtROXH16ndoc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LX1hEkKm1EcUj+VkphCTvsOnlIQK7/mS07up/88Kvm5qH6OC77I6On33N3tyvMUaMh7WDmRLnF88Lru6zXbW1cSZxRMZLRNv8JwRrif3oTaE/cRgpaJXd1DfsbXSR7xnafyJGfhmC2cOtIQHhYt879L2UicDbVPUE56Jg1T+HSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xqkol/wg; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-690404fd230so73547337b3.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 15:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727131263; x=1727736063; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZoULqqwj4G3XNtXjnOz7why+OLiXHg9txfngqFgB/jM=;
        b=Xqkol/wgJq9NI6dEeKU3RYZ/AyfGl6UMbxP8h+y4CylIonZ2DeQdF1bxRnOPhED33K
         0M0T8aWaK1Xn80HZVm2wlre50zqV+kBeUmbaARY2bS+Aeay/NM51sX2P2mM6StEC6c4D
         UDUkk+f+XtlkfUP72MrLUbwslM+1+yyd688k6X3HprUXUraFpLrgi92wBxWjKpEDtB/4
         V9OnlgioVOp3k6+bhLmADgvyfsIZ/fkCl+VAryUXeP/WRptY59JVLKmCuqMm4WEpBWpn
         I4+QJ1v+fJfmfDch+jvON3IkoybO1aVgsk3IH67mbrk/ti1dDZhTzyrdOV5hVyP0Uf/x
         BlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727131263; x=1727736063;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZoULqqwj4G3XNtXjnOz7why+OLiXHg9txfngqFgB/jM=;
        b=tuI6cU8yyqV28R0NVWqQ4hDKxPjd9t5B6VtxDrURxoyf8rpvBq/yxy+RjynXlMuuFv
         GB6qsRHBsL+q7aNFYG3H9t5VUdVBbdg5vHyQQPRn/91fRkik89RQFnEqKdnEbRbrFUzz
         ehPfwHI6ZIUBsPUJr9f7x4QeTwoC1XKQmLw3VVy8smTIjRje/Ohd01w7pkvNGfEDOiic
         JiuzlN+j14x9M7dRs0G2cNNb4BOIGcvyFxtpQrLGZgrLtTu8EkXoWjnrn/qrXBpVPUZD
         aNwSJC8YMTY22xscS80FnbXmoIJEKjUArR4hzKEdZrF5FJOXB7C6VP2QXBsLv+ykVtHL
         6sGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpkmsrdsvRc/anCg0JhY5lT9YGNCYdPt9Y1vunG8fBbigg31Zm4HUpHgsZGhW8He0ioibCImo08t0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8sMTPdlKH4mmQTc06Pyl+E5cSPtv0wFOUozfY5w1LcIJQFXkY
	Kc1N2/yme7vRWahhejTfkfk/iRmrvmeNLFXACoJ1H3LRwHtlDFWywN7d7nxt84fmURBoSmFkVkf
	A7A==
X-Google-Smtp-Source: AGHT+IEXpzIYcYsmTLKPd3jrRYMqBg1mBudgZ4U8Lyu2HY5beZ0fdWyVImEb0QiaDHKoCbIIu3DCYtSPThc=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a05:690c:f05:b0:6dd:bcce:7cbe with SMTP id
 00721157ae682-6dfeec02c4cmr1054977b3.2.1727131263094; Mon, 23 Sep 2024
 15:41:03 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:40:49 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923224059.3674414-1-amitsd@google.com>
Subject: [RFC v3 0/2] Add support for time DT property in TCPM
From: Amit Sunil Dhamne <amitsd@google.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, dmitry.baryshkov@linaro.org, 
	heikki.krogerus@linux.intel.com
Cc: badhri@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

USB PD specification defines a bunch of timers that can have a range of
acceptable values instead of specific values. These values have to be
tuned based on the platform. However, TCPM currently sets them to a
default value without providing a mechanism to set platform specific
values.

This patchset adds new DT properties per timer to allow users to define
platform specific values.

Changes compare to v2:
  - Added min, max & default values to DT property in Documentation.
  - Changed return type of tcpm_fw_get_timings to void instead of int.

Changes compared to v1:
  - Defined new properties per timer that we are interested in rather
    than defining a single pd-timers u32 array property.
  - Better description of the timer properties.
  - Since subject has changed, adding link for previous patchset for
    posterity:
    https://lore.kernel.org/all/20240911000715.554184-1-amitsd@google.com/

Amit Sunil Dhamne (2):
  dt-bindings: connector: Add properties to define time values
  usb: typec: tcpm: Add support for parsing time dt properties

 .../bindings/connector/usb-connector.yaml     | 35 ++++++++-
 drivers/usb/typec/tcpm/tcpm.c                 | 74 +++++++++++++++----
 2 files changed, 92 insertions(+), 17 deletions(-)


base-commit: 68d4209158f43a558c5553ea95ab0c8975eab18c
-- 
2.46.0.792.g87dc391469-goog


