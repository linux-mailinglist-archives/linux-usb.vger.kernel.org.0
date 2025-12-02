Return-Path: <linux-usb+bounces-31097-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E580C9AB3D
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 09:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 33FBC4E0637
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 08:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF28F22A7E9;
	Tue,  2 Dec 2025 08:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V4q6+Zvz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDBC238C3B
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664540; cv=none; b=rdIo4/LJCymxpCtSHUAtu048DcNXNNzR3/vo6KU39vTYodwOaK+KkQXsvOncij6akVZjKnqKUfTUONKcbb9ExOunhTNDX4hPsW0Ymoo907V7uFvv7JK1E4fhwxiNy40eJt81Id86Zo9GffBgu6lOtPHc6uMUDC07+sYLdGbAaR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664540; c=relaxed/simple;
	bh=4vaQ9WNJT1i5QQHGxZbypcSK2+H2d1p6oOPk1sZfpiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4+YvOaVY49Yk0vSpWM/lfNLX/nQZH8CgnCcn28+L4l41rTcrYCcYP6f7yEO9dwpzPlS7huZPtDI6PTg/GQqNt7AucByVvg7UGArp+yr7ZJHiFLWSSY0xH7LVUBVm616OexLGBizj8pXSr0mKg3UJW1eestzKWGVnvDd3/iQU4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V4q6+Zvz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29845b06dd2so68986315ad.2
        for <linux-usb@vger.kernel.org>; Tue, 02 Dec 2025 00:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764664538; x=1765269338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjuUELaIuU1gd/2FdtvzglPjtUaEtmlP48ZimdLyUps=;
        b=V4q6+ZvzZylpy3qbS0GLNnsuewVGJVHl6YF/J57Mx6sOymKyuVg/smV9YKHoHwSK2x
         T4AoSXAVIpHtwikun+KDsOm8inlWy4sgAZoUBcNhl2EytlAv9+rT7PmlgSh/lBNgsV2/
         qNKupcazMjhC+dnWgTh8HiAaBy7J9Nwh9Gn5vWLolZcSXwqHPnVoTOiteOoHnY1wwega
         H3IQlHPtQNP9MLiRffvFe7ONQAIsgAXOVPY2D4WNqjNDzh97r1979GtcRxk/rqUhOBUR
         PyGtxvxPpnLqicVQiUIs05l65U1Bw1ASv8EuqWCRr9DdEENJuQgo45SfnsUJLG7IrfWF
         fQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764664538; x=1765269338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JjuUELaIuU1gd/2FdtvzglPjtUaEtmlP48ZimdLyUps=;
        b=A+o/oaAo4IamV2AEjNR/YcvWZZ8J+McRiZn0M3Kgl3PI/Ui0uxKnuWTfT31kk+d11O
         Ceat5U3GyDE3IC/yZbPV6B6Tdk+bsUVXsFUinV2UP640d1X9P86RA6+xsWdC7CKe+EcN
         hQE/rOGr0sKfUZgQ0OYZ0eoToPsBz/YuShm6eD5p+fUigQo3QNkQrhr/By/hlA/pk570
         RwRNDJBV2f7RbHZRdsDmSX6MGHuV4ffnMwzb2WPEYgWT8EXZYf0Zys/hKiAAkwsi+5sR
         1vPiU5SwZanAfTonXI9jqswUvh6vq5qeMlZDeb+cPNDKYsQZQA9qHNbGhhpOz7hV9dOq
         CuUw==
X-Forwarded-Encrypted: i=1; AJvYcCVcyj0I2pmEnoKN8YvtDKWrgRVcN2gp0sGyg2IBG85TLVTzvQEVge5tUMqrnT6aSPN61sR48l71kZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz29ltLq5heR+G9+7Ab6ADNPkiwprmSlY/gsxudERTD73P+NrHH
	aiBOIb9TeRtZ4COVP8FZUJIq5em/3qTcV5RMMoT+cYb6qgoLYQ0JGBky8GZSkQ9V8mQUp4qmbBe
	t5XHZ2+hR3uBdK3z0KGibraxMr/A/w3RGtqxFLj0f
X-Gm-Gg: ASbGncvOVTjvAgRIFdt1bMAjK4hThr4Nfqy3VaVbR1xk4RI1dkewM+reJ2hkBs5YHMx
	zKr948GNSPtNla7qLFXA1XDna4/yh9d1ndgC9Qrgl+445qT4L39mO/+cCgVEZidIY06HFyjoD69
	is8cp6taQAc8bGqwpLFYpK93w1AHwAjex8fLTmhYHDnQc7umRXKV6trWbnPrjjaHh20BdJHT0Gm
	ssO/YgKooM7EQQYDh0T4pj0QPw2PymUNq8zJRDgex5aF4rmzHUFYEQQEp/9ZmwPysSJmCHlwZyi
	RAKiSA==
