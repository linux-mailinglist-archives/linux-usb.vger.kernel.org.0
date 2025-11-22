Return-Path: <linux-usb+bounces-30829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7870DC7D12A
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 14:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C3BF24E4899
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 13:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D7536D518;
	Sat, 22 Nov 2025 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="os9d4T2d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017F11A8F97
	for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763816419; cv=none; b=HmqW5nGy7pFrErbx4aC8LIPMKcSc/GJr45Q7aIGACVmVy8UcaI4bK7osgOTTzd7ASUvst46n+FkCpoYa9qshQRWVX9eXe0uwP/Er/eN8hirTrED6Cmc/iPfo+83hNCrGfVJZ/RhwmODj+QkuNd/IQTttM5uXU5bTYid3jeU5aV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763816419; c=relaxed/simple;
	bh=4SJqsNqEC1ikm16NffcXgYdxYhJQBd/iOeqcJJhYHLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldw0wBAh9AfuMWJ5YvOWF7BnFm2rgkNawB+M8+H15MNjr6kP+XyxE43aJGFGCSWiZpAdQ7t2wD/QL+vrrxv+oBt2sEB48EHQ9nvxCbd74JVKF8821ynTXm9PFA/MOltRFLQI0CQhNOYQ0PYczVpX4yQMAOJoWMh7AvSl99k6m6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=os9d4T2d; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8843ebf2facso38564136d6.1
        for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763816416; x=1764421216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D33saOqa18RCkbxGkW6RKN+23lAQ9LGSuB2LH3pnMFs=;
        b=os9d4T2d+So6Rpy/YaGnb1tA9gdaArBOX541V9BVvTY+Eps0B7VAyliAPxsw1r6mRW
         JW6/wJPp+ANKs0Y/6rBNIij8fvtZ9gmkZSpzflZUYpYd3NYlGWYAunAz/jNwiTHcHtZ8
         FfG3SoFh0cU+qpKTXw8FI+p7Ua51QwphDNeid/pN0Z+Aokyg5ufG3jTzoZKo+abE37DI
         u74LarExgH/Fkj4FY/pBJkumzJAmxrajxf3kLSmFOctBZw7z7K/GvxXL4dXzLMBeFtrY
         D9Rr43293QJY3xjCcA9HLEbpWQOvIggTBby0cgi12cFM7oiK7Il23wRhKK8cL/qfQs6G
         cvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763816416; x=1764421216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D33saOqa18RCkbxGkW6RKN+23lAQ9LGSuB2LH3pnMFs=;
        b=ifzQaeQahmWPkFckPgwLQyvpLBOxSybcSMOETmXinAVMlzxHCliEJlMiBG7c1rrBev
         +hQCyNTXoAXhUMVIIclHHMjRep4JEohf6uCxdK+eUDhcAzKtR3wZi0qxNOrAXT/JeYtb
         II14REkpYewTMEAX0t8CcuQrwB5z2D5BlLpqYL5bYjeDFC/YdFYgAZjCINru3til8Uqw
         Z2DIUtktkuQM7PyysBme8rntpGoT5nLUueTUywOMExTR0ZlA6BmKbuUI6nio8aCrL3up
         N6Ns/8pgJON87+XsJqKxJ9eEMu3CbN4arNRylB3nVeD+RYqprnkiFn0dtTmnzZe7Cf3M
         /xlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX+C5O1WiJn7nSu8xYnQ1NNjjou0lpZ2BfkA3FBMmPC1yHuoDhDuG/j/b4Scy1WvliCap2rkS3j1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlg9UfeyfJ2Q02RjRA1Ufh0Y1YR0lMlxgaFncWY1o4keblsi7K
	WMInlpGlI5XaKZNiYrRjOHD+Vb5BtW5M7idRdu0PWoUIwksJt569qjyEBa8umcVLdqsgqPgOedX
	/dCj9kbAe2N5Yx/Cr/JI26c3sQPWWVELr6hUJylRtfQ==
X-Gm-Gg: ASbGncuE+1v3q8uL93h2io/eAJikPbMbH/rXgDfbHERf40oUmEAfTvA9BCb0Zefz/zl
	f8LHHn2UK1IM/FFkOi1LcRbpVSCDsoGhhfoE2FyMr8S0spwTGhj0Idl8NTU++77GhNz3LkN0QzA
	tdDfopUD5+DuCSfwif62vcWgc/fEmyVrBVhQWCGzfTELSvKmxCfDiNPVFggUWF9R2QqPiAaeL0Q
	/4SPM4lpz4al7KcIhyC7QZGjSI8jlrkUk8eNYnsvjh8rDpLT4DKUIj2spnzXzOUofw2932lYA1E
	QkwPtQ==
