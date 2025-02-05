Return-Path: <linux-usb+bounces-20184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A990A2989B
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 19:19:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8B7916809C
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2025 18:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9631FCF79;
	Wed,  5 Feb 2025 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JriIhorM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99901FC7EA
	for <linux-usb@vger.kernel.org>; Wed,  5 Feb 2025 18:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738779589; cv=none; b=RfCwEWbFpr/ZDtUydU8Un1ygPSWFZdug9qJt+6KGGvBYNmvm7A/IkGsQavVl+ykjzmT/0/W4sWIHQnEQrMiCglWVekYwpTox3ryrHhX4mDnjq8BIKLf75QN6n3uPbLHSTCZVAChF/Ij0la5iarMrKocUaVnUmOFWp6yuHkw7dqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738779589; c=relaxed/simple;
	bh=Y9cbveh2CwhVYwoFhmCN0UCeLgvgUnCU7TI71FPNIi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ATmvPzht8LBvEr7gEeoDTCD2XKBK2YPyXcTWRXZi4cXNgyUrgyCmAHCORF5mykmLtwpdBb0Z1tYGZQd7sFVwRCNIveVR8jfTI5Q+PKsBs8czRhWo+BqsRcF9Cl2f0VMwEJQAkZpysHBTNcMd8LJTSf3CEVcmv6y/vJYT3Nl6FrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JriIhorM; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-71e2766994bso60963a34.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2025 10:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738779586; x=1739384386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYD314+kCrbyuPLEovXv8C/gyv8YrwaHmGXW6MFdMgQ=;
        b=JriIhorMzBoE8KnKupnIP982bFi10iXqcO46sHLhaylKOPOo8iBxGo/27laZaoI/vZ
         W4293dZMvJi3VwiqjFSdTgcVHHwg+NOGXD+vq/XC3NwHRsrSONcC/7xHla4pUdpKFmeO
         AnxvtXkBdPYfJIYFvssGz1KrMrJG7a9uzBLYCFUxrRH+/tmY0w4hK+kodsz/3O1+oPWW
         PNEMRUykRCeao2YNSYtdnKqFGCFDBGO6QDiLaBpo008Q+cr9bkTtRczx7+gCA3IrUK+s
         CPINyAovI2oKE7s26tQYq0PzAfXGlyMElzq8h31BYypnd2wjzZR0lu51xjLMmF278fsr
         y3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738779586; x=1739384386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYD314+kCrbyuPLEovXv8C/gyv8YrwaHmGXW6MFdMgQ=;
        b=ul7GwNHmA41mscoIFI5+VOnDpbOMt1bA9vE7LdSE9bNb290je8WdAvPpZXN2Noj4Oq
         GRIBGUdpIwcHfsiU6OpGp5lIdALgwY1pnaKWBK/SOVrqUfnY0+LGa81pRbOMtwy9dqU0
         vyj0GCn+WNdars2KpRIGcZbn1WMfXT/0klbpkIy2sqvCHWa981e4POE3PZIt8OSJmWG1
         pUZWLYHyd7pf86MFlCWE0SNvUxZ+ZaiFO/n3DfvG2gO8dy3Z81yux/P/O/H90eOMR8R4
         p0PU0NXZ4ohpOTgFSk0ZskfEYT6/4/ziiiWVcEbitgH/ia1ssiuaN9mwctG/sqN5Pxio
         rTZg==
X-Forwarded-Encrypted: i=1; AJvYcCUpp3k6qFcfJyjgn6EAX0vNDU049PW+wgBMHQK0CRB+OPwpgf34BUVxA8RgY2pZhvqAMKNPI8sDnl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4SEYcI40oh/2gmA7860iYMScopcGdiE2/ZHlND3iKBMbhSBV
	RJsu2nsJEZEaO10C6xk1s9ofO7lg/dEuEAgPzETd9RKQTDooJaLHv7Kho6OslIr2c3JFWSwLXnW
	dQMSwlbHjSSOjusULbLie33BWyZHXFv0ohtR6
X-Gm-Gg: ASbGncvhu1CxhU77J6KR6NMtYwIkQuSSwpW328ku+DD51s6ZBFi9BXXlsPl4ey5pIez
	x9PBaY+vLlBCM4xyjW6cTOk+QdAuT0qCHXS5OKXyNPzcXmkKIGDZb5sV7Why41EBcGuzN1aMupQ
	Yj1W9jc1gTsoIaQiZetPmhYTCDoiQvDA==
X-Google-Smtp-Source: AGHT+IGuWZdwDyLPOPSuzL97lJDl1x5nZAEdalBO0y1kiEQKuLwR5fdEC2+CwMSeq2b9Rl/wMIZG79qj6WwSZi2Yqko=
X-Received: by 2002:a05:6830:4702:b0:71e:5a:f4f4 with SMTP id
 46e09a7af769-726a42882bcmr2685173a34.25.1738779585726; Wed, 05 Feb 2025
 10:19:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202035100.31235-1-badhri@google.com> <20250202-purring-ambitious-axolotl-4c6ff4@krzk-bin>
 <CAPTae5+j9N=RBpfHVE-As+dz7HzrxXAH1enWrmSdFzu6DuaTBA@mail.gmail.com> <80172550-a3d7-4d56-927c-ff63debc79f8@kernel.org>
