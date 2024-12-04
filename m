Return-Path: <linux-usb+bounces-18076-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 789699E304F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 01:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4224316439A
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 00:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C92F1FA4;
	Wed,  4 Dec 2024 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1fJeGdL5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F42F624
	for <linux-usb@vger.kernel.org>; Wed,  4 Dec 2024 00:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733271701; cv=none; b=WaC4+8gCCRPhu8grja/cTNVMouyHv/xbzBujOEvrCxXezELza35UNSPCQd50QpOTleyFFmqAJyhKmzozFXgPWRebWpfC14aAeAr6MEF6hHzAcp/mIo1p0EaG3EZq+rFGPuSVAAIXdWreNaVE1uLP2ltkoIp6SLkZZOKk2qyUE3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733271701; c=relaxed/simple;
	bh=7HTKs0VUDZkY/qob9RuaQrShW0s3SXyxEq5Aazn9TCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1v5Kd1aIk9/FEG9hsgB+CmYiB9uXm+oa/qP85DNc0+SZ3hkv1EdKYqx/l0cR4cgU0kra5pIfBHRFcL3cS+JX4bdrAcDFeFN1oOpaaSy9/5HdZ8TStIIoshfTUuQr7kxZXMBLaz+u/I/yLaAoaT8EZ97jGTChiHTbw0jE2knLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1fJeGdL5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-215a7e487bfso20170235ad.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Dec 2024 16:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733271699; x=1733876499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpT/AlPwJiVeeLr30xrIvlukqthTxhmrspNV2T+3D8I=;
        b=1fJeGdL5oWl51YKI8m3PYIJXyrhFTbi5QsH+mspXuHEBHy3Xi3+9agvUvuswBFV9ur
         yG1Qhpg5SFZ4j5ExPd58LReroEQivYHUV45fk5ttlwtrCKTuau5Jfp0LewMlxI4+6IZD
         9SBzsUE+jHykl6YGXCXntMU33gxkkyNJaRqgw8m0v3PZUmeP6KurfM2SkSJ3YZtwrQzh
         hIGAX6r80QeC/QxSNJx4MA3spFN8ofjIoV9V5lYh5tLLZQ2aZKvYpE9ob0ii2ESFssib
         WUQDsAzeQBksCnh3S6sgYkG2pZbAUS2/e1kS95B8BAz+9emNOQQaVN6wq6wCld8FPoEt
         6CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733271699; x=1733876499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpT/AlPwJiVeeLr30xrIvlukqthTxhmrspNV2T+3D8I=;
        b=SmYSTw8dt5vm4qqh6Ejg3zzNw7ONfhmYBhHaJA6EdA3F/cDtWgNShMrw3kG/5eEbCG
         SoVjPkaDvvgxjp9K2FQTNKOT/UcMvFIT/f4RqZ8obMUmlkRO6WDE5jgq+/mYxwwrHvbQ
         pzAgoogW+evzSJQDP47DMgxXsaBBb6Qx8XhWcW3iIqtGpW38GtJQXW2rqU5goYs9Qr8X
         BGJCXm5vYmxz2g+dPh7vbvs0oHnSPmqbbKmptpf1RDbFDTxJUyqRKhyOWRvlpK/nthgf
         V/HkSIbyEYFVExq1jv2Vt19g7xjj8EYixnxBcMTHmiHjF4vZSLViazkjo0QsNwO32Imm
         WZwg==
X-Forwarded-Encrypted: i=1; AJvYcCWxVArrRCMJTnwdml3VrPHsmYNTZCBqFWBIxXmcgVfknd9A/jzCmYZCG0m8pG5cfwkdiHq/g78qS+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3wuNaD7JUgOt1L2cik8W/HU8RSveY0FkQM3hX4JNvw2SLF4j
	S5gztNnj/BBdjWFYPHqLcnrvfWSXCM+cUZmhNrXqIllhYfV29xrDIM9EQo8w1Q==
X-Gm-Gg: ASbGncsboWxDo5002xI3BBXY0auXvtAtm8ChxBjSz1tZGxg4GbjaNUm4n+vSZwDdGWp
	lzzMMWMGt+oFvaj9CFfvIwwxee8Nfv2D4hTHyhLeAethMbcS4toL+K0Mxj7uCI3JikKKMhH8fT8
	KDkNp2hV6lpJ6lRmezWdCmeTSNSEwV7dhSWm/6cM6ku77ZreXM+yfk58J/L5Fn60CjNADHoKMWH
	81VweNw8GfM+1quy2hY89p1lMpF3NMw/XRXa5kggE61LXxmaNES3oRnor7aKs2EIowhgS2iCaaJ
	PnoATRvpaA==
