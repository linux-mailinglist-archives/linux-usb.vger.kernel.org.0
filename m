Return-Path: <linux-usb+bounces-15337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F829983D72
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 08:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91DB1B22651
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 06:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAC0481B3;
	Tue, 24 Sep 2024 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fstab.de header.i=@fstab.de header.b="R/8KoX3o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD5181745
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727161118; cv=none; b=fHWkY20bN6/YeuY+VKoybzrrOxi9hL2PVvGeHWn5ENBB8vh9ur3LQccJgRCqGc9KJL0N8z7OUEOGNpHERitUsoOlvpDk5ukDG4dkoqBDQ7uJvGvHrNGVAfuhBJY10uUUR+19HesoMY+YDeIkcoGRBoMGsFh6R9J0ZO4OYt9PmGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727161118; c=relaxed/simple;
	bh=07q9ahYM/nP+CJ0HMHVEG+85azyTF6BeNrjm3O9SQGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eaEIt7Z4pxpmi3y92eDzFw0Yw8y5DyUQcBxT2LhsEErPz7byYf6DRDWWPkxr72rcKL2MATWBmedWbRyMggvBW6cbiN7yvE5El0RjXM67/w3cf3QbYqj+3vdAy6W9BwdRTj+2aUqI25OdfQG6Ks8I/2uMX3NhHdogI5a2b+ObUSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fstab.de; spf=pass smtp.mailfrom=fstab.de; dkim=pass (2048-bit key) header.d=fstab.de header.i=@fstab.de header.b=R/8KoX3o; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fstab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fstab.de
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6c582ca168fso35283066d6.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 23:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fstab.de; s=google; t=1727161115; x=1727765915; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07q9ahYM/nP+CJ0HMHVEG+85azyTF6BeNrjm3O9SQGs=;
        b=R/8KoX3oIk6MckCsnIIc/2Jee+UrhLstJohwv/DepTP4naFJ/uPCrF+gX4XSXB6ooT
         TE4TOMCyOLheK8Gv2QXExWJ5IjdiD5/7ZPOfDQSjIN8eYHXWc2pxpfZ7XydVllnlnASF
         OQJpcl+CLxz6L6+aJije/tbq7ctlh43zUznjP/0l0q6T5PCn7SxeMn5NLowJb4VSSxaD
         gn2/1LQSmw3aOLK+iZTidgs1Nt1/hgA8P1GuLV2ARWsdrSc+SPUKUo16fRHUF4IUfif8
         KSCKbDnQYhvV4TZWMfID4mKywVCNfNR8mwxh+lRRenTtT8bbbxKq+c+BbajkojNDFX2R
         SCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727161115; x=1727765915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07q9ahYM/nP+CJ0HMHVEG+85azyTF6BeNrjm3O9SQGs=;
        b=G/TKiwx6pt4zPFKHscxRx9edWGqNqSHLg0HBLGOzhQUxKK/5UnahXVwe7Ns+v9PdCe
         m5ryMEVI8aX7BfAbiPF37n0HbYCMsu4b8t/0qYxkRxWT6PvTJhw6nc5Fi/tShAumx7Yg
         wnrJ6E8Vb3dk5T0qXJp1OS9h6SgVbgSH4hrIBqqmTaUJsmLm5tzLJ1+aLkVijeHo56Nt
         R90h/NeVdy51Sievn6ewGc1pZ8lEy2CN7Mg4TzuLmYIM7PSwWZz21bBKcs0wqhzVpaH2
         wQNNrOvoRKyBwXQ7ZPfQniX4owzLWMkWCwAb03qbPzLMHHFX8ycQGDdADoiEjxeCDqAb
         9eGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3iWLFkH/vK4GfSzokUAhDACI0f1B95A+yHT1QHo95zedzIXZ9UwM949iGiSdgo0aqL4qdMkSYf8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVy3u0feozqgI8wLm44BJ0xYGO7qlS83aFo85WNUBvpTPwOmn
	nm6FI4EVfvnHDDwZL4xMDGcHzBTYukb3i81nlGNf9jpWSfqZXyMuT1+nAutXOyqREmiRlQHab1Z
	l4rilm2lqamcrHQuBCrZ9mFpPLFl7R1tswdqxxw==
X-Google-Smtp-Source: AGHT+IFXJduceOyuYmjFZFES4FBzZayxNGhe01YJ32akwYi9lbFIAX7peTclwe0Uro0bKhwdttyXSE5jwSC68MbxVT4=
X-Received: by 2002:a05:6214:5d11:b0:6c5:8125:d7c2 with SMTP id
 6a1803df08f44-6c7bc6f1a81mr244109976d6.26.1727161115375; Mon, 23 Sep 2024
 23:58:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPX310gmJeYhE2C6-==rKSDh6wAmoR8R5-pjEOgYD3AP+Si+0w@mail.gmail.com>
 <2024092318-pregnancy-handwoven-3458@gregkh>
In-Reply-To: <2024092318-pregnancy-handwoven-3458@gregkh>
From: =?UTF-8?Q?Fabian_St=C3=A4ber?= <fabian@fstab.de>
Date: Tue, 24 Sep 2024 08:58:24 +0200
Message-ID: <CAPX310hNn28m3gxmtus0=EAb3wXvDTgG2HXyR63CBW7HKxYkpg@mail.gmail.com>
Subject: Re: Dell WD19TB Thunderbolt Dock not working with kernel > 6.6.28-1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

I can reproduce the issue with the upstream Linux kernel: I compiled
6.6.28 and 6.6.29 from source: 6.6.28 works, 6.6.29 doesn't.

I'll learn how to do 'git bisect' to narrow it down to the offending commit=
.

The non-lts kernel is also broken.

Fabian

On Mon, Sep 23, 2024 at 8:45=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Sep 23, 2024 at 08:34:23AM +0200, Fabian St=C3=A4ber wrote:
> > Hi,
>
> Adding the linux-usb list.
>
> > I got a Dell WD19TBS Thunderbolt Dock, and it has been working with
> > Linux for years without issues. However, updating to
> > linux-lts-6.6.29-1 or newer breaks the USB ports on my Dock. Using the
> > latest non-LTS kernel doesn't help, it also breaks the USB ports.
> >
> > Downgrading the kernel to linux-lts-6.6.28-1 works. This is the last
> > working version.
> >
> > I opened a thread on the Arch Linux forum
> > https://bbs.archlinux.org/viewtopic.php?id=3D299604 with some dmesg
> > output. However, it sounds like this is a regression in the Linux
> > kernel, so I'm posting this here as well.
> >
> > Let me know if you need any more info.
>
> Is there any way you can use 'git bisect' to test inbetween kernel
> versions/commits to find the offending change?
>
> Does the non-lts arch kernel work properly?
>
> thanks,
>
> greg k-h

