Return-Path: <linux-usb+bounces-12433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D094593C8C9
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 21:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F402B219DD
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 19:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676D85C8FC;
	Thu, 25 Jul 2024 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsitec.org.br header.i=@lsitec.org.br header.b="KBY/8SV4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13C055884
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936281; cv=none; b=SnxFtdvS4fWqqRHbvEyrxbnZHYmJQjsY4JYO577YVSSt5HVc/scuUNSnzbz0zP71/1+GQMQVNbp5N8irsrwnfIQc7i6BuX0ttj7+Bl+N2SdbP0LoTu4RTfQqD8k8+/kZRjiiNvOfWDL0XBIYNqgvYGvouzBJ5ENtGv9sUuIyFyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936281; c=relaxed/simple;
	bh=Bpcia0/o5B8BhAJ9qUX+o8LGGcQPQRYLkalp15mNWqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7Ofl9p72AG+u7TrEPt7fu1ONo2fS7vIQtxr6HLwuAb8tcRT9wRJ0Xes1IdHjBrxNm9WVrmDbVJh24Wawz07eYJmIhOSQnoBXHL/TfnFbs9dWOYUnS6QQ5uLr1BVXSv+sDMxbmJa1Q/SxI1quQG6yhc7RLt2DybVoXSgEwG1tns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lsitec.org.br; spf=pass smtp.mailfrom=lsitec.org.br; dkim=pass (2048-bit key) header.d=lsitec.org.br header.i=@lsitec.org.br header.b=KBY/8SV4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lsitec.org.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lsitec.org.br
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efba36802so930876e87.2
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 12:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lsitec.org.br; s=google; t=1721936278; x=1722541078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyXCE7KJHaGfRdUIuaUfXONueVL8bkKteWK8hRjsSXY=;
        b=KBY/8SV4IV7h70fYOQYU8rYCFb5kKW/TCF+oNNPRCI8PNkzCk3xRGzzsbJKPpDb3Mn
         DOxVA89QZNJLK0VI77qEdFtwy07hMiWT44xGzIVFfj67orn7Rrtyg7lG+p3osHFCmtNy
         hku0NlIKCl/p/1n7fSKtwBbNpr+HnbqJmfBIQGDEupROBF8326Hb96jdnMAx/tSCphic
         fyYIyciDu4Z3gQyO0v8IPPfDs1zeKO+ev1gKegtiyzPEs0bCvXDTAUjwxL9UQQ1qGRMs
         zAvIF1GyIWDZYuqlfZx95zAE3CyiMFAZSAFRNJDqsNpTi0Prm+PSyAq+KlFEYd5fW5vt
         muzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721936278; x=1722541078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyXCE7KJHaGfRdUIuaUfXONueVL8bkKteWK8hRjsSXY=;
        b=lX0Wig31oneJrtb9oeO/POjmdANYiLTOu9EsrtVel4cyjuGVP+REfUjOequhZ8eT7D
         SLfLYCi8d3oifpymWSE5q+YDrLhn9/Evwu494DbFGd0F75YwEm+4WyhmCiIOmHbDhlO8
         rvYBClwcg0upnjrZVHXWoEEYDbQj653jpMXd5gc+MAdffEq7lxpnFrnrjW+jzpKAO5sO
         gOMU2DUFTBuJDqLzaL26SZ4GUXxH+6dvzyHyEg4oZIJyEBY6t/xgK276OemYQaUtp579
         5J8kTM0VksE7gD1VthRd+YryfykzOpYVX4/TyGJ064sbK63rQ9iE7RLycZJZG07FYsRO
         EbuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUarrvNPAKOmytDneBcpAw7AMnyQZz+EmBsqY5spXgfQ7jto0/ad+badyxE1eF0dQUbSLtWZO+BMafYHnnGaz5au3RGCaBIIRCg
X-Gm-Message-State: AOJu0YyAHZPGW8174OTlSuzvpXYWCXjuqVoTW1BtMykpdHWIcEUMYOpQ
	o/wApO1f2RXzccVl2/49Ksdl1OWfajEcWsqeQ3s5Am5cNm0BMChprTpDF8TVIQ68mM/7EtI9cPM
	G4WkI+qQgNk2+f5YdXYdMSP7vCDyb6xlk59cZ97PkJKOwAoKVTIgp
