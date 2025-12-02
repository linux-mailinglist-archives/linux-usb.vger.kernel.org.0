Return-Path: <linux-usb+bounces-31100-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EAAC9AC5F
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 10:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D85EE346D4C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 09:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8C63081C5;
	Tue,  2 Dec 2025 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aBeM5Hdr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1730748C
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666124; cv=none; b=Y1WqaHDLmc7sFB65E/H9OQD7wUtnk/fqM0kWHpV7vhdApCqWl6/vAIeY08L549/sP67Jud2rAK3I5Bdyf3AURMZQdyYnLYPIMaSxqE6clWaZ1SEHjHsMgCp5HaGcCmpQgr+RsQEXJ4yD4pms6MxCXaeROw5zUpCsBNNgNtR8fcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666124; c=relaxed/simple;
	bh=i1w1KgmggzJXL98eGvitaCcA9E6kmwV4ViMaGE9iZ0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pIXbF4m32RReQxeJBBj4tUJF7asj/qiJWcRG/P+qX2VNUHltlQeooF1cvZJNVA8mEVssIZ9hxyInoQE30OR8tbs3Ql77uyulg49DG29NCpwmWza4b1e4TKCIv0Gi2GtCJCa1WuZa/j9kBLQvR89XSkInwmbX28wpEvpWzNMOj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aBeM5Hdr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-297dc3e299bso49877475ad.1
        for <linux-usb@vger.kernel.org>; Tue, 02 Dec 2025 01:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764666122; x=1765270922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XHkkGY2cNGbvvZiNneWk2OoD80gfsi3EfjvphamSbE=;
        b=aBeM5HdrfAEFVUCAZYxH+8LrnIL9uq4D8x8INmxcR9CBImyZzc+kVHA9Mia/TI9W3c
         trFpNUQV+3+o0lw4ukg6uOdqPbcfu7D4qVWiaSvGiAFrJvYkddnHuocQWkrxWNHUUCyW
         8R1KjtnFj05e7BnMuYdRzpocYSbV03Dy3VQDkDNZA7Q3KVc1kXt1ji3rVo7Dvi8Anxpz
         Ya1xn5r0MM/6/vvPunHm6IhcD9boPiun1BReWXdpgmEyiiJtB5HubD+cVSq0Yb5g3A63
         S7ps5gZQZpEiYcOpMe5/LS5fhxFUFe8wStzZXVKTpxSwHBkx6WfqO7IyF68a78DyPXne
         KQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764666122; x=1765270922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XHkkGY2cNGbvvZiNneWk2OoD80gfsi3EfjvphamSbE=;
        b=wBmnU+1reRcvBG9zOrRQZoPsl5NKaZbQ1YpZEbYhIZnzylEabeD771oXKNu8oQOQUz
         9aRR5vFttLA9LntRniCFkTipmjzhnUj3frh0oAoBQrTbM01UDUwiuhDByeKY4WleqJU9
         xwk4oVq3P9aRuaCJXYBu4mQB2c7L9u+wZJ3x/d4xIYwyQoBHQHLeRU2YSruwM7h5Vj96
         mMS44J+tcHJXhYl9bXBHnoYFv/6fzJQw6FI57WonTqzek9jodVB/z90KQgpP/aOZ3nzU
         tduZbXQWxMpoFQ+qlN2phcpBY/wI+wqsnxIi+EwmEr1fb2V4iLtAUBOgKjR95FHp90Z6
         d5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX9ysgHJ1WThpHKW2gBaDYP8AGtD3UtUuBXrY8ha9uRfVrIfsZ+LB7I3Db9WG9OeUHm1EF6bioo7EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7sdCNZNComI92hmXo6wqetaORVCKmWgtEVLfznQE5kilm3C7E
	+fymPF6MnzDylijOuIKi1wsSgIY7w9mD8Z7dsNz4iAWqfSKgwZE4ps+h/2nK+8gRLvHe9nDp8QE
	YF6GNk5qz+8PL/gDf9jv9EQdbA7FlLnRAdZONPyvx
