Return-Path: <linux-usb+bounces-35041-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJQ+CJR6ummTWwIAu9opvQ
	(envelope-from <linux-usb+bounces-35041-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 11:12:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B82B9B03
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 11:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B2BB30131B3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 10:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B995C3B8D4A;
	Wed, 18 Mar 2026 10:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="5PH08Mmr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452F3B8D4B
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 10:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773828522; cv=pass; b=pNkCfUCjReQ854t2TNOEyp9I9ps+0ZL7ti7tYQI4NOSrXKFNmBZjTYdDP3/s16g92Y54YhFIqa2C76SmPCoXocrNAAini5sSGSaJ3PlcX7fus5WuFDJx1rMGtaFCjN2FV2/vhjXBdf2c0biop0wn0b5e52OQKEdNahhkl+ZvSfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773828522; c=relaxed/simple;
	bh=QeBwEzpkQBoucAoNzKR5pXm1ojBrdQj1YQVWxIyUZ6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDjEuJ3sS4B3cgkROSJx7pE+Odis/XJSyl5koSv6tc87Cf7bGGoW6Ocp+NZwNzWQtYllRGGbBon/S2uYWuew6+zLpSXXywtxG3qDYB1MQXrOw85504lMKoRlvksXFZyOX2A9NHiz7c7+dvOyNb4Wum4Yy8lhKJA9d0sOXqMZt/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=5PH08Mmr; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97f9587e6eso76814266b.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 03:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773828513; cv=none;
        d=google.com; s=arc-20240605;
        b=KHCb2dFXB8NPv/6UqTts4LXQ8ifBkdlKCeLBftJeKm2NCStjLtHmdLS3WKaGYyzPSf
         i7ERwyDwnxmD29h851CBPgCSKo4wPzRCU0AZlCLrZqiJizuWj2MdEEDX0BltKqJhEcIV
         l0briiHan4qV0F0E3SfZAI/OEm/ePRT0jNP4ZUUf6nr6mFLQDDCLwNN6zrtAZRgG5r6Y
         oPm752JNZ2QKTLbVTTgZRWuvaiAH97GbvTf8ybABoPcxo7TR6QeRWOSmqs2oD0Ee20Pd
         /XLXyi3NYqz1fLaOu/hpe6Z8jHbHtJR3yUvW2h86/Td+xmORcqdS5MesoP7aoFE8YkCh
         WM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vA3prr0pqra4fvY8vHWhez7S8tBJXQJ9txp+/8w8yfU=;
        fh=1jDSUSNHu9Cwcommda2iC7y58asniwNTfZm9FUcAdqo=;
        b=EgmtuEWcHqWuaReflvL65yeu5tFHEiQbwccSTO1BGk6NgCo0Za/AhsPu7tQc7YDdgg
         hmKO71H5zehXFXgrxtTppbMoJIPwq3ObWzJp1K73rI8h58XKxTplUOFRFUYh+LdLqIto
         p+gb5R2lbv5FBnzVPvjRonXkemfD+Mpm/Nm2V5C5G0nleiCpU+GvUypUghC1IMzYLndt
         T9qg6IrPNH5N3N/fwmDbMkzt8JfdElK+BaI5uqkXLcKGd60pcVCs4syknmPQ530/oK5F
         vn7yGNBi7MUM3bFPlVSb5pWc+5kHpv2fBMZljZLLwevjj0KLjd25JyPlYCDNq1d5bT7m
         ptkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773828513; x=1774433313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vA3prr0pqra4fvY8vHWhez7S8tBJXQJ9txp+/8w8yfU=;
        b=5PH08MmrYQuBIHjHEFqxdobbKawbDu7m48yaplt4qym8hzW3tiwTW/15LPFfeT1m9o
         EorOizKk5k4hUhQ9tZ98jLyMVwJXCi+JAXmZWAEWsPrWR9krbrYEtBDIeYG+7kQxirgG
         zKCYAWfMunFRu1+kTyEV5rIw7uqbC20Kr5JsCPE+hZbEorIO3kkSLYYMcH/b9ezTK0sy
         +leJTauMV0yQ//Ph/YGH/tG2VXR0dScUB65Q8EPIfUDvTOEPS4FaGBjbdNd285Gt85PE
         48s52xjHlwf2TWbX/6CGboPSx0IVTAZH937pIrBnTMnMwmyxDQcPt2GpOTsJGZLRMZdl
         9n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773828513; x=1774433313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vA3prr0pqra4fvY8vHWhez7S8tBJXQJ9txp+/8w8yfU=;
        b=S083UUBD3s3gNUqgLBYVZqnRQy6s90splJjNnXnMnnpuo47Wb42HtysxqFgGz8N5cX
         3dq4n2WpiyeNsRXCgVwAws5dATjF0LSbcWAN6CmKMkr2AU/9LwZg1ejhvLUFSUuxe9XU
         vo5tSu1IBFwiy3SsSqyvO3Z3TuVJHkEnGW4+yG8b3M3J9FWERsSeeEv4e2oZKRMHK3y3
         SKVLk0IIpSo+2vX+nPT7ajjTkhrI+najVtIOxvZ3j30F1+Rrtk4SSwzTdJX3Onc9BdiT
         ae4Z8gDyMkoL4eunhHdxrpp/7Aqo6EgtI5gnjFkRk7PRvItIDKehQU+M8779HTvyFzOF
         s2ag==
X-Forwarded-Encrypted: i=1; AJvYcCVSLZT8oHjqMCuLOo11GxH5KPlSR6KGBmGvE1wh705gHQ91yVqzA93l2XJqxDgPP042FX/j65eELEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOhQxy/EigNd8xwc0DtxFnSM4r3fLfjXXcvi8ILy0R1M6hXnBJ
	sj1in18eFbsWEDB7WP/YfAwPRjmuIruASs7PWF1cVyRr2HNclUELmBQEj/9U6d3Ecf7EkGD+y4v
	QNp5KoBgHtqxjFIWyTv68CXlWUM1x5ccn23s365OksQ==
X-Gm-Gg: ATEYQzys2mzS8+6v4MhKI+MtnKnaKlggm1Gi9j6HqdLX0PGoCJSbyGEaAd659L4G4o8
	qvqKlTzwxBjn4wNJv8mtiFOFEjygIiskImkd8tbrcqJosPsD26wa+tRCf1B1ZKQIYbwAmRTHeZ6
	6Z7dKHaukcfEzTIhoim4swUMb4Jpn2i5OjI2qUoj/yFDrdhUtxXyUoECPtKxKujdtf5c3tGxDzv
	MArLPFG346zyMR7bNhR7FvNmpYQwmXVXn6NL0NTJpaU0sYaWJFy0+c2ythwDzwtoNVhzIhCERsb
	mK9GNVA=
X-Received: by 2002:a17:906:4784:b0:b97:ad7c:64cb with SMTP id
 a640c23a62f3a-b97f4abcd3bmr149390566b.44.1773828513373; Wed, 18 Mar 2026
 03:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260318-husb311-v3-0-2b32e6192b9c@flipper.net>
 <20260318-husb311-v3-2-2b32e6192b9c@flipper.net> <c7129177-1265-4bf3-9925-48146bde37bf@kernel.org>
In-Reply-To: <c7129177-1265-4bf3-9925-48146bde37bf@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 18 Mar 2026 14:08:18 +0400
X-Gm-Features: AaiRm535_GbWw5AUGnVGXLuLzlNfnDHGSXBhv5FW1noP-OPW1VXZBuUsNdmUPdo
Message-ID: <CAKTNdwHrmpLLf0Oh27Td3YG0qsGKxhDBLRh4_hL3+kGWwKFvZw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: usb: richtek,rt1711h: Switch ETEK
 ET7304 to use a fallback compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gene Chen <gene_chen@richtek.com>, 
	Yuanshen Cao <alex.caoys@gmail.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35041-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com,collabora.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[flipper.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 253B82B9B03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 1:27=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 18/03/2026 10:23, Alexey Charkov wrote:
> > As stated in [1], ETEK ET7304 is functionally identical to Richtek RT17=
15,
>
> Functionally sounds like its functions/features. You mean the register
> layout is identical?

Both actually. The only difference is the VID reported in registers.
Will reflect in the wording.

> > so reflect it in the bindings via a fallback compatible.
> >
> > As there are various TCPCI chips by different vendors reimplementing th=
e
> > registers and behavior of the RT1711H/RT1715, fallback compatibles will
> > scale better.
> >
> > [1]
> > Link: https://lore.kernel.org/all/20260220-et7304-v3-2-ede2d9634957@gma=
il.com/
>
> [1] should be after the URL, rather.

Noted, thanks, will adjust.

> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml | 11 ++++++=
+----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml=
 b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > index 1eb611f35998..62169daddb4c 100644
> > --- a/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > +++ b/Documentation/devicetree/bindings/usb/richtek,rt1711h.yaml
> > @@ -18,10 +18,13 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - etekmicro,et7304
> > -      - richtek,rt1711h
> > -      - richtek,rt1715
> > +    oneOf:
> > +      - const: richtek,rt1711h
> > +      - const: richtek,rt1715
>
> That's still an enum. Don't change the format.

Ack, will make it oneOf: enum: ..., items: ...

Thanks a lot,
Alexey

