Return-Path: <linux-usb+bounces-4043-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAAE80ED3A
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 14:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58CE31F216BA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 13:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29ABBE60;
	Tue, 12 Dec 2023 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTekyR63"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE9D19B1;
	Tue, 12 Dec 2023 05:17:54 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b9b6ba42a4so2623962b6e.0;
        Tue, 12 Dec 2023 05:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702387074; x=1702991874; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vejtt1vJmeMimDpZjsg0bJpa54Rp+HdUAmtTiNxdWkk=;
        b=kTekyR63PiLadLtLc2/cFwSs+0IyaHwn1VncUaWtBACP4hfQwi4V3o3buHkPDLOojW
         DwXIujru9ETMGjOnCrn6rqx9iBX8gsV5he22pmv7hiUBimCGfM467LgDEcO5SAFpC9AI
         TV338b+lIUNz4qonP9ILQrGgJbkcn5o6kADfW3ESn8Ir1hPKL1U6zrVP6IlQkVltJ4fH
         658P2q6HpmEiKVlmPNYvljw6sW6E+x48h/HgSLh2LyqjpQSP6YgORcgVud9hGPCUIipc
         y9CFtx1MKFZV8AntE8ABwudQ5T6UX5yHblcBF+pfmd9iri3E4PCOeUkTq9SnQs8+CPTY
         NSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702387074; x=1702991874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vejtt1vJmeMimDpZjsg0bJpa54Rp+HdUAmtTiNxdWkk=;
        b=XMEy2bRHqLGxI43XBFwLe0xg4SBz3/A9/ZliyagQsOFnlHHua2HmitiViR33HiXl32
         5beW9006/cjkbrGhERgBSjvOVPAwJeEXfVYW/zIEEyu8SPOvd1XiD1/AOQqVJgKMmQtF
         M2Rw2hwMhwHxiE6IJRfH+hLXHUeoUc+uJ9Ctj9hS4wkmGYQ62w4nUFpAMOP4ml2OvvZw
         R2ygy1vidnJ6KmZiJ7oaJ1Y5T/dLmkMfiMd7/QholMQyu2NjcCocHP5WNAtOVQIifnnb
         ihc6iqwAO0IUCzYrNf7dpZGL1B5ujPMEQQ97ma2+re7ZFnRntvm88vEMpC26forA0SsQ
         qEQg==
X-Gm-Message-State: AOJu0YwW1mG3LGaXS4cWcEzNKtHhNAHMZ8ettR1PWtMycCcCRXD/M7yp
	rmO7AxHvz8zyneCsHsdvnOhKXDQ/QPIy0YpdYSY=
X-Google-Smtp-Source: AGHT+IHoT69UI/fJcUDrTHSTsHf974x8+i74FuoPvmebaK+30qyesiiJ+/Gf8J71fqPi/ux1J3g5Tm9RK2/uT3xBdJo=
X-Received: by 2002:aca:1908:0:b0:3b9:dd3d:f606 with SMTP id
 l8-20020aca1908000000b003b9dd3df606mr2844499oii.14.1702387073703; Tue, 12 Dec
 2023 05:17:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231204144429.45197-1-linux.amoon@gmail.com> <20231204144429.45197-2-linux.amoon@gmail.com>
 <20231206135311.GA2043711-robh@kernel.org> <CANAwSgTS0ZSFPv4x803pCLEpjH5imh8vEoWpbiJRH14Sy3GZww@mail.gmail.com>
 <21673bfd-bb87-4c7d-a53f-337c263f3a00@linaro.org> <CANAwSgSo37B0zg-xjrmqndSZ5SbyB3m27_wRsqqN9WTONooeiw@mail.gmail.com>
 <604e653d-c1e2-45c7-b121-8a6b4be5c6bb@linaro.org> <CANAwSgRB=XWo2-40rDru=Zy277-kgGNjozJ8Lxnxgv_4ABB-kg@mail.gmail.com>
 <1a78d453-62a2-410a-a40f-1ff0c2b62e86@linaro.org> <CANAwSgTy4N7Q8e0OQLsFRkRDWksTSbkOetKQGygaqsQ8++U1_g@mail.gmail.com>
 <2e688f4e-11d7-4f8e-b8ec-58f4a97304a8@linaro.org> <CANAwSgQstkS-SDaV2hj0fimt7vgfEgOT_x4efshZ6sZQ0gWSEA@mail.gmail.com>
 <8f28ea77-b3d0-445e-8d8e-80f980775f89@linaro.org> <CANAwSgRLORHb6qiHWRBR0tMbYB=O=gwatuGhk72SwZyhYMopCw@mail.gmail.com>
 <d2962ffb-badd-44a6-bdcc-53e15d4a4379@linaro.org> <CANAwSgSpuh-+HFYg2UTgX27SHFyCBddV46MgKakiSCOtFX4+aw@mail.gmail.com>
 <436ed6a4-2ed9-47bc-bcc9-18a52b1a791b@linaro.org>
In-Reply-To: <436ed6a4-2ed9-47bc-bcc9-18a52b1a791b@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 12 Dec 2023 18:47:38 +0530
Message-ID: <CANAwSgS8ip+FvuvgusjNwnVL5Z68PRmEdwfQxhst_ZoVZFoFNw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: Add the binding example for the
 Genesys Logic GL3523 hub
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Icenowy Zheng <uwu@icenowy.me>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-amlogic@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 12 Dec 2023 at 18:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 12/12/2023 13:51, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Tue, 12 Dec 2023 at 17:22, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 12/12/2023 12:37, Anand Moon wrote:
> >>>
> >>> Here is the list of warnings I observed with this patch
> >>>
> >>>   DTC_CHK Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.example.dtb
> >>> /home/amoon/mainline/linux-amlogic-6.y-devel/Documentation/devicetree/bindings/usb/usb-device.example.dtb:
> >>> hub@1: 'vdd-supply' is a required property
> >>
> >> You always require the property, but it is not valid for some devices.
> >> Just require it only where it is applicable (in if:then: clause).
> >>
> > I had already done this check many times before.
>
> I don't ask you to check. I ask you to change the code.
>
I have tried this and it's not working for me.

> > my v6 original patch was doing the same and it passed all the tests
> > but since I updated the required field it not parsing correctly.
>
> Your original v6 patch was different. I don't understand what you are
> trying to achieve. Or rather: how is it different, that my simple advice
> above does not work for you  (as in the past you reply with some really
> unrelated sentence).
>
Ok, It's my poor English grammar, thanks for your review comments.

> Best regards,
> Krzysztof
>
Thanks
-Anand

