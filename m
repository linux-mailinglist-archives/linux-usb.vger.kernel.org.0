Return-Path: <linux-usb+bounces-15838-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03975994543
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 12:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B57B0281850
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 10:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19598199E92;
	Tue,  8 Oct 2024 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="04fJqgdB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1DD192B98
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728383005; cv=none; b=fo8RO9xQ2Wf2wtNuh4AJvJRW2qz1nFlFTPcIuqR2zNql+arDqXfx+OZq7ixZZebatm0r94hJriuA7iW0PytwZOU7FCFpXNYkyS1CUwmKf7Ycl+gZGspAux0sd4Z0cElrQKPHehz8fXwilGxEcYleQ1NWsqLy9gvxsvwUQD+Z9VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728383005; c=relaxed/simple;
	bh=f2JudxArye2wpiIb8K+RhPOO4cRulPiz/mwLo46SQUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtLch8gLZQAHu17Zew6JfmzLYj5zIZD7jW6YiWO3IoSlEJyqCzNaUxZs7EAAHTGgCRlGrF9D1sEb+QcvaH/JDRWnQwzUbaMnoMMYH4JF12cv5+7pgbjrxa3eDSb2MO8nXnIFfOcc++nTxFpKjAA4b41YqcqvIjOmJeL8L6ZxOJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=04fJqgdB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42f6995dab8so219525e9.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2024 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728383002; x=1728987802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fA/J2+ZQcPGnzj8ynI/jiVRpMpa13Bnx0iLjBY9FM9o=;
        b=04fJqgdBG0FKAXSEomaYi0tYw5yNwfAqSVCoSnlOH0bs+gj8nYzhpoiLXTzfkRHZfH
         msGf0FuDEr6doSi8oDRXFzNDyPe/911YIrvrJI1pVXAjcE0GgzMSxeRnswMPhvl/YCua
         j1e3G+e32Ehmr682utsuNtq/A3aNAfBlAXN00yhRyut1YO5JVL7VCzL+mhA/iwASsiEX
         SCrPgSPNu8ENloQyp5+DQm+4wUqox2eLJfIkiJVuoXyPXUTemqf0wWv+q4BGTGC6WuvH
         kCt+e/d2ROCuH+QNnbyPiDJLThUqHCKVcHn+ggYV4NLsGFUKoc+MZX/1Gtx9VtZwgbDD
         fAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728383002; x=1728987802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fA/J2+ZQcPGnzj8ynI/jiVRpMpa13Bnx0iLjBY9FM9o=;
        b=DlIsu89WphqJL9b8bIldYjFM0PUHrrA5mD/YBQtiQ+lE5+4dytdzsFx0yNUUUCoWHx
         wvATDRS7ABwFO72BPwvn+PZ/4IquEa26n/+yvvQbbMz5Galr2YzINlj+vHBuoE4GTvSB
         lTJ1K9jXtynVRnWVCQHSXRADC4YcTm40Umwa2FW0mO8BmcY0QjoUimGZt1jZJWBMF60+
         nFDJ1uE4lTWaJYiP202AVF9mp7kK9+mcuabfnRjVOkuGoZXU/m4CQ+6v3vC9jG927lUL
         P6mjtRddvMZ0HIMQF1nFUFKC8MEp7HUd8LgpfkqAhgg3CAhZKM1i72hv/hmjfsbtmK4c
         1Q7g==
X-Forwarded-Encrypted: i=1; AJvYcCVjflOJlzCQqHt+QokBVFLoyCHvtOVKr3z5L6KpGz1sX44Yz6uQhFgUuos0wirjwjsFaRW4hSOrZXk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/2JRG8XLTR3T9Pgb7oKMS4xB+0//7N/cVgNLSXD0RLhndVyVt
	MtIduOzwvxNjr7PljgZH3VXS1IxxQlDpIujHOpOBaP+W5CN6TOEiMV/NDDt1Jw2sF+oVbqPeqJg
	NHXCMSJRdSbV7bt7gJ409b9Bb0qW/FIBDVFCx
X-Google-Smtp-Source: AGHT+IHT/gNzWk1RKoaELNn2JDzijMxsvMFLG+EZNCcHZ4M5itLUHja0mfJFTvoukwb9uKzDVt6SzyaFPwzH3jyHGVA=
X-Received: by 2002:a05:600c:5010:b0:428:e6eb:1340 with SMTP id
 5b1f17b1804b1-42fcdcddf49mr4057055e9.4.1728383002113; Tue, 08 Oct 2024
 03:23:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007135508.3143756-1-joychakr@google.com> <20241007135508.3143756-2-joychakr@google.com>
 <c98ece5f-c105-41ca-af1a-bddc61893071@kernel.org>
In-Reply-To: <c98ece5f-c105-41ca-af1a-bddc61893071@kernel.org>
From: Joy Chakraborty <joychakr@google.com>
Date: Tue, 8 Oct 2024 15:53:07 +0530
Message-ID: <CAOSNQF148N5meoFZkbGKoMXMZ62kf=JOV+1r0GCsep3DPP_Lrw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc3: Add binding for USB Gen2 de-emphasis
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 8:26=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2024 15:55, Joy Chakraborty wrote:
> > PIPE4 spec defines an 18bit de-emphasis setting to be passed from
> > controller to the PHY.
> > TxDeemph[17:0] is split as [5:0] C-1, [11:6] C0, [17:12] C+1 for 3 tap
> > filter used for USB Gen2(10GT/s).
> >
> > Signed-off-by: Joy Chakraborty <joychakr@google.com>
> > ---
> >  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Doc=
umentation/devicetree/bindings/usb/snps,dwc3.yaml
> > index 1cd0ca90127d..a1f1bbcf1467 100644
> > --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > @@ -190,6 +190,18 @@ properties:
> >        - 1 # -3.5dB de-emphasis
> >        - 2 # No de-emphasis
> >
> > +  snps,tx_gen2_de_emphasis_quirk:
>
> No underscores.

Ack, will fix it with a follow up patch.

>
> > +    description: When set core will set Tx de-emphasis for USB Gen2
>
> And why it cannot be implied by compatible?

As per my understanding these are tuning coefficients for de-emphasis
particular to a platform and not the dwc3 controller, hence should not
be a controller compatible.
Similar to the property defined right above this definition which is
from PIPE3 spec for USB Gen1.

Thanks
Joy
>
> > +    type: boolean
> > +
> Best regards,
> Krzysztof
>

