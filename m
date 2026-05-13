Return-Path: <linux-usb+bounces-37411-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDfBC9W4BGplNQIAu9opvQ
	(envelope-from <linux-usb+bounces-37411-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 19:45:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DDF538427
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 19:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4C96302D084
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 17:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A6934DC537;
	Wed, 13 May 2026 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brbtuFEa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0A54DBD70
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693700; cv=pass; b=gDGc6VyWxyQHLUzsfiJ1mqkYP1mw4AnuAzPmXzUyTeBOV8Qk68yQxddXiwjbc6We6xrATp3Ez/3lZjQV4TpR0kaGVI36WS0egNGV2zf0bXnh7gfOpQGPjRjR4x0LeR9/nFjkpa9xYCTZesfHsstnLpSQL/b67aewbQzH+1TYmrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693700; c=relaxed/simple;
	bh=6mKKdTvK5cZhpi/RRSOEX613zOGTzbC3S1RaopRBLKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBB4BfkdF+8RphoPkzibP6RcRpQow8FsJ87B/zWFGDpwsaNMKJS3ccNBsovk7sHQSDCFonnZSw/QfuYeDdfxnUOFVFRMko9FUmuNI8naJmyIG1gEK2pB2ZOi8IgWB8reTsK4kcfrOmspVeLPx5nIHOgYmMlc4ebcywD6bJ05M3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brbtuFEa; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c15849aa2cso9465894eec.0
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 10:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778693698; cv=none;
        d=google.com; s=arc-20240605;
        b=SNRE0okhitaFIib42jzsDrmrLHirn/71prlLvjib1pRWyBpx7kUCsvGK5yStz5AO0X
         OqfjXN/Jxv/pxxLOApl8F9andC3Pl836uCexI2o4skBd247jYEL36dnacz9YkdnA1H/P
         aSFfKT0uaQPDeF6VLdaQGXaZfd82fPA2G/cL9IDPy5Na25yKMMvScrGv6wzFXXJw4kxB
         5ZC7bFhvn47+l+gOKtklN39Wepe6IQ/Lvqhlr+xnGASmAMdiHMiK7fd0jomdMfv5g6Uj
         iUdlSF5FSNnjoB9h5x+ltIXDiptccJlzPkTUqpUlWx3Gs7J5Dv2AGajLtTRtV7tsnqd9
         jLeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        fh=RnPpi0Pms8hM5/naIaNVQCYw+UL0d4I47spvOdcLM7Q=;
        b=GVkkMKyHs1MjXLrVAvo9DPIYza+PLdRJ1/P+BsZ3PESy8Hm5fmEKaNEXYOeBDI5gyz
         scPsre7nl9yn15UwBMCGy5b75nSfQySYE7dQgpRuAwQLtMbsk4Aerhn3E8ZBJ/YuO/TG
         ALu+Syld9kCoXwyKDeSuBg8cIuCvVgG0/DGxaYQGLyaRdBrlnuAy2I4zsv8J0HGYWjtf
         aQoOvNVkStLaUwz0KvAgwsxUyUKE3WFWJDdTPwGPZE+0RtzyY0mUdwju+l4DJSLLCwQv
         3i17NW/bhrjQY3AQNgFYa2M2MPvTO8AsWqKgV7IPe0RrRl+LBBjFGYgYCY4SD3WZ+hsQ
         iybg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693698; x=1779298498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        b=brbtuFEazLvBam8XINvJDXjF4XU7Qkp7fQiYSxPQTepmB8WvWHIRTCVTi9pB7foIL6
         0/W0vSriBFjY2RkGafYIp3N8uXwzdwScxWHoxxZtSCBovdpx7Xs6FOZzh/qaY31Jdj4t
         YTTlWuFH78pT5gkN1IBaUJPpp6RW+DYyC8ZeQJH3a44yTQ/pe6jvRdvWuqzbIKYMG8lI
         dW5AKVf2w3DaVrMJWyNn2iCQS2VTQ9sx+a8YZfbdcW3HIpw/xpSzTfY/y9Abr41h77mW
         1GJBzvBbtWmE0LM1lNMS6ehhYxVqQdGvALg6fD25VRI6iRdjMP27lhMh7XgnHdknCdPQ
         xlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693698; x=1779298498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        b=lpJMo5ihu8mC+9dp4rtv7b1xUiLomoh78OxSXbsGwoKhoazHS/oyXqho84imLg4Y4R
         4Rp2ARCO1JT/94seSl6OjYmfL1O30h1jxQJsM20QtpKyma0o5+giJkQiLaYb8+dzOE1c
         0kxV1J5ojB5V1PJZV/5HWGYqQ8Tuk3+Prbg/kBGqhcZzvYGLXaVMx9fEDYHMN8/fBCwD
         VGOTJrQHLh2jUN0c4WQjo98etRKuZv7Btd0yLQOzqSqHSt45MNRRP3ERK2ptekNSnpnY
         VdZHeRF/s/xAXK+MNSYBbEaTfpyKuc/YDwBnYwQC2RqnWl9FdMlFQCaemGgRdmyumdPj
         28Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/QAJOrL82OU3FWEsRJzvQVW0wa8xJQzFBqItYsPhE3hXpEqph9JzDXkblTOfUSm6n0HN9jwTgqd9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9CnHrjrfLO1+CkB3M7pUecJae0w8zVVi6g4OVWep3KfBQBPgX
	bgs/0t5ty8Zoo723jvwBz6m0miRYnHx39B/Krn8BemxD/rhBWGGO0UbtIiducjvX8HaPbROTok5
	ypK6yzRmi0TXq73NqfG7Y1tNO42Fqz8c=
X-Gm-Gg: Acq92OHdcgAEhUnuG6ZvWV13jDf773V6t4h3H9efkg9LmMD4+GKKsnKgDmGo8yeRXCm
	WQn340xGzGPlBmHh8BBYW6D9S2RuOcZxFET+fDYGM0+H5MnZY1/UCAe4ftxQDxvUVa8DF1ZWLtS
	xS/2DMlJG3XW2RpikhvE8tKsT2CB5uX4YA4FbBDF989dfTaTu+JiWJfNckLgu47a4x25Q+W9OZv
	JavQaTZWGBKK+XK7WZYexDZialsC9BszJtDenNi/UpUkPxPqPFlShCkOMmH6Ar4+o5G4ozC+CO+
	yX9ST8LWBRUp/AT4ZBM=
X-Received: by 2002:a05:7301:198c:b0:2da:d4b4:c85a with SMTP id
 5a478bee46e88-3011747e13bmr2818209eec.11.1778693697976; Wed, 13 May 2026
 10:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-2-clamor95@gmail.com>
In-Reply-To: <20260511135703.62470-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 13 May 2026 20:34:45 +0300
X-Gm-Features: AVHnY4Jn_9cXsf7GdBN5Zma5dh7sHSjSA1xGhyeTeuyfFq_71h-4QZdAyPVKUFI
Message-ID: <CAPVz0n2GkucfHqvgusF=K_KakqaJmZSLP=8VYMyVT5HAVDD_XQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: usb: ci-hdrc-usb2: Document
 nvidia,external-control property
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 23DDF538427
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37411-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
7 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Document the nvidia,external-control property required, for example, for
> USB lines in HSIC mode connected to a modem, where the modem requires
> precise control over the USB bus to properly enumerate all its stages and
> intermediate devices.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Do=
cumentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 691d6cf02c27..a13c1ef49a57 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -75,6 +75,13 @@ properties:
>      type: boolean
>      deprecated: true
>
> +  nvidia,external-control:
> +    description:
> +      Indicates that the controller is configured externally and that th=
e host
> +      should not attempt to touch it. Usually used by a modem which requ=
ires
> +      precise bus configuration.
> +    type: boolean
> +

Would schema maintainers mind if I create separate schema like
chipidea,usb2-imx.yaml is handled? At the moment ci-hdrc-usb2 holds a
mixed properties of several SoC and can cause unwanted/unsupported
node combinations.

>    ulpi:
>      type: object
>      additionalProperties: false
> --
> 2.51.0
>

