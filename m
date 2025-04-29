Return-Path: <linux-usb+bounces-23545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0322AA0178
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 06:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9BD95A5359
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 04:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1879127057F;
	Tue, 29 Apr 2025 04:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b5Myyv2b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E154726FD85
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 04:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745902649; cv=none; b=IfofR4vDfvDGH1WAmgPEQv3N3K/ttUKGVX/CDGIFNyLEKzohHs7vTzpJNPmI/hTslNw7hHiX16fQLOk5/0pSMXWjC4zv1WksGRvJwUkNdtMN1AgxBZdgCdvB9I9aF8X/rEuzZyOLQEaQxoSOT6olGjSA+wUIGzqLGs6oZyqs8nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745902649; c=relaxed/simple;
	bh=m6FGyiZkHMC+2yp8IbiBo7CjuQ9bcjs1Mm4nlu4EBhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCPbb41Fc3vQEAFUOMJJ5mPDGDhDrGkly2ZrIs5lxesUpCje+VqKfbmx8ruc1fVaD1Dyga8x9dOnKkkZjvMZWKEGUc8BAeOB2A2Y/MYksp5M29Ut0nO9FAHc9Bnke8PKye4aqJsgcXdb6avQVzNbsmVgBM0O51wf7/wcb1/QlGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b5Myyv2b; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72bceb93f2fso3960625a34.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 21:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745902647; x=1746507447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxJjPKSvLNuwm8T8yyYWoXIiPFioN2J33NfgaoCKRgA=;
        b=b5Myyv2bVlHfQWpWI2rdYfx4K0qmOn/acjSe2C15k2s0+XT55KaN+c9aeebrJIFhe7
         2gxaxfslfagTFK8b7trQS7JngAF9R5r1/oDQeM4pyu/KOitPKh10GVFO5o4pivw4m7gO
         KIHAbusO6EObS+CAhbE3J7RKzPAOmAcbzZ/aU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745902647; x=1746507447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxJjPKSvLNuwm8T8yyYWoXIiPFioN2J33NfgaoCKRgA=;
        b=bmXFeWNOm2gvkNFSqWLHDrMgmWGMnZ43jT6POUomczIaGUeYsxY7pRsRqTvCOp/vZG
         HAq76ipf3BFA2DP1CflvVu4davGs3GVnILmpNaEX/cUdYElMVwQ621i4Dbk8JSKoID1k
         N7JWj/vvFwKEpzHw7/YMdYk1wcQCj52bx2+POtNVhbD9I4/vTCGjqj7B8Jqoxnjy/uTk
         ZVguJv25R15/GZU9uNxqxFtqAIjjC36ypJxLfRc4E3Z4C6tY4br+LkK6M3z+gElKfNtB
         xSGzCXh6OuFciURl5Zb3KjX+C6J3Oq10V7l1KLMx2lt6W24Oc6Q1bB+dndVSf0tkdHfI
         HGoA==
X-Forwarded-Encrypted: i=1; AJvYcCX4rq1a4qj9Wq1bVK0y3k02FgBtorKQ2xe0fkv9LU3I2HE//0pvAlX2h3E9d35yEskhCYb1xofRywY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhLoLtOroaJYoOluicAxSawXOXG54H9Z6U9Mz7Em5+3p+P4VPZ
	sUbQIpN4GjOjBsq4X2aDQmyO8QO6yrF7UE0PQjxJEdCawZ0OMxAtaQCiwjAnK6MxxQ0QWo7Mf6Q
	EXwFXnBlNE4xrmynSJ4Ab7ol0RGtWR/FGxz+X
X-Gm-Gg: ASbGncsNbIr4XPlA6KZ2ZNHbCW6BZNC7Ki5GZvaxrJvaX9uhTYmIH+WmJDeYPAA4DNy
	YxXWbMxnDz8FYXSGj+XiehO0xr2lcPcype0cRWo1wqPyaPn5vAUGVArUSPlUiXEBF59YsIlGNXw
	Wuz/rwyRMdIFWa9qOCqxjtjoxLCs8DLb5/y8ZyOUSvWgoUYU9NZqvi+Pl4LEAo
X-Google-Smtp-Source: AGHT+IFUnSYiQTmvsck+KUotDYKkwXPoTLcg5O5KAVTySG21gdvW1WNGApyRqouuC1eL9JpZ/kRdvGBU+Ln7X1cOHQg=
X-Received: by 2002:a05:6830:40c6:b0:72b:77c0:7d7c with SMTP id
 46e09a7af769-730898e1330mr850088a34.6.1745902646915; Mon, 28 Apr 2025
 21:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422082957.2058229-1-treapking@chromium.org>
 <20250422082957.2058229-4-treapking@chromium.org> <CAE-0n52cwBxJ3gYzSi1+nNcRRSgbMToYBFLJwdVWSMOxBmUN1A@mail.gmail.com>
In-Reply-To: <CAE-0n52cwBxJ3gYzSi1+nNcRRSgbMToYBFLJwdVWSMOxBmUN1A@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Tue, 29 Apr 2025 12:57:16 +0800
X-Gm-Features: ATxdqUGMZR39bp0SrXhteoiQw82MbBr2R1yiXPTsRp7MUnVxU0r-Nptpe6H-Yy0
Message-ID: <CAEXTbpfb6KOqrU0oAvbzV76Wj_YORsjcukBVZx-d2evYtmwshg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
To: Stephen Boyd <swboyd@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Tue, Apr 29, 2025 at 7:46=E2=80=AFAM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> Quoting Pin-yen Lin (2025-04-22 01:28:29)
> > diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml=
 b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > index 6577a61cc07531..a020afaf2d6e7a 100644
> > --- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > +++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > @@ -10,7 +10,7 @@ maintainers:
> >    - Matthias Kaehlcke <mka@chromium.org>
> >
> >  allOf:
> > -  - $ref: usb-device.yaml#
> > +  - $ref: usb-hub.yaml#
> >
> >  properties:
> >    compatible:
> > @@ -19,61 +19,35 @@ properties:
> [...]
> >
> > -      port@4:
> > -        $ref: /schemas/graph.yaml#/properties/port
> > -        description:
> > -          4th downstream facing USB port
> > -
> > -patternProperties:
> > -  '^.*@[1-4]$':
> > -    description: The hard wired USB devices
> > -    type: object
> > -    $ref: /schemas/usb/usb-device.yaml
> > -    additionalProperties: true
> > +additionalProperties:
> > +  properties:
> > +    reg:
> > +      minimum: 1
> > +      maximum: 4
>
> Is this limiting the 'reg' property of the hub node and not the child
> usb-device nodes?

Yes, but the regex pattern of patternProperties restricts the
downstream device nodes to '^.*@[1-4]$'. So the 'reg's of the child
usb-device nodes are also checked.
>
> >
> >  required:
> >    - peer-hub
> >    - compatible
> >    - reg
>
> Can 'reg' be dropped because usb-hub.yaml requires it?

I can drop 'reg' and 'compatible' in the next version, but I see other
schemas referencing usb-device.yaml still set 'reg' as required. Is
this some kind of convention, or people just didn't notice this?

Or maybe I shouldn't mark 'compatible' as requried in usb-hub.yaml to
make it more generic.

Regards,
Pin-yen

