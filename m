Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3684D2103FC
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 08:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgGAGhG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 02:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGAGhG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 02:37:06 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3DA0C061755;
        Tue, 30 Jun 2020 23:37:05 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id c11so12916304lfh.8;
        Tue, 30 Jun 2020 23:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=SD/0qn6JqKKpB7bOb23E9AAhzSBJk+aMYrPs8uz7OVY=;
        b=ufmnGf2nbIziUxJtvhVYSdfBCRy+VdWhpPuwJIbU2FX2MTIW5wELkVT0aBAREWa6mO
         US5XYqEO4Ez3a5gouN/+YfIGdd+1zx1QRJpX4UA/wppuqDmpxpHd6eLlkRZif3gwYJzY
         k3DdL7NC2EbL6qia8gB3Kefj35WasNL5lLfgkouq/lTg83wzkZUw/Gpv4u+QN01qQz1e
         1QJTD4jYL+CiCMnjAXMEQS1qv3j99XmMFJC0dJRBRNMPDhqVj9rogu7TOD8h1mtiF7tJ
         K1/RUCfqakT+rk8NykZEtKHeioz11e6IN0n6gIVLGtTLkW18LzCEeJZS7Qy2oPbqfBlD
         z2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=SD/0qn6JqKKpB7bOb23E9AAhzSBJk+aMYrPs8uz7OVY=;
        b=KpfGOIU1v3G5PRkcibN+/SPEhfyf5sRY2DKFm6y6pItedJGiTiejTj+SR6g9Ox41eM
         O/0XYIruWjRPiCd2b44D1TA22ilhrOJNF1RH1gKZLIBZsRo+sx7Z+q2Hg7eOGAIMAaTw
         gFiJfwDRj2Igf1XrrLa+CNF+pi/wmOG+wPBSg8GQaqReMFF2E3KVLt0GTceIT8hApGh2
         FrzTzkh/nxCaKbIwEhorbFNTP5/bhT9RGeq4abvLOCQyHnVE0rYgWHfacVdoFRYS+9yo
         5cQ9U66KQACBZ78a/eX0GPOCcxeU/4zOHDJxIMzNdmoocpWSsy1hzrW+45LWk8VYaVFK
         Y0mQ==
X-Gm-Message-State: AOAM533HDIdQBLSEVl1sST9E1LYw3GN4jiLZHKWd4PgUl6BJHcpm4taj
        eYt1VF4wmfhQUljQ59xRYjFZ42ML
X-Google-Smtp-Source: ABdhPJwz7OVXT1pgOhZ0Q0i/SBHd3yg1p4KMbsFuCRMP2F61ZT1XjiBhVuEphUdxmU9rwGpI9p6fFw==
X-Received: by 2002:a19:ac03:: with SMTP id g3mr14037275lfc.164.1593585423614;
        Tue, 30 Jun 2020 23:37:03 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id o64sm1687746lfa.22.2020.06.30.23.37.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 23:37:02 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: Fix up terminology
In-Reply-To: <20200630174123.GA1906678@kroah.com>
References: <20200630174123.GA1906678@kroah.com>
Date:   Wed, 01 Jul 2020 09:36:58 +0300
Message-ID: <875zb791x1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> USB is a HOST/DEVICE protocol, as per the specification and all
> documentation.  Fix up terms that are not applicable to make things
> match up with the terms used through the rest of the USB stack.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Do you want me to pick this up and send it back to you on a pull
request? It's fine for me either way:

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl78LwoACgkQzL64meEa
mQYHZQ/7B64edhHZ1yd7G41dH/2VjiOZ95jMg09RAgc/wAehQu25B1hvi+t7BAOJ
xG8MKGC+o5+GD5HrZq0+8CCDciPf+V7xinsXnJYiXfQWDQrNfKIQc2jLFqkLpJR4
MN00DAk4reTlF6225NFrKNQVZ0zk/W9hUz2QpB6MeLsEzENaOHpGSAyLWo+5TiR8
0TCIDPCqtFArpNDpoOs6lPuwn5ly7vteBwRrU5437gHvpZmOb4saGy+6LIk/iN7m
EzFYKdrhFsJp5wpObViZDRmHRA+dKb6kKOROLbOiEewateUzAx3r78BZp636T+oW
Dq8HuVXypweFAJ2FLzBw9ChUNxxFxLEfNjgJxSwr/vbc1O2rzdqoSx8eydtt42W0
kVjwNJhrjtBIjv1EWisP9IjjCMlk4zdYc9aQyc+6Zw3mwoBnjJHepOdx23sAl9tq
FOpF4WX9MAz5wrB4oOX+zzAkkPx4crz7zMKp8XTt55AgObLxbrIPqwd/hzcTftul
aP9mzbWBVqTozma0h7jTfdtxfgKppCS83ZMf9FSPOMjBaoB0eQRgaK0e+CG1LP8L
rbqxVkpxamcFO9tpUOSxgEStCEkQV01wFzJBxcAGlMWap9A+UlSELvLMp50/u/NJ
J6Cy/ADsUSpUdfXdGdmE5pk1qIFlmTxHjkHbJ7BHpcyG8kjtuQU=
=tVaM
-----END PGP SIGNATURE-----
--=-=-=--
