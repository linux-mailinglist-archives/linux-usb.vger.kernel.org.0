Return-Path: <linux-usb+bounces-8658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE13892011
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 16:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F545B2B77E
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 14:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A797D13CA94;
	Fri, 29 Mar 2024 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xx1Qa20K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA1E1CAA6
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711716837; cv=none; b=LoNBzailAgKm9Dc1CIsBb3O1dQArx0cCN2tupEauQJ2nLaqRnyXJSPY/7wYHLJzmPL1oGqloakJnVfCN2O/z0HX/DATiSKUWwAws9+y8Y0RhReI+OFxPTsJfx5j0m8LWjQGnq+T8IJ+7htclrWs7HpoVJpieeFotbFeD4q4WnLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711716837; c=relaxed/simple;
	bh=UsSlr2DfmOF/BtL79NIGofPlpt4lDrgJKpftKL7JDDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J05KwvYwlmKBZchF/ib0APhBoNYkHL+TI9l2DSgcF87SvhIZQPjxUOHBzE5GG7Em/9b7AryGEi0ezZ2kzUOR1QwL5vrbdmbwIMYBDWaEbtjyGLxxgwCnwhrrgDbg7wT1P2JHTI7TIGQsZSKCNyjna8bqNIz8LYOQBmjL/DzJpcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xx1Qa20K; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso1363022276.1
        for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711716833; x=1712321633; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NyDnNSvCJUp05VCQqo3677K6CevG5jtaaiUaNI9UR+M=;
        b=xx1Qa20KQGb1Gf4AovVMHQnR/0+zE2BThA1nMVYx8ld5frjNSyOUOUdZYNgUY4l8Lf
         fyJjdsv8v6I6RtyCgPjifp/mEj4JgxZJ4YK9PQoXwQn/0WT9Zj9LPpMjw1i9DThLauH5
         j1V97wHgknPR9it6h7c+kY3KDCTeTaiRIb4uNOrxi2adamp+TKGIlpC3P+fSX7WeEtWx
         SDqwumj+SZqC0pI2uuiFeuJOJ3PRvaDh06qHdRAxqFUuHz9/SVvkfxPqT7gLjdKk3GCu
         FQF9bDH91TAfVsJ1tz15GFAWWaSa781e9GgYq6xu2U/cjXaVwFC9Jg4CtjTvrwuvb59Z
         NURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711716833; x=1712321633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyDnNSvCJUp05VCQqo3677K6CevG5jtaaiUaNI9UR+M=;
        b=tajMwnBptc14S+kaUrujlQSf1pWLF22MEPVgWiMrkEqUqPWhNMjmVxl8zl54ubcInm
         ua9xEv4tIl8mjb4J3oJyQTGyloWce55076yiQWvPw6EpTmLIfV7VStaV/KydzxrXUSeL
         5Fey/qwWEK7MANAvdwojJ4svrYw7gaFYQwotV3SvX92eyG94KT1GI8HaLvikJjXJSPCS
         36yEtzswO5CMg+qPN3OQmVl85SxcZp/IKMTP0IJOgAeOkviY1I/Ryyncrzvy656H10im
         t3Cnz/EHAiHh4Y/oQWNgJT1JvVoTYlYFU0TU4zk66V54aTtHIkldmW6uR87QbsYyAqak
         EEpw==
X-Forwarded-Encrypted: i=1; AJvYcCW6RiTPMXuhignmdEa5WY17jz9MbYRLbdP3Zkns6bKRFuZYxa4L60TvXkr6EgfwIM9wR5vqr261ozECqayBmM21HyJNvgeRhj9S
X-Gm-Message-State: AOJu0YxpwGXtcMuo2Ues7fsvsbuxpr9gah5c0kj68dOAgq7Y58er/MDT
	7W7+7Y9XBTrO8EZ39Nx7vTNHA7OP9FcXNduZNabLwKURGfxNCwzNSSYJ6Pvf8l1ctaayn6FcDvU
	hwR1r+xNt9h5Dl3qua08MskN53mf3UIcxLO8Z3g==
X-Google-Smtp-Source: AGHT+IFunI+UQDVGnWmv0F7IWNGm07qzq1TQ+0vfx7aJ3z/R1MeKDke21gd7kwJEbmHQGGRWljZRqkClNo4ONptPYGw=
X-Received: by 2002:a25:6c8a:0:b0:dc6:c2b2:c039 with SMTP id
 h132-20020a256c8a000000b00dc6c2b2c039mr2259417ybc.41.1711716833190; Fri, 29
 Mar 2024 05:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240329071948.3101882-1-quic_kriskura@quicinc.com>
In-Reply-To: <20240329071948.3101882-1-quic_kriskura@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 14:53:42 +0200
Message-ID: <CAA8EJpqx+VFW8z6oG=+pnhPN97Q3R6z+ygf85Uspve-9syQsUw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Add gpio-usb-c-connector compatible
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <linux@roeck-us.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Kyle Tso <kyletso@google.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, u.kleine-koenig@pengutronix.de, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2024 at 09:20, Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> QDU1000 IDP [1] has a Type-c connector and supports USB 3.0.
> However it relies on usb-conn-gpio driver to read the vbus and id
> gpio's and provide role switch. However the driver currently has
> only gpio-b-connector compatible present in ID table. Adding that
> in DT would mean that the device supports Type-B connector and not
> Type-c connector. Thanks to Dmitry Baryshkov for pointing it out [2].

USB-B connector is pretty simple, it really has just an ID pin and
VBUS input, which translates to two GPIOs being routed from the
_connector_ itself.

USB-C is much more complicated, it has two CC pins and a VBus power
pin. It is not enough just to measure CC pin levels. Moreover,
properly handling USB 3.0 inside a USB-C connector requires a separate
'orientation' signal to tell the host which two lanes must be used for
the USB SS signals. Thus it is no longer possible to route just two
pins from the connector to the SoC.

Having all that in mind, I suspect that you are not describing your
hardware properly. I suppose that you have a Type-C port controller /
redriver / switch, which handles CC lines communication and then
provides ID / VBUS signals to the host. In such a case, please
describe this TCPC in the DT file and use its compatible string
instead of "gpio-c-connector".

>
> This series intends to add that compatible in driver and bindings
> so that it can be used in QDU1000 IDP DT.
>
> [1]: https://lore.kernel.org/all/20240319091020.15137-3-quic_kbajaj@quicinc.com/
> [2]: https://lore.kernel.org/all/CAA8EJprXPvji8TgZu1idH7y4GtHtD4VmQABFBcRt-9BQaCberg@mail.gmail.com/
>
> Krishna Kurapati (2):
>   dt-bindings: connector: Add gpio-usb-c-connector compatible
>   usb: common: usb-conn-gpio: Update ID table to add usb-c connector
>
>  Documentation/devicetree/bindings/connector/usb-connector.yaml | 3 +++
>  drivers/usb/common/usb-conn-gpio.c                             | 1 +
>  2 files changed, 4 insertions(+)
>
> --
> 2.34.1
>


--
With best wishes
Dmitry

