Return-Path: <linux-usb+bounces-23124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC089A8B6E4
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 12:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4414E3BD732
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 10:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17E12356C9;
	Wed, 16 Apr 2025 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EHsTS0wk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967118CC1D
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800011; cv=none; b=MYGxXgTW2YstnVBjZDSUTqZFvL/jpQAk7/1dJ42d9tmjZgfeKYsjmgIzCpWQOmdnpyapaqWAvJ1DbI4rWU0MPV/La85xd5ytA2kjisX0s7skZ3iAYUw1yIEaribYnzHln5+onTq2jZGudHjhe2QHDHymofI55361o2IpHIVEOIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800011; c=relaxed/simple;
	bh=O43vBZXURJqZi5/YVIFLW0+npdbUxEBlQ/F7/trHqLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1DC62gf0zai0Ngs3rBMK7QG0+OAQwmQb2tir96JYIptvoLI4tPsj/atx5SoKNwgrHt0i8cTV58oXndiFlgiWRAyrxcwMvWUFrFWOXbqit9MKNLpO2ectjIg6tvOCyW4Zo8fIdv8VJ5zJwhLwUdvkmpBU7MbnSql9MFO2DrAbiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EHsTS0wk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499c8c95beso7394e87.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 03:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744800006; x=1745404806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5ZXVb5dTrb9owxQOaSc6zse/02f6gsl8oULQh4e96c=;
        b=EHsTS0wkOzCfHSuRVYtTHP6PMnYmh1qqtQ+o+FbKOp4FdtxD0KhGZJv8J8i3Tq0XYL
         RI1g+91v35Jyv2vvhFK1TTcWGc0iX1a5Zs0T7vS+ubkd8Y0nejh84fc5SwBBCuAuXM0f
         j8GrQk+GMwG6mO2oJgfVDAG3kaxtdCZ/R3nMiwz0bt4aQ/Rpi7NHo7gb5S7p80yOVaqN
         64XXo+ZNS4QRj/+wNuZgwvuDCJlIJfkWGg1wPmaDkynRbXh9mGi+8HHWenQjJ7qUpkLw
         oYQuvGaU9nqQ55uXMxjjKL33hXNJzCo7fakVG74sGcK1XC5WZv7DG3tVaK6lzcZXWQ+F
         BfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800006; x=1745404806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5ZXVb5dTrb9owxQOaSc6zse/02f6gsl8oULQh4e96c=;
        b=cujuAhh+hWmEVUhiMQ2SeBbKdnq9j6jDJUiKvNHFkAqHcomE5kfdCxnO5e8RVKR+va
         Z1M8zy41Sx1yhcUxOWOQDAEWVmpuTREKcoSZoXUPMhB5jffyuUIkGdGL3k5yQ1hUaWwS
         jb408sFuziSWj18XUkTyrzU28Ld3couzxNUvO+y5gD7tF2BRPTdB8F4WvFxA0nnAcxIH
         4hXt8V+vjfQW8+/GrzeTrLw4K/7tga7HObG5u3SlsJnh+cwkqrYKCqx33mODznHKeyaA
         PrBzq/X4h2zipA5UjPfhpKa6YNPw1U1ZGWu/yUnOa6scpEtDX9cAkzzf87ysUpuLOWQS
         QXXg==
X-Gm-Message-State: AOJu0YwVfR3eL1T75+vdd0dc5RyQ/RU3WXVwHlcmXYjP8ug+iuPelKyx
	HEdL9Zx9zlsAPV8iJVV6ynSK52YPsLUXFpCLtMXNWEP4bO4688rSh76mhy4YS6l9psnVznVfBJ1
	r8uWwlkQB/clVe355AR6zsMRTWE75DsToChukpWPx4JpYCWB9LXNB
X-Gm-Gg: ASbGncuEIZ664bmzbhTYxMHv0/UWzWJ8U/VxsIjcwa0OXwrvlXDhKKxQI70EXKodF8L
	OYhtpzirv7d/XWywK9+NWI5ObvSz8HN3qBn7ZxSZdsdtpYBqXkpxSWJcn9dnFBFzhHb22jSQXZk
	C73ucXuRm0zxHMEZh3up7gTKtU97oSozoS1cOQGv7WQoONEkQL
X-Google-Smtp-Source: AGHT+IG0RRQcjL0vTELyRBOF75YqbYQVhuLkLnGrg0E8ngHimeLXE2D4ctxxmq3vsKAQL1uhbg5wwG9sZ5PWlbwkso8=
X-Received: by 2002:a05:6512:328d:b0:543:cf0c:ed14 with SMTP id
 2adb3069b0e04-54d6437ea2cmr72985e87.5.1744800005838; Wed, 16 Apr 2025
 03:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327133233.2566528-1-khtsai@google.com>