X-Gm-Gg: ASbGnctJKeahVKjEJNyf6d+R0rSlKibMFUkk4mjgy/9YU5R6F0XSMiZIkh+PTrCs3hb
	srN3HA+br5hDcTu1MsqfF3uOXdqM1SHtdzj+Lgkpt5kSlmwF4PIps/Sn2cvEtCng7jRZpGcwzjp
	ouEWn47vQe0iqkuYE+XL33kHYBiAVQTkaqUzO4RZhOlrNIlesKGAHLXSUxCKzDRpmb5S7SFi5V1
	ZADoVn24Ie0LC+PIhsDZAq4R+MA11vdWJ4JdPL2wGsIE+Yy0lXP6CG+GnDFp4Yj5XG0g9A=
X-Google-Smtp-Source: AGHT+IGiBzRHl7TPtYwtQi06ZiaJhnVzUcHhh5xBVlcMIML+l0+f6MQo/KbqNIpZ30wUru3qydCRc5k9yej1kRpZNRQ=
X-Received: by 2002:a05:7022:1111:b0:11b:9386:826c with SMTP id
 a92af1059eb24-11cbba5508fmr13693558c88.41.1764666110328; Tue, 02 Dec 2025
 01:01:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <2025112226-heave-refrain-53e6@gregkh>
In-Reply-To: <2025112226-heave-refrain-53e6@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 2 Dec 2025 03:01:13 -0600
X-Gm-Features: AWmQ_bnlSStXeZAFzAhajdXf-6yqBRh8xzoWnHdfQbF_eyEVNWCr_wtC1nkDZig
Message-ID: <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 8:59=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Nov 22, 2025 at 09:32:06AM +0000, Roy Luo wrote:
> > Add support for the DWC3 USB controller found on Google Tensor G5
> > (codename: laguna). The controller features dual-role functionality
> > and hibernation.
> >
> > The primary focus is implementing hibernation support in host mode,
> > enabling the controller to enter a low-power state (D3). This is
> > particularly relevant during system power state transition and
> > runtime power management for power efficiency.
> > Highlights:
> > - Align suspend callback with dwc3_suspend_common() for deciding
> >   between a full teardown and hibernation in host mode.
> > - Integration with `psw` (power switchable) and `top` power domains,
> >   managing their states and device links to support hibernation.
> > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> >   `psw` power domain events to manage controller state
> >   transitions to/from D3.
> > - Coordination of the `non_sticky` reset during power state
> >   transitions, asserting it on D3 entry and deasserting on D0 entry
> >   in hibernation scenario.
> > - Handling of high-speed and super-speed PME interrupts
> >   that are generated by remote wakeup during hibernation.
> >
> > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/dwc3/Kconfig       |  13 +
> >  drivers/usb/dwc3/Makefile      |   1 +
> >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 642 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0a=
bea88572d9ae81e26 100644
> > --- a/drivers/usb/dwc3/Kconfig
> > +++ b/drivers/usb/dwc3/Kconfig
> > @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
> >         the dwc3 child node in the device tree.
> >         Say 'Y' or 'M' here if your platform integrates DWC3 in a simil=
ar way.
> >
> > +config USB_DWC3_GOOGLE
> > +     tristate "Google Platform"
> > +     depends on COMPILE_TEST
> > +     depends on OF && COMMON_CLK && RESET_CONTROLLER
>
> Shouldn't this be:
>         depends on (OF && COMMON_CLK && RESET_CONTROLLER) || COMPILE_TEST
>
> I shouldn't have to enable those options to just get a build test here,
> the apis should be properly stubbed out if those options are not
> enabled, right?
>
> thanks,
>
> greg k-h

Hi Greg,

I agree with your interpretation of COMPILE_TEST but it doesn't
seem to align with upstream convention. I found the following pattern
in several device driver Kconfig files (including but not limited to usb,
pinctrl and phy).

    depends on COMPILE_TEST || ARCH_XXX
    depends on CONFIG_A && CONFIG_B...

For this patch, the APIs exposed by OF, COMMON_CLK
and RESET_CONTROLLER are properly stubbed out so
I'm all good to go with your suggestion, but I'd like to make
sure this approach is conventional.

I plan to add ARCH_GOOGLE as a dependency in the next
version per [1], so the "depends on" would probably look like
the following per your suggestion:

    depends on (OF && COMMON_CLK && RESET_CONTROLLER && ARCH_GOOGLE)
|| COMPILE_TEST

Please let me know your thoughts.
[1] https://lore.kernel.org/linux-phy/1a53d473-fc13-4ac5-ba52-4701d95e3073@=
kernel.org/

Thanks,
Roy Luo

