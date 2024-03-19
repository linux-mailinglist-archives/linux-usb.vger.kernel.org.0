Return-Path: <linux-usb+bounces-8061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109A87F56C
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 03:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E7CB28115A
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 02:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC9C657AA;
	Tue, 19 Mar 2024 02:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u+QpXFOH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE44651B6
	for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 02:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710815185; cv=none; b=bcuxtgjPD5/euVYKVIEeS2vql5VEMRMPgjYUgt+qVyHHP7OL/dM9URxkuPxR23AuOxq7/EBFu5m+4f2j6pSBV4GmX9senx3EWNikf2aNnZxj99saIt/XMVHlx3zbjeqwnK4WBO/Kkr5hKtHzc22hX4SrnZ8Z4RJIOkfmkoWs5m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710815185; c=relaxed/simple;
	bh=sggre/bwedm+SjhOnNs5oKMSJXt1Hx/MhvbnEbYdQRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJIn7nlB4Xr3aasn3ozpibIGKX7cwZp8cRdg6IKFTCIIEX+tQ6d3BgcGmLCT+sCoAz3qDpm2Bh22anoUszASsLncz5WvPessEPymH92ps61IDlnU42ZnCxL01yf65nZZ5XnXPfxfoj4GsgbQNbCMTsRLMUr+E8j98vc8HO4iWwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u+QpXFOH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a467d8efe78so524230466b.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 19:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710815182; x=1711419982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PVwebktWBWty2mBrf17cNCGtAzEMmWTbg3BNLwRbR4=;
        b=u+QpXFOHxIIm2aA8ZtgDstbdEP0JytJobxygrcibELE2iSg42kVC3nIhORU+hQRdCR
         g02IrjRD211Th2bTY7QgjIDz8/vvzyrWwbNp74QLJaFZFfbHDgcS2+5Tuoj0930kPNkf
         c5x6ok0I/EMtikTXIe6THfEeU4JEvOhnoN+MkV1pV8QRt5gUoq42kfYXtxdB4JbDg8Mq
         Ny7aNIrtG/saUzznCbyJGJp+gTdqkFow4k6LyzTqM8w2oRxnxSQ41Quu/jitkpJYs0uC
         3GS4g2V6k/At4g57bbgqkF2rtgkVMB32SCqGrKB26kWQdo1HgPBZk0ytKK3VgS62qucq
         Xqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710815182; x=1711419982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PVwebktWBWty2mBrf17cNCGtAzEMmWTbg3BNLwRbR4=;
        b=XmNvDI7hAsKaRBaBxjFg27wRAKCtxumnxoDBZyMlMOx9inlSwK/MDA1SI48FBu22NL
         mU5slBEcqCGrmXW0hpkLosylwXqlKnY2/Abp/ea3I+4J6uoQBb460qrr8dco9yF1xJfb
         DPG7gRM6C+O5eUXJJoKxv/8FB5LReDbcbJHFBgBD+kn+6LotOFwK46NEdqqagxBQ7Bje
         gbZ0dW6YKsrnonwoI7O/fwXQT+YGTrvn+dSEKU6HaaW71uyZqmZW9s/IpFJnIsHwpUq2
         9+EgZkTU3y6QGsr6YdBM5PrV1Ja9oxfgw7d/07QDjq0FtH09Y+VVEf+VbcAzlHmuc08Z
         Wgcg==
X-Forwarded-Encrypted: i=1; AJvYcCXogfRbc9h0IO9FXDlYIFAq9PCMkuW/Phd5SQ5Pcb+nkVqMOTY2jevj0AU34hCKzrcUdUJXG/Mk/GsfeEkPA4Xw34Z0vCd3TB3r
X-Gm-Message-State: AOJu0YxZyovmv5YCFiMl8+muoDCCTsw6eyX5YLphR+caVVLhwG3ISzT7
	LJVdftSrkvCcb5fSUP+ku1OhIoKtrVn7o3b1Soo3Hh7sKO4cTTWz+ZFUrWjasxA3Ywu4fkLYnBM
	5/flV5zryabG6uwL0qBqIqNma3+LnZgtUK8LV
