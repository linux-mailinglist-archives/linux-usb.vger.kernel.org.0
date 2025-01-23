Return-Path: <linux-usb+bounces-19677-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D5A1A6D8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E9D21690B5
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BD4211701;
	Thu, 23 Jan 2025 15:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5ppztmt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3FE20B22;
	Thu, 23 Jan 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645329; cv=none; b=FlksQO4/GL/fbRsCOnW0jNHSXfI2u5ci6ZjPg47Kngb+uJ3SsxGMUkRneQ3irPXAR7y/SaN2eery3RD02uLl0jMARBVlp6UW+rc7C30n918GxZu9GXDncYf0JPUU5+wfZsV4WgGvpRTxM9BzvSdMjwzGhasIocbE/D5BZODK9Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645329; c=relaxed/simple;
	bh=NWhksfyYko7Hl7PUJsqNiyWdCFxm69M1FQLArme4S/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sc0LD0VIqPbHZOT4Y7YuYft5/siLDYEhALnfAnL5R0BAFzcHPbFmSvsBQYZn3Fr47mngph2eigLPGzyGJOjds2OZydrrpASgsBOCIQFhkVI3ij0ZHk2STTWQl+S7tWEEE6mL/VHz1sHYi8/kFXQ2gmCnZAwifAddVlL2RRc61zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5ppztmt; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46769b34cbfso16452641cf.0;
        Thu, 23 Jan 2025 07:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737645327; x=1738250127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5J9+bh1wvgqFbUM9Zsb8mjxSdn7EtJd7i19Xwq8KPw=;
        b=Y5ppztmtgJwShx5rKQX81ztuSx+xWOtt8+sIqsokHClyfF8qRKCp5z0qxpgjmnwlnB
         qedGUiISZ3YxyubQseE2Mm1DY/02McPXGC4zJHpo/k2Y+KNASyEs3/P+6aQ9o8AquBgJ
         ovbEE4fkdkfyExnm3xlhgYXpIFZxtI3hzANIcQUT987o3c0trotCsT1PMcKBLaAtbxl+
         jY4qz229mcIY8N+Ceofid/QnKl4Sgak2dDRmiBB5hPnJihCxX+E+afK+gJwoh2dDNSVP
         wselvyyGTdrJF/io9/jjh/XJh6Euw2IX7ljNRJ4JUUz468lhbbnn7rq35ws24F4cxvb6
         LAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737645327; x=1738250127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5J9+bh1wvgqFbUM9Zsb8mjxSdn7EtJd7i19Xwq8KPw=;
        b=OFBxd3u7MBsH8/EUKYmmxoJgBbd+VgOr52y1O3svhmaeM1uJaoTf/lwtqI1yfrefz9
         Ylrlh4jqIYdp7mX2af0tzP+DuQyMk95Amxjw7xxM2sSpUl3z1dhrftfnK9VBIr+NAqiJ
         J+p/cISq2mJ+aSxg/TtIScI/soAy3a9lqQ4pqb5JO0VMzf3KSrS9fGteol15rR5ke12X
         6UeK/sdGm+Lrm+wBARcXHXNbkol2Bk4bo5y0zqUHTnR3UAP9Sd+M8zqbjmm2pDQZdXvM
         TYLfW6tln606tsMwwbvEVJyfYnADAXaPBO8X5Xeupxc7AxeDn05xggKnQ6mIQq8B8rAP
         IBWA==
X-Forwarded-Encrypted: i=1; AJvYcCVkQPaso0lH04CRQbHj85/iBI1QsrsgdZ7ZErn0flS5id7kkDLNpLLvgi+eaGYfAiOg1grVubmYgfPf@vger.kernel.org, AJvYcCVpRuLwYQKVrpUh6xeg5pk4MN4QThJq3COe9+keruZdASe8jFsRekC4YSVGwVe32WgTv4tl9MjV6wlxaKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZZf/G+C2/DguvwOzB32uKeB3/yQ2PiB0T4QmdrzFz+yzNrGg
	/wkPNveezYgwCZwjzi+RlZsRL8p8NJUkipa2jjBKlZJjO3YIqvFEV1cDc9KzsiZ95e9TyJULcbm
	Lof1I9b9+k5htEKsXMlS36e9YwjfE8pEC
X-Gm-Gg: ASbGnctmGdprpP1G/fc4RSEHo6A+o5C9r8G1WkAtVFMNS5mrXCc1AjfLJ7jP9et/D67
	s75PvZ2cuzxi1rpYiKkhh7BGbJwQi2Ik5i1QS1AeF0Fid6kcNo+Wr6DKmeOR0Uw==
X-Google-Smtp-Source: AGHT+IEqAX1T5lOFIon2lw42VIMQUdQEIwXsO5LqaueEtGjKqJjhBpZfqZKODzmCfGk4ssRPViqCfzHBKv1W4DqdBHA=
X-Received: by 2002:a05:622a:487:b0:467:6133:3372 with SMTP id
 d75a77b69052e-46e12ab7422mr404421171cf.25.1737645326773; Thu, 23 Jan 2025
 07:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
 <2025012315-feminine-spiny-b288@gregkh> <CAPSxiM9vF0=fzOovxC2nj1t1Naxx9T=QJPaN-oi5U-h7s5OwLQ@mail.gmail.com>
 <2025012322-fit-flagship-381c@gregkh>
In-Reply-To: <2025012322-fit-flagship-381c@gregkh>
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
Date: Thu, 23 Jan 2025 20:45:15 +0530
X-Gm-Features: AWEUYZltfppv6UQH92CYMneho0yRrKTj8ucmWvhBq0X7NUjCbN8ly5i0YuuybR4
Message-ID: <CAPSxiM-iFfntGgfbKja_vhme05Owi0RFHAHC2n6tS+5NfkD2Mg@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: Fix documentation warning for sg member
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 7:52=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Jan 23, 2025 at 07:47:18PM +0530, Usman Akinyemi wrote:
> > On Thu, Jan 23, 2025 at 7:37=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 01:31:02PM +0530, Usman Akinyemi wrote:
> > > > The 'sg' member in struct dwc3_request was undocumented, causing a
> > > > documentation warning when building the kernel docs.
> > > >
> > > > This patch adds a description for the 'sg' field, resolving the war=
ning.
> > > >
> > > > Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
> > >
> > > What commit id does this fix?  And what about the reported-by: line?
> > >
> > > thanks,
> > >
> > Hi Greg,
> >
> > Thanks for replying.
> >
> > I was applying to Linux Mentorship(LFX) for fixing the Linux Kernel Bug=
s.
> > One of the tasks was to look for documentation warnings and I saw this.
> >
> > I created a patch for it and sent it also. So, it is not reported.
>
> It was, you might have missed it on the mailing list:
>         https://lore.kernel.org/r/20250120182219.30dcb3c6@canb.auug.org.a=
u
>
> Also it still needs a "Fixes:" tag.
>
> thanks,
Thanks for this, I am sorry, I did not know.

I sent the updated version. I hope it fixes this.

Thank you.
>
> greg k-h

