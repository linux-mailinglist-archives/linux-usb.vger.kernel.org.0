Return-Path: <linux-usb+bounces-19638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0621DA19611
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 17:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16CD93AAB7C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 16:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE450214A7D;
	Wed, 22 Jan 2025 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GwiUJLV9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD84214A73
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562007; cv=none; b=HAqBIYtZ6tk8K3fH+QWcODmQaV8K+kDoG0HDiotKLJbvpOljc/W/0Tii3ZU64F+oIoJESQFDhbes0rBWL3zTPCjFfQGcufzHuB3MNf/9GihkuOe5TlgyUAM/L04b9Xf+HiE3pHs8Q+LGgL86Ee+NUxkzvry0xArzCOQj+qo/S80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562007; c=relaxed/simple;
	bh=D7TiOSZ0/r8Dzi84iu+4HEgPSO7+SRktGnz+bPePQSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UQp3nJPW+rK67ofKLG0+TUktb7/7WoPL3joFANEk9gEnEfPjs7OD96phIBN8KkvP4UvqhQQYWn6I3sCCCMokMAk31IVJzDPSWzxS0hjWvIFmcD2+OUO0iXK9hrFiiiloI3PxlENsu7IeY+2uNDdgN0maZogTySaaG8HVEcnvXn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GwiUJLV9; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d442f9d285so8953a12.1
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 08:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737562004; x=1738166804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n6nA1UPEDmI3S8tFcuk38xHsxsh37uFCZRIM8k0okM=;
        b=GwiUJLV9UdiSt3Urze5gfe3b1zq8cgNEkAYaNEDKjqV1EmZ/sx7aJJI6gFPuyhuBHp
         Nqho+w4MSX+EdW3LDiemPr9N4ini8y9dmTR+3+nE6ns1k8RwZVViCWxlZ5xdPM3O09gO
         ihSClG7pT0o5iAoejx6ZsrHrZLMSCj4N8+oJP1o5UGo+fFYOgcjriT8Fr/hYoTx3jJR6
         Iv6O1G0XpOsk1i8OQw7tLGmK4AUz9YFWq05cVgSuamprEbfoE+AbnQ+ToWC1YqhPnGhw
         0vdkksPNkYThtBvXZd2aYzgczrnMVxbyc9w7rvsK25NtOZv4bxX6Z00+jr4BQKFvzWaa
         Hqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737562004; x=1738166804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n6nA1UPEDmI3S8tFcuk38xHsxsh37uFCZRIM8k0okM=;
        b=qSJakl+koxqcWGi2BbugEqVpoJQ9o0qVhqFVUtGHfp89q8K1ggjL9DFptzI2jvcShG
         aXuahSog0EEDSy68TCsqS7GnI+bn0329b9xLKZ7OPuYVbmRGlLYMwBFlt87nitz9jbX1
         z2EhlYUitYFJ0Yj+Qq4wGEbtZCGl74Np63nSzmEbV/x7WICsIool7PTl/AV+IKwDTj7M
         anOzmifSbaHOYjLYrmTz9jYALnX8GB1JMyT6oNADUcVBSu4+/rl7qnRGmuWn9vAfmE5A
         fL/z7DRI2Bh28qe5tTWIZU6Bya8xcdfsDvkITNQNnv3SoohpHEO2RrO/2dc0FdEFmmtx
         OGXg==
X-Forwarded-Encrypted: i=1; AJvYcCUaoZn4HwT+h4vQgY1rxRaaMgjn10x+TS4UBwW/9ur88+tis4rxFU5ShHihvV2hhHWlKnp+kzHAnI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx9Rzq7Clapkz0iivvEBbD1n8c7NtQf7sU+s/ufIwXaFun7r9q
	Cg1imJV9fOKPi5N84SouWNeJliK9+j8qtvt6pdwlOyZQr267WeB4y1sgcJqF8K6M5nyOPQs4TY2
	pbsEODixU43WLx0xIi7chQL2tnmVaAc/sK/ok
X-Gm-Gg: ASbGncteRdqbancyFwzc6mhKNDHVohIrPNfIg0YQDwcUizHl5cFhgDNAjJMfUd8Y82c
	6FZ6vxFwVQ63hcykYkG+gL7pZdTp+xw/AiXG+AUwM0Nmllxwr1anevy/7kslD9mNIOASyKzbx2u
	6Hvy6jaQ==