X-Google-Smtp-Source: AGHT+IHJrCgIOLl4o7NWWLpx4hV5ffDAfX6bvndBUHOzhVwN3Sh2SMUBYCSUaMSJYcN7I8cF0AZYPeseet0woJPXfmE=
X-Received: by 2002:a05:6214:19ef:b0:880:53b3:a9bd with SMTP id
 6a1803df08f44-8847c48694cmr88775616d6.5.1763816415832; Sat, 22 Nov 2025
 05:00:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
 <2025112248-spoon-waffle-a508@gregkh>
In-Reply-To: <2025112248-spoon-waffle-a508@gregkh>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 22 Nov 2025 13:00:04 +0000
X-Gm-Features: AWmQ_blyAPM0LR0XqdHlXvnT72Nj6YIaIeoZyPTuWF8E9Zu5nwZOromhbyVp9eo
Message-ID: <CADrjBPp0icwChpAdeK-CBEqvV__ALJ4YO=cp5uhXEUu3nqL4UQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roy Luo <royluo@google.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Greg

On Sat, 22 Nov 2025 at 12:35, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Nov 22, 2025 at 11:58:39AM +0000, Peter Griffin wrote:
> > Hi Roy,
> >
> > Thanks for your patch. It's great to see Laguna support being added upstream.
> >
> > On Sat, 22 Nov 2025 at 09:32, Roy Luo <royluo@google.com> wrote:
> > >
> > > Add support for the DWC3 USB controller found on Google Tensor G5
> > > (codename: laguna). The controller features dual-role functionality
> > > and hibernation.
> > >
> > > The primary focus is implementing hibernation support in host mode,
> > > enabling the controller to enter a low-power state (D3). This is
> > > particularly relevant during system power state transition and
> > > runtime power management for power efficiency.
> > > Highlights:
> > > - Align suspend callback with dwc3_suspend_common() for deciding
> > >   between a full teardown and hibernation in host mode.
> > > - Integration with `psw` (power switchable) and `top` power domains,
> > >   managing their states and device links to support hibernation.
> > > - A notifier callback dwc3_google_usb_psw_pd_notifier() for
> > >   `psw` power domain events to manage controller state
> > >   transitions to/from D3.
> > > - Coordination of the `non_sticky` reset during power state
> > >   transitions, asserting it on D3 entry and deasserting on D0 entry
> > >   in hibernation scenario.
> > > - Handling of high-speed and super-speed PME interrupts
> > >   that are generated by remote wakeup during hibernation.
> > >
> > > Co-developed-by: Joy Chakraborty <joychakr@google.com>
> > > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > > Co-developed-by: Naveen Kumar <mnkumar@google.com>
> > > Signed-off-by: Naveen Kumar <mnkumar@google.com>
> > > Signed-off-by: Roy Luo <royluo@google.com>
> > > ---
> > >  drivers/usb/dwc3/Kconfig       |  13 +
> > >  drivers/usb/dwc3/Makefile      |   1 +
> > >  drivers/usb/dwc3/dwc3-google.c | 628 +++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 642 insertions(+)
> > >
> > > diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> > > index 4925d15084f816d3ff92059b476ebcc799b56b51..f58c70dabf108878cbefe0abea88572d9ae81e26 100644
> > > --- a/drivers/usb/dwc3/Kconfig
> > > +++ b/drivers/usb/dwc3/Kconfig
> > > @@ -200,4 +200,17 @@ config USB_DWC3_GENERIC_PLAT
> > >           the dwc3 child node in the device tree.
> > >           Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
> > >
> > > +config USB_DWC3_GOOGLE
> > > +       tristate "Google Platform"
> > > +       depends on COMPILE_TEST
> > > +       depends on OF && COMMON_CLK && RESET_CONTROLLER
> > > +       help
> > > +         Support the DesignWare Core USB3 IP found on Google Tensor
> > > +         SoCs, starting with the G5 generation. This driver includes
> >
> > consider adding: (Laguna)
>
> What is "laguna" and why should it be listed here?

Laguna is the codename of the SoC (mentioned in the commit message).
The dt compatibles and proposed dt files all mention Laguna (as
opposed to G5) or its abbreviated form lga  so it could be helpful to
have this mentioned in the help message.

See https://lore.kernel.org/lkml/20251111112158.1.I72a0b72562b85d02fee424fed939fea9049ddda9@changeid/

Peter.

