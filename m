Return-Path: <linux-usb+bounces-19682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C143AA1A74F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:52:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 175E01687F0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EA5212B29;
	Thu, 23 Jan 2025 15:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnnDWWd0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFB1288A2;
	Thu, 23 Jan 2025 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647534; cv=none; b=CEfXvora1KqGjfdYwKX/lmZ7nApaMDu5t7PPl74NJGQPca6RDjH1FD9QniTIEzAMKJj/VJo/pssqlRHjtmd8/8cmT4gVMc2KI0JujhFgVUVVqQsfA0cFdHBDnvG63HE52pAir/QQi6iUUzKabk2YJXmwCvxT28naHL3Jm0gH+DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647534; c=relaxed/simple;
	bh=03w5UWu/O3ekB7lvpky/GfWarqi6PIliEIHCCynI+k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIhFqdJclOrm5vkxhSHhNASIoIH8aB3fAIWKL4rtJ8I8znhzpCB+sAVhBMb8aG3OXnnLxvNAusuAcpFUBBBvWJ/PkhFquokWx8GJ2/CV5LBk/aYOSlysfovYoWlcCK9CdSHKMBXEiuTes8AVypzHNZylUF3Hbb3QYxsq5oBTYko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnnDWWd0; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afe70b41a8so306193137.3;
        Thu, 23 Jan 2025 07:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737647532; x=1738252332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj06bp/HITRtXVBRV4Lbjlj+8PZj2C8OFIZlbtoqH18=;
        b=MnnDWWd0ZKAdBNlX8/mrUtLJKsXRFG54meVI4rylBtC0+4tiAXM0ubE+5/4FvkgBj2
         1KnKtgDuGN99yWSNArBYsDh/po7IDwwDw9gQ0e+vdYHyb5YAWrSdLBF5EaUae8cXgwTC
         SnIAJ+dvFE+tDeCJjG1HjnxTWeTFCyKLPF/FdICs122h+myD46qV0zbAhanjdvNkpoFD
         4HNzeFRB4HH1JG2WVWHGV3K0OliY+E/Ti7ZgqGGl+VRE1y689hHh/GO068EGPlKBI7yU
         uQ0LgeBSZYJ9xkDIz+vL2obYa1IoMb6ig9gV8+JaCfXG4Wzsu1ICWSTM7bV2e25oA05e
         uxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737647532; x=1738252332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rj06bp/HITRtXVBRV4Lbjlj+8PZj2C8OFIZlbtoqH18=;
        b=hPkDPKaUZ8g+IfM9iMtlWedNz+cxviMkpyfcL/tA3j4paXKOzOSGR7tdK56ZpBoei/
         tSx4W0T2G+62DqZSsQcGC39jcmFi2BndSRiHlUSgokVm96Q71Z20bBwXX8TLna8yCdHe
         0zTGPiqAAAJZGm2TNI/E9FcuFXvXzP8S+9WTW9eQVoQVna6b/Zx0iNvFKtZxj3efIEex
         0dIzhEmozZNYanh9OEwj6FR0kto5GC/o9dLvECBvqcgx0KCQLc7sOJJ5TcdsBaIU4eh2
         LhMgkzR3vIwt7un321CIXzLq/ExyC5Sg3SBGX2Iz7GKnos0apvK0brCoeBJJsoh49dHb
         CTYw==
X-Forwarded-Encrypted: i=1; AJvYcCWCgwJzPq8h2GhvYOnzQDPeOrou7BUPtlnBEEYlW6P0wIk0xRPDx37zZLEvJM/QpQbTa3w2IP0EVCoi@vger.kernel.org, AJvYcCWYZg03elbYcpRJfpsPAJyeCPE8Rq/aT3MdNnNZu6T245jnFfsgGpVk0N0N/s230Qqpkw8a9KoaGnNP+xg=@vger.kernel.org
X-Gm-Message-State: AOJu0YywrvgvO8To4SwO5N3tkTwJf3XrdN+NMb1q1XmjTKi4BFuw9iyw
	FQaT9Z7aOzxL5hRgMBMBvMs3G7A/nL/ZUEulxZZPQnI0X9/hc9La3L95Pqqa1M7Et2XKOsVo9rx
	gmiaRouOVtqv2sbXf8XO23UxiSzLwA7A+
X-Gm-Gg: ASbGncvhvxPE9nGQAe9js9aGa+Gl72Srh2OJtfoGXK83zwm0thfZxhAbVN979bkzIKy
	StEaDkep59TYyiCUX2XhweY+SleBE6CKHlVBZOScrwKD6I3aUyUSeeefU8uPwGQ==
X-Google-Smtp-Source: AGHT+IFA4lIslzzScQrTmg54GabFpm44eLphwSn8a2SauIK5gkJFZ5JYkjyNYt7W0yfPVI4XC98tdVYwERdiIZN1eXg=
X-Received: by 2002:a05:6102:3f03:b0:4b2:5ce4:2b4f with SMTP id
 ada2fe7eead31-4b690b5d82dmr24555537137.2.1737647532156; Thu, 23 Jan 2025
 07:52:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
 <20250123151335.15878-1-usmanakinyemi202@gmail.com> <2025012309-catfight-tightly-32f9@gregkh>
In-Reply-To: <2025012309-catfight-tightly-32f9@gregkh>
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
Date: Thu, 23 Jan 2025 21:22:01 +0530
X-Gm-Features: AWEUYZmjVUhFw_e_l90iKoDlnnjkqqXCyfHpm5OwN3Wx5Ph_icR5CyABYkOESa8
Message-ID: <CAPSxiM8wejNRNU04MN6y78aR519GuYrSHe2gV_R-Eim7y7VeqA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: Fix documentation warning for sg member
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 9:08=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jan 23, 2025 at 08:43:35PM +0530, Usman Akinyemi wrote:
> > The 'sg' member in struct dwc3_request was undocumented, causing a
> > documentation warning when building the kernel docs.
> >
> > This patch adds a description for the 'sg' field, resolving the warning=
.
> >
> > Fixes: 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> > ---
> >  drivers/usb/dwc3/core.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index ee73789326bc..0c417a12e6f4 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -941,6 +941,7 @@ struct dwc3_hwparams {
> >   * @request: struct usb_request to be transferred
> >   * @list: a list_head used for request queueing
> >   * @dep: struct dwc3_ep owning this request
> > + * @sg: pointer to a scatterlist for DMA operations
> >   * @start_sg: pointer to the sg which should be queued next
> >   * @num_pending_sgs: counter to pending sgs
> >   * @remaining: amount of data remaining
> > --
> > 2.48.0
>
> Wait, what kernel is this based on?  This structure does not have the
> @sg field in it anymore in linux-next, so why is this warning still
> showing up?
>
> confused,
Ohh, sorry, this is the 6.13.0 version, right from Linus fork on Git.

Maybe, it is already being fixed and I did not have the latest update
as I have some new commits.
>
> greg k-h

