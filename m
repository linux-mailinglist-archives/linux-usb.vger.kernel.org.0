Return-Path: <linux-usb+bounces-22266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78FA742F4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 05:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA563BC49A
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 04:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1449C21129A;
	Fri, 28 Mar 2025 04:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fy0Iu609"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178111C8618
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743135112; cv=none; b=gO1Y2Dv/tv57UmEEnOEWwvWPeAb/mV3JubdUi7Qchi4a/jJJiF3yx9zkjmGEMc+YRL/dapbNcFfcZcMkNWZ+JoJLGmDvIPFdLC7+NI/pKjLQuS8HfkwfNjci3BrVS5my83FMgsOcLmbTisSVzALsb1+qeQxf0Z57nEaLPmIQOBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743135112; c=relaxed/simple;
	bh=VcQhGjwKbCvL7TRvUAl66tFmQC357t2OP7ZqCwnkd1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I024NU6v+dUwKO1bQoY2zX8uLho+W3NS+uinJNnBD57fbHagWaAMWZ0UfLaLNwazG40zEK/yiTsKI0s2Svq5egIROWUimd5pS9tc+Tn+7uzswWaQPazSk8ijpsodTvGbU8i0NNjmQGrHVOomQqi3+86cSmgiy+eudn2AdVuYuf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fy0Iu609; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30362ee1312so3006550a91.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 21:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743135110; x=1743739910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOaMt0R9YVNlwsA3/uI772AmvrvkxzcfR1yqEVw0pxY=;
        b=Fy0Iu609nlNHuG9ClqLu+UMxGHR0IAoL+VJmrvaJLVNypQU4rg7l23kou71EVsuS5l
         I85zvc0BhhWo+tSQCwghPfTc4rV1R/gDOyZMKPnRtmj/B0BchgusX8uuGW43DIcobBDW
         6g5BaIdakj0Zv/iuSU1nH6+xddj6+78Mxav/8d44n5J/sN/cew6OsM+hsApEtjRwLvcM
         piAi0a6kF+wKxxoE3MW3YBXhAx0H0XvvsUCElocGxy2dgDbMZQ1eIROn/mC8zr+CJ0cw
         pNFDpu9Fi142rhLR0tHXrwBL4thUjWiVtsPhcNrLgzLr8Wzz5RIUDJbcdjBlKR5BKG20
         NWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743135110; x=1743739910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOaMt0R9YVNlwsA3/uI772AmvrvkxzcfR1yqEVw0pxY=;
        b=CIBhPNbdDRr9aB8riRo80PXUYri3lDZ3ga0n6u1OYBNFNkRWAPUoKUV4OqDnrSCKR3
         WbT0NTWkO2QsznerQNZTjvNQTmrvVMeD97GWpV9KFrXWkwiRdbK0K8Ejs35C7KCx+IU2
         CCGoaNh+5j9AYZ3+XnP6NTJ3zjwpzSb64OpzueSpvp43a5yKPMkFJ2nO5A/ZyhfFmyC9
         F8hnKTUyjA1grnkitOQNxTKrX4EQnp+AzIMGTty5pQEqVxlJgerogOFF8eGWRg3B8rSM
         Y3DfZvfnFzXWfFL463qGsnBlVv5sS8PGTGahTXLScKcl6mkseFapqodnASNUBYy88ueo
         +byw==
X-Forwarded-Encrypted: i=1; AJvYcCXa5lS6TttBy3nptZsI99nMqkCWhHYSsLnxuCOcdgNx0Q2bNhqyP3ONC+Sh7Z7ievgxKYDUHoutzYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQPyU/Z1yQ5CqsemkpFu2T04CPF2ee1IrPAwuQTrtFoeKIFWar
	qWTl04c7ybGqld+E0RTJXFR4+lt37+Tl8Ij8bxUgAKsOrDgmpvVTk2mvzuJLqbg6nYnlQBDVVtt
	Z3V06b5+paefHcJErC2L7S9ChbPMHFwVCABDz
X-Gm-Gg: ASbGnct3x/gZIMF5n1I/em7w/MkntpooBs/v3P/225QihBw4sm+woagvVIUSwZ/+rcI
	MFhImn3oC5gGCHo1oBbqFRfIdrQGpr1Fqr1LVTvXnbM76IGbeva8yY+MFOMb83ymcIQ4mXeUlUz
	fV/k7rAa8fgaqifFekzv2wkVGTHYIrNzFqKPOujVS1/VEiU95QE2VeG0Se
X-Google-Smtp-Source: AGHT+IFzcIsDka9WHZJAJxFJMpLG8c8sNW7ZlIUJIwmaNAc9LhnSuWXu0PkDrFCS/5qopuG/ewx09I4HC8RtpYaWMI8=
X-Received: by 2002:a17:90b:5450:b0:2ff:64a0:4a58 with SMTP id
 98e67ed59e1d1-303a83c3c41mr7500138a91.22.1743135109830; Thu, 27 Mar 2025
 21:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com> <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
 <2025032734-reward-fantasize-dc16@gregkh> <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
 <87746e66-84c1-4ff3-8b69-fbee1664eff6@quicinc.com>
In-Reply-To: <87746e66-84c1-4ff3-8b69-fbee1664eff6@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 12:11:00 +0800
X-Gm-Features: AQ5f1Jpnovh_4p-_u6V4wCVMQJgZBCl06fy9sGBvVcdkQOOr_maNF6N-1VIckKo
Message-ID: <CAGCq0LYi=Dq+3RvvK6Z5kFGZ3XanPq2BuizEBZ353oVo2FGHAg@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org, 
	lgirdwood@gmail.com, krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com, 
	Thinh.Nguyen@synopsys.com, tiwai@suse.com, robh@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 12:12=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.=
com> wrote:
>
> On 3/27/2025 3:14 AM, Puma Hsu wrote:
> > On Thu, Mar 27, 2025 at 3:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> >>
> >> On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> >>> Hi,
> >>>
> >>> We have implemented and verified the USB audio offloading feature wit=
h
> >>> the xhci sideband driver on our Google Pixel products. We would
> >>> appreciate it if this solution can be accepted. Thank you all for the
> >>> work!
> >>>
> >>
> >> Great, can you properly send a "Tested-by:" line for this against the
> >> 00/XX email so that it will be properly saved?
> >>
> >
> > We(Google Pixel) only use the xhci sideband related changes and two
> > changes in the sound card driver. For the details, what we actually
> > tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
> > Do I still send the "Tested-by:" line to 00/31 email? Or should I just
> > send the "Tested-by:" line to the 8 changes above? (I added
> > "Tested-by" line for this [01/31] first.)
> >
> >> Also, I think a new version of the series is coming, can you test that
> >> to verify it works properly?  We have to wait until after -rc1 is out
> >> anyway.
> >>
> >
> > I think this v36 is the last version of the series as I discussed with
> > QCOM Wesley. And for sure I will test it if they do have a new
> > version.
> >
>
> Hi Puma,
>
> I'm discussing with Stephan on the QC specific stuff, so the common chang=
es
> won't change on v37.  Please provide your tested-by tags for each commit,
> so I can carry them accordingly on the next submission.  If I do end up
> making changes to any of the common patches, I will remove your tested by
> tag, which means you might have to test it again.
>

Thank you Wesley, I will add Tested-by for the commits, and I will
track your next new version.

Thanks
Puma

