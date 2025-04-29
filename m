Return-Path: <linux-usb+bounces-23556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C2AA1A9E
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 20:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 739223ADB83
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 18:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F219253949;
	Tue, 29 Apr 2025 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TJzHirKm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183D1C6B4
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 18:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951062; cv=none; b=IwYlIJoxegtSxqL2yoRTheWhi0BrPJ81sJripcji1ZI3tGjAHV/hFuSY5+jvdgO3wXG66WOnVDJpIH4ThyGsO+zPbeXxhbhQ+WH7vqXzgrbGOOAw0P7UGoqoREB//DFISvpJOrKGMGPMH++rH2yXhtiiyXfh0FJzr8MoLMY4c84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951062; c=relaxed/simple;
	bh=RJa7WlHjlJgo60D+6Dl0m/sbJ7UiWpejvUH/NN60IfE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D/TsiuN8SGMJ6yqT2gXTV9t+4f1a+M6JPAnlBkO+RrJ9B61GxkWURFKib8/5RmHjdG189UEZVyLQXbZT1MQU1rGVqNxzrzFXe4aWnjuESHM0Uw0hcRd6yLfAKiz5zFEUHFDsPWDaU5ihIa+MZj2JPr0hQUHyGsF5uQ/VHwNXBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TJzHirKm; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c56a3def84so617106485a.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745951060; x=1746555860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F12pg5HzOsF6YliOK/8QQ8SVTK4+Rj0ibiDXWC85YMA=;
        b=TJzHirKmdd7NU+gD1Ecu272QUNDsa84cZIvp6hfZdJTwwuXHkBn4hsSK33/V5cSXBP
         SojUrIOIuScvD8t/sFcMybpBEj0MlfZZmx7sF2MK4dyTC9jwdO4UX+tejY14iLVyrlIM
         dyeDEWQIOJulUJnK+APNRqQuY6Lp5slVrDnyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951060; x=1746555860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
         :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F12pg5HzOsF6YliOK/8QQ8SVTK4+Rj0ibiDXWC85YMA=;
        b=ecPEgoBgWyyP/sbpPHwpMCnh0FWFdGs9TQUYFvEXfD/tIDF+9NZkEzDySI+kErYbFg
         kckgxZDh/txqWBW6YTEc2mHRqXy+pV0iV07mD11xYgZZ2aIJuV3qLSn0yEv7PgLeFgcd
         JZMUIJGypkvrOL5jqeQ4Y4w32oTq0YXx7814GD01u720U1tKM7RArAqQUOSTbgF3eLrN
         a+miIu1pwbKTLofbU8YGt12jDO235uuc4k98P9i8yvwaOqv7pSBTLi/8ER8y8lXo+XXu
         UodnqO9ZGhnWy924m+I2CUCqx8A0HBY7kyyT0D00Si00T3a3U71Au8Bh7hdM3BFoUSpB
         jFqw==
X-Forwarded-Encrypted: i=1; AJvYcCX67SRxCcpRojwheZ0+hFJYG4w0elxiutDoyMmgDsNKecK/T4ycJygmqQp/8vRnrr4S2LtPv7m4IR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6hAA+xxeQgFRQiOoyBGjTlK9ZFOAgrarQrJwjIqD9CJ0MewUF
	nvtZfkrkL9JbmRDKpesJ4kYMMSwRYxPzb4mndWAuvo6rC8+FQW1pjQJ5FIkuO20NDVllh6ez8Cp
	DxGpOAOvXndu0lNjMfLpiWCLpg3nBu2rY7Pax
X-Gm-Gg: ASbGnctmQNNUBEYlHV0h8Q3vTXXhiIb6o9GnAvztGi98yYIjCFyZ/OISuZ/O0FC5Q4H
	pDsbuhNeK+kNU+KJxMpsghA6JrByacwkbdMLfCs5aHVJy9AVDG0ixBcVF8ZXwgg45mnDpFVri3p
	1qoS0W8Ds/FZNJcVAaRnds23X61wVKffY73v/gpfPF9wkDNPFaTg==
