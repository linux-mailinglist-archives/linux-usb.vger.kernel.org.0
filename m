Return-Path: <linux-usb+bounces-28975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A33BC27F7
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 21:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF03619A299B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 19:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F158C231842;
	Tue,  7 Oct 2025 19:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BeY0t+XP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91DC2CCC0
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759865036; cv=none; b=NyI3PfSPSaaY5/s2djDAwXhMvCK1zoqJ94YFdqvBUwUw/zKAjEZkCn+ajj3i/th7xCi6RjwnheXkstN0l0sXPbOex4o95YSQhyl5YvTYaOYwnnEa6yHpWJ3mKGHwGxc/3lw/lZmhs3XGPKRFdc3n3Oynp3UWn3dKf7xxMIFUYJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759865036; c=relaxed/simple;
	bh=Xw87XgCbg1sAtPDYd2NoXiEutjwEoopTGJYzoXJp+RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0abS++Cc+e2PBk8OD7d1acaCx/MVSAam+pujvIGRBAnqj0uQBjNMwUGHyJs7slqCAQSJJZ4IhcEHbB3qz5Wv9wH4FF9oqZDfKoGeslvpVtYqEMUJgI7CzvMi4Tn0kV/kDxg9l9to7BFJF+5lYDo8E4LNj59JmG7hbu/DnAbWKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BeY0t+XP; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7930132f59aso1225072b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 12:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759865034; x=1760469834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eT1nwRDKVbKeF8BXec5ppEFdy9ETGubsSZiyxLMw9JI=;
        b=BeY0t+XPIL49xGOpuFawoFJcyKkJT42Sx+SmegzwSVIr0zRs/+N3UQ2vb6Nw0S8Th6
         P6R8jdaXsc9UCy+8ByKBz65bzckfmDBv/qrTT8PxAWJWhS0HokRZcCtkgu3EBf4DFk8R
         F8Az6eu4+yFOWCOMHoXxJZ0XDgel6Csu+9/s7huIuiK3V2l+9gmOUofebtpA7OpQY9Sm
         O4/qzioO4qk431yZUiyJsfCuNUdg5ge5S9eEztjfqP4HZkHyC+TlBlFHs67J2VcjR5sy
         0ra+sU4if5dvHqoFhzw26vD31vwLfaNxRK9Avkx9/jcujFk2UHw/1llUOv52QkhM0xVs
         HcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759865034; x=1760469834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT1nwRDKVbKeF8BXec5ppEFdy9ETGubsSZiyxLMw9JI=;
        b=saU8k7xGEdFfwDI+tSb/0quc5HwWOGjdUIIhllhwzYkvjNqUPWogc59gVsLAoZLqrv
         4lzdFqljDrTo2lpwGLB/K1u0CBS0E8RVezQ++fvY6IDFb9xSnjboRmPlk/MVYS7DdCPa
         gEu+nkREhR/wm4+qhLriFqe9h3qEwQnac8F8h+mou8farIPhNHIqmoUN0/eXKp3W1BFJ
         ZfAhc5SAwV+a19VYIfRo72Pp9m9dADDs8+rqqtU1PnthqvHHDakZ3vZweo00eqYBUDD7
         w9OcuCCDZSE3ZIJngAo1/A2CPd1HQozxbyHfOTb476spUEWbc4KsM5JSftweIfJ53Ikt
         gM5A==
X-Forwarded-Encrypted: i=1; AJvYcCUCeyjLB7uBJc+ru7BXHnmryps3dnszG83qWpIbUrx5YTTpbmhNR6JNI5EXzH+NH67PSauDn6/Zjew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2YNfaCDzDrj4RQ05ga52Bv+u4q+dpxMWilvACrQTQmrYwVEsD
	0bmjaWYN7yD0AiTNtG0W5GWDBhRi7OslfRdZrtdSz+mlUUeAoFP3bTnbvieajuEBcw==
X-Gm-Gg: ASbGncsprzMUzZOa0jOH1lNE3lu5T4WU/OGfF8afHGvWW/7F1IBzSTUw6rXU+1nm1RI
	CyrKJHpY3MA8pnUFP/88L65ZpcHzPja6M7EvA7Ebw6/Oq/KgRA7bZKSA6R0T/ZC0jfKhq5AcdA9
	+2vtaKwCsFDfSENAYwb0eTZT6CqBLSlwaV9xCZFf4YRm0IhZGjZuKs/FcYbbH78K/eSEWDzFter
	2W1tlpOzTioXE0QxxWe8HObHW7vJNNkJgUJHuYjPEQPX7rmTqjIjeu7Mw0u6cBuT02Esn5FF3ug
	64inKwz+GT4uJ5pqABftjhuXlrl+yOaxiBhb/PLwqU6pewPrhHMkse/SpU5PMRCmiotVrrMj7E7
	0yz4/IoY0EYT9lL6n3Bp0DHZDz9/1KQ7GCedlJ9zvpdMnbBdQmw3Lm4Y3oBXhQI3ozIX89YQYmN
	IVzhC9AU3kjHgU8sjtaNdPvNe002ZSztw=
