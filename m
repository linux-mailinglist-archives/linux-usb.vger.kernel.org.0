Return-Path: <linux-usb+bounces-21316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34227A4D625
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 09:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35CEE1893F5B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 08:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E832C1FBE8A;
	Tue,  4 Mar 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tKLIHTuS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710271F8BB5
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741076583; cv=none; b=g6VHTtpxWuGJZwSitOUgnSUewPuidfYCH443qLU/kQ5rLhyNeeuKPYVK6ZXxoVD9Rqhljxb+gDqBFBy82O7FawtU6psQQzrT3sZzQ4ZhvwChzS5jB49AikN1oSKJ2epxj9kFfM6ipkWcjckB8YDOSDQlNN8jWy9mJJ7HKapy3vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741076583; c=relaxed/simple;
	bh=oJRocjVxvG8aocBlf5vT9fLjx9PJTOnjpaP9NfdgLoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTE4Pev7Z/FPVTMTnGJrKgyo/ByEssW1BvvZtQ8le6rFPG4eLs1VB8tlo/NCcoqrYHr/Z94ArpDT4mM3M7Af2JlBTBsiJN9XaaKQvuMMHzqQXq5kdhnpfOnTRIHhipDRDkaTTNBPYp2qmBoVj9LATdZGovr8bfTCfBaVMDbzd5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tKLIHTuS; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so9957972a12.0
        for <linux-usb@vger.kernel.org>; Tue, 04 Mar 2025 00:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741076580; x=1741681380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6vsEs0w+2fpN2o1KS8VIE9clQoUeLM/QArYwjwqcY0=;
        b=tKLIHTuSb8EsCI1KkpfUsVKCJmmjnPjmWq6aBgxmRlJtqHk8ikuDpQ8pHQReaI2mzY
         hSRuBoHrplNxKm+Y4AUGV9s/rpZi3ab7HTGhJPL3UL+H4U4sUbErG02SGoa5LSgQ49lJ
         EK907gmP/2Nd2Rx9WKHHzLvL/Hayd2zCx/SsnRoV6+qLW0QbLmyVmqKpmmFIgpZi/d+P
         oOyVrYPQC8+ZdXGCZHDzxOYUHCOpJgGTP8f8IZC2o38X08eQfmkCkksKnHW0A9U/jHsu
         UF0pqcYRChbbFpJq4Bo5lX4ZWHo5VqiJXAXUKvRfft6HvLeJM3L4MsQVeRM6sf+t+cpL
         Mbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741076580; x=1741681380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6vsEs0w+2fpN2o1KS8VIE9clQoUeLM/QArYwjwqcY0=;
        b=iwK5Mrt7iqxixkfFPd4PY28hzjxI+0udA9WkPO55Fr9ACM2dCTmgsq/2oFgJoY8FC2
         o3VkWxx9OGuj8xUKz06z2D3K3PmjJwgilEVQhv/9uS2yb7ZUTVpL0Yx/XQsJDwHbQykI
         aH8jWqeE3ik5GAURYghyUFXCzhB/x9Jte7IO1ioJ+XkJAndDG4TsaV4cWXK8JuG4WIpZ
         Q08XslnPK0mshbJo8h6uPXwM6LllEfx2eTLtWrZ92OUj5IFv4bcVZWuPPOS/vJCSTqwj
         Nzs1ZSFRXwed124Q8euJJ7J80xRuOTeCVz49JNNVkL/pKAlNzR93f62+ThHzGY2peK7t
         sIBA==
X-Forwarded-Encrypted: i=1; AJvYcCWTHFsgSV/IxddwsQmF1BgWK5cdxBZGYMcp6G8sPDEoD7/c3kO/bdg7BNn0R8Jmw6aJxLX0gEXS4lI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnehYNUfHxFFCdAXBAl9ZqMBiDQbbkrJQ3WE1MjLi+EEr2mF1q
	O/PgprNoQlo+YswBDKKWdH8tNBgD9tNQcS3MUl+kx1JhBh1izhzHiZr4Ubj5H+w=
X-Gm-Gg: ASbGncv3/ZLW15m390/kiNaYETdligc+V/24AiQjtAHu1u1Y5hLMoRp4jCLoJpFpDJf
	KrE+Y06FFbn2Zee9X1fYEZMZWpBZug2lEsc6a9vRqqukT6+gZMKbPiBMOlNNU9EFeQLVUVBWwDR
	TtVZF/843lL1xfOfG37UeJ/1Y/sj/OV1DFG/iAo8SwZUkUswgAHmaeNxt2IOJkgu3CfTeglDaiZ
	AdflIyeLY1euxTgdLcXT1OF2JUqFLOdS/3M4tTWrCsuLCnW7kv+vwbYFxD/hFFmzoEJKDA0zaaW
	GBQsDJ55tLEQGvXNtqz5GHdQlOlQygYmnG1itu2yoTfID5vYU3QbuoOZ
