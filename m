Return-Path: <linux-usb+bounces-15224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DD97C55A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 09:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 025D71F23B28
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 07:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6838F195985;
	Thu, 19 Sep 2024 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nBQihPH1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AE218E055
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 07:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726732303; cv=none; b=c5N/4Zot2zJ44pKOwAs+hWdxkwoI+rqDhjuA2BKFPCGae5O1MkJiU6RTa2vaQadEpu1PsXc7ktPef+vGB2olyI28Mk/rg4dm/Kh1v4StmkTN9E0g86pT3vMGLW+agXfSeI0i3Hf82lkaYzl/0BNcGUl/1xZd5f4liOgIQleQ1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726732303; c=relaxed/simple;
	bh=U5WJaoTtcAuGD8VknlYfHc4GGLGgL4otqGdvhWJttDg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Zl+pM8FAdj/pndBPXxYgJZXcUqQJCexknmgy2HzimTYSTq+BuubD1vZPmUjPDPdKwVyYkO5YLrTrKOmEHosx7l+Cn0sPWkd+HbzvVGlSjO0NtKIe8gqVTGrpQ68GFAcoL2oyFXqFsnZWoK4+ZWAay77lIVXv17XKL+SjXOXk8QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nBQihPH1; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ddd90f09d9so8629487b3.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726732301; x=1727337101; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mate0Slr3ggKx26+pzgz4eKqO0en772zUr1uU4Z1wp0=;
        b=nBQihPH1o3ieP/xmIzPUM5TRB4vLnv7K/AZhqj5hCAu8InlN4qqvvdn6cbhKZw36+W
         nQ6nPQhrcZo0hJ43Zlx2471JCzwuGNbC78/2FHWx79vowvC9CcGlMtRGE37rwoleDA17
         fcN2yfx3jOonc/1y43mLgXtiHKCkjg53B3fmE+Twm6jdi1FS/asNrDgBecitLIGKSkWk
         olhSs3X47b2rGa+woQqUrBPXQ3briGmS8wePskoaD2UcwEobP/dqw5eoEd3fTfuyLeYf
         212MuQkcaNgl+zQdaE6cE4EBt0LrbrQTuNdXPmb5L+PJOykbiuWpoRNKaKG+IeTXT082
         1poQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726732301; x=1727337101;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mate0Slr3ggKx26+pzgz4eKqO0en772zUr1uU4Z1wp0=;
        b=i2vN9plMnPjJPjLpshUHQQZoN7/kzvm3jRaYP/VPE8ugM1oKwdZR+sLCv5WUUyFre9
         ED9OR9UA3Albt0gXXR3Zl8w8By7AXVLRu8Qjw4Tby2AuUh1fLGMxWUBLmSuZnH/ooQtV
         x5stt6+yM+gVn00AkGsfvpvx5fKzIhCZ/AAm5LDAYg+NOn3eXaxKGDMsx3NuL0KT9Ne8
         oydZnbO+JutPpkRRNI+gtRHxcE4F9m/Y1CdnImf4TQgRdrmiAIxdqt0EXRzZVFsnS5vM
         n2Z2r57gBlyKzfrXaB5FhBxKpqisXBQ8xiccYwkazD/mAsP+RE72CNZHYcIoAlQQ+Qz0
         JAhA==
X-Forwarded-Encrypted: i=1; AJvYcCVgzOE+J2f7vMsa6XeQ8umFA25AMAN8afobsSc/NgFunIORKhlo61AmsCZrHZd18iC+msUZ49/GA4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0cQ2wM8M0sESmsm5hJZP0/pujWZteFTKUaxS08irLr36M1f3T
	t7TzFuGEvOcxqVczntrm39p2rju8u1jPI5PrM84mvi+a/9F9U0Q6vaWhvGsd0wPd5oDvrvfbTEb
	KfA==
X-Google-Smtp-Source: AGHT+IEu/+FJoc9hrDc4MDglAwuuZk+o0/lAYv5WANFWM3V2/yyCRexmYGQ4ZVdoraKu6E3CzFuagXfOftw=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a0d:c087:0:b0:6d4:d6de:3e35 with SMTP id
 00721157ae682-6dbb6ba2a49mr2511977b3.8.1726732301295; Thu, 19 Sep 2024
 00:51:41 -0700 (PDT)
Date: Thu, 19 Sep 2024 00:51:12 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240919075120.328469-1-amitsd@google.com>
Subject: [RFC v2 0/2] Add support for time DT property in TCPM
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

 .../bindings/connector/usb-connector.yaml     | 32 +++++++-
 drivers/usb/typec/tcpm/tcpm.c                 | 81 +++++++++++++++----
 2 files changed, 96 insertions(+), 17 deletions(-)


base-commit: 68d4209158f43a558c5553ea95ab0c8975eab18c
-- 
2.46.0.792.g87dc391469-goog