In-Reply-To: <80172550-a3d7-4d56-927c-ff63debc79f8@kernel.org>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 5 Feb 2025 10:19:09 -0800
X-Gm-Features: AWEUYZnQ_MjYKPi3GzKBCYvuUST4PyFu-pF3hOKR55xFpZgNJeJuOBnJiMENe7c
Message-ID: <CAPTae5+xF0B64AhT5fjMU9tcW8cT9smO5eUD=Wpsiw2CKAhDAQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: snps,dwc3: Add property for imod
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	felipe.balbi@linux.intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, johnyoun@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, jameswei@google.com, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 5:50=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/02/2025 10:07, Badhri Jagan Sridharan wrote:
> > .
> >
> > On Sun, Feb 2, 2025 at 6:11=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Sun, Feb 02, 2025 at 03:50:59AM +0000, Badhri Jagan Sridharan wrote=
:
> >>> This change adds `snps,device-mode-intrpt-mod-interval`
> >>
> >> Thank you for your patch. There is something to discuss/improve.
> >
> > Hi Krzysztof,
> >
> > Thanks for taking the time to review ! Happy to address them.
> >
> >>
> >>> which allows enabling interrupt moderation through
> >>> snps,dwc3 node.
> >>>
> >>> `snps,device-mode-intrpt-mod-interval`specifies the
> >>> minimum inter-interrupt interval in 250ns increments
> >>> during device mode operation. A value of 0 disables
> >>> the interrupt throttling logic and interrupts are
> >>> generated immediately if event count becomes non-zero.
> >>> Otherwise, the interrupt is signaled when all of the
> >>> following conditons are met which are, EVNT_HANDLER_BUSY
> >>> is 0, event count is non-zero and at least 250ns increments
> >>> of this value has elapsed since the last time interrupt
> >>> was de-asserted.
> >>
> >> Please wrap commit message according to Linux coding style / submissio=
n
> >> process (neither too early nor over the limit):
> >> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process=
/submitting-patches.rst#L597
> >
> > Ack! will do in V2 of this patch.
> >
> >>
> >>>
> >>> Cc: stable@kernel.org
> >>> Fixes: cf40b86b6ef6 ("usb: dwc3: Implement interrupt moderation")
> >>
> >> I don't understand what are you fixing here.  Above commit does not
> >> introduce that property.
> >
> > Although the above commit does not add this property, it has
> > implemented the entire feature except for the property so thought
> > sending this with "Fixes:" while CCing  stable@ will allow the
> > backport.  I am interested in having this patch in older kernel
>
> Not implementing DT bindings is not a bug. Otherwise provide any sort of
> proof that this was not intentional.



>
> I can easily provide you proof why this was intentional: negative review
> maintainers.
>
>
> > versions as well where imod support has been added. Wondering what
> > would be the right way to achieve this. Eager to know your thoughts !
>
> So again, downstream and forks... NAK, you cannot push things to stable
> just because you want them backported by Greg.
>
> This is not acceptable.

Hi Krzysztof,

I totally agree that this is not a bug but the intention here is to
not call it a bug but rather to land this in older versions of the
kernel as well which I wasn't sure how to do and I was perceiving
"Fixes:" while CCing  stable@ as a way to do that.
I will drop "Fixes:" and the CC to  stable@.  Came across the following
https://docs.kernel.org/process/backporting.html#submitting-backports-to-st=
able.I
will follow this and explicitly submit backports. Let me know if that
isn't reasonable

>
> >
> >>
> >>
> >>> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> >>> ---
> >>>  .../devicetree/bindings/usb/snps,dwc3-common.yaml   | 13 +++++++++++=
++
> >>>  1 file changed, 13 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.y=
aml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> >>> index c956053fd036..3957f1dac3c4 100644
> >>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> >>> @@ -375,6 +375,19 @@ properties:
> >>>      items:
> >>>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
> >>>
> >>> +  snps,device-mode-intrpt-mod-interval:
> >>> +    description:
> >>> +      Specifies the minimum inter-interrupt interval in 250ns increm=
ents
> >>
> >> Then use proper property unit suffix.
> >
> > Ack ! changing to snps,device-mode-intrpt-mod-interval-ns in V2.
> >
> >>
> >>> +      during device mode operation. A value of 0 disables the interr=
upt
> >>> +      throttling logic and interrupts are generated immediately if e=
vent
> >>> +      count becomes non-zero. Otherwise, the interrupt is signaled w=
hen
> >>> +      all of the following conditons are met which are, EVNT_HANDLER=
_BUSY
> >>> +      is 0, event count is non-zero and at least 250ns increments of=
 this
> >>> +      value has elapsed since the last time interrupt was de-asserte=
d.
> >>
> >> Why is this property of a board? Why different boards would wait
> >> different amount of time?
> >
> > Interrupt moderation allows batch processing of events reported by the
> > controller.
> > A very low value of snps,device-mode-intrpt-mod-interval-ns implies
> > that the controller will interrupt more often to make the host
> > processor process a smaller set of events Vs a larger value will wake
> > up the host processor at longer intervals to process events (likely
> > more). So depending what the board is designed for this can be tuned
> > to achieve the needed outcome.
>
> I do not see dependency on the board. Host has the same CPU always, so
> it processes with the same speed.

 By "host processor", I am referring to the CPU which is scheduling
the TRBs and responding to the events reported by the Synopsys DWC3
controller. In a nutshell, the CPU which is driving the  Synopsys DWC3
controller. The Synopsys DWC3 controller could be paired with any CPU
configuration and therefore is "Host has the same CPU always" a fair
assumption to be made ?

As a reference,
https://lore.kernel.org/linux-arm-kernel/9cb2e5fc-1bec-c19c-c04e-fe56e5c1bc=
16@codeaurora.org/T/#m392cc1fe604499984c61ac07dacc840616194efe
is the first patch which introduces IMOD as board specific property
for XHCI based controllers.

Thanks,
Badhri

>
>
> Best regards,
> Krzysztof

