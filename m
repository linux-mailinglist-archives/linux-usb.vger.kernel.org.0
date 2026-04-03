Return-Path: <linux-usb+bounces-35955-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFlWDo1D0Gk45QYAu9opvQ
	(envelope-from <linux-usb+bounces-35955-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:47:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90931398D69
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 00:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1410130125D1
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 22:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCDB3612D8;
	Fri,  3 Apr 2026 22:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AmpVW8CZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A046D335067
	for <linux-usb@vger.kernel.org>; Fri,  3 Apr 2026 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775256352; cv=none; b=R3/JGO9t0XQy0BX+kIRRS7BlFg4NYAkIIx7c4AlfIAjyCNaNoBSUpSVSdiIgE3mjkRd7q5ZtGOoPf22Phh5GxuhLd+GCwBvJQIEAh8wVDWLAe5RK7rUQDa9aqqkR+8jftHM0i/e4gAI6iC3ZrJ4GIDNe6RQsX0aDyFOy/zzV3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775256352; c=relaxed/simple;
	bh=wSlnrD2kv3P7QYG/VjRh77QodoZ+LICLXAucIhnlE/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfR26FWQStFTb9O1yt/OGOD+5dnGkuBPS5y1XmTuyq8rbUImcmT1lZ1mbkZx6fRBXdzyRzJurpLhlLsoXGyMexCunUFNEYX9HddIyr4Qg9KmFnUKIyFHa+HCiVq61t3Eub0/M9Y93rzsiYE3+C8GgcVF5HbBDSPAj2Tki8rM2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AmpVW8CZ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-823c56765fdso1113467b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Apr 2026 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775256350; x=1775861150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IVU9vvv3WwItsMU3YyQVteUJY4jTF8nIAOzbKoR/H80=;
        b=AmpVW8CZEQMH6x1RUSprKlTlJHfB6Vw2JBkHIWrjfpalX2XeGh4LxMZmqvsRJwpi7d
         rSniAaIutFh+o+dlZHPKrMyJTEa7FS51o6DChM1c1x46zGa+o1+KM45yvkINhjpzUYMh
         FEFNEMamBN+pkxBIzK6h3dQn64TDoHcKiZqw6h/9wn6f9yIjylYSQ6b2cNGVHJX9fA95
         x31mgYF7tO5vixwma3dCRp5faImY/vwqOuUpeHRERcTWhrCe9cOQX8R2yRFMuFfup0V4
         qMPdIf7XFeffBEyJxdDmynCRoSRDAkF3zPEDBXqYlTUagldMofRmOrBoFGTGCB2JNeug
         I+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775256350; x=1775861150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVU9vvv3WwItsMU3YyQVteUJY4jTF8nIAOzbKoR/H80=;
        b=fjkad62/Xta1wnysojnsrfSYrKSQ0Gr7ykMr5gFOzhf3GEyMumZlSiUCTfZAzOw29P
         fdtsCam5JrJBHk2LZ98H0m3GDJ+E73Cz4miHr33CGVsHG97eLHqoKZzW6LBhPHx25wCU
         Iaws8gFd6uy2bOPNY4YJKRCVhg4uV7oU/tzdnUjWBLZYvcq+FGOhkGJBxOf9oqw+9+s8
         mak83v3X6oSFxttxFyKAgDmiXIL5L0Xz3OAFaKpAQLOi/RhgxSueSosEn3LzlFKu5gNx
         O7qCIbFyJeHxxxGGnjIW4kWVda2rbnjWQrWTw6xvbCfx0EwE6KYfA/ZLNIxY6gm7Nrs9
         2AEg==
X-Forwarded-Encrypted: i=1; AJvYcCUDp9rRNHuYOL4M9a7fSAyGaxMHfFuWzoOD5P3XoWtOvquF04LH2aGRtQRbk3sIWk70kPEZarmrbBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwTly042+LuiR+6UcxYhC56PZdjfd0NzxtfC+dF9IAidnkS7SG
	xOwOOnuRZd3wprNWrite4BcDC5rw/JHunVohZhm0K66ruGnq22S/3ZSFm0xAy37ymA==
X-Gm-Gg: AeBDiev26fjMdVI5T6lD1hbkivGzsbMimN82fpC4KryxOvJHUaAgpuPt7hIOP0QlkkG
	IdIf1UetVocEK9Tyfqzw5UfDrrGhsdEBHJEK8uqRrbde8up7YAIzrjvZwSKti6GHrNj7ijxl7oz
	RvY10Plqrribp4b9S+nFOjuBV0zYYobPbsk1p7qST35Yf+0ic38OCeG1dlB9VJa9kE5JbrvaQXp
	yLrKZdVVmqr7r5gKfsnxo8wkVlyD6GUPAU0NoMEZaIBPm310u5cQXDXfB3n3WdbEAafpEELth8l
	KTreXXMao6hO0PpNvuBF7eHs4TpFWZ7LjpP2MqN9JSNbYgRsXZA3Qsq2Rjz+ZLNYh80P57BGJWW
	HJZzCnki+vhpv2VniPO4QmKVAKSwNpbiXRNLdazmM8IrrMOYE/Ai7TApDkzys5ep2lcxubTbjd7
	wTNKtmfHNsGMRBuRi6uNdsJ2z4fq+lErUWXmzhBT+bOY5Se7BoKnjf8Yno
X-Received: by 2002:a05:6a00:2393:b0:827:32d7:6690 with SMTP id d2e1a72fcca58-82d0da98e9amr4233727b3a.13.1775256349293;
        Fri, 03 Apr 2026 15:45:49 -0700 (PDT)
Received: from google.com (21.59.127.34.bc.googleusercontent.com. [34.127.59.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca75dfsm6785331b3a.60.2026.04.03.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:45:48 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:45:45 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	abhishekpandit@chromium.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, akuchynski@chromium.org,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: chrome: Add cros-ec-ucsi
 compatibility to typec binding
Message-ID: <adBDGVToA4wSUUGV@google.com>
References: <20260403223357.1896403-1-jthies@google.com>
 <20260403223357.1896403-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jztD/bANTVs+KmqZ"
Content-Disposition: inline
In-Reply-To: <20260403223357.1896403-2-jthies@google.com>
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35955-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bleung@google.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 90931398D69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--jztD/bANTVs+KmqZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 10:33:26PM +0000, Jameson Thies wrote:
> Chrome OS devices with discrete power delivery controllers (PDCs) allow
> the host to read port status and control port behavior through a USB
> Type-C Connector System Software (UCSI) interface with the embedded
> controller (EC). This uses a separate interface driver than other
> Chrome OS devices with a Type-C port manager in the EC FW. Those use
> a host command interface supported by cros-ec-typec. Add a cros-ec-ucsi
> compatibility string to the existing cros-ec-typec binding.
>=20
> Additionally, update maintainer list to reflect cros-ec-ucsi and
> cros-ec-typec driver maintainers.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  .../bindings/chrome/google,cros-ec-typec.yaml | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-type=
c.yaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> index 9f9816fbecbc..fd1a459879bd 100644
> --- a/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml
> @@ -8,17 +8,28 @@ title: Google Chrome OS EC(Embedded Controller) Type C =
port driver.
> =20
>  maintainers:
>    - Benson Leung <bleung@chromium.org>
> -  - Prashant Malani <pmalani@chromium.org>
> +  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> +  - Andrei Kuchynski <akuchynski@chromium.org>
> +  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
> +  - Jameson Thies <jthies@google.com>
> =20
>  description:
>    Chrome OS devices have an Embedded Controller(EC) which has access to
>    Type C port state. This node is intended to allow the host to read and
> -  control the Type C ports. The node for this device should be under a
> -  cros-ec node like google,cros-ec-spi.
> +  control the Type C ports. This binding is compatible with both the
> +  cros-ec-typec and cros-ec-ucsi drivers. The cros-ec-typec driver
> +  supports the host command interface used by the Chrome OS EC with a
> +  built-in Type-C port manager and external Type-C Port Controller
> +  (TCPC). The cros-ec-ucsi driver supports the USB Type-C Connector
> +  System Software (UCSI) interface used by the Chrome OS EC when the
> +  platform has a separate power delivery controller (PDC). The node for
> +  this device should be under a cros-ec node like google,cros-ec-spi.
> =20
>  properties:
>    compatible:
> -    const: google,cros-ec-typec
> +    enum:
> +      - google,cros-ec-typec
> +      - google,cros-ec-ucsi
> =20
>    '#address-cells':
>      const: 1
> --=20
> 2.53.0.1213.gd9a14994de-goog
>=20

--jztD/bANTVs+KmqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCadBDGQAKCRBzbaomhzOw
wnQEAQDeE//xnq+IhVlSfGC0hc1ZyoqA+HBIw3N1qF61jTIvRQD+JHkGa1XhuFXF
01WwG0Rcho+Je8H6Omm0n/driIMIpwM=
=vw5y
-----END PGP SIGNATURE-----

--jztD/bANTVs+KmqZ--

