Return-Path: <linux-usb+bounces-24888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA423ADF008
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 16:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC31B1894516
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 14:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04B51ACECE;
	Wed, 18 Jun 2025 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ztOfbE7B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B48D16A95B
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 14:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257911; cv=none; b=bnTwuaKytoL55jITwAupxetFc/7K5zzkiSgOPp4o2/EuL3/j6n3iBqjADZyVfE2oEyKj9tftlpbUBz+EaoM2CNRx8csrQwAztPb+ei3xuHPtREy/RJZVbzd01AAYBDANa8LPNQOoMplmbHYRSqn7TlqwsiTNEkFPfAqjF55uu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257911; c=relaxed/simple;
	bh=wFDJGOoYvxypvMpqpT4ZM8yTHl6scWUOtsqCWIeHNU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8B2vaPPIOZLd7P1UstOZDJcUtgNoChkIifyfzasVoL4lAh2fNlwtFlByWkXwvm3Lxa4DsTEKz756SDPRZXXf/KDLDDw2rmmU5HgV4jPDOMPE4V2Kcveg5WzD3bRma+AuUwcUss8yD2DNrfCawzBZ4isEl8EPdoFeNzhy9qaD0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ztOfbE7B; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-551f007a303so7013e87.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750257908; x=1750862708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgwogF8uqMbr2+utkBcdB+9XUE0/TMWHXyL3HiSuo4U=;
        b=ztOfbE7BV6PqP1SZRntwrn1NAZ0bs4p/keOwkqgUHfydN0ecy5SdJhw4Kd2oelNamV
         Ltf2ccSogNMs5dtKsPuDH1cCyvLSSA8oX00hBKHkHCCta5M2kzmBUk61rA4MbkJa+BCs
         zZAml6AJkmUaB2yK1mN6FVodMhqvmJ4StM0A3ai/4lGYvB86Xim9aUpFGmnChtEflv5D
         UqtaFM1XWpdQ9w/KOQ5dxd0xy6ADdFekIhPTkrimoJJLtosjahVhj6B0+Bgx7rA9FnWf
         Bkg5XNPpIv4oP2f96wUlUOjY5VNaHabZXDXqGN3v+Dz0zhTHZGniVDFIkzPAhkL2lmmZ
         SXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257908; x=1750862708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgwogF8uqMbr2+utkBcdB+9XUE0/TMWHXyL3HiSuo4U=;
        b=WNKUqiV7oUokSEtNu0jfRugY/C/hHXgUAggBUKZ+ZeEzMPcdZ8Ndz/Ey2EyYCc3RV7
         zHonyE/jPW5usvXs8EyFIB1fzSokz0BJlTjC/HN+IImMGkh2kgNiey8lc1pddB64U2Hk
         hmnsgL8Glirygdzdzk6Bz0xjmYfX8Ra7rdrDAXCvud/Mpo2RRVMzo2kvuyRhBuUT2hyQ
         xZbzJDb80Y7bHMbb3d1FgK3VKZB1WSl4Q4tXpKd7Qka0CAAlxVRpxUmrTRPkJ8RUN09S
         fsL/aPnmEgolPp5zzWJ5dJRnnHLfrxCDT9LXayfPw+bUb8C1MS+4aS4qGjFy+tY/Hifk
         vxQA==
X-Forwarded-Encrypted: i=1; AJvYcCXNNKtC7RCbbDiNdTWrXEXk/ftgUXHY8B1AKECWuRKWHwgrt05tqHOpo7tovSev5en3dt4gBBoAoqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvq+zhFVcHzkKmd5wEG3rc46TCWvv9I3mXV+6GUdkuFqKefBTO
	fA6YV7CwVLIYO+WzTU9l/wqPRs/lRzH78WAJllkbQXG1AO40zV3sFXExsGSO5CiDLV8ukhWjwBQ
	BimfDA21ZEEkHWcLOHyWAwlLHVdn4DNR4UdyLJhlL
X-Gm-Gg: ASbGncuZGjpzJfeqJofruCHOgYIy5+JG6TkPeGfTYfRELIADNCo62gQEzi8mJdVLLmM
	WeY3j6/Dc4lg/eAieEpXwdjKS/MANeZJaByFHUDYNRPfnFckzzxw6M8FKqFaDHUgtTnl4SC0Ogv
	/oDaUe7QUoUfDSR4wM4+byubzv9Yu3wasfu8buiRElOHkB
X-Google-Smtp-Source: AGHT+IGsHULveGxM+Zja84HplaohcRZH+z1Ahxw+rjNmRssuHdQl/61J38I3+e2DEDA8rD3yf0Aeas3nTywrwhBEfyI=
X-Received: by 2002:ac2:5deb:0:b0:553:50d2:5c20 with SMTP id
 2adb3069b0e04-553b80b051cmr996457e87.6.1750257907321; Wed, 18 Jun 2025
 07:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617050844.1848232-1-khtsai@google.com> <20250617050844.1848232-2-khtsai@google.com>
 <8cbc5220-c993-44a1-b361-418b36a3f336@oss.qualcomm.com>
