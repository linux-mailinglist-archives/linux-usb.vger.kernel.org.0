Return-Path: <linux-usb+bounces-7460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918D86FDA7
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 10:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2B6C1F2113E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Mar 2024 09:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49D2241E5;
	Mon,  4 Mar 2024 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1FtDhoe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED992249E6
	for <linux-usb@vger.kernel.org>; Mon,  4 Mar 2024 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544409; cv=none; b=lAU/vhyg404zG2VyUD5pWz7dlIEPhcW3QVzk1FQUGAGKXaQz23yLjQkVeOBLLSJoZDhhE79dSz2t8IH5JFZIP3tuL8KomkWyKyeQOtMQzBn5dnuckimykixKvSgR9rfw7PosrTBHh/5hfjHybGrqrnm9Sfqfvuf/HJ5DQWOWiKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544409; c=relaxed/simple;
	bh=ryXeKJw4iy3UVLpne9eJ1l4gNk+sRKCmF5OtA5i44uE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MejbHuLAa0LCZI44gI9QT1/DOiVyjQcW1hH4JnBQpY7j1X90LkCeFNAtLCXSGiS+5adFAs/59eeFNHe4Frn5XCB305qpOBF4mUp2ut2te5njW/BildUqxburEVptnNf0Vzl6pPCONnZ96+pPQkHjwV7eRuvHOuD0fwEKqRExwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1FtDhoe; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-607c5679842so41901227b3.2
        for <linux-usb@vger.kernel.org>; Mon, 04 Mar 2024 01:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544407; x=1710149207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uVMXMp5GXf//8orzDkeuICE4lRexQIrg1Lif5wkwjnQ=;
        b=N1FtDhoezai/Bw3f3eWeQN/fIs4hKOhj05qSYKr8aV7NsEsOpZcSpEPoDZxxc/LVG0
         W2ZaO+tQbljsBW53tAHU5fDF9HnsctuIR4cTMrEfBlc3HAeE+WkzXTP6lVT8Beat2oB4
         Qu4rA92rHMtsKE/TUIwhB4wAHvrfdFxgt5KnpW0zj2LTmgnHawYYWtmJ3/ySrMxSBpaO
         b63+gPfrTGe5t8moL1+azE+QSNLmWwPRhIcMn2UrameZnfPtENFA0htM7/i9qtSttkQv
         W3IK3dIyByo7YH3l72ooRWdj7dF8EFeeXTdKhtp7JwkkecO/indlVWXPfPC1NTPIlcUG
         UIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544407; x=1710149207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVMXMp5GXf//8orzDkeuICE4lRexQIrg1Lif5wkwjnQ=;
        b=G73JF4a47eoG8NLvavucp89UG9LJre/B8BNMpNUmCLWQm82Y4dc9rbrxKUO7FN7+EV
         iWSNpk12+aqbMGNHSqYWiQ6xDrQZj3+BqT/1S+GELivtAx7aByIopQEQZW042I/U99br
         c41BhAWB7eW8b3+Nq9SwlJwi77pLkXOdlEkDM3GpD/b9kKXXqKZVAfw6z87N/oZ4feVf
         zXoGgWXYx4BEVYXnSWkyI3F/0M7aAptMWyN6Ug4bUNH0Yi8QkF0KV5qKZgsV+kC5vw2m
         qAz/X+njXn+fzneeerNUAv3Oxuly3I7O+LEN3H+q/Jj3HPckcz06/z644ZE6DN74XJMG
         rTEA==
X-Forwarded-Encrypted: i=1; AJvYcCVyRlg8s0OdDgtEj6WiwYHXWBtEe1YHIptnWmcgpFeK8PC5B0mPFWsSbdHbVxelyZLIXZIH8FFNaaGgiTZGhF0XDCioqD/46e8o
X-Gm-Message-State: AOJu0YxQj9bREcJdv0fPIDJPSMNivItZm1vaaTRAdkRgu/bn0ntxPkLL
	0UtAI8KJK8J/fWs2JnZNi4SvoVrjxLk0ZmuHbeL/sNiM8VHDzsjzLMRjcWsvNu1s3ELa39sQ1KA
	U78PP9ptzUCys/ZBcv35QggRErbiBLiHIQuKP4A==
X-Google-Smtp-Source: AGHT+IHQFQoTq3QFgov9rUkgv2gPMwLnUo/V33Y0pWtYI9Bmu1SYWRGOQ6V4Ce4vhTaUkv92lE9/v2HlEmv0hYBqm4M=
X-Received: by 2002:a81:6f03:0:b0:608:7a9c:9a82 with SMTP id
 k3-20020a816f03000000b006087a9c9a82mr8055053ywc.47.1709544407024; Mon, 04 Mar
 2024 01:26:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221-pm4125-typec-v3-0-fdd0ee0465b8@linaro.org>
 <20240221-pm4125-typec-v3-2-fdd0ee0465b8@linaro.org> <CAA8EJpps9EPCgwBF8d8DbVzSZQ5tbEnj3RyGcJ=ua0eigDWQzQ@mail.gmail.com>
 <CAA8EJpq=Js3vtRQrUDWi1mOgL3C1iEsaAQs+dwHg=hLyE0U-rw@mail.gmail.com> <2024030452-detail-curable-b5a4@gregkh>
In-Reply-To: <2024030452-detail-curable-b5a4@gregkh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 11:26:35 +0200
Message-ID: <CAA8EJpow3a9rDRgia+D7e3mp1GQGTS2UmTzBufewRcS0ZgqiZA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: usb: qcom,pmic-typec: add support for
 the PM4125 block
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2024 at 10:32, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 04, 2024 at 02:08:19AM +0200, Dmitry Baryshkov wrote:
> > On Wed, 21 Feb 2024 at 02:00, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Wed, 21 Feb 2024 at 01:58, Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > The PM4125 PMIC has the same Type-C register block as the PMI632.
> > > > Likewise it doesn't support USB Power Delivery. Define the compatible
> > > > for the TypeC block found on PM4125, using PMI632 as a compatible.
> > > >
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Making a fool of me, for v2 there was:
> > >
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > Greg, as Mark has picked up the vbus regulator patch, is there a
> > chance of you picking up this patch?
>
> As it doesn't apply to my usb-next branch, it's hard to do so :(
>
> Can you rebase it against there and resend?

Done, thank you.

>
> thanks,
>
> greg k-h



-- 
With best wishes
Dmitry