X-Google-Smtp-Source: AGHT+IFu9/5+j8r+Fb4pBtW95+Cl0mFkAx99vWRUt0Y35XyzFmr6MbTbI8DsVSvg5VsvJGnE/Mvw9QqpeiGeWfWctas=
X-Received: by 2002:a17:906:81c9:b0:a46:6958:c415 with SMTP id
 e9-20020a17090681c900b00a466958c415mr639887ejx.8.1710815181445; Mon, 18 Mar
 2024 19:26:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228013619.29758-1-quic_wcheng@quicinc.com>
 <20240228013619.29758-21-quic_wcheng@quicinc.com> <CANqn-rjTgHgzssxZiuwvTKzOS31wzjS4Y9G-XacZN4a7c82MaA@mail.gmail.com>
 <d97f635f-053b-70a7-5ffe-a1ae273091d1@quicinc.com> <CANqn-ring2uf=A-F7VuRwnJ--n=FtFzSddCmR-=nfxCGcFAF2g@mail.gmail.com>
 <0e9f0f2f-a404-3b76-3c52-9eca7594efa3@quicinc.com>
In-Reply-To: <0e9f0f2f-a404-3b76-3c52-9eca7594efa3@quicinc.com>
From: Albert Wang <albertccwang@google.com>
Date: Tue, 19 Mar 2024 10:26:08 +0800
Message-ID: <CANqn-rjMcncjZv9YNZJOZgFo0_ro9hk=TBSFrY9RfhE1Mi13qw@mail.gmail.com>
Subject: Re: [PATCH v18 20/41] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, corbet@lwn.net, lgirdwood@gmail.com, 
	andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org, 
	bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, 
	konrad.dybcio@linaro.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> We can discuss that offline and come up with an approach that is
> reviewable by maintainers and the community.

Sure, looking forward to working together with you!

Thanks,
Albert Wang

On Fri, Mar 15, 2024 at 4:57=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Hi Albert
>
> On 3/14/2024 3:29 AM, Albert Wang wrote:
> > On Thu, Mar 14, 2024 at 3:18=E2=80=AFAM Wesley Cheng <quic_wcheng@quici=
nc.com> wrote:
> >>
> >> Hi Albert,
> >>
> >> On 3/13/2024 1:03 AM, Albert Wang wrote:
> >>> Hi Wesley,
> >>>
> >>> The suspend function `qc_usb_audio_offload_suspend()` looks to stop
> >>> the traffic on the bus, so that the bus can be suspended. That allows
> >>> the application processor(AP) to enter suspend. There is a subtle
> >>> difference with our feature, which is to allow AP suspend with the
> >>> Host and USB controller active to continue the audio offloading. We
> >>> call this feature `allow AP suspend in playback`. So, I have some
> >>> points to clarify with you:
> >>
> >> Yes, I'm aware of that feature also.
> >>
> >>> 1. Will the suspend flow `usb_audio_suspend() -->
> >>> platform_ops->suspend_cb() --> qc_usb_audio_offload_suspend()` be
> >>> called when offloading is active?
> >>
> >> It can be.  This is why in our case, we are going to issue the
> >> disconnect event to the audio DSP to stop the session if it is current=
ly
> >> in one.
> >>
> >>> 2. As my understanding, the suspend function is to allow AP suspend
> >>> when the offloading is IDLE, but it won't allow AP suspend when in
> >>> playback or capture. Please correct me if anything is wrong.
> >>
> >> As mentioned above, it will let apps go into PM suspend after forcing
> >> the audio stream to be idle.  We won't block PM suspend entry.
> >>
> > Right. Your design is to force the audio stream idle, or say, inform
> > the audio DSP
> > to stop the current offloading session first, then AP can go into PM
> > suspend as usual.
> > Then I can say the current design did not support the `allow AP
> > suspend in playback`
> > feature, right?
> >
>
> Correct, this series does not cover this mechanism.
>
> >> Yes, I saw that patch as well.  I'll take a look once this series land=
s
> >> upstream.
> >
> > That patch is rejected and archived now. So we need to find another
> > approach to do
> > that, even based on your framework.
> >
>
> We can discuss that offline and come up with an approach that is
> reviewable by maintainers and the community.
>
> Thanks
> Wesley Cheng
>
> > Thanks,
> > Albert
> >
> >
> >>> 3. We would like to integrate the `allow AP suspend in playback`
> >>> feature with your framework to become one upstream offload solution.
> >>> Here is the patch:
> >>> https://patchwork.kernel.org/project/linux-pm/patch/20240223143833.15=
09961-1-guanyulin@google.com/
> >>> .
> >>
> >> Yes, I saw that patch as well.  I'll take a look once this series land=
s
> >> upstream.
> >>
> >> Thanks
> >> Wesley Cheng