X-Google-Smtp-Source: AGHT+IGSwGW88WMOLbHemUBllZFvuVlpdJOj4FF3pHUy4SuNXB8acXcCYQBlHBqvvbgzLZJwVZQjDQ==
X-Received: by 2002:a05:6a21:33a9:b0:2c9:1323:f800 with SMTP id adf61e73a8af0-32da80db36cmr695432637.9.1759865033911;
        Tue, 07 Oct 2025 12:23:53 -0700 (PDT)
Received: from google.com (232.92.83.34.bc.googleusercontent.com. [34.83.92.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0205336csm16623586b3a.45.2025.10.07.12.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:23:52 -0700 (PDT)
Date: Tue, 7 Oct 2025 19:23:49 +0000
From: Benson Leung <bleung@google.com>
To: Jameson Thies <jthies@google.com>
Cc: akuchynski@chromium.org, abhishekpandit@chromium.org,
	krzk+dt@kernel.org, robh@kernel.org, bleung@chromium.org,
	heikki.krogerus@linux.intel.com, ukaszb@chromium.org,
	tzungbi@kernel.org, devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: chrome: Add Cros EC UCSI driver
Message-ID: <aOVoxQY3sLgkzJgD@google.com>
References: <20251001193346.1724998-1-jthies@google.com>
 <20251001193346.1724998-2-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bael24djLhppaNDA"
Content-Disposition: inline
In-Reply-To: <20251001193346.1724998-2-jthies@google.com>


--Bael24djLhppaNDA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 07:33:41PM +0000, Jameson Thies wrote:
> Chrome OS devices with PDCs allow the host to read port status and
> control port behavior with UCSI commands sent to the embedded controller
> (EC). Add documentation for cros-ec-ucsi node which loads the Chrome OS
> UCSI driver.
>=20
> Signed-off-by: Jameson Thies <jthies@google.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  .../bindings/chrome/google,cros-ec-ucsi.yaml  | 71 +++++++++++++++++++
>  .../bindings/mfd/google,cros-ec.yaml          |  4 +-
>  2 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/chrome/google,cros-=
ec-ucsi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi=
=2Eyaml b/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml
> new file mode 100644
> index 000000000000..2121776e3ff0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/chrome/google,cros-ec-ucsi.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/chrome/google,cros-ec-ucsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Chrome OS EC(Embedded Controller) UCSI driver.
> +
> +maintainers:
> +  - Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> +  - Andrei Kuchynski <akuchynski@chromium.org>
> +  - Benson Leung <bleung@chromium.org>
> +  - Jameson Thies <jthies@google.com>
> +  - =C5=81ukasz Bartosik <ukaszb@chromium.org>
> +
> +description:
> +  Chrome OS devices with PDC-based USB-C ports expose a UCSI interface
> +  from the Embedded Controller (EC) which allows the host to request
> +  port state and control limited port behavior (DR/PR swap). This node
> +  allows the host UCSI driver to send and receive UCSI commands to a
> +  Chrome OS EC. The node for this device should be under a cros-ec node
> +  like google,cros-ec-spi.
> +
> +properties:
> +  compatible:
> +    const: google,cros-ec-ucsi
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^connector@[0-9a-f]+$':
> +    $ref: /schemas/connector/usb-connector.yaml#
> +    required:
> +      - reg
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |+
> +    spi {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      cros_ec: ec@0 {
> +        compatible =3D "google,cros-ec-spi";
> +        reg =3D <0>;
> +        interrupts =3D <35 0>;
> +
> +        typec {
> +          compatible =3D "google,cros-ec-ucsi";
> +
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          connector@0 {
> +            compatible =3D "usb-c-connector";
> +            reg =3D <0>;
> +            power-role =3D "dual";
> +            data-role =3D "dual";
> +            try-power-role =3D "source";
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/=
Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index 50f457090066..646bc81c526f 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -99,7 +99,9 @@ properties:
>    gpio-controller: true
> =20
>    typec:
> -    $ref: /schemas/chrome/google,cros-ec-typec.yaml#
> +    oneOf:
> +      - $ref: /schemas/chrome/google,cros-ec-typec.yaml#
> +      - $ref: /schemas/chrome/google,cros-ec-ucsi.yaml#
> =20
>    ec-pwm:
>      $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
> --=20
> 2.51.0.618.g983fd99d29-goog
>=20

--Bael24djLhppaNDA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaOVowgAKCRBzbaomhzOw
wghaAP4ptO8He+nJ7m200fytazpueLrS9kKxn3i2rwNFghRDdgD+K5AL8DYGEsTY
DAUJA4flfi9ks9FmXLEf5hEQyUN98w4=
=nNDB
-----END PGP SIGNATURE-----

--Bael24djLhppaNDA--