X-Google-Smtp-Source: AGHT+IHUjKDQ6+slJUAhAf3WVfJImZelO7NCd6T45qtNsIy2liPFTj1N0ZUfaMz5My9tZ2vaNRB+uzNmSX1y35Onkw0=
X-Received: by 2002:aa7:d89a:0:b0:5d9:5a5c:f2f9 with SMTP id
 4fb4d7f45d1cf-5dbf52d5516mr120621a12.7.1737562003573; Wed, 22 Jan 2025
 08:06:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com> <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev>
In-Reply-To: <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 23 Jan 2025 00:05:00 +0800
X-Gm-Features: AbW1kvb2zlEX3iAAJgCi0wJTZP6Xx_KQqsUjFfxlIQjPKO2bQBrQH3i83VISl2o
Message-ID: <CAOuDEK3aip9SLCUPOzpVPwx-O4rmF-+sQrF4GJasGPBzV=qJdg@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 12:14=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 1/17/25 8:48 AM, Guan-Yu Lin wrote:
> > Wesley Cheng and Mathias Nyman's USB offload design enables a co-proces=
sor
> > to handle some USB transfers, potentially allowing the main system to
> > sleep and save power. However, Linux's power management system halts th=
e
> > USB host controller when the main system isn't managing any USB transfe=
rs.
> > To address this, the proposal modifies the system to recognize offloade=
d
> > USB transfers and manage power accordingly.
>
> You probably want to expand on the problem statement and clarify quite a =
few ambiguous statements.
>
> a) "allowing the main system to sleep and save power". What is the 'main =
system' and what sort of sleep are you referring to?
> Traditionally when playing audio the audio devices remain in D0. Support =
for playback during 'S0 idle' is more complicated, I have yet to see a work=
ing solution even without USB offload in the picture.
>
The main system refers to the device running the linux kernel. The
sleep refers to system suspend in the System Sleep model[1], which
should be S3 state (Suspend to RAM).

> b) when referring to power management, you have to be specific on whether=
 you mean 'runtime_pm' or regular power management. Not the same thing but =
there are related issues.
>
Thanks for pointing it out. By power management, I mean the System
Sleep model[1].

> c) for audio offload the transactions that go through the DSP or co-proce=
ssor are only for audio endpoints. Control transactions rely on endpoint0 a=
nd are NOT offloaded to the best of my knowledge. Which means that you woul=
d need to track control transactions as well, even if there is no audio str=
eaming. Otherwise you would have a risk of the XHCI controller transitionin=
g in and out of sleep states.
>
To my knowledge, the system would not issue control transfer after the
system goes to sleep. If there are any abnormalities in the XHCI
controller that requires the system to handle, the controller would
issue an interrupt to the system. We could allow this interrupt to
wake up the system, and the system could then issue corresponding
control transfers to handle it.

> > This involves two key steps:
> > 1. Transfer Status Tracking: Propose xhci_sideband_get and
> > xhci_sideband_put to track USB transfers on the co-processor, ensuring =
the
> > system is aware of any ongoing activity.
>
>
> > 2. Power Management Adjustment:  Modifications to the USB driver stack
> > (dwc3 controller driver, xhci host controller driver, and USB device
> > drivers) allow the system to sleep without disrupting co-processor mana=
ged
> > USB transfers. This involves adding conditional checks to bypass some
> > power management operations.
>
> This is even more confusing, initially the point was to prevent the contr=
oller from sleeping while there are offloaded transactions, but now the goa=
l would be to allow the system to sleep while there are offloaded transacti=
ons. This isn't the same problem, is it?
>

The purpose of this series is to allow offloaded usb transfers happen
during system sleep. In order to achieve this, we need to prevent the
controller from sleeping when there's offloaded usb transfer ongoing,
specifically when the system is sleeping.
Without this series, the system could still allow offloaded usb
traffic when the system is active, but the system would put the
controller to sleep when the system is going to sleep, thus we're not
able to suspend the system when we have offloaded usb transfers in the
current system.

[1] https://www.kernel.org/doc/html/v4.12/driver-api/pm/devices.html

Regards,
Guan-Yu

