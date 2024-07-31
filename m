Return-Path: <linux-usb+bounces-12727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9C994312B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 15:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC0CFB25D72
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 13:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4DF1AE843;
	Wed, 31 Jul 2024 13:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K2fY6A3e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39AC1AD3FE
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433361; cv=none; b=lTIGxvJtsdvBC93O1sRZ/phfX3QD5ZWOLfIakdbAcM/ZCasbLTnaNB+zyXXTso1don5fNKHDmHaphwgl0mofU/gfnCdFmAgd+5rMJZmNTXZgYlvPMlS7Z0o5JvJtMoxKuZFSc2/E5TpT0NENXYvI33pcz+8xOJM2I+4tXZQPdE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433361; c=relaxed/simple;
	bh=jllcrUTFrQM9He+XFnKeFXqCJM1ojABnVklonbgRXNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBTlgtbVMcsaTBbNAE9P6sH5ueMLOEw/3w5z/3Kuu7jeZGjGurCj55u9vtzzVl8yI4uGQUV4ToyDTRmt8TNqP5jC8v4rB+QMpC9eFo3Jsnd+FhDE4GegnX8XdBwBI1xEofh5XhDOx5nWsgnIl8JkHL1VFvR6buZ5cthDzQx4Q9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K2fY6A3e; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efe4c7c16so8615305e87.0
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722433358; x=1723038158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jllcrUTFrQM9He+XFnKeFXqCJM1ojABnVklonbgRXNU=;
        b=K2fY6A3ewWxE/DmOi9Op836xJT1LZMvqVfcmgoycufyKsORynLtRAmDDZ9XjkU3gLi
         4YxLuUIXjs7l0APDVSaLWovMI3hfB4krG6QRFdutlwMIJvlAwZOhwPJzMQJfk9w9saOP
         ts/3t4ANOM9zDD7NwHVZ6wNN3ul42BGNkNXyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722433358; x=1723038158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jllcrUTFrQM9He+XFnKeFXqCJM1ojABnVklonbgRXNU=;
        b=bxh9XuNyN2vzue3kjom61Wtsf6hKbnx8B/RSygU5RHxSZJZS6ODaFzQZgScOiJ/6wt
         9aYmnmRD6kyUdkrkSsulDTB1m7w/N8VDuaQrJ8a6U0mz9eEN3rdb6eM1Lm2fSXVZdjeA
         wyVvHH/S1Blg8FQYu3zi/a77+PItZdxqhTZ2JfzC3mWUPiHDrj5VquahWyuMk3NLhTvS
         EDhZ3OF5BfJ0ngZQ/rQ7zuGz0j2TNQWrRJJeU/PTrNEh4NOGHg2osTbJDEKFm2/+MrZ3
         IQ23A/59shCqUT7vvNkMad25sFdSHCLxgTjUSQq60BMHNEj28oGtGEAWhCwjB62ggwdm
         gBDw==
X-Forwarded-Encrypted: i=1; AJvYcCW7QnzbPdeptU5gvGM3rt3x2e9i+xifDKE3ukeBDFhRMPD3/J26nLxDGLUXP+fg4tk3vb1uMLF403Fu/KHYUYaNpBOmwLAOWzHY
X-Gm-Message-State: AOJu0YxZVcDgK8wY3C1ovxNL7+mjdJRRxAiNmdRz+oVy+e/R3FKjQ4k5
	ZGt61TuCcpjaG3FjoBPsFwZ/rdqW4XW1Ii5uA3TTR/ApsGVVTV9G3nUPhmMGzx4qzKk/EvgsKqY
	t1LFef5xpj5xdow8fc2SJC25Uca0YHCTksUs=
X-Google-Smtp-Source: AGHT+IG0EUyvyJRSoQdoJH1Z5JWM2QHBfuJl83EQO4wydZhzG5/ylFtek7+D0GiK5ct61jwN7iY/AwlXr140KFw7X04=
X-Received: by 2002:ac2:4558:0:b0:52e:be2c:4b05 with SMTP id
 2adb3069b0e04-5309b27d284mr7878242e87.21.1722433357460; Wed, 31 Jul 2024
 06:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725074857.623299-1-ukaszb@chromium.org> <121d85fe-976a-43c4-95d2-1a066234a758@linux.intel.com>
 <CALwA+Na218B0PK3QG20_XFovJMfB4ud7B9Z=4kX=xwu8bjAvHA@mail.gmail.com>
 <115eb4be-e336-4a29-84d2-bdafb84a0f9f@linux.intel.com> <CALwA+NbLsg2qfmaHagMNimN0mvU6vNP-rsY31O-9X6oZovAOJQ@mail.gmail.com>
 <8cc19d0a-80f3-48a4-9fd2-0cc42b8ed1f4@linux.intel.com>
In-Reply-To: <8cc19d0a-80f3-48a4-9fd2-0cc42b8ed1f4@linux.intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 31 Jul 2024 15:42:25 +0200
Message-ID: <CALwA+Na_SORXHFr-GZJtPu_HySd9dwo+UAUsv0sYanrH501o4Q@mail.gmail.com>
Subject: Re: [PATCH v2] xhci: dbc: fix handling ClearFeature Halt requests
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 2:47=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 31.7.2024 15.28, =C5=81ukasz Bartosik wrote:
> > On Tue, Jul 30, 2024 at 5:45=E2=80=AFPM Mathias Nyman
> > <mathias.nyman@linux.intel.com> wrote:
> >>
> >> On 30.7.2024 3.17, =C5=81ukasz Bartosik wrote:
> >>> On Mon, Jul 29, 2024 at 4:11=E2=80=AFPM Mathias Nyman
> >>> <mathias.nyman@linux.intel.com> wrote:
> >>>>
> >>>> Hi
> >>>>
> >>>> On 25.7.2024 10.48, =C5=81ukasz Bartosik wrote:
> >>>>> DbC driver does not handle ClearFeature Halt requests correctly
> >>>>> which in turn may lead to dropping packets on the receive path.
> >>>>
> >>>> Nice catch.
> >>>> Looks like a halted endpoint is treated almost as a disconnect.
> >>>>
> >>
> >>
> >> I pushed my thoughts to a "fix_dbc_halted_ep" branch, it compiles but =
is not complete.
> >> It mostly focuses on getting the STALL case for bulk-in working which =
this report was
> >> about.
> >>
> >> I think the code itself best describes what I'm trying to do.
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_dbc_=
halted_ep
> >> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit=
/?h=3Dfix_dbc_halted_ep&id=3D8532b621314e93336535528d5d45e41974c75e01
> >>
> >> If you can try it out it would be great.
> >>
> >
> > Sure I will test your patch and get back with the result.
>
> Thanks, that patch was missing a "ctrl =3D readl(&dbc->regs->control);" l=
ine
>
> It's now fixed here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/commit/?h=
=3Dfix_dbc_halted_ep&id=3Dcf99b473a1477c1b3510af0021877197a039c43f
>
> Can you try that instead
>

I will. Thanks for the update.

=C5=81ukasz

> Thanks
> Mathias
>

