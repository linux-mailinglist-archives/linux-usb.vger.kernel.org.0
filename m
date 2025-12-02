Return-Path: <linux-usb+bounces-31109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BCC9C2F0
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 17:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3247D3A24F9
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 16:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3D12853F7;
	Tue,  2 Dec 2025 16:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0qAAYlaL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA81279DC0
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 16:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764692727; cv=none; b=ITzLe7ZfToSv6GMAquCS1BkpoKJ+hIU9HpTIWsDo86Kz1CRj93SMhuQAZyThI1p0wKGZr7wT6ND04tGek4iA2kodO9jbYvOaCobXpyghmyexExTyL+GB9IMYg+p/N09faSsF/0kbdHs0waQLHbu86wA9JttCwZQadpP5loSfcMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764692727; c=relaxed/simple;
	bh=nZdtivljgxNkSnyAU+uPi1o13Tk7h3FCZtl989MAkTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sb10xnkd5BZhOogW1MHCqD+PHbBGUKvYyF/bFne39UsWz5XS1kTWQi6QSyewXg4u3ziZD+K2MtyhfF+WKOy/Ln8ZkLaB83+7RJkQFw4xYaqvFpzl9OnZ/eWbd3Qq69XvbuBucKPJkLyKp4tdVxzdZKNpsgkgRuUQd34c6T9VqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0qAAYlaL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775895d69cso25134335e9.0
        for <linux-usb@vger.kernel.org>; Tue, 02 Dec 2025 08:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764692724; x=1765297524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CUlMgoqtU94MhEJOHiTF0drSAqmoR7IifiR5EWvc1M=;
        b=0qAAYlaLYhBKcbotCxlVIUQUaJSAXCnrTbG6ElPD5SkhYU0J3w5k581lAPxiM71yYu
         KhTibt2Upn+BS7+zyCz2zjVweKOhBm7mrxFz41KkdQIT88VBjR58IsZhjpUQHiG1PPM+
         P1D3hIlPyZlB/ULoenNZTBsYTneqRdMeFZPUw5jihbX7dSdfs5kyKmS0y23tCHy7UXn+
         sUyth23bw0jZHko4eaQicnBPZ8cC9nkLW9cnCgV3kh4WnIQfKZq4xgfldJvb+D0uhU0q
         kUweWAqtga4m2ioKgQQJ4Q9JsIMNGHG/Lpa79xnPTURgdOjjYh6OHifQMsOu6p0jOCQg
         LMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764692724; x=1765297524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CUlMgoqtU94MhEJOHiTF0drSAqmoR7IifiR5EWvc1M=;
        b=IZIm+p9A9SxwVkPkltnNIRYSlDJY6CnsIGXOaHbmMIHmNeUE2qPMPbzO7wE8NZ/0tP
         BWHZtE/s0ohKZSjjY/8kcRUiQhOCgkQy+Mu/iHm802xnd2e15HgSxbF+WVOyWnaaFa0P
         vv/egWObH5CEg7nYGYAmZuC6dWMiD2OU06Zgzq1tt2PvRJMPsFEKBA2bBavyaJIxvZAH
         by7oNlE9GJLzmxhqrXnQhjE0VcWxsuyAsACIAxoZxOu2IR3mCJl1o+fG3ztm6jMmD0vx
         Q1nxAUhVkyv2BzUlMwaAACJt82i5tiRi/E27L+TwfHLpLWRhtAX/Y9wYnhvKLeAdSGkz
         mobw==
X-Forwarded-Encrypted: i=1; AJvYcCWx4ysPKgN02Zvt4VEZXP9Kb9OjCeAyk5psm99hmLfTtkSmRrjw/lFN9RBd43L9Cxsa4QDFKZKl0tM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3IhFO8VO9YGWzlI2C6qI/JBlosmZHz+o9UjufKclfvZuMTgZs
	xgtsZ9QpowH0AauMMB3HZBAQmRhr8eDETUxLSO//OZncjothiMRpY94v4izZ61V0LiXBLBVIb84
	2IRRyR0A49MPIw7f7Aph+/DZDAQk7tc3LXTIuYcjs