X-Google-Smtp-Source: AGHT+IHoiOLENLGhLXWGELB6ox9z/tzngT3DeCxXBg38Og9THlvL6975U1umNVzFH7Cshp+aGBEl2w==
X-Received: by 2002:a17:902:e888:b0:215:7faa:ece2 with SMTP id d9443c01a7336-215bd168ddcmr59048055ad.35.1733271698603;
        Tue, 03 Dec 2024 16:21:38 -0800 (PST)
Received: from google.com (30.176.125.34.bc.googleusercontent.com. [34.125.176.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21548aec039sm79389225ad.113.2024.12.03.16.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 16:21:37 -0800 (PST)
Date: Wed, 4 Dec 2024 00:21:33 +0000
From: Benson Leung <bleung@google.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Fix completion notifications
Message-ID: <Z0-gjXEceyMeh03B@google.com>
References: <20241203102318.3386345-1-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="388AzRB7epXEOkPt"
Content-Disposition: inline
In-Reply-To: <20241203102318.3386345-1-ukaszb@chromium.org>


--388AzRB7epXEOkPt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 10:23:18AM +0000, =C5=81ukasz Bartosik wrote:
> OPM                         PPM                         LPM
>  |        1.send cmd         |                           |
>  |-------------------------->|                           |
>  |                           |--                         |
>  |                           |  | 2.set busy bit in CCI  |
>  |                           |<-                         |
>  |      3.notify the OPM     |                           |
>  |<--------------------------|                           |
>  |                           | 4.send cmd to be executed |
>  |                           |-------------------------->|
>  |                           |                           |
>  |                           |      5.cmd completed      |
>  |                           |<--------------------------|
>  |                           |                           |
>  |                           |--                         |
>  |                           |  | 6.set cmd completed    |
>  |                           |<-       bit in CCI        |
>  |                           |                           |
>  |     7.notify the OPM      |                           |
>  |<--------------------------|                           |
>  |                           |                           |
>  |   8.handle notification   |                           |
>  |   from point 3, read CCI  |                           |
>  |<--------------------------|                           |
>  |                           |                           |
>=20
> When the PPM receives command from the OPM (p.1) it sets the busy bit
> in the CCI (p.2), sends notification to the OPM (p.3) and forwards the
> command to be executed by the LPM (p.4). When the PPM receives command
> completion from the LPM (p.5) it sets command completion bit in the CCI
> (p.6) and sends notification to the OPM (p.7). If command execution by
> the LPM is fast enough then when the OPM starts handling the notification
> from p.3 in p.8 and reads the CCI value it will see command completion bit
> set and will call complete(). Then complete() might be called again when
> the OPM handles notification from p.7.
>=20
> This fix replaces test_bit() with test_and_clear_bit()
> in ucsi_notify_common() in order to call complete() only
> once per request.
>=20
> This fix also reinitializes completion variable in
> ucsi_sync_control_common() before a command is sent.
>=20
> Fixes: 584e8df58942 ("usb: typec: ucsi: extract common code for command h=
andling")
> Cc: stable@vger.kernel.org
> Signed-off-by: =C5=81ukasz Bartosik <ukaszb@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>=20
> Changes in v2:
> - Swapped points 7 and 8 in the commit description
> in order to make diagram more clear.=20
> - Added reinitialization of completion variable
> in the ucsi_sync_control_common().
> ---
>=20
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index c435c0835744..7a65a7672e18 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -46,11 +46,11 @@ void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
>  		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
> =20
>  	if (cci & UCSI_CCI_ACK_COMPLETE &&
> -	    test_bit(ACK_PENDING, &ucsi->flags))
> +	    test_and_clear_bit(ACK_PENDING, &ucsi->flags))
>  		complete(&ucsi->complete);
> =20
>  	if (cci & UCSI_CCI_COMMAND_COMPLETE &&
> -	    test_bit(COMMAND_PENDING, &ucsi->flags))
> +	    test_and_clear_bit(COMMAND_PENDING, &ucsi->flags))
>  		complete(&ucsi->complete);
>  }
>  EXPORT_SYMBOL_GPL(ucsi_notify_common);
> @@ -65,6 +65,8 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 com=
mand)
>  	else
>  		set_bit(COMMAND_PENDING, &ucsi->flags);
> =20
> +	reinit_completion(&ucsi->complete);
> +
>  	ret =3D ucsi->ops->async_control(ucsi, command);
>  	if (ret)
>  		goto out_clear_bit;
> --=20
> 2.47.0.338.g60cca15819-goog
>=20

--388AzRB7epXEOkPt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCZ0+gjAAKCRBzbaomhzOw
wru7AP0Xyu+d6bTAj4cclKtJ8F6OISalWKMW3PYciK0D+FE7mQD8D0k9pQsfjRpK
q97GXgutHLh6ITcFW76qAWnPpYLugQA=
=FZ/1
-----END PGP SIGNATURE-----

--388AzRB7epXEOkPt--

