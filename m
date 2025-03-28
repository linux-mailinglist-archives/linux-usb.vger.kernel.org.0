Return-Path: <linux-usb+bounces-22285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E21A746AF
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 10:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24DC917BD8F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 09:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2737219ABC6;
	Fri, 28 Mar 2025 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gfwE08Nb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C575A42A97
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743155881; cv=none; b=hfkRpEvEDpMea9dL5CEVOb+XnRUT/Jtvpv/iKkELm8iHcw70Sxt58bE11bwTVXfpy130DvJMwkQKcx9hhaG9ppWOwMwfQ3v4584wKi0P/1ctgDygJZ9M8QMPROIjSxs0xpxc3Vh0AerM9TUc2nQEPZNT0CazWR9cjQhSf8Qs/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743155881; c=relaxed/simple;
	bh=/gdD/THSWAbwGj67Z++Y9DOQFDCQciwEQVy0s/66uPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2mFCPLpyvMGVsFo+GYoizFYTfngnZwUBCUtMJ5HIlWuviKhZfHirf7lw1hyRDLz7za/2oEKv1iDJPLiWBs0JYf9IrOpbG3hrvUFjwSJMfrylxFvYoS4iN0NE/UontBjsm626cHJn6BbYWov1/acDjGwAgIJQMtuYUVlO1QzzD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gfwE08Nb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301cda78d48so3400671a91.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743155878; x=1743760678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZYtTsrIPAe41J4yNxqv7EJNaaZwNx8BjsgApkuh0T4=;
        b=gfwE08Nbgq1v47BuAb0MtnTI20X63WrdN5cGz7DOs3XDmjDxjPo7Tc3k0GlcISRT0g
         winkEjXzRyhgC5FFVzbgACysCbUT3bEHs2lfk5/CAjS2kOLNQ6MsUa1CTus5Kf33Be5i
         XtshNI6UpizE+EdLZgasjnoQOzHXbyFZnq9qxz2lbqNRSRWqpAWUHqMhI1RmTjSk0NDp
         gocpO0fj9kJdezuvrYPW/efgmIJxjNk8c+JaKWk+59sqzVgvCx9ID7kCrz1hy+lvhPGZ
         O+LkZYuqNaa409kNqK7QCjmQMtp/VG7oFeIWpq2fgyZ7vzE59oHrzSHmqbZzTcP1mTgw
         Hrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743155878; x=1743760678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZYtTsrIPAe41J4yNxqv7EJNaaZwNx8BjsgApkuh0T4=;
        b=vE99YvhDH0mnCLlOlBN8IJvFY84cOg90Td63csrBufVoH1xiBU1jWNdGxzIE0CPxWs
         1ZD8J4zhUpGfLcYzPO/ejYWjH1RrA8Kw8WzgOm2d9V2KY5dTHaXW9FtrrxCVW7LWF5fg
         32KF1KkPaXTpZY0fED7d4ir25ZsnSarCaEMnYLeVdGX4nRgt42M0sZLTSE+UjjTGw6QD
         92XI+pxWWiv9oscAtMzMuwAIEklQ0dOk/s7Z9xNYCF5LErPNRd+3GxEQzESys44vxcN0
         bKPXukWCUQ7UYjo0SGXqj2mojQJCey3rDLx6K0NiFInMtJfTeuNn6/ZdflPNCpB7nnFp
         EUJQ==
X-Gm-Message-State: AOJu0YwIubk7mVLYrhZY/2k3h5rvHU2aOTLp25P6mb09ie2Y2ROnjWHh
	xzi6tpBnwjVOKlye83sdHK1Ps5yihUPKwTg/JEv6PBZytOYjVss+EfXpDIfuh6GgbKfreIVkZl7
	olDNStd13dOBeS9Rs9buW5zFLYK1LQTKrjzaeHg==
X-Gm-Gg: ASbGncu/i2+RUxYxKMQVa+xFzAID9xEgVWTg1kP7uUXYhnYWqC0DkRy8G54upNFWs3a
	UBVtjW1ypfAFLI/horNzgCssodHQg/II0qGTURoo1aoOug29yZWOMAP3J+XDQy3BKDxNrE4unzs
	VHr3Jl7ctiu+VSxo/83DHmAAzU8CL3wM3xngNRhPfiJBtXJ8nif7iomZM5ig==
X-Google-Smtp-Source: AGHT+IGE4kAXJFCC9n+QoE2cCCbaVShG7l41ORulhfn/P60yG/KMJJy+iTpXhi68M/ZKHxzURZyL2wd02G8LBB6pBfU=
X-Received: by 2002:a17:90a:da85:b0:2ff:64c3:3bd4 with SMTP id
 98e67ed59e1d1-303a9185acemr9626243a91.31.1743155877725; Fri, 28 Mar 2025
 02:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328085603.2156517-1-fisaksen@baylibre.com> <2025032841-tactics-linguini-f2ca@gregkh>
In-Reply-To: <2025032841-tactics-linguini-f2ca@gregkh>
From: Frode Isaksen <fisaksen@baylibre.com>
Date: Fri, 28 Mar 2025 10:57:46 +0100
X-Gm-Features: AQ5f1JreJ7KJmb3h6KU36-6MqO-_Efs-A35qTi4DcjR74ln3kGeBSt2hMNT5MLo
Message-ID: <CAJ03sU_Ad4nc=nvNU7Z+bjGYF35BEh_V5suWw+Vi0pb=imSpQA@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: gadget: check that event count does not exceed
 event buffer length
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com, 
	Frode Isaksen <frode@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>What commit id does this fix?
It fixes commit ebbb2d59398fb7ef92fae83d6aeba0cbb2b6f99f ("usb: dwc3:
gadget: use evt->cache for processing events").
>Should it go to stable kernels too?
Don't know, it happens extremely seldom. First seen on kernel 5.10.
Thanks,
Frode


Le ven. 28 mars 2025 =C3=A0 10:10, Greg KH <gregkh@linuxfoundation.org> a =
=C3=A9crit :
>
> On Fri, Mar 28, 2025 at 09:55:25AM +0100, Frode Isaksen wrote:
> > From: Frode Isaksen <frode@meta.com>
> >
> > The event count is read from register DWC3_GEVNTCOUNT.
> > There is a check for the count being zero, but not for exceeding the
> > event buffer length.
> > Check that event count does not exceed event buffer length,
> > avoiding an out-of-bounds access when memcpy'ing the event.
> > Crash log:
> > Unable to handle kernel paging request at virtual address ffffffc0129be=
000
> > pc : __memcpy+0x114/0x180
> > lr : dwc3_check_event_buf+0xec/0x348
> > x3 : 0000000000000030 x2 : 000000000000dfc4
> > x1 : ffffffc0129be000 x0 : ffffff87aad60080
> > Call trace:
> > __memcpy+0x114/0x180
> > dwc3_interrupt+0x24/0x34
> >
> > Signed-off-by: Frode Isaksen <frode@meta.com>
> > ---
> > This bug was discovered, tested and fixed (no more crashes seen) on Met=
a Quest 3 device.
> > Also tested on T.I. AM62x board.
>
> What commit id does this fix?  Should it go to stable kernels too?
>
> thanks,
>
> greg k-h