X-Google-Smtp-Source: AGHT+IH0Xb393ctWLRXZSas7YgLXGqNPTHNCJsQolq/B1J5pMVs0L4gi+m3eIifTOO2YP/AzGBdjxw==
X-Received: by 2002:a05:6402:3891:b0:5e0:8c55:531 with SMTP id 4fb4d7f45d1cf-5e4d6af98d1mr18864132a12.14.1741076579579;
        Tue, 04 Mar 2025 00:22:59 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:ea7e:cb1f:99c6:de2d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5925ff875sm332907a12.20.2025.03.04.00.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:22:58 -0800 (PST)
Date: Tue, 4 Mar 2025 09:22:49 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	robh@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v35 00/31] Introduce QC USB SND audio offloading support
Message-ID: <Z8a4WYq4GqWBVNyX@linaro.org>
References: <20250219004754.497985-1-quic_wcheng@quicinc.com>
 <Z7W_Vz_kVDjIcp5N@linaro.org>
 <82ce69a3-d248-494f-6ddb-098f392c78a0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82ce69a3-d248-494f-6ddb-098f392c78a0@quicinc.com>

On Mon, Mar 03, 2025 at 06:39:52PM -0800, Wesley Cheng wrote:
> 
> 
> On 2/19/2025 3:24 AM, Stephan Gerhold wrote:
> > On Tue, Feb 18, 2025 at 04:47:23PM -0800, Wesley Cheng wrote:
> > > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> > > 
> > > Several Qualcomm based chipsets can support USB audio offloading to a
> > > dedicated audio DSP, which can take over issuing transfers to the USB
> > > host controller.  The intention is to reduce the load on the main
> > > processors in the SoC, and allow them to be placed into lower power modes.
> > > There are several parts to this design:
> > >   1. Adding ASoC binding layer
> > >   2. Create a USB backend for Q6DSP
> > >   3. Introduce XHCI interrupter support
> > >   4. Create vendor ops for the USB SND driver
> > > 
> > >       USB                          |            ASoC
> > > --------------------------------------------------------------------
> > >                                    |  _________________________
> > >                                    | |sm8250 platform card     |
> > >                                    | |_________________________|
> > >                                    |         |           |
> > >                                    |      ___V____   ____V____
> > >                                    |     |Q6USB   | |Q6AFE    |
> > > |     |"codec" | |"cpu"    |
> > >                                    |     |________| |_________|
> > >                                    |         ^  ^        ^
> > >                                    |         |  |________|
> > >                                    |      ___V____    |
> > >                                    |     |SOC-USB |   |
> > >    ________       ________               |        |   |
> > >   |USB SND |<--->|QC offld|<------------>|________|   |
> > >   |(card.c)|     |        |<----------                |
> > >   |________|     |________|___     | |                |
> > >       ^               ^       |    | |    ____________V_________
> > >       |               |       |    | |   |APR/GLINK             |
> > >    __ V_______________V_____  |    | |   |______________________|
> > >   |USB SND (endpoint.c)     | |    | |              ^
> > >   |_________________________| |    | |              |
> > >               ^               |    | |   ___________V___________
> > >               |               |    | |->|audio DSP              |
> > >    ___________V_____________  |    |    |_______________________|
> > >   |XHCI HCD                 |<-    |
> > >   |_________________________|      |
> > > 
> > 
> > As I noted on v34 [1], this version is still missing instructions and
> > changes needed for testing this series. The device tree changes don't
> > need to be part of the same series, but there should be at least a link
> > provided to give other people the chance to provide Tested-by tags.
> > 
> > IMO we shouldn't merge this series without those instructions, otherwise
> > we risk that this just ends up being dead code that no one can use.
> > 
> > Can you please share the device tree changes for a board upstream and
> > any other changes needed to be able to test this series? E.g. for
> > sm8250-mtp.dts, based on the examples in your cover letter.
> > 
> 
> To clarify I'm testing this on sm8350 in recent times, but utilizing sm8250
> definitions for the ASoC platform card, as the platform sound card is more
> or less the same between the two SoCs.  Back
> when I started this series, sm8350 was missing a bunch of dependent
> components, such as aDSP not being loaded, and missing platform sound card
> definition, so I had to define and enable those on my own, which required a
> slew of new DT nodes, hence why it wasn't as straight forward to include
> the DT definitions yet for sm8350.  Not thinking that this series would
> take as long as it did, I was planning on separating out the DT changes in
> a different series to enable offloading for the devices I have tested with.
> (sm8150, sm8250 and sm8350)
> 
> There's still a pretty big chunk of dependencies missing from sm8350, so
> those would also be handled in the follow up DT submission.  For now, its a
> much bigger hurdle to get the main/functional changes in, and that was
> taking a significant amount of time from my end to manage.
> 
> If you want, I can give you the changes I have offline to enable this for
> sm8350, since I haven't spent time formatting/prepping the changes for
> submission yet.
> 

Can you push it to a public branch somewhere (e.g. on CodeLinaro)? I was
talking to some people from the community about testing this on some of
the smartphones we have in upstream, so it wouldn't help if I just have
the changes privately.

It doesn't have to be perfectly clean as far as I'm concerned, as long
as it allows to see the whole picture of the additional changes we need
to make use of this series.

Thanks,
Stephan

