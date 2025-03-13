Return-Path: <linux-usb+bounces-21733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A3DA60142
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 20:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7589420206
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 19:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE30E1F30AD;
	Thu, 13 Mar 2025 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TS/dfdqH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9601F30BB
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741894248; cv=none; b=Ehx6QsuuLWTr46VSAjt9lI6rH6CZ0jkg5NqcHRI5cQ4FbM2YmFvX0xb41FKEdTph//k+oOt0Wg0j2XwqrWQ0iLBKA7Amr5hmDNLlaQaNVXElUXbZtZDz6+f7zHWGmRsKH0LlQJ/wJMuiclIKCBGBrYU66yqe8Y8NzGtkb4gwF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741894248; c=relaxed/simple;
	bh=7Md4guzuu+5PteE4+/PKz/uRcgnmj/2p8chBDnxxxko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FX5bsTqE5WeuDsFg8Q/uV++os27ujT5OUrdslRBnJdcK3QvH/vOQiiW9uogCiqoJlRSA3p/KdmURcbDfzVuYqfhkxznD8EqCybpatLuNHzUVry0bW26jHdkSE83CDZwB/pB5JUwfvls9y7jfhXANtB+EVNqzxE4RAezTDBwS0Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TS/dfdqH; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c081915cf3so162833685a.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 12:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741894245; x=1742499045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pU5dmfFAwtKVHugQOsEi9KoVusxSRI65CQ1c6e5/OxU=;
        b=TS/dfdqHCxtk9Ymy8JbpxdJlHMKgQYFBer9P61wrDRX6zDy0WZ8aupAlblLssuLtPD
         wjoJAT9855DSbgt/E7oU/7S8Oo9coNhP949NK4vE7C+Pi/nhwNH7KuD58EOYXqmYqsjG
         GJq9onHL5MrbVSSm7hNRhEWDBozvPAWcQkRRQaGP4htmt5OkQc1KFHIZPyeSrXVAirXq
         ICTTDEAKKJYTLTO4eUwkcBRgUDomHG5OZuyLM0xgPUoyt3bnU9Wupyoieer0Wrsr7zvR
         0DWsWCHLBM8/cXlZKFhQ4YNzpNve7dFpb8RHqSAaFaN3hb27pEvvPx7A1M7nnwnEUZ9I
         jmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741894245; x=1742499045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pU5dmfFAwtKVHugQOsEi9KoVusxSRI65CQ1c6e5/OxU=;
        b=TOkn8WkoMFz7SbPP57ARDmFjD8mTmXDJjWdu+2998ReU0x32RZcMJGWuGkG8YoTcpl
         Cqu5UW10pYTA8p0D5yrT2ni9n5y4ED0mw/O2k/NC6c9dDSjQb1yG4I/oLzAeHiEzo4wt
         ixpWSfcVn8p8TzlDSQhZWoVjnlzX8YyatJtW5c3X3iTRNcjC7Anb6/BbPWXrDagISIpl
         XXc01jviM97igm2Aiz0UnfGwRQUpYe/ZQCXuj7r/fT6GcvMW9reNLu07ejAyObczXm8u
         J25kbMdsdZZNEDNNUDzS06xau0t0JAwyCqU3N9OTY/7ulXDFAZ7hlijp2J5Sb4Qv0odf
         5Oow==
X-Forwarded-Encrypted: i=1; AJvYcCUfwoThNSFKMxJw5joQNeCDYyfJJgZHA1n5RyPNrrfvy7wdwxrx9cEzjEsFNLEi5r1xTL/+8Ot1Jk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOz7ObeBfSl5e7pcU2+tMRhDgV+4XZDQdlxup/XUNQ9zxbTUDA
	Fg12srO3uoRgOkhdXcdz5XuGg7+uaDAKL3PjCsYtQN3V3bRCOpKmVtFEPmuijdwVH88xRj+zKN/
	mGPpIuQGAomCL6aY+uOAKjZfEtZ4Hg8ZMGv2t
X-Gm-Gg: ASbGncve4AgWJ8Z4fk66FMyp4qA4xS1UYFf2LIq6zkNU15APZ3CAa+xVSc25gYOKzSX
	cUhX7wkUUOIAHNNTaqODtoaS/ckkopR0RfdkRi2+SiPFm3o3JKgXPBhpEc7BMmx+MOc5QarpTQg
	365pEdgsw+eg8FLr/EsM3KRKjCUeBNIma60ZHWQu/R3d2TicsrMK2r8qMm
X-Google-Smtp-Source: AGHT+IErYf0CMh7pjopA3FPIsyT1DWsU21J14PsrsdFu892DgD9E7YId1+/cdaugNZMtD2vYkpyH/8y4YKpcXNKFUr0=
X-Received: by 2002:ad4:5def:0:b0:6e8:f2aa:a8af with SMTP id
 6a1803df08f44-6eae7af13camr12862786d6.38.1741894245341; Thu, 13 Mar 2025
 12:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312223434.3071598-1-royluo@google.com> <480c7796-2402-4009-9463-81280f9405bd@rowland.harvard.edu>
In-Reply-To: <480c7796-2402-4009-9463-81280f9405bd@rowland.harvard.edu>
From: Roy Luo <royluo@google.com>
Date: Thu, 13 Mar 2025 12:30:09 -0700
X-Gm-Features: AQ5f1JqqW3P8PdoKGB2y2ZgzSjr5ecrMCcWMGY3liW6jDEIX9qUAMkq0C0Wo3FQ
Message-ID: <CA+zupgxoHjK_JU-2djDa-bPFCn97gHDMnz0GSvXtJfL2mpFyyg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: core: Avoid redundant system suspend/resume callbacks
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 7:27=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Wed, Mar 12, 2025 at 10:34:34PM +0000, Roy Luo wrote:
> > dwc3 device suspend/resume callbacks were being triggered during system
> > suspend and resume even if the device was already runtime-suspended.
> > This is redundant for device mode because the suspend and resume routin=
es
> > are essentially identical for system PM and runtime PM.
> >
> > To prevent these unnecessary callbacks, indicate to the PM core that it
> > can safely leave the device in runtime suspend if it's already
> > runtime-suspended in device mode by returning a positive value in
> > prepare() callback. This optimization only applies to devices without
> > pinctrl, as pinctrl has distinct logic tied to system suspend/resume.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
>
> Out of curiosity: What happens if the USB controller is already in
> runtime suspend (with wakeup interrupts enabled) when a system suspend
> occurs?  Does the fact that the interrupts are enabled mean the
> controller will remain able to wake up the system even if
> device_may_wakeup() is false?
>
> Alan Stern

For this specific device-mode scenario, "runtime suspend (with wakeup
interrupts enabled)" seems unlikely to happen, all irqs are masked as a
part of dwc3_gadget_suspend() and then the dwc3 core is torn down.
If this really happens in a hypothetical scenario, I would expect
device_may_wakeup() set to true when wakeup interrupt is enabled.
In device_suspend(), it does explicitly check
"(device_may_wakeup(dev) || device_wakeup_path(dev))"
and won't enable direct_complete if the device could wake up.

Best,
Roy