X-Google-Smtp-Source: AGHT+IE4K+rC1T0nxBLda3rMJ7Xh3tPJApYjBfQYjhEN+PQBck3O++fb17f2VhiEsxBvds6BzbdMR2BO+hO3HQSpzKc=
X-Received: by 2002:a05:7301:4616:b0:2a4:50ca:9234 with SMTP id
 5a478bee46e88-2a719d7d25cmr21780225eec.26.1764664537612; Tue, 02 Dec 2025
 00:35:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
In-Reply-To: <CADrjBPqPsPBBSbhx8ZFreFWX2tRxaATT=azS-b1H2b=TJoVAAw@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Tue, 2 Dec 2025 02:35:00 -0600
X-Gm-Features: AWmQ_bl1YCwZSA7pQNoH9cFjlkJSn831NjN8Dq9QhCXB5pUpJEJxffvLo_epzic
Message-ID: <CA+zupgyopHGCCb-HcNvyi4m5-UDerYZFmT7S0cNYLYONz-wzwg@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 22, 2025 at 7:58=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Hi Roy,
>
> Thanks for your patch. It's great to see Laguna support being added upstr=
eam.
>
> On Sat, 22 Nov 2025 at 09:32, Roy Luo <royluo@google.com> wrote:
> >
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
> >           the dwc3 child node in the device tree.
> >           Say 'Y' or 'M' here if your platform integrates DWC3 in a sim=
ilar way.
> >
> > +config USB_DWC3_GOOGLE
> > +       tristate "Google Platform"
> > +       depends on COMPILE_TEST
> > +       depends on OF && COMMON_CLK && RESET_CONTROLLER
> > +       help
> > +         Support the DesignWare Core USB3 IP found on Google Tensor
> > +         SoCs, starting with the G5 generation. This driver includes
>
> consider adding: (Laguna)

Ack, will add it in the next revision.

>
> > +         support for hibernation in host mode.
> > +         Say 'Y' or 'M' if you have one such device.
> > +
> > +         To compile this driver as a module, choose M here: the
> > +         module will be called dwc3-google.ko.
> > +
> >  endif
> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> > index 96469e48ff9d189cc8d0b65e65424eae2158bcfe..cf1cd408d938b3ac26d58b9=
be7fcc5af3ee82660 100644
> > --- a/drivers/usb/dwc3/Makefile
> > +++ b/drivers/usb/dwc3/Makefile
> > @@ -58,3 +58,4 @@ obj-$(CONFIG_USB_DWC3_XILINX)         +=3D dwc3-xilin=
x.o
> >  obj-$(CONFIG_USB_DWC3_OCTEON)          +=3D dwc3-octeon.o
> >  obj-$(CONFIG_USB_DWC3_RTK)             +=3D dwc3-rtk.o
> >  obj-$(CONFIG_USB_DWC3_GENERIC_PLAT)    +=3D dwc3-generic-plat.o
> > +obj-$(CONFIG_USB_DWC3_GOOGLE)          +=3D dwc3-google.o
> > diff --git a/drivers/usb/dwc3/dwc3-google.c b/drivers/usb/dwc3/dwc3-goo=
gle.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..53e04a5409d8a11eb025b0f=
5cd351cb1b33281ab
> > --- /dev/null
> > +++ b/drivers/usb/dwc3/dwc3-google.c
> > @@ -0,0 +1,628 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * dwc3-google.c - Google DWC3 Specific Glue Layer
> > + *
> > + * Copyright (c) 2025, Google LLC
> > + * Author: Roy Luo <royluo@google.com>
> > + */
> > +
> > +#include <linux/of.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/irq.h>
> > +#include <linux/clk.h>
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +#include <linux/pm_domain.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
>
> Please sort the headers alphabetically. It helps avoid duplicates and
> is easier when adding new headers.

As Greg pointed out, no such requirement exists for usb drivers, but
if it makes things look nicer, why not?
Will sort the headers alphabetically in the next revision.

>
> Also can you add this file, and the bindings patch to the Tensor SoC
> MAINTAINERS entry, so it's easier to review future patches?

Sure! Will update MAITAINERS in the next revision.
Appreciate the review!

Thanks,
Roy Luo


>
> With those nits  addressed:
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
>
> regards,
>
> Peter.

