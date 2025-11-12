Return-Path: <linux-usb+bounces-30449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9543C52009
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 12:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 683B03A67A4
	for <lists+linux-usb@lfdr.de>; Wed, 12 Nov 2025 11:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC8730DD14;
	Wed, 12 Nov 2025 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Agq4Gj7q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FABA35958
	for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946890; cv=none; b=T3LxOc/7bL8nMa3RaacoB4vpP/GnA9mHZ7/XRdhfqcqHomis8PzTshckl4RMIO2t3XL5TYXR1IJUDgA/dJPEGZb+sSBifhozmkAukd6ote1p8ID58YuNKMvvzO6bHTK5X8rPkoghWfb8RYsgJDVA3JDE1WYOYZ39sQecm6lPv/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946890; c=relaxed/simple;
	bh=1dYK7f4FkPzoZeJ51K8mDZvHGpP/FeIezNcDD5hERdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pg0Ow9KP1JR5EJ+li/FJhUzMWzNU7Q37ldwSmVOuHkIU3MAUtDVWv8erxMk5Rn9Rl01od+ufTlwIEUGutXu4CWaTD+YyY5eHU37Gkca+fc/fdWPepjjdyM/EGjOvBU/CKLV0QnXqJAeMVSJVHR0jlaiiTdmbejbghj6oznwxtzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Agq4Gj7q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2957850c63bso6266805ad.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Nov 2025 03:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762946888; x=1763551688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig8V7S9rFhIoVLkY+/XWuMwWvPcC3NWWv4ch5Z8G1nk=;
        b=Agq4Gj7q75twnaldQoOyRwegmMpWfqRiAkSduaLyqfF9b0ngSBXUBtv38zNPxzZpju
         2LpRH+6BJo6spdCm8zZPmto1MLnrBLRUm0IpN6/mSkVf51HqIIPjhyJgDMSLvcMO1oRM
         MbjG3IMv5Lnbq8xDWQz1rKjXI92CnRArQ7ya+qWk/+lQyJy1mampYfS07KdJCS0becQa
         YfWSz7irenPniI+wFEEq7tfeB4zn1FuHmSABqEcIdGoti6+7BD5XeI+HUliFBkUsEeCn
         Oz+AG21bFX/eRk0++NhYJbsjsX5WIigS64HJwwEwNpZafC97iICeD7vbcHYl9cDYOLpx
         02Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946888; x=1763551688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ig8V7S9rFhIoVLkY+/XWuMwWvPcC3NWWv4ch5Z8G1nk=;
        b=wxito8ZVuWtA5EDn9J7norVuvgOtyeMDLHSbOC4JK/sdN/LzlUy41VsnUeLvXkfVio
         rcC7UHOjZLPjY4KzIF6qEooktbyoXk9OkUdO54XId7UfgsTjdIlBvdGmis/Gw0POpbdr
         QhYM1q2e9FRUy62N71HqxJ8RCgDszdwTBU64+0QoHR1aeXX4Iml3HA0xtW3fK1M40or4
         CkRZyfSvGJTRbVmbmBJ7lT3WZ8cgAoU1E04R8HGbnc4JZnK37Cr4give8EyGqy27a44S
         DTXlKIprwL79gWSpel9c81pKxNWKYs22u5cQ7ecWeGAZbdo5HEC6QrLPjLQl9/Er/w+b
         5Ujg==
X-Forwarded-Encrypted: i=1; AJvYcCXQYidXfr8VTFWdvHaMO3iYEvIDgSF5huVr8T0Tm1gFHiB2LrhiGz4W++wGOlVJGJ8FD8/eNT0CQig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye9RSCyvd7ORhyEXTo8b6aKsMj/7w/Isd9aBQ1BY9CI3Axu/bI
	T5jo6eLTtbyE4UFg3dA5BQRko8rH8gdKWk0Jx2nTENuY4Lbtlu0bRk0LgiVBc83qPfmb13B+drE
	U0vsi+9hrCQeapSwMRo13LzsIGy9XyCIlXhkSSreo
