Return-Path: <linux-usb+bounces-31120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D440C9D9BA
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 04:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5F6B834AB02
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 03:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF582522B6;
	Wed,  3 Dec 2025 03:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LqQ0Bp7K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A97B23D7E6
	for <linux-usb@vger.kernel.org>; Wed,  3 Dec 2025 03:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764731136; cv=none; b=cTgZxR3B+59LrqCeyjke6zBquMRBsMZ2MKVEECFwo2h3LHV5WRUoyagq4CaifBI9w7ezRg4z1dyODI3fTkx+k2brGULVD+C94+x7gRx3jW6n1vpZPa0aCo0ZnDV2t+cIPLLrNjH2tykiJJETsH7WQL8dnwCH0hmG585rDJmu12E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764731136; c=relaxed/simple;
	bh=meSucs6aX2A4XVy1F+K5x4iZpmFlAAKDNrrl/ysjrUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HrkluWbtJoMBuUa7dDcRlBURCyhwWWH/8SfjliXu6524iP22qs/1ynz1M3xmm4aMgxGWTXo1eNKufwz8lt60dr+oNFHy7dCB/eCyQ16dlIKhjoNVsBYahBhrrAmq8ATEJ1NoyMuHUhfWCDJPzUmMDSBrntaaoSJTCgJ1y9y1xE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LqQ0Bp7K; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2981f9ce15cso71870525ad.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Dec 2025 19:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764731135; x=1765335935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SUCSRcAh5wfvR1Ga9HOQmp+DboJkGyQoezHpnT4C/w=;
        b=LqQ0Bp7KhS0KhismEEr5+U8U6Bi/4Vf18CBWatmFix6oD1V3A37C2kJBZ9RbHTv5Ml
         QV9cbCseb+9r9alfZqburW/bcGrAgNVch9zypXszFw4g0YK0vn+F3/q8ujpeSKiwreMN
         vrkYicNeobrKKpzcWG+YjUUNjvMCCdkjPZ98ncffWT4Nh3/bNWKEuiPmpMaWAJ0w03HI
         OAs52Il3c16lh8qBysG8QOO2W0BQrsb2DYvzpFV+j36ty19skiyz85pvM656vyPodkK1
         gOt5UuEeTAQrYQ7cvRs+brj/JVHHJ8LpdrZSpOFq4eNpgwmf+70hHMSx4tTvQO6K2QdC
         y+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764731135; x=1765335935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SUCSRcAh5wfvR1Ga9HOQmp+DboJkGyQoezHpnT4C/w=;
        b=bsiyr9hJVugOEsYjqdUZ2IGt9E+/Lm32RsfPnxXr4x9MhdJw3tp1sD/tTR9JCd2KrO
         H955wmro9p0EBDxlzbOuwQIvlz8DPkXkFyLN6CYSAWFWljQuoMQo89muAs9/CRuFB26z
         fQfd4TmppMZ4L2kkyGmhb34t86onZg8tJ7hQO2VcVyRl8bOnxOR1qqTu1LfPpKxISjC5
         2h1G32OfNJ+8KC3EnjhS2G+WVmrcR7O9XkwQXGU9EkLf+x/YIv8D31aEh7beagWZOox/
         ZDA4DjdFIeTehPmWU/C4UhDzSetiG0eO8jNAwTmN1dFARfhoAffb7HiXreP9dtuVEPzg
         fTAA==
X-Forwarded-Encrypted: i=1; AJvYcCXDa5u2JQyQZUZBcbxB7oyfOVyc34WO5qr2n30Jv38wkIsa91JQqySLtQaSBFb0n4djMFOwgbsbuZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7sdvUAROoUF2/wV0159tZ4H3miXH25/Jc0pRAgoepR0GxKXS3
	gMr+ixvtZAg1jFMzMdR5n6xSmNpLgrVff4r8E4EA4/VcUuLwR2aCJuY2bdUSzZx4ujGXkpd4vo7
	RcsIqpJiV7eQV+Ke8N2RseSKemxIj1n6hw5iY3nYh
X-Gm-Gg: ASbGncteOLA4jbPkN8DDZCNjJXQfh3mnZR6YwrOHLSevFqgQ4uT1jVQQ/w08e60rJNC
	COdMxi2x5EAgvRVyG8ZiK0fOrsyPRD14mxrthu7g2Q3uRO/aUVnCU1BogIbqBm/3TAgb4/Tgdoh
	YHv3ny+d61KZTOYLPj6/lMQCSL1RKJOmTScXH7mGB12XAzhlc8Gp51Yg1KfRjJunxIxaZvRUyS+
	ta3IReFshEaXq2HBfvLzBlKh6a/ha3qiD2fAjZAt3tZhhL4Jbzx2Uhb2RCAxVyBpfpWgbDbD8xE
	eS+agg==