X-Gm-Gg: ASbGncv7GziYiZO6Cr5tu638QffFsPY/j9IYn+rT6Qz4IN2ghCY42NfY8reIfCC9OGK
	+gQdH3cX9vEwvT5GIOxWO+sy78HwRsamd582ZCRvydtH+7RjilNiec4/ANkhwoazvNNefAmmgnF
	QJXHNF17HeFFNdHeQV6GO9dNOobCopmQJVfdi0RjyQR3oT+5vEGto2aM4E3L6IrIX7zhbjjN90Y
	9I2jZP2z29ulC0HAJmZE0GvbdiQHzzvQ3ty6Y2UcT5DFGm068QSnXF7lrmM19VtOoR6BdNIWUcA
	srqSmHpdCGkePk2qJ/5WTtgpaObefRyb63B5
X-Google-Smtp-Source: AGHT+IE4G9icvFTi4G31CX4WGeT5pU2lGVP4hWaU0UtxQPpBaqTsf8OMaEZe1X38AnxII3RFCgHJu8dMtfftlpYsffA=
X-Received: by 2002:a05:600c:1547:b0:46f:d682:3c3d with SMTP id
 5b1f17b1804b1-47904adff1cmr325914555e9.13.1764692723568; Tue, 02 Dec 2025
 08:25:23 -0800 (PST)
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
In-Reply-To: <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
From: Doug Anderson <dianders@google.com>
Date: Tue, 2 Dec 2025 08:25:12 -0800
X-Gm-Features: AWmQ_blwqi9oyEjuzVvnRUnzW3pTAJekeVpgwKfN72pLxhs1IzFYcf2tLSKp3Dg
Message-ID: <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Roy Luo <royluo@google.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 2, 2025 at 1:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> >> I plan to add ARCH_GOOGLE as a dependency in the next
> >> version per [1], so the "depends on" would probably look like
> >> the following per your suggestion:
> >
> > But "Google" is not an arch :(
> >
> > And really, the whole "only have a sub-arch symbol" is something that
> > personally, I think is totally wrong and prevents kernel images from
> > being built for more than one "arch".  As an example, the Android GKI
>
> Probably you think ARCH_FOO as arch/FOO/ directory, but this is not the
> case. ARCH_FOO in this context is SoC platform, so e.g.
> arch/arm64/boot/dts/FOO/.
>
> All of ARCH_FOO build into one image and that's recommended way to limit
> unnecessary drivers.
>
> It's just confusing naming for whatever reason.
>
> > kernel has to support more than one of these, so what does putting this
> > behind a symbol that no one will actually use mean anything?  Android
> > will never be only building a ARCH_GOOGLE kernel.
>
> But distros will be, people will be. OK, maybe not for ARCH_GOOGLE, but
> ARCH_QCOM we do for Qualcomm-based laptops and embedded folks even more.
>
> We had this talk in the past. The point is that these drivers here are
> unusable outside of that hardware platform, so only when you choose
> hardware platform (ARCH_EXYNOS, ARCH_GOOGLE, ARCH_QCOM) you will be able
> to choose these drivers.
>
> You can also look at ARCH_FOO a bit orthogonal to actual kernel
> architecture, because ARCH_EXYNOS is for both arm (arm32) and arm64. The
> drivers should be available for all Exynos-platforms, regardless whether
> this is arm32 or arm64.

FWIW I don't feel strongly about the ARCH_XYZ Kconfig settings, but
I'd tend to agree with Krzysztof that I personally find them useful.
Sure, it's fine to just turn all of the ARCH_XYZ values on and they
shouldn't conflict with each other, but it provides an easy way for
someone to know that certain drivers are only useful if the kernel
you're building supports a given arch. If I'm building a kernel that
doesn't need to support any Qualcomm boards, for instance, I can just
turn that arch off and I don't even need to think about all of the
Qualcomm-related config options.

FWIW, if you do add a "depend" on ARCH_GOOGLE you should mention
somewhere (maybe "after the cut" in your patch) that ARCH_GOOGLE
doesn't exist yet. It should eventually exist when some version of
this patch lands:

https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e0983930a=
1f1395814@changeid/

...but it's not there yet. ;-)

-Doug