X-Google-Smtp-Source: AGHT+IEuYZ2r4eYEmCnRhaGeNZqjE8w9e9f0L6v1FIOcoNWO1AUT1cDFAMaQiUVPFzCMjJv1HcimUcXF1bPyz4z/CM0=
X-Received: by 2002:ad4:5c86:0:b0:6f2:d367:56bf with SMTP id
 6a1803df08f44-6f4fcf3ffc4mr6322226d6.31.1745951059800; Tue, 29 Apr 2025
 11:24:19 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Apr 2025 11:24:19 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Apr 2025 11:24:19 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAEXTbpfb6KOqrU0oAvbzV76Wj_YORsjcukBVZx-d2evYtmwshg@mail.gmail.com>
References: <20250422082957.2058229-1-treapking@chromium.org>
 <20250422082957.2058229-4-treapking@chromium.org> <CAE-0n52cwBxJ3gYzSi1+nNcRRSgbMToYBFLJwdVWSMOxBmUN1A@mail.gmail.com>
 <CAEXTbpfb6KOqrU0oAvbzV76Wj_YORsjcukBVZx-d2evYtmwshg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Tue, 29 Apr 2025 11:24:19 -0700
X-Gm-Features: ATxdqUFejwQ77NkwJw7ohUrQlQOeNG0in9NRcHlIVxu9xsrunJsL3ZQnzhOWA54
Message-ID: <CAE-0n52aw2HXe1eUCkLbbc7tnr+okF54hOfSSRm9nic3rbCFzA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: usb: realtek,rts5411: Adapt usb-hub.yaml
To: Pin-yen Lin <treapking@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Quoting Pin-yen Lin (2025-04-28 21:57:16)
> Hi Stephen,
>
> On Tue, Apr 29, 2025 at 7:46=E2=80=AFAM Stephen Boyd <swboyd@chromium.org=
> wrote:
> >
> > Quoting Pin-yen Lin (2025-04-22 01:28:29)
> > > diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.ya=
ml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > > index 6577a61cc07531..a020afaf2d6e7a 100644
> > > --- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
> > > @@ -10,7 +10,7 @@ maintainers:
> > >    - Matthias Kaehlcke <mka@chromium.org>
> > >
> > >  allOf:
> > > -  - $ref: usb-device.yaml#
> > > +  - $ref: usb-hub.yaml#
> > >
> > >  properties:
> > >    compatible:
> > > @@ -19,61 +19,35 @@ properties:
> > [...]
> > >
> > > -      port@4:
> > > -        $ref: /schemas/graph.yaml#/properties/port
> > > -        description:
> > > -          4th downstream facing USB port
> > > -
> > > -patternProperties:
> > > -  '^.*@[1-4]$':
> > > -    description: The hard wired USB devices
> > > -    type: object
> > > -    $ref: /schemas/usb/usb-device.yaml
> > > -    additionalProperties: true
> > > +additionalProperties:
> > > +  properties:
> > > +    reg:
> > > +      minimum: 1
> > > +      maximum: 4
> >
> > Is this limiting the 'reg' property of the hub node and not the child
> > usb-device nodes?
>
> Yes, but the regex pattern of patternProperties restricts the
> downstream device nodes to '^.*@[1-4]$'. So the 'reg's of the child
> usb-device nodes are also checked.

I'm confused. The path looks like it is removing patternProperties here
and limiting the reg property of the hub itself so it can only be at
port 1, 2, 3 or 4. Why is the patternProperties being removed? Don't we
need to keep the patternProperties around, or somehow get at the
patternProperties for the hard wired USB devices in the usb-hub schema
so we can constrain the reg property to be between 1 and 4?

> >
> > >
> > >  required:
> > >    - peer-hub
> > >    - compatible
> > >    - reg
> >
> > Can 'reg' be dropped because usb-hub.yaml requires it?
>
> I can drop 'reg' and 'compatible' in the next version, but I see other
> schemas referencing usb-device.yaml still set 'reg' as required. Is
> this some kind of convention, or people just didn't notice this?

I assume nobody noticed.