X-Google-Smtp-Source: AGHT+IE00Jj8lifAVyOlNM+HSO5KAH2p2+XIjwg9+Q/a0glWyV/TrALRc6Ps5HeIt3G8ctnfU6QGA/Kz4ruBaOeELw4=
X-Received: by 2002:ac2:4f07:0:b0:52e:7f18:176b with SMTP id
 2adb3069b0e04-52fd6018d9emr2388317e87.11.1721936277637; Thu, 25 Jul 2024
 12:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALWWSVGAg_4hW-a-SHFvQQ1N2A7jjTQpfO34fRUWdfR6N43ZRA@mail.gmail.com>
 <20240703004708.stx2dr2vix6j2d7i@synopsys.com>
In-Reply-To: <20240703004708.stx2dr2vix6j2d7i@synopsys.com>
From: Ana Clara Forcelli <ana.forcelli@lsitec.org.br>
Date: Thu, 25 Jul 2024 16:37:46 -0300
Message-ID: <CALWWSVHQPfEgKmmNq5mJhK5sJ-6tjC_nww-T9+asd-3NO5+WQg@mail.gmail.com>
Subject: Re: Issues while implementing Designware DWC3 on an Actions S700 chip.
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

I was trying to make the mainline kernel work, but the system won't
run without the Debian patches. Would the 6.9 kernel from the testing
repository be enough for you to help me out?

Regards, Ana.


Em ter., 2 de jul. de 2024 =C3=A0s 21:47, Thinh Nguyen
<Thinh.Nguyen@synopsys.com> escreveu:
>
> On Tue, Jul 02, 2024, Ana Clara Forcelli wrote:
> > Greetings!
> >
> > I've come to you because I stumbled upon an impasse while attempting to=
 make
> > the USB3 device work in my company's custom SBC project, which uses Act=
ions
> > Semiconductor's S700 SoC.
> >
> > First, the context: since the chip was discontinued, the manufacturer s=
topped
> > updating the kernel source, so it was stuck in version 3.something. The=
 USB3
> > subsystem used to work with the manufacturer's code at that point, but =
so many
> > new features were added to the mainline that we had to move on to newer
> > versions.
>
> The dwc3 controller here is quite old base on the regdump.
>
> >
> > Right now, we are using Debian's patched version of the 6.1.76 kernel. =
Our repo
> > is public at github.com/caninos-loucos/labrador-linux-6 . We implemente=
d the
>
> 6.1.x is still old. Please try mainline. Otherwise it be difficult to
> provide feedback on your custom kernel.
>
> > device tree nodes, glue layer and PHY code on the usb3 branch. Some cod=
e is
> > from the old repo (the phys especially), some was adapted to the more m=
odern
> > format.
> >
> > The problem: Only a few devices (keyboard, mouse and some pendrives) wo=
rk
> > correctly using the usb3 port, and only when they are connected before =
the
> > modules load. Otherwise, the device stops at the stop endpoint  command=
 and the
> > whole XHCI module dies. I tried to debug using the guide at kernel.org/=
doc/html
> > /latest/driver-api/usb/dwc3.html, but I was quickly overwhelmed by how =
complex
> > this system is. I followed the commands
> >
> > # mkdir -p /d
> > # mkdir -p /t
> > # mount -t debugfs none /d
> > # mount -t tracefs none /t
> > # echo 81920 > /t/buffer_size_kb
> > # echo 1 > /t/events/dwc3/enable
> >
> > # cp /t/trace /root/trace.txt
> > # cat /d/usb/*dwc3*/regdump > /root/regdump.txt <--- this had to be mod=
ified
> >
> > but tracefs returned nothing from dwc3 and the regdump is incomprehensi=
ble to
> > me, since I don't have access to the IP handbook. I tried more ways to =
access
> > the trace, and even enabled all functions, but I'm mostly sure that the
> > aforementioned command works just fine.
>
> The trace.txt is empty because this is host mode, and you probably
> enabled the trace after loading the driver, so the controller
> initialization isn't captured.
>
> You should capture xhci tracepoints instead. Same steps, but enable xhci
> trace events:
>
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
>
> >
> > The regdump.txt file attached to this email shows the dump after connec=
ting a
> > generic USB pendrive and waiting for the dmesg output:
> > [   90.800444] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to st=
op
> > endpoint command
> > [   90.828621] xhci-hcd xhci-hcd.0.auto: xHCI host controller not respo=
nding,
> > assume dead
> > [   90.836534] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> > [   90.842256] usb usb3-port1: couldn't allocate usb_device
> >
>
> This may be difficult to debug without knowing your setup quirks. But
> I'd suggest to try against the latest kernel first.
>
> BR,
> Thinh