X-Gm-Gg: ASbGncvJhZwotdoCGV3HTuVjC5dnTDpugwLzN4dZ++P7vC53ifHh2S3v0baBjIBB5HV
	XG7RFXQYOakBCi1Ia7/KaSWjC2AFZZYcF/R/jfd8NSYgtQwFJgE8ey0jX1OMpILS5I0PBmRHjkV
	RzZpaEExwT6vKgzZ8F37H9VDeiTUOUNAsSXBd4xifsMdWd0vy59jGa3AWPnMWEwQ7y7rdQ3XxP/
	5HiVjJsFmhr6Ytr48hofZJzQxUMdKb1+y5LcUk/83rUT5RW0BM03ZFLdY71iStRpFqvzjmHpi3E
	nqUvsAhUf3ePQKFJtArn3VTZ3btHxAeecwiQ
X-Google-Smtp-Source: AGHT+IEzhYJUJIhP1itpJ8SMj4wfy7Edo9fDUXSWIfM11ytYomEi4CEvHvu/YvWNAK7+sehRmwWVHzbMhPckpBBMF6k=
X-Received: by 2002:a17:903:234d:b0:296:5ebe:8fa with SMTP id
 d9443c01a7336-2984094a5bcmr70869985ad.23.1762946887940; Wed, 12 Nov 2025
 03:28:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111130624.3069704-1-royluo@google.com> <20251111130624.3069704-2-royluo@google.com>
 <20251112-logical-grebe-of-modernism-dcf83b@kuoka>
In-Reply-To: <20251112-logical-grebe-of-modernism-dcf83b@kuoka>
From: Roy Luo <royluo@google.com>
Date: Wed, 12 Nov 2025 19:27:30 +0800
X-Gm-Features: AWmQ_bn2RT6EbgSb3mHFWKckHPwcrvZ-s2OqhjevpH_GhYx3Lcain4Rs18PGkFc
Message-ID: <CA+zupgxALZjF8m=PfYgb1QUgf0u+-Su0XYQ3VB=fCpM1dt9s_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, Badhri Jagan Sridharan <badhri@google.com>, 
	Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 4:32=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Nov 11, 2025 at 01:06:23PM +0000, Roy Luo wrote:
> > Document the device tree bindings for the DWC3 USB controller found in
> > Google Tensor SoCs, starting with the G5 generation.
> >
> > The Tensor G5 silicon represents a complete architectural departure fro=
m
> > previous generations (like gs101), including entirely new clock/reset
> > schemes, top-level wrapper and register interface. Consequently,
> > existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitati=
ng
> > this new device tree binding.
> >
> > The USB controller on Tensor G5 is based on Synopsys DWC3 IP and featur=
es
> > Dual-Role Device single port with hibernation support.
> >
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  .../bindings/usb/google,gs5-dwc3.yaml         | 140 ++++++++++++++++++
> >  1 file changed, 140 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/google,gs5-dw=
c3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml=
 b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > new file mode 100644
> > index 000000000000..bfaf6cbdfec3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/google,gs5-dwc3.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2025, Google LLC
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/google,gs5-dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Tensor Series (G5+) DWC3 USB SoC Controller
> > +
> > +maintainers:
> > +  - Roy Luo <royluo@google.com>
> > +
> > +description:
> > +  Describes the DWC3 USB controller block implemented on Google Tensor=
 SoCs,
> > +  starting with the G5 generation. Based on Synopsys DWC3 IP, the cont=
roller
> > +  features Dual-Role Device single port with hibernation add-on.
> > +
> > +properties:
> > +  compatible:
> > +    const: google,gs5-dwc3
>
> Doug just said SoC is lga, not gs5, so you need both to align on that.
> Actually not only you both, but whoever else is upstreaming from Google.
>
> It is not the community who should synchronize and organize way how
> Google works on their own stuff. Google should organize how Google works
> on your Google's stuff.
>
> Best regards,
> Krzysztof
>

Ack, will align on the next patchset.

Thanks,
Roy Luo