In-Reply-To: <20250327133233.2566528-1-khtsai@google.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 16 Apr 2025 18:39:39 +0800
X-Gm-Features: ATxdqUEz3Vxoy2SWWp3ckll3jRAQgcoBue0UND1ir68nE66lyLygn_C_oCNJUro
Message-ID: <CAKzKK0oqdxvnfGg6GR_N3M59fdPqR+uTW=YC6SPGOB7+aojV_A@mail.gmail.com>
Subject: Re: [PATCH v3] usb: dwc3: Abort suspend on soft disconnect failure
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 9:32=E2=80=AFPM Kuen-Han Tsai <khtsai@google.com> w=
rote:
>
> When dwc3_gadget_soft_disconnect() fails, dwc3_suspend_common() keeps
> going with the suspend, resulting in a period where the power domain is
> off, but the gadget driver remains connected.  Within this time frame,
> invoking vbus_event_work() will cause an error as it attempts to access
> DWC3 registers for endpoint disabling after the power domain has been
> completely shut down.
>
> Abort the suspend sequence when dwc3_gadget_suspend() cannot halt the
> controller and proceeds with a soft connect.
>
> Fixes: 9f8a67b65a49 ("usb: dwc3: gadget: fix gadget suspend/resume")
> CC: stable@vger.kernel.org
> Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> ---
>
> Kernel panic - not syncing: Asynchronous SError Interrupt
> Workqueue: events vbus_event_work
> Call trace:
>  dump_backtrace+0xf4/0x118
>  show_stack+0x18/0x24
>  dump_stack_lvl+0x60/0x7c
>  dump_stack+0x18/0x3c
>  panic+0x16c/0x390
>  nmi_panic+0xa4/0xa8
>  arm64_serror_panic+0x6c/0x94
>  do_serror+0xc4/0xd0
>  el1h_64_error_handler+0x34/0x48
>  el1h_64_error+0x68/0x6c
>  readl+0x4c/0x8c
>  __dwc3_gadget_ep_disable+0x48/0x230
>  dwc3_gadget_ep_disable+0x50/0xc0
>  usb_ep_disable+0x44/0xe4
>  ffs_func_eps_disable+0x64/0xc8
>  ffs_func_set_alt+0x74/0x368
>  ffs_func_disable+0x18/0x28
>  composite_disconnect+0x90/0xec
>  configfs_composite_disconnect+0x64/0x88
>  usb_gadget_disconnect_locked+0xc0/0x168
>  vbus_event_work+0x3c/0x58
>  process_one_work+0x1e4/0x43c
>  worker_thread+0x25c/0x430
>  kthread+0x104/0x1d4
>  ret_from_fork+0x10/0x20
>
> ---
> Changelog:
>
> v3:
> - change the Fixes tag
>
> v2:
> - move declarations in separate lines
> - add the Fixes tag
>
> ---
>  drivers/usb/dwc3/core.c   |  9 +++++++--
>  drivers/usb/dwc3/gadget.c | 22 +++++++++-------------
>  2 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 66a08b527165..1cf1996ae1fb 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2388,6 +2388,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm=
_message_t msg)
>  {
>         u32 reg;
>         int i;
> +       int ret;
>
>         if (!pm_runtime_suspended(dwc->dev) && !PMSG_IS_AUTO(msg)) {
>                 dwc->susphy_state =3D (dwc3_readl(dwc->regs, DWC3_GUSB2PH=
YCFG(0)) &
> @@ -2406,7 +2407,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm=
_message_t msg)
>         case DWC3_GCTL_PRTCAP_DEVICE:
>                 if (pm_runtime_suspended(dwc->dev))
>                         break;
> -               dwc3_gadget_suspend(dwc);
> +               ret =3D dwc3_gadget_suspend(dwc);
> +               if (ret)
> +                       return ret

Sorry about forgetting the semicolon.

>                 synchronize_irq(dwc->irq_gadget);
>                 dwc3_core_exit(dwc);
>                 break;
> @@ -2441,7 +2444,9 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm=
_message_t msg)
>                         break;
>
>                 if (dwc->current_otg_role =3D=3D DWC3_OTG_ROLE_DEVICE) {
> -                       dwc3_gadget_suspend(dwc);
> +                       ret =3D dwc3_gadget_suspend(dwc);
> +                       if (ret)
> +                               return ret;
>                         synchronize_irq(dwc->irq_gadget);
>                 }
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 89a4dc8ebf94..316c1589618e 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -4776,26 +4776,22 @@ int dwc3_gadget_suspend(struct dwc3 *dwc)
>         int ret;
>
>         ret =3D dwc3_gadget_soft_disconnect(dwc);
> -       if (ret)
> -               goto err;
> -
> -       spin_lock_irqsave(&dwc->lock, flags);
> -       if (dwc->gadget_driver)
> -               dwc3_disconnect_gadget(dwc);
> -       spin_unlock_irqrestore(&dwc->lock, flags);
> -
> -       return 0;
> -
> -err:
>         /*
>          * Attempt to reset the controller's state. Likely no
>          * communication can be established until the host
>          * performs a port reset.
>          */
> -       if (dwc->softconnect)
> +       if (ret && dwc->softconnect) {
>                 dwc3_gadget_soft_connect(dwc);
> +               return ret;

This should return -EAGAIN after a soft connect to keep dwc3 active,
allowing dwc3_gadget_pullup() to perform the subsequent pull-down
normally.

> +       }
>
> -       return ret;
> +       spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->gadget_driver)
> +               dwc3_disconnect_gadget(dwc);
> +       spin_unlock_irqrestore(&dwc->lock, flags);
> +
> +       return 0;
>  }
>
>  int dwc3_gadget_resume(struct dwc3 *dwc)
> --
> 2.49.0.472.ge94155a9ec-goog
>

Hi Thinh and Greg,

Sorry again for the lack of thorough testing on my patches. I've
corrected silly mistakes and sent out v4.

https://lore.kernel.org/linux-usb/20250416100515.2131853-1-khtsai@google.co=
m/

Thanks,
Kuen-Han

