Return-Path: <linux-usb+bounces-31632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD488CCF0D1
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 09:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DCC2303CF53
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 08:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6751A2EC541;
	Fri, 19 Dec 2025 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="h8SkymSN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay59-hz1.antispameurope.com (mx-relay59-hz1.antispameurope.com [94.100.132.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C9D2DA75B
	for <linux-usb@vger.kernel.org>; Fri, 19 Dec 2025 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.230
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766134446; cv=pass; b=pIe27v6vw021Kho2nj600Q71hC+S3d1wRIEKf76ZWbg1AJ/otsnIufyzclZ0KkU/lIlFISF/D34v/3SfFKvDh85atu1St2EFaSkYPF5xKde51Ia4GzXzbkqgS5FDgeWwgixQLLig0zm3VglGFPAh6ODzf1oHTjlABoIfBeT98Hg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766134446; c=relaxed/simple;
	bh=6oc7It17KeilgegxeNRo1i/RHu/E39oXWX/QlQF0RCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KiISBEjr/Cje+IMfpEX+h463/oAkZotJwnDotcjjnIiITtuu1HwDMN3bYlbEg8YdexnNQ7Wlg5egR8vWPOKnNqp7VzP9ujo2vUAdyZKkPunSS8HOQu3X05A/nNhRfr6Klg9lLYZlerVWK2WN08/jwgrDrXCdHDbrWFr5MtsySiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=h8SkymSN; arc=pass smtp.client-ip=94.100.132.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate59-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6oc7It17KeilgegxeNRo1i/RHu/E39oXWX/QlQF0RCQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766134384;
 b=bekEyycxHgfr+mTEokLYi4Xs9caiMu3RQjlZXAXVRKjlXMNWzYkU+BgTKQqr02aP91wEn8u8
 sqj9hIdukeI1zZyqtTxRqoOovg3FUUyE3NhsWOkLpnV+lTisGyxE5PMp1vH2YkSOto/b00P2Aot
 4X9aISqC8ivvKm37YHUBNWeIKDp9vS14NUGVdNTg0d/7h76UOUehJvSw+rOLvCnaqKjJg03Zo2i
 QIJggAXZsB79mtbw6ymgv6I63acihmvuNa83xfHPzaUg2ym6X6luApwjhayC8ZTGMdcNNfQFD0g
 rRZoZfnU+qPDad+cuAwmF0B7YSDEPxSaGUbAN7bwPunqQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766134384;
 b=LBuqdSgMetTgasucJannusoyqC6Nw3lhxw4GOIEwq3tyUVGmrbmbVC9YcSsGj5U3V0bJgy1H
 jSLEU3CduYWMRLlJYJczQIW7PmgvV1Q1FyCwL3PIOCkWE6UaqX4fZ8J1Q482/DgzX10darYaTTs
 4QsmciwT2/NQMkMqA7men2cAkuXFjrBmQpat64+iWGwJipjXgGXHAcoTBGsAhq8wu4WrSoOyHP0
 6DisLhyOPnPF2fuQc0FZufMOco1WThuSTUd3JiPwgWpk6fPFJD4aQUkhXeCXIt1Wle27xaZOjdQ
 kuduoB71MHzL2gfxPpLmWb2iIYSOi/PMtT4jHgfCtIGag==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay59-hz1.antispameurope.com;
 Fri, 19 Dec 2025 09:53:04 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 2A461CC0DFA;
	Fri, 19 Dec 2025 09:52:41 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
Date: Fri, 19 Dec 2025 09:52:40 +0100
Message-ID: <5334958.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218154412.1524249-1-alexander.stein@ew.tq-group.com>
 <CAOMZO5CmP_rdFA=PqGSmKDU+ObzifHFDjwYMD3J67bjs0h_sfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5083097.iIbC2pHGDl";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay59-hz1.antispameurope.com with 4dXhBL1g4tz2H3m
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ec9600c3e752c55b521189496a3b09b6
X-cloud-security:scantime:2.013
DKIM-Signature: a=rsa-sha256;
 bh=6oc7It17KeilgegxeNRo1i/RHu/E39oXWX/QlQF0RCQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766134383; v=1;
 b=h8SkymSNEEN0wI8W7PtNbvNqcS7yYUHPEPD+4yvj57aEN6b+zTyOvxGDwKQ1CaM/27Ne1ETk
 0QNcQF+HRVqta4FKnXOC24Kdx3NlGAQHnA2A3BEBL9qSgDvWVMCybljY5XX+r6u43GP+0rlwAF7
 zEgNg3lbyrrBVop3AulCRTzJhWmOxGtVOsJkmqFNDnmILa3j85RyuVloEHhAx7LIbpAiu/MdwN5
 74ZtQfT6kOuDehuUo7WF5qcmxuOdimZe52751F/ZVrrOdOJrtVXSMufkKgDhiz64R+ZiWxOEegM
 xm4fB8svZ3Pn/s54OQQvNANlIvEN+zbNMXr29X7zWRZUg==

--nextPart5083097.iIbC2pHGDl
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: Add TQ imx8qm based board
Date: Fri, 19 Dec 2025 09:52:40 +0100
Message-ID: <5334958.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
MIME-Version: 1.0

Hi Fabio,

Am Donnerstag, 18. Dezember 2025, 16:47:33 CET schrieb Fabio Estevam:
> On Thu, Dec 18, 2025 at 12:45=E2=80=AFPM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > * TQMa8QM on MBa8x
>=20
> This commit log should be improved by explaining the SoM and base
> board in more detail, providing a URL, etc.
>=20

Will do, thanks.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/
--nextPart5083097.iIbC2pHGDl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEByESxqszIvkmWRwbaS+g2M0Z/iUFAmlFElgACgkQaS+g2M0Z
/iUH1Qf+IxHFSR95T2hBQwwM9IgO1Inlb91z7oiYIXySTXPCEjG6Av5RtEuSZl2e
O+dt4h1CE9XXqLEY2DVjSvlFAWEx/L5EUisdPyJ2tXGliCgeVwF3XZW+C/ovnfdO
7jhXmGvdD2mFi3CO/wVemv1ppF7bMUby3dnyTDOjXVOfEf3a2hmT31pMqWgYzhCE
dEriyn7CXcQo1ZnNKjApIPZBVIaIhjkEXeghiUl1rTOzg/UHKF4vDfxXKyPqvDVV
RadFi1ad3RPyf72KEX3v6++BU5qn0jEjemNtK7XNRqfGZtPVUhT0N0fDiy5hAjIl
prnxK1jJb+NOc19mnDS82JD0ru0lOA==
=Q+zr
-----END PGP SIGNATURE-----

--nextPart5083097.iIbC2pHGDl--




