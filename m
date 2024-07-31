Return-Path: <linux-usb+bounces-12740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF739433C9
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 18:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E039E1F22159
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 16:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF15C1B013F;
	Wed, 31 Jul 2024 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lsitec.org.br header.i=@lsitec.org.br header.b="QGZiU/ON"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4A312E7E
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722441705; cv=none; b=EsKjpAuqkY8QcE/6bJsGfk/b+9ceguog0kcUz1Kse3rHyvdY3D1nBtgQ2Nu2+MlctVBsxeqYoOtiQDzQGqA7vfhIgLIVQqsIK2hHzT+U7jaYQRiHg1kGLZyYNueUrvfu7U7JYt8p3yZp9kEA4IfkyjLMLUAYOuV77erard53Sws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722441705; c=relaxed/simple;
	bh=TNT/jmwH19hKqq6fjbCyBX+qvb46hXrSjpzOxqgDVgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeZdeOfdR035Hhcm7Gh6N704NicZicwGbRsHTH38j4g3dZTZmdzGwCWVxIHDG0I1sVvcIWeMifhrn9ukYAjqOCToS1rD9vUwl70ycCzpysUZDvtxlQo9wm+516SfXT+3JbiQAfggiLcvmZzx4li/i8jlxGqpIZ24eg1dETyc6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lsitec.org.br; spf=pass smtp.mailfrom=lsitec.org.br; dkim=pass (2048-bit key) header.d=lsitec.org.br header.i=@lsitec.org.br header.b=QGZiU/ON; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lsitec.org.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lsitec.org.br
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52efd530a4eso9324367e87.0
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lsitec.org.br; s=google; t=1722441700; x=1723046500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4rCgwncPlau4sxWtpQo5QISijshpqBjcB04fl6j68I=;
        b=QGZiU/ONU0sPRkb9gNJ5EUT7/6BDXWWCf0lgPkoXRPs5phRxPdGu5LhpVIG1BPJJJg
         GBOB9+xXBxteNE4rUeH39ONLYJPKtsZzM07amoBNj++Jrbruj48GRwOz57jZ26BOAcFY
         WuyPYjprRlN4jXK+6D6YA1VszKU2aa002xudOem/2M8uOQzzKQb9Ro512sAGLGFFGXZg
         /7NZ4IUC64dfbn7lyg2JqKJy9o6olk13Lh35T1gLWpFJSpUMiVDe7w2ZnTP/+cM7Iq9u
         9Q40a34f4sliXSzBmUbl2EKbbGdRFsmf+6XbBrB42KAcBjfTlTiez2Tog5YVqCLQx4O7
         PcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722441700; x=1723046500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4rCgwncPlau4sxWtpQo5QISijshpqBjcB04fl6j68I=;
        b=ec4b6eBf9Y0yuy3V9IBRel5i0hMv/ubYfdsPA8HoOC3lWPajpGD2sOD9C5xiOWPaE9
         1sItaJiqaDivlQSjIoLZnkCd+09TxmlmZJ20E3MefQxoi892Nju057l6XBj6+blUihvZ
         Jk7Ck6A57zs/nkwOz5RpKct1UAMLzeU8nxSmbpPVH/A7KgIfBzR1OlGG20ZCFwHAH1Mn
         6Clvr/ML2WCKqdsxqRL9iH9IVsF621VKgcPkGO6m91de32z/ND6M/6e6kX5j+kdxEy1+
         VpFpi7f2c8qvjtnujVRk3m3THLk/o7aF7RKC5JHZYcM4A1P0ityJTElF/p/+hy/plrZr
         Yoaw==
X-Gm-Message-State: AOJu0YzgsNytzz7H1r9XNcwCv2ILvgezpp792rT+FSCfpxdnKuNUAsgr
	e1Ik79NCkvl/mBF75qbhTnB52u7RpIVAUEh1XDvdMvGJ/MP73+kc8Kc1P6Ce5wk25mwZ32Lpa4R
	bpX7Ez6li2izNYc0Y8ID1J/OIPMC/Sitr8zoAx+RSTq9/A84GZQ==
X-Google-Smtp-Source: AGHT+IEdOe8HUgHVAGbvSGzFpGYZzIw9Hngvl71heaVLORXcnRp+Q7rR02VNPR4KF7VUHyt4Z0IcnDWPOWQR9Eq80uM=
X-Received: by 2002:a05:6512:2354:b0:52f:2adf:d445 with SMTP id
 2adb3069b0e04-5309b2ca930mr12848704e87.41.1722441699848; Wed, 31 Jul 2024
 09:01:39 -0700 (PDT)
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
Date: Wed, 31 Jul 2024 13:01:27 -0300
Message-ID: <CALWWSVHndeZ7yFBUvMvhi3BPBdvPQafFhars4BcEgUbsPzUkWg@mail.gmail.com>
Subject: Re: Issues while implementing Designware DWC3 on an Actions S700 chip.
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
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

