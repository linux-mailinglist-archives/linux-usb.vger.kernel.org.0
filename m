Return-Path: <linux-usb+bounces-6726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3111859BEC
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 07:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 549A61F2029C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 06:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B18200D8;
	Mon, 19 Feb 2024 06:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TtXgDuyF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1151920DF6
	for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 06:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708323074; cv=none; b=LTa5Gl9elMkWObkwfrEIeriOOJdwf8INqXkAh4T0H5+okqLMyZzLIh2R5O0gln4ffAT/17PUhmyRzEtTOvbZ+faRk93CKtjDT70LNzjb16KtVWAuJ2sXSFJXIi/MBydmELdd238Gp+VC6iJSJHtXoMP3wzus2/P0/HxgPttaKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708323074; c=relaxed/simple;
	bh=6dDfDAz5I+hc4k6dr0zdna9LjUyhKmw46b/4NU8Gsds=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lrvdxiHbAZz6vTD/UbQ0f3JOeHmizibPKi+SGfYq28MZoohg45ywqu7GsJ/7TkaERJVbMnp+3PC4aCiB9N4QkZFkF2So4mWfmXh2qpzyhI/xMXg4iCMtCNmLZ8A0zv/VjWFXyJ0zUO6MBNtcFg4ObuWG+3ayfIcUawEkbqFCrfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pumahsu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TtXgDuyF; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pumahsu.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6047fed0132so60826137b3.1
        for <linux-usb@vger.kernel.org>; Sun, 18 Feb 2024 22:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708323071; x=1708927871; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uGZJ8u5lTXI5mGL4r7O/a3CozSV5U8TTkXgiiPZhXeo=;
        b=TtXgDuyF/O0tiHAWvoEN0OrrSKeCowgZmbHQ3sq0ld3lS3+GzsG+iBjox9C7XuHTN5
         DsIbCvg5B/jNSKWUcHarT5vt57lkJoSbE4qyJp7+WtWuvAG5x9g/iRezsCOLNpIWqzjJ
         Z6GNVYWhLwGrgtun7WoZAMmhMpE8CIOoInXMzCgHxG3Nv7nrgHveKwxm0w/k7ZVWOdP7
         DTiLuH6gS16K7aX1PPAsmsOmqheAGVh61Ar2scjQWRH7hKl9+wDxn2JyJ7tbDpsGK7Rr
         NCX3gBykPKK3X8VjRxpjps84bjVi3Jlx56KZxS2oWeAnv1jKaB5bIDq6eM1oC7MP5lMJ
         Bisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708323071; x=1708927871;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uGZJ8u5lTXI5mGL4r7O/a3CozSV5U8TTkXgiiPZhXeo=;
        b=j3XUw9BpD94sTWNeoksY2rx1ti7Xxyzhn/m0FkRPdPPkx7GeGbGExW+7XnAJXuWG9a
         eZhUV4uz3KnBcLgFCDCEf6zRZ6NfhJyHEcKVdg8dvkptl0XUZrZ8F3ahz06tHj2vfDga
         JfuZRIjpWmQc4ChWfo9gAeZyhGlGqg/eUg5W7UZSc3EPwWKDDK4aPJj728ZOKoslV0Wc
         5KO1d6Zhbw4xClOjKUKV1Y012hXMzXhGdLpiNO/+kTptlY0zHLc5eJC+pDu3+85QkK0K
         cyDCvwMiXbcG9J+X3YVZ2vfDpxBkjuL5v7DBhepG7HV+RAjFmgnaOOUUluo9wPJ82EiG
         JGpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuX/a/gzo3WGWc+qGLkFS2UJJyKNeJGWxMHs7Lg8/BEX++tuqQI77fW52jel22WCbW8/yj4rn/jmtJKKg3yJw8JgILGvrw3EXb
X-Gm-Message-State: AOJu0Yxf8GKTGF8FwZwik5f4SCsGdtYUCC29mjqknmIV6yt466YYa8Fr
	lq3hV6ChneHEaR009v7WOhrbDl9q/sWChnqpFFImeiKzWovLOtpChQDEvrXdwsFg7h4Dh/B/7sm
	UfHOqjQ==
X-Google-Smtp-Source: AGHT+IHZtagH7BxHLIkh1QcbT/hFogdlNF7ZRCSon/JkCFDlcOCKCwMiiYdHzhHdxmGNAIdKeM29oFOCWbjX
X-Received: from pumahsu-p620linsp01.ntc.corp.google.com ([2401:fa00:fc:202:c8b2:b71:a506:971a])
 (user=pumahsu job=sendgmr) by 2002:a0d:e2d6:0:b0:5f9:abfe:243c with SMTP id
 l205-20020a0de2d6000000b005f9abfe243cmr1937909ywe.3.1708323071233; Sun, 18
 Feb 2024 22:11:11 -0800 (PST)
Date: Mon, 19 Feb 2024 14:10:08 +0800
In-Reply-To: <20240219061008.1761102-1-pumahsu@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240219061008.1761102-1-pumahsu@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240219061008.1761102-4-pumahsu@google.com>
Subject: [PATCH 3/3] MAINTAINERS: Add maintainer for Google USB XHCI driver
From: Puma Hsu <pumahsu@google.com>
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	Thinh.Nguyen@synopsys.com
Cc: badhri@google.com, royluo@google.com, howardyen@google.com, 
	albertccwang@google.com, raychi@google.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Puma Hsu <pumahsu@google.com>
Content-Type: text/plain; charset="UTF-8"

Add Google USB XHCI driver and maintainer.

Signed-off-by: Puma Hsu <pumahsu@google.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 960512bec428..dc0e32a3c250 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9081,6 +9081,12 @@ F:	arch/arm64/boot/dts/exynos/google/
 F:	drivers/clk/samsung/clk-gs101.c
 F:	include/dt-bindings/clock/google,gs101.h
 
+GOOGLE USB XHCI DRIVER
+M:	Puma Hsu <pumahsu@google.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	drivers/usb/host/xhci-goog.c
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.44.0.rc0.258.g7320e95886-goog


