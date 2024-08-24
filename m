Return-Path: <linux-usb+bounces-14041-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F72F95E040
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 00:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65142282946
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 22:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6DB13AA2E;
	Sat, 24 Aug 2024 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJRhvduw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0188F62
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 22:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724538324; cv=none; b=kN26vwzrtih0Y20K6cjNDt4R3I+ABFQg49oEY8TO/6cL10oKhqF8697dF27LzT/3AcVbWVKiEt09LbBRAa4bQqIYfo9pw7TQycLeZMNgDeYulPNsKunSDwYUdwWl9cmnH2PQVM7p3RjQtok0ESJVKrFmy3oMI5Ah1KE0i/SOLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724538324; c=relaxed/simple;
	bh=chGM9zE1WM10DLj367FHIqZ2iigwVbXe449qDNEvXss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VYSfM5BMmXyO+KXfzq28jm4WfHJGKQiR/E7jJu0pUcL//4E2oEuSgH8KUhStP5m+E2Tf93SYvKhh2dEx4ezbnSqbb1clzpWoBPUrZexG7uq4AR2ZrSBMluZU1JROzd798TQ2ozr8TiKsWxr7ZRElvDhYDccHn4ajRP+RII74qas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJRhvduw; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2705d31a35cso2801352fac.0
        for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 15:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724538322; x=1725143122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3jfYWVVYMnFnkq2u8OQUv9t6htr8yfhef4OcFzoKG4=;
        b=fJRhvduw2NSXczd0ds6G8/DSy76DiRW+f6lZV8PTavsyhAmBNG08vihQWf6ubplhw7
         z1U/xl0YTw68nVS8cICfyO/U1Bf8vf5LBeMYRNhpvlVJFAS6dI6WwIyYCmudloRMVQFO
         hlpi+6yf7KKGO4bsJZSFEfl6Mgx6M+ui6cEGfd7eQReK1I7pHMYF2Qu0y2Y4S+s2YXGT
         VQze/YGGRQkusxDwVL6ZZU6xX2b9BHtmN35UhokR72FunJ0cJ92GUPsxTNjxuh8oauaT
         Uyin4okzoWMNtwiUB9jdYfI4BKVPAP6prXqMo7B7RPzAzPFTjd3J0tKIE37tr7pwAtJK
         q7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724538322; x=1725143122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3jfYWVVYMnFnkq2u8OQUv9t6htr8yfhef4OcFzoKG4=;
        b=c3OZsxF2Pbkf28iwIndVYs7osa9h+L8XVwfUG6cufm9PpJLvsO5Ftop3L5JVfrsD9y
         m2t14Y19aOoRsYrxDwGVep5Pr05fxk1ZfDn5L3vutDZJs24d/54GFgNVAUwuMDZejy9q
         s5CplwlSbJwe1NTLCRMJixo/ViCW/Kc/lhI3IQvA8k+bwZ90eWe3cS/pA77tpmqnZ1Pa
         ujR2A9Sf+bI9jCTD6ki6uR+67Stwk/pP5oscWbNEnvde1NWyQcIjlXcq33OzMnB04xJy
         KatKzCOKdQpYxiNezEx5m2Dx0Sx3g4OqYwVoRq+QNqkMnmoNTxE1m7jFzDYkcHTPcBga
         n9aA==
X-Gm-Message-State: AOJu0YzzvBZpugdqf+w2A9eBO8cxcJGMbZb7xtRA3uOZ18oH7AfYSq78
	h6F9wvgHuaHT9MdVaKa0WSv6bz0xQYEM483BCBjkFEbGyAKWAEt9F53iaQP6dM0ln/tYYZKAYLC
	Zcs4cv3WKKJ5vEcTP1C7kiLiWR7A=
X-Google-Smtp-Source: AGHT+IHxFOqyGWQVaEApEbTYwH2t1mn5OXOYS3ICUKpIDmhPimv6ZP3mAC0aSKLUExIUm8+501QtiB735AUlrOsfgQw=
X-Received: by 2002:a05:6870:c693:b0:270:205a:4070 with SMTP id
 586e51a60fabf-273e64769femr7481976fac.14.1724538322337; Sat, 24 Aug 2024
 15:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823183553.2288-1-alon.barlev@gmail.com> <ZsoZMVlT2hfr3qx_@arcor.de>
In-Reply-To: <ZsoZMVlT2hfr3qx_@arcor.de>
From: Alon Bar-Lev <alon.barlev@gmail.com>
Date: Sun, 25 Aug 2024 01:25:05 +0300
Message-ID: <CAOazyz2tTXv18o9wLS03XK_WPwZ7wOD5v-W3WfQvJJS=APS5=Q@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: qcserial: add support for Sierra Wireless EM7511
To: Reinhard Speyerer <rspmn@arcor.de>
Cc: linux-usb@vger.kernel.org, johan@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 8:33=E2=80=AFPM Reinhard Speyerer <rspmn@arcor.de> =
wrote:
>
> On Fri, Aug 23, 2024 at 09:35:53PM +0300, alon.barlev@gmail.com wrote:
> > From: Alon Bar-Lev <alon.barlev@gmail.com>
> > +     {DEVICE_SWI(0x1199, 0x90b0)},   /* Sierra Wireless EM7511 QDL */
> > +     {DEVICE_SWI(0x1199, 0x90b1)},   /* Sierra Wireless EM7511 */
>
> Hi Alon,
>
> the interface layout for the DEVICE_SWI(0x1199, 0x90b1) entry from your p=
atch
> disagrees with the usb-devices output from
> https://forum.sierrawireless.com/t/em7565-1199-90b1-usbx-qcserial-issue-u=
buntu-20-04-mbpl-driver-fail-to-compile/26361
> and the Sierra Wireless MBPL_DRIVER_R27_ENG2-usb-src.tar.gz driver attach=
ed
> to this thread https://forum.sierrawireless.com/t/driver-make-error/30702=
 .
>
> As a consequence the DIAG interface would not be supported by the mainlin=
e
> Linux kernel.
>
> Regards,
> Reinhard

Hi Reinhard,

Thank you for the references.

The push back is regarding hardware specific modification of qcserial
to meet device requirement.
To make it harder, Sierra patches upstream modules and provides as-is
without the ability of side-by-side installation.
I compared the changes of qmi_wwan, usb_wwan most are trivial and
hopefully reach upstream.
I hope they workout and add the options support so this can be
upstreamed eventually.

In order to load firmware it should have been sufficient to have QDL
setup + somehow setup the tty for the AT channel.

    echo $vendor $product $interface >
/sys/bus/usb-serial/drivers/qcserial/new_id

Would have done the trick to be able to use this at least manually
without forcing the device specific nor options at this point, not
sure how simple it is to support this notation.

For now I will keep using the patched version of qcserial as it
actually works :)

Thank you again,
Alon

