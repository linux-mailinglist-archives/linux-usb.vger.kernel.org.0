Return-Path: <linux-usb+bounces-29883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A014FC20134
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 13:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BABB1A21303
	for <lists+linux-usb@lfdr.de>; Thu, 30 Oct 2025 12:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F66326D43;
	Thu, 30 Oct 2025 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MW4iWMyv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAF054918
	for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761828451; cv=none; b=uNRDJTGHp6FqJ8e0luaQouI3Jvy+L9pP9hU092nObgxyov8z6FJqaP9hE509GcJzGwakCz8NqzbZcKiPJU2d5bAxpnXz5B5RMJSW6ZsdhqJG4+0Egz5DQNuv/34ZALIcd8+xVVRXgBuULDAKtwXvmVKnribkbIKEPyoLMxCW7xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761828451; c=relaxed/simple;
	bh=ZOBiokM8c5XD8o0G5ylHkCAcR25MLrmutsibBfHjPhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZEQHKv+89AhqHndC8S9h9OEMPRNgYwvX7lJBkDZL6YvSLWU04h14gEhIEEVF4/SD5FjyaRGAz2kqwC11lIeDokq1zrOtIyeot13p5gKGdWYyawgPb+DITbCoianxifgsRZTs5dJUrC8C3xfCSqISHvpPNGvoPUKDxuoO2ZsQgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MW4iWMyv; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-945a5a42f1eso45037839f.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Oct 2025 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761828449; x=1762433249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnwtP05c5M93G2taJ4NMon+tkAFmpaQ7EAFzjgkQfJs=;
        b=MW4iWMyvPu8yEmYxvxEC6yWaPhXadGpbKXGsDyWyCjMqLnrLl925/hWKsOrcJW1Skx
         IDXT/n+unvH5F0fDRb2/u5avufu4rxUEJxaDc+j5Pb1ZYs1YVtnWKE6HmPM6mP64QlhN
         kWzN64XmW4VqwOWP80Y8EpjCypMUJfyROoBqipyl1C38xLqjbctQx9SMgV+IN0cE26UM
         iESatHuXExuG5RD2CZaICSduAF9MDtuFVZiMcriAmh4Jtcl7rmecMkmYZCcDPJwzriKx
         NJ1on2UDZFy4bO24G8V+C5qsVKxha+3kJ9AriaHkU7GWUF1cWidbhgJkJLRf4Ps04EA1
         vlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761828449; x=1762433249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnwtP05c5M93G2taJ4NMon+tkAFmpaQ7EAFzjgkQfJs=;
        b=BXlQ+t/rYvuW1u307lzYFU4fXZacuy/aHz4ik+cm1QDaaIGAAYWnFOQcWeEvXS5gMS
         HZxwZn8p/saKL+cqOPqADvR9ISuQqcCBXalN9pD+1UewS0rO/zErWN76mzR3dy+kjFrr
         a3sa8ExHjOCqrdvbRVnpfW/MJ4yMEuTR4LDciouYJNCb9HmXT/j3WXZ9vmvhuYUbSgI3
         6ty9hoOSbjyzFYN5P93Nw2vki3uTJcz21msxP+wXCSR7KU6Hj/3MjfIIgSTOnQ3QchU2
         Mu5iCuEIbr119pCQizHLnf0QZha41/2bZhVY23sm6qe6lXTQeyu+rJF4eH2emdpiFTmY
         +wrg==
X-Forwarded-Encrypted: i=1; AJvYcCW8/9zjGzXB0mgGhLXh+lAjo77htRYNjyjCIOoA5Qqgb7trRLfo+uE95S4Bokcv9xJ4gM9OhikqiOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeTBuP1LkCKRvzEdnhhb8CrsbD9MgOxR2YtWBkYMqx4N80jvdd
	b9k7YC6JiQpMZKfa53AXjKBIupjslS0EwXJndo9CNwEq9+QnI2/c2DigR1nVEsGNjZ55j5TTemG
	MHB3s7MNqPynqFc72TN/9LVwgeg6RUGE=
X-Gm-Gg: ASbGncsflcdkt8tqkn3NbnhA6kIWoDhqCTwI8/FrKQviMsiizV/33G8sYesmYN4NPHg
	fbMKeq7pA0OHEQJvPrLwfZcN6QejRqiMxrxiPndKGt7LJuzkT930pT2yXEOa3Qn7FnZs04QFXsh
	0TP1dIAP7R7k9QDKJg6bkD2gwDuc2P5CX4RKzPxrZ2c7Sd0/Y9OiT+YaFIuSXCfqF7l8Jz+yG3x
	fOwt8DF0woQrszWdlqbEaxXlTLAQb+QqDlZK/JRSunaxVceI8Auvrv1l2TlAPUrIlWFRVgt
X-Google-Smtp-Source: AGHT+IHCxXydKxh9JkZNuVgxEGvL7KyPwxy6Io3OsezmVBVknh0x/Frm0LIboOPYmUq1goG7v4/bpUjgNtbL8zRPZZU=
X-Received: by 2002:a05:6602:6cc4:b0:940:d996:7837 with SMTP id
 ca18e2360f4ac-945c979c141mr889994039f.10.1761828448756; Thu, 30 Oct 2025
 05:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFNq8R7q-GvFgwRKewzG=ZwkbxEfhKjEsxHWXQ0q8BsSSDFcnQ@mail.gmail.com>
 <2025103049-suing-renewably-fd67@gregkh>
In-Reply-To: <2025103049-suing-renewably-fd67@gregkh>
From: Li Haifeng <omycle@gmail.com>
Date: Thu, 30 Oct 2025 20:47:17 +0800
X-Gm-Features: AWmQ_bnMyOTxq2NNLN_DgsUVoIz85Ut1ncE0R_8YULW3dKwQpBu9pcUP79nQs5Y
Message-ID: <CAFNq8R6uZSS3+nWXkR8XERjMRGTC_4_47UKm_N=P8Um5ySLAtg@mail.gmail.com>
Subject: Re: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Felipe.Balbi@microsoft.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Greg,

Thank you for your prompt response and advice.

I just tested the issue on kernel version 6.1.17, and the problem
persists. I will proceed to try the latest kernel release 6.17, and
report back with the results as soon as possible.

Appreciate your guidance.

Best regards,
Haifeng

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2025=E5=B9=B410=E6=9C=8830=E6=
=97=A5=E5=91=A8=E5=9B=9B 17:39=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Oct 30, 2025 at 04:49:19PM +0800, Li Haifeng wrote:
> > Hello Linux USB experts,
> >
> > I'm encountering an issue with the DWC3 gadget driver on a Rockchip
> > RK3588 platform running Linux kernel 5.10 (from the
> > rk3588_linux_release_20230114_v1.0.6 SDK). I'm developing a kernel
>
> 5.10 is _VERY_ old and obsolete and way behind in new hardware support,
> especially for the dwc3 driver.  Have you tried the latest kernel
> release with is many years newer?  How about 6.17?
>
> If you are stuck with an old release for some reason, please work with
> the company that gave it to you as you are paying for support from them
> for it, it is their responsibility, not the community's responsibility
> to manage that release.
>
> And pleaase, do not release new devices on this old kernel version, you
> are about to loose security updates in a year for it, which is not good
> for the lifetime of your device.
>
> thanks,
>
> greg k-h

