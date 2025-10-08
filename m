Return-Path: <linux-usb+bounces-29009-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EF0BC40F9
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 11:03:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 097153A426E
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 09:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A95257830;
	Wed,  8 Oct 2025 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzSQN6h6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E381FECCD
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759914177; cv=none; b=qydDF6iafQWYAJ0Jukk5nD1CxMHIvl9PnlK/IFUGVMK2DInh5dWA6xDlaL/Y3E0HRrRMOrn8TrkgquTchTP5NejFuiuTLkHQR8EhS7Yhs8fCuXlpmCkQcITWE/b1OS1nC/g8Teo6pLg+E/HePC4esa95UtCmzmxYdgg0qgeAiVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759914177; c=relaxed/simple;
	bh=kF1TctwsFK2boTjPaOPq4WDnTfl9gvF+EoHMxWRsNws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiESkJgJGZ+hh4Xt89RieYYyYxDT+IkP3fFOFG6aRpSLw/gTHzwuXia9OanSlHqw5jReYMSeNPEWDZPpDgaWFJekAgJ1laQ+Swur0TwqP1CE98Mb2uWdFYT3zZ5dBh22t32NrjVhlTbSxGdDxVqcDpBOED62VVutUfBpWUvknm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzSQN6h6; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-54bc2d1feb2so2019521e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759914174; x=1760518974; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UNISjFhZVOyxNmzWk6Oc8rzemD97BELUfRbJibpGUYw=;
        b=bzSQN6h6qBLNrG8IJq3+Z6PPHJMomoekwKDlw6LVU+uBBUubWnrDtslt+hhFvd5Xfq
         lyNOxD1yp0kOVY2siYncaOkeGF20OfGfkc2GAZ2mokYcYk83gMxH45nbwh/kYtNckHCw
         vD6KDTAOOPUXdTDOJYEAmhrJY9r0ah45kAe6Anyg0UZGXPmbz/s+dtCM8Y3lq5i/KcAA
         GdKV3ZQQccOn5e3Tq3HUcCWJqZVRk5PzySt7Iy58ubc9IqrqMNvoZTuVhTIkS4Wmyh2/
         Hj+98rVn0ziwU7j87VmXJt4IoGJn1jw9Vc6KKF2x4vtlmKAq8lHIubaW6gzBD4TidlKs
         h4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759914174; x=1760518974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNISjFhZVOyxNmzWk6Oc8rzemD97BELUfRbJibpGUYw=;
        b=vnCnM5ZV/6Se014aSVkwPlHaGYboozosHocKYdIfob9bPY6RwHLnAvPD+JMY422nG3
         HgXOZnTspxtYNNWlGJ6d7gtVdGmHC6mHNmaClDEDIWeB5ODpdzLmpHxmfHekXYDMb46z
         ydjseFydY1E3IiXpuAalmc/9VvH9bZwhRArJRuQsiPLkT5rdbJcI3QVsr0pR4OvLNqD4
         tKNcXzpGTG7rIQwD6gYkLI++OoHEG0vdj7MJ9RLNLoyqcvW3uH0J6YUfL35mBq85XIq4
         ZGDYRGOr9tkdSTyhvRcxN89OCTJc2SIL4zrpDhSbmr9XoOYeEvB2GW8Lp1q6xTqCj2Tt
         I5XQ==
X-Gm-Message-State: AOJu0YxEoz/YRHC0Lg4PXnPx01HcwNoriV50E6QhxBU7hMEeBwgtYU/W
	oRn7wE8IQy/JeYNYSM5brklBpvEsaUz3Z2Q9Kkbvwrf5f804VSevARiq1XEZYUDqn6oh0cQlO23
	WKlmTPgoVnFHictRXh9MVpPQipoRMG4A=
X-Gm-Gg: ASbGnctrviPSM/r7qk00lrIGk1yRZ4E7UB946Jd3OVqDSk5Xgao7YO09KmKKowFXkw6
	WaYcXg/Mb7H0uHYvHe5EIGY2MF7XJf1bQ3kR8aA7ofVpVzpZ2oyOJoXoCkW4F/sL9//ZAbNeJT4
	z1b6E9YgmegCwutco1xry/xYl+d8nZpaJIv3SUSDFUEgHyFxCLxwHb4njfms6l9abp0VGLPARDm
	qphEydmDzIH2Bxzm4YDMacJlshxQ6Y=
X-Google-Smtp-Source: AGHT+IGXBLTVg0GZ4k7Ne4HnzkIHCspOdJBHBxUkydXCzxxJtFtgkwkOq9pkNh3HOnTuK5M+tBY6pKsALsEm8wucb/0=
X-Received: by 2002:a05:6122:1d04:b0:54b:bcf7:69f5 with SMTP id
 71dfb90a1353d-554b8af1c5dmr923583e0c.8.1759914174573; Wed, 08 Oct 2025
 02:02:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
 <20251007231709.6c16802e.michal.pecio@gmail.com> <CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
 <CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com> <20251008082055.5646dadc.michal.pecio@gmail.com>
In-Reply-To: <20251008082055.5646dadc.michal.pecio@gmail.com>
From: Arisa Snowbell <arisa.snowbell@gmail.com>
Date: Wed, 8 Oct 2025 11:02:43 +0200
X-Gm-Features: AS18NWDS6Dn8ycOWuXPvCmeT8vfwMyrjN9hBZW0G9KxUQ0-xsrdIjuyKmIj-qyM
Message-ID: <CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
Subject: Re: [REGRESSION] USB-A devices not working on boot after recent USB merge
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev, 
	Niklas Neronin <niklas.neronin@linux.intel.com>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Morning,

> So the issue is that there are some USB ports on the motherboard where
> devices work when they are hotplugged, but nothing is enumerated during
> boot, correct?

By testing a little bit more now in the morning I found new information.
If I replug in the USB 2.0 port, no, it doesn't work. Only if I plug
it into the 3.0 port.

> Are all USB-A ports affected or only those limited to USB 2.0 speed?

From what I can test, yes, seems to be only USB 2.0 speeds.
Tried USB 3 flash drive and works on boot, if I plug the mice into USB
3.0 it works.

> If you look at hotplug notifications like
> [    4.612030] usb 18-2: new high-speed USB device number 2 using xhci_hcd
>
> the first number (18) is the USB bus number. You can then find the PCI
> address of the xHCI controller by looking at the root hub (device 1):
>
> $ lsusb -vs 18:1 |grep iSerial
>   iSerial                 1 0000:0c:00.0
>
>
> Can you reproduce the bug without rebooting by some device
> and then reloading the xhci driver on this particular controller?
>
> echo 0000:0c:00.0 |tee /sys/bus/pci/drivers/xhci_hcd/unbind /sys/bus/pci/drivers/xhci_hcd/bind

With my new discovery about the issue, I don't think I can do this.

Thanks,
Arisa