X-Google-Smtp-Source: AGHT+IEaw/KAaB9NQPn92QcJbyFAkEiHxEvdc+JFEc5o3oBuUZIzccLg55YH3cTE7CxVtrjUj9n7SYHTGXfIZWZDfhI=
X-Received: by 2002:a05:7022:1b0f:b0:119:e569:fba0 with SMTP id
 a92af1059eb24-11df0bee281mr624917c88.15.1764731133682; Tue, 02 Dec 2025
 19:05:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <2025112226-heave-refrain-53e6@gregkh>
 <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
 <2025120209-unstylish-john-2a6c@gregkh> <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
 <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
In-Reply-To: <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 3 Dec 2025 11:04:56 +0800
X-Gm-Features: AWmQ_bnH8zw5DfDwDs1QuKD2A0QWVUVTK2D542APdmuEtTsd_99YivSDqmKY8X8
Message-ID: <CA+zupgwiJmS9+MFt8F02HrPkRYPDidjg9dxNUJxd8d_0RM6cww@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Doug Anderson <dianders@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Tue, Dec 2, 2025 at 1:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > >> I plan to add ARCH_GOOGLE as a dependency in the next
> > >> version per [1], so the "depends on" would probably look like
> > >> the following per your suggestion:
> > >
> > > But "Google" is not an arch :(
> > >
> > > And really, the whole "only have a sub-arch symbol" is something that
> > > personally, I think is totally wrong and prevents kernel images from
> > > being built for more than one "arch".  As an example, the Android GKI
> >
> > Probably you think ARCH_FOO as arch/FOO/ directory, but this is not the
> > case. ARCH_FOO in this context is SoC platform, so e.g.
> > arch/arm64/boot/dts/FOO/.
> >
> > All of ARCH_FOO build into one image and that's recommended way to limi=
t
> > unnecessary drivers.
> >
> > It's just confusing naming for whatever reason.
> >
> > > kernel has to support more than one of these, so what does putting th=
is
> > > behind a symbol that no one will actually use mean anything?  Android
> > > will never be only building a ARCH_GOOGLE kernel.
> >
> > But distros will be, people will be. OK, maybe not for ARCH_GOOGLE, but
> > ARCH_QCOM we do for Qualcomm-based laptops and embedded folks even more=
.
> >
> > We had this talk in the past. The point is that these drivers here are
> > unusable outside of that hardware platform, so only when you choose
> > hardware platform (ARCH_EXYNOS, ARCH_GOOGLE, ARCH_QCOM) you will be abl=
e
> > to choose these drivers.
> >
> > You can also look at ARCH_FOO a bit orthogonal to actual kernel
> > architecture, because ARCH_EXYNOS is for both arm (arm32) and arm64. Th=
e
> > drivers should be available for all Exynos-platforms, regardless whethe=
r
> > this is arm32 or arm64.
>
> FWIW I don't feel strongly about the ARCH_XYZ Kconfig settings, but
> I'd tend to agree with Krzysztof that I personally find them useful.
> Sure, it's fine to just turn all of the ARCH_XYZ values on and they
> shouldn't conflict with each other, but it provides an easy way for
> someone to know that certain drivers are only useful if the kernel
> you're building supports a given arch. If I'm building a kernel that
> doesn't need to support any Qualcomm boards, for instance, I can just
> turn that arch off and I don't even need to think about all of the
> Qualcomm-related config options.
>
> FWIW, if you do add a "depend" on ARCH_GOOGLE you should mention
> somewhere (maybe "after the cut" in your patch) that ARCH_GOOGLE
> doesn't exist yet. It should eventually exist when some version of
> this patch lands:
>
> https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e098393=
0a1f1395814@changeid/
>
> ...but it's not there yet. ;-)
>
> -Doug

Hi all,

I appreciate the detailed discussion regarding Kconfig dependencies.
Based on all the feedback, I'll make the following adjustments:
- I will update the Kconfig dependency to depends on
  ARCH_GOOGLE || COMPILE_TEST and drop the other
  dependencies on OF && COMMON_CLK && RESET_CONTROLLER
  as suggested by Krzysztof. This should also address the build
  coverage concern from Greg.
- As Doug pointed out, the ARCH_GOOGLE Kconfig option does
  not exist... yet. I will add a note about this in the next version.

Thank you all again for helping me improve this patch.
I will send out a new version with these changes soon.

Regards,
Roy Luo