In-Reply-To: <8cbc5220-c993-44a1-b361-418b36a3f336@oss.qualcomm.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Wed, 18 Jun 2025 22:44:40 +0800
X-Gm-Features: AX0GCFsDnAuqG_eBCE0NH5iSAwM0mK_YNKjBQDLgH6k-Y0wAmBs5AA-kujp4xNk
Message-ID: <CAKzKK0p0fx4bsqVVPWjJQxG0sEHee0b0OPE7dqCb7cbW7+XkgA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] usb: gadget: u_serial: Fix race condition in TTY wakeup
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, hulianqin@vivo.com, 
	krzysztof.kozlowski@linaro.org, mwalle@kernel.org, jirislaby@kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 8:26=E2=80=AFPM Prashanth K
<prashanth.k@oss.qualcomm.com> wrote:
>
>
>
> On 6/17/2025 10:37 AM, Kuen-Han Tsai wrote:
> > A race condition occurs when gs_start_io() calls either gs_start_rx() o=
r
> > gs_start_tx(), as those functions briefly drop the port_lock for
> > usb_ep_queue(). This allows gs_close() and gserial_disconnect() to clea=
r
> > port.tty and port_usb, respectively.
> >
> > Use the null-safe TTY Port helper function to wake up TTY.
> >
> > Example
> >   CPU1:                             CPU2:
> >   gserial_connect() // lock
> >                             gs_close() // await lock
> >   gs_start_rx()     // unlock
> >   usb_ep_queue()
> >                             gs_close() // lock, reset port.tty and unlo=
ck
> >   gs_start_rx()     // lock
> >   tty_wakeup()      // NPE
> >
> > Fixes: 35f95fd7f234 ("TTY: usb/u_serial, use tty from tty_port")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
> > ---
>
> Reviewed-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>
> > v2:
> > - Move the example up to the changelog
> >
> > Traces:
> > [   51.494375][  T278] ttyGS1: shutdown
> > [   51.494817][  T269] android_work: sent uevent USB_STATE=3DDISCONNECT=
ED
> > [   52.115792][ T1508] usb: [dm_bind] generic ttyGS1: super speed IN/ep=
1in OUT/ep1out
> > [   52.516288][ T1026] android_work: sent uevent USB_STATE=3DCONNECTED
> > [   52.551667][ T1533] gserial_connect: start ttyGS1
> > [   52.565634][ T1533] [khtsai] enter gs_start_io, ttyGS1, port->port.t=
ty=3D0000000046bd4060
> > [   52.565671][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
> > [   52.591552][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
> > [   52.619901][ T1533] [khtsai] gs_start_rx, unlock port ttyGS1
> > [   52.638659][ T1325] [khtsai] gs_close, lock port ttyGS1
> > [   52.656842][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be975=
0a5) ...
> > [   52.683005][ T1325] [khtsai] gs_close, clear ttyGS1
> > [   52.683007][ T1325] gs_close: ttyGS1 (0000000046bd4060,00000000be975=
0a5) done!
> > [   52.708643][ T1325] [khtsai] gs_close, unlock port ttyGS1
> > [   52.747592][ T1533] [khtsai] gs_start_rx, lock port ttyGS1
> > [   52.747616][ T1533] [khtsai] gs_start_io, ttyGS1, going to call tty_=
wakeup(), port->port.tty=3D0000000000000000
> > [   52.747629][ T1533] Unable to handle kernel NULL pointer dereference=
 at virtual address 00000000000001f8
> > ---
> >  drivers/usb/gadget/function/u_serial.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadge=
t/function/u_serial.c
> > index c043bdc30d8a..540dc5ab96fc 100644
> > --- a/drivers/usb/gadget/function/u_serial.c
> > +++ b/drivers/usb/gadget/function/u_serial.c
> > @@ -295,8 +295,8 @@ __acquires(&port->port_lock)
> >                       break;
> >       }
> >
> > -     if (do_tty_wake && port->port.tty)
> > -             tty_wakeup(port->port.tty);
> > +     if (do_tty_wake)
> > +             tty_port_tty_wakeup(&port->port);
> >       return status;
> >  }
> >
> > @@ -574,7 +574,7 @@ static int gs_start_io(struct gs_port *port)
> >               gs_start_tx(port);
> >               /* Unblock any pending writes into our circular buffer, i=
n case
> >                * we didn't in gs_start_tx() */
> > -             tty_wakeup(port->port.tty);
>
> Just curious, since this is already under lock, checking for
> port->port.tty would have also helped, right? Anyways looks like
> tty_port_tty_wakeup is better.

You're right, adding a null check for port->port.tty also solves the
problem. I actually submitted that exact solution last year, but it
was rejected.

Link: https://lore.kernel.org/linux-usb/20240116141801.396398-1-khtsai@goog=
le.com/

>
> > +             tty_port_tty_wakeup(&port->port);
> >       } else {
> >               /* Free reqs only if we are still connected */
> >               if (port->port_usb) {
> > --
> > 2.50.0.rc2.692.g299adb8693-goog
> >

