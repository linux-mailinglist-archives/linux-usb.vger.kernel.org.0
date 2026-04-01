Return-Path: <linux-usb+bounces-35757-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MszEx5szGmUSwYAu9opvQ
	(envelope-from <linux-usb+bounces-35757-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 02:51:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD29B373492
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 02:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E505B301D073
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 00:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62406195811;
	Wed,  1 Apr 2026 00:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="PpdHDVCz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980F3D561
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 00:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775004553; cv=none; b=Rza1uHp4kJgsdJLPfU2zAUf9wBXdnnbdSeU5h0wzUs5bMBTuE1Q8iKqGWrskH1SfLHo8aKw+O+cnnZ7qjVr7N2VHf5xcZ+pHX3Kd9VFTLb25Fsadtf6GHr32oq4e6wjrhUt2Vbola/+7HW6mrNN9UbaHv0Wvx8NJ5q/LrjHN7nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775004553; c=relaxed/simple;
	bh=EGx4Gtqhy6vQM0IERqIf4TJ0cM2JbaaRPbmynMr2X+8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kp7yTUuln2XfzR8wb5u4tt0e+teYjPJmS2FCuevw6eYPnz9QZcYvXEEA1BB79L6TRmoFBdDt6OYIcjthBTJ+yfAoJSTPHjZ/UXGuwxEPqpLBgGFUJm9V520RYWQZTm9DBz+pHnHc7x8HuJjr79vEy/OQ7PKkfWCFx/3rhfV2MD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=PpdHDVCz; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50b2b2aa276so54417931cf.3
        for <linux-usb@vger.kernel.org>; Tue, 31 Mar 2026 17:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775004550; x=1775609350; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JUkRIvdQFHiAnsrTIQq7h/KQaMmFC7Xdh16/VrfT1J0=;
        b=PpdHDVCzSVyioJ621TdeW95/U3JkUoPR48jONESlmvC2Fh7sI40rjrz8UWed0DceL2
         BY1wyppBxsokhfVu6TBGUsojX1+cd+KLBB8zQ+SwdJxUpgpkVYAfpxu5dJA+0+EPC8on
         +pMDgUetXTLGFJCI3o84nXMF9rpoLJghiQwCXHmtOwRN3eeJ7Ii+/ptdZXeqaGpHPgsA
         XG0WATMrg8Be6SJ/DngrNQFq5JewSxnkbO6afXSas0lebj4KXnpv0sczhddG3eYRUPLI
         jL1GfgxX8ETExjAPDjqu0BcH6YQGCDpb0I+kHXLVrmWqMzgtGp3A1PBy+Sm37I3p3y8a
         sXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775004550; x=1775609350;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUkRIvdQFHiAnsrTIQq7h/KQaMmFC7Xdh16/VrfT1J0=;
        b=rRjTjWfC7GCt11GFDdZrDsUyNWrOBoNrLTK9mQcA0996jk3rzQnRfA5LLhBERMwZYs
         mW/9OzP7/UvwgTyOfQ2oXtJ2DKtUuhXdfJzKLl9k2ZVThjMsiSowRes9aHECe4syHsEY
         rY05F7AEiPmUaCRxbxwFOccvAkSAAIw6y7jOX/YoKhk5DTap1FEzDaixG5VFkaMWIs6u
         VoMR7Q6fQPEHdTUmu1g3zD1X1OPZjSMcbsFEaXt02PLDiwDUro5t1HVmrOfQYrgxA4WU
         4k9hZm3Ru82+mue8tifBmpRf9CjuJR2a5niKcv6D82P39PfpkZzhpG073+FQPLsPVm5Z
         IsUg==
X-Gm-Message-State: AOJu0Ywl+1JUJ+d3BCKCLq2avZF6NEkT/lycxaQLj/QzczNfJRXyIDPy
	XArU/IQoigKjFOMUDcLsLzZO8VYfzrHqq9WsZiFclGF0oFPmDQjxoalBy8VlNk2SNNI=
X-Gm-Gg: ATEYQzxmNT0URKMPrs2l5sXrWveGB3Hdnp3sMAO3aDRudc+qr/H3IPqiB0LTPCkpcN3
	lakbw0bxlL3jgVXL+m2lZgeFkYk6+M4ftkzbnEMdmoL3So8toAOeOHE7kO2NqMMFdpfSmvwKjQj
	9y50Al6XKXrxyrYTU3mg1fuhHR+5b7hRVUEPWdhxj2s8FRuVOu6HAaoD32xd+GelIvgt3JJB2tI
	quq9g9JTTGShjJtx0iHE4Q9bgQpMDqWR5K5AGxGGZkd9cHXaV7mFrM60JtyfkdvD9uXyPUXIvHZ
	LRUEtGRxL/o5jpeYrtzCL8A40NO9UB+tND6TsisacsPfkzjC+0USj5LyF5EIrL8RsAEJkctIpjE
	lk9drfFUN+p6wBSXD2mVzKrmp0EuDYzkND8tdgzzm9JSrOm10/B1VaCU08ryHzeedMeWyk8h1E+
	ETayCJASIab1Q541eZojV7hj3rYIbv8x8gGKgl5FzrtgluUAaKmSRP8Z6GhSdU4WCSaF5jJlLA8
	NP5ONShx5BXzGl5Q4KTnt8jK1a4yZZ2OZ0=
X-Received: by 2002:a05:622a:4d9b:b0:509:1326:ff24 with SMTP id d75a77b69052e-50d3bbc9a34mr24761901cf.17.1775004550481;
        Tue, 31 Mar 2026 17:49:10 -0700 (PDT)
Received: from thor.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm102251671cf.16.2026.03.31.17.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:49:09 -0700 (PDT)
Message-ID: <a7c2973a44ad14c15f808765c3d394d07bef09f8.camel@ausil.us>
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: Add support for requesting
 VBUS for Type-A ports
From: Dennis Gilmore <dennis@ausil.us>
To: Alexey Charkov <alchark@flipper.net>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 31 Mar 2026 19:49:09 -0500
In-Reply-To: <20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net>
References: <20260217-typea-vbus-v1-1-657b4e55a4c2@flipper.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.0 (3.60.0-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ausil.us:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ausil.us:+];
	TAGGED_FROM(0.00)[bounces-35757-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_BAD_POLICY(0.00)[ausil.us : Multiple policies defined in DNS];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennis@ausil.us,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD29B373492
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-02-17 at 14:12 +0400, Alexey Charkov wrote:
> Add a regulator-only entry matching OF-described USB Type-A
> connectors.
>=20
> This allows platforms to explicitly model VBUS supply regulators for
> these
> ports instead of calling them PHY supplies or making the respective
> regulators always-on in their device trees.
>=20
> Type-A ports won't typically need a dedicated driver, as there is
> nothing
> to configure apart from the power supply, so there is no controller
> driver
> to traverse the OF graph and request the VBUS regulator, unlike for
> Type-C
> ports. Thus make it an onboard USB device, which it kind of really
> is.

Tested this on an orange pi 5 pro, with this and matching dts changes
the USB port was functional.

Dennis

Tested-by: Dennis Gilmore <dennis@ausil.us>
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> =C2=A0drivers/usb/misc/onboard_usb_dev.h | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/usb/misc/onboard_usb_dev.h
> b/drivers/usb/misc/onboard_usb_dev.h
> index 1a1e86e60e04..35d15b034664 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -108,6 +108,11 @@ static const struct onboard_dev_pdata
> genesys_gl852g_data =3D {
> =C2=A0	.is_hub =3D true,
> =C2=A0};
> =C2=A0
> +static const struct onboard_dev_pdata usb_a_conn_data =3D {
> +	.num_supplies =3D 1,
> +	.supply_names =3D { "vbus" },
> +};
> +
> =C2=A0static const struct onboard_dev_pdata vialab_vl817_data =3D {
> =C2=A0	.reset_us =3D 10,
> =C2=A0	.num_supplies =3D 1,
> @@ -130,6 +135,7 @@ static const struct onboard_dev_pdata
> xmos_xvf3500_data =3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const struct of_device_id onboard_dev_match[] =3D {
> +	{ .compatible =3D "usb-a-connector", .data =3D &usb_a_conn_data,
> },
> =C2=A0	{ .compatible =3D "usb424,2412", .data =3D
> &microchip_usb424_data, },
> =C2=A0	{ .compatible =3D "usb424,2514", .data =3D
> &microchip_usb2514_data, },
> =C2=A0	{ .compatible =3D "usb424,2517", .data =3D
> &microchip_usb424_data, },
>=20
> ---
> base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
> change-id: 20260217-typea-vbus-74515378021d
>=20
> Best regards,

