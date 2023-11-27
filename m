Return-Path: <linux-usb+bounces-3353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A40B97F9F1E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 12:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20048B21139
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 11:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DCA1BDDA;
	Mon, 27 Nov 2023 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="lqLFkr23"
X-Original-To: linux-usb@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293648F;
	Mon, 27 Nov 2023 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2GRltP4Rr3L5riZZSXtiFRtgLW87kbnv/sr2hXRDfq4=; b=lqLFkr23rJuB9oajngA5aisE/n
	5CoO+kFXIGE9qZvNFV5wEYE86hUc9lCYYj7Tcs/dzCtbB/cr4WHiH3oSuq6uxM7sEqIHyqhzhjJ8W
	HcxXh1bXc3u1PWsdhoP3I9X5SCdQX77wJRKZxiBLGGAQPggea/mkhiYXy08MgfzhBaqcGEBdakxzW
	IFkMXiFJUUvOlPbJvUP39Qxd/SjjDYgkjLN8axtpH5AfIpPKLoIyl8va/X9XQQm4URavkDMzYN4s1
	Asmv8fer3FJoy5Kacm1sI4jZaoyCQjpXASPNB8i+GdVgZpXHDkOuP0oXji9hV2i2W24/3IvEowKAV
	fYs/O4HA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <kibi@debian.org>)
	id 1r7aDE-00A9Ih-Hr; Mon, 27 Nov 2023 11:55:41 +0000
Date: Mon, 27 Nov 2023 12:55:38 +0100
From: Cyril Brulebois <kibi@debian.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: bcm2711-rpi-cm4-io: Enable xHCI host
Message-ID: <20231127115538.npv23hhn7jfrk3fc@mraw.org>
Organization: Debian
References: <20231126025612.12522-1-wahrenst@gmx.net>
 <20231127003432.7aztwjxper2a3o33@mraw.org>
 <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5uc5qthx4vce3b2r"
Content-Disposition: inline
In-Reply-To: <b1156fee-aa43-43b3-bb03-baaac49575f4@gmx.net>
X-Debian-User: kibi


--5uc5qthx4vce3b2r
Content-Type: multipart/mixed; boundary="ys2p3o3qlbkot5o6"
Content-Disposition: inline


--ys2p3o3qlbkot5o6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Stefan Wahren <wahrenst@gmx.net> (2023-11-27):
> thanks for testing. Are you absolutely sure that you are using
> bcm2711-rpi-cm4-io.dtb from the mainline tree?

I'm pretty sure, yes.

Starting from the unpatched kernel:

    root@rpi4-20231108:~# md5sum /boot/firmware/bcm2711-rpi-cm4-io.dtb /usr=
/lib/linux-image-6.6.0+/broadcom/bcm2711-rpi-cm4-io.dtb
    5cbe07e9f85ddfefd21ffe98bf92f5ea  /boot/firmware/bcm2711-rpi-cm4-io.dtb
    5cbe07e9f85ddfefd21ffe98bf92f5ea  /usr/lib/linux-image-6.6.0+/broadcom/=
bcm2711-rpi-cm4-io.dtb

The second file is shipped by the linux-image package built via `make
bindeb-pkg`, and sync'd into /boot/firmware as the first one.

After deploying the patched kernel, I'm seeing both files getting
updated:

    root@rpi4-20231108:~# md5sum /boot/firmware/bcm2711-rpi-cm4-io.dtb /usr=
/lib/linux-image-6.6.0+/broadcom/bcm2711-rpi-cm4-io.dtb
    c6ea63f43dcdf8ecd66dda6c494f52e2  /boot/firmware/bcm2711-rpi-cm4-io.dtb
    c6ea63f43dcdf8ecd66dda6c494f52e2  /usr/lib/linux-image-6.6.0+/broadcom/=
bcm2711-rpi-cm4-io.dtb

Comparing a copy of the first set of files against the refreshed DTB,
I'm seeing the attached (dt)diff.

> I would expect the following hardware name: Raspberry Pi Compute
> Module 4 IO Board

I suppose this is an arm(32) vs. arm64 difference?

 - setup_arch() in arch/arm/kernel/setup.c does this:

        machine_desc =3D mdesc;
        machine_name =3D mdesc->name;
        dump_stack_set_arch_desc("%s", mdesc->name);

 - setup_machine_fdt() in arch/arm64/kernel/setup.c does that:

        name =3D of_flat_dt_get_machine_name();
        if (!name)
                return;

        pr_info("Machine model: %s\n", name);
        dump_stack_set_arch_desc("%s (DT)", name);

So I'd guess you're testing on arm(32) and seeing the name embedded in
the DTB while I'm testing on arm64 and seeing the name as filled by the
bootloader?

> Be aware the arm files has been moved into a broadcom subdirectory.

Thanks for mentioning that, but I've been working on arm64 exclusively,
and those files have always been shipped in that broadcom subdirectory
anyway.

With 64-bit capable hardware, I didn't think of mentioning I was testing
64-bit kernel and user space (Debian 12, arm64), sorry about that.


Cheers,
--=20
Cyril Brulebois (kibi@debian.org)            <https://debamax.com/>
D-I release manager -- Release team member -- Freelance Consultant

--ys2p3o3qlbkot5o6
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="bcm2711-rpi-cm4-io.dtb.diff"
Content-Transfer-Encoding: quoted-printable

--- /dev/fd/63	2023-11-27 11:39:50.018176449 +0000
+++ /dev/fd/62	2023-11-27 11:39:50.018176449 +0000
@@ -183,6 +183,7 @@
 		vchiq =3D "/soc/mailbox@7e00b840";
 		vec =3D "/soc/vec@7ec13000";
 		wifi_pwrseq =3D "/wifi-pwrseq";
+		xhci =3D "/scb/usb@7e9c0000";
 	};
=20
 	aliases {
@@ -351,14 +352,14 @@
=20
 	leds {
 		compatible =3D "gpio-leds";
-		phandle =3D <0xad>;
+		phandle =3D <0xae>;
=20
 		led-act {
 			default-state =3D "keep";
 			gpios =3D <0x06 0x2a 0x00>;
 			label =3D "ACT";
 			linux,default-trigger =3D "heartbeat";
-			phandle =3D <0xae>;
+			phandle =3D <0xaf>;
 		};
=20
 		led-pwr {
@@ -467,7 +468,7 @@
 			clocks =3D <0x11 0x05>;
 			compatible =3D "brcm,2711-v3d";
 			interrupts =3D <0x00 0x4a 0x04>;
-			phandle =3D <0xac>;
+			phandle =3D <0xad>;
 			power-domains =3D <0x27 0x01>;
 			reg =3D <0x00 0x7ec00000 0x4000 0x00 0x7ec04000 0x4000>;
 			reg-names =3D "hub\0core0";
@@ -492,6 +493,17 @@
 			ranges =3D <0x2000000 0x00 0xf8000000 0x06 0x00 0x00 0x4000000>;
 			reg =3D <0x00 0x7d500000 0x9310>;
 		};
+
+		usb@7e9c0000 {
+			#address-cells =3D <0x01>;
+			#size-cells =3D <0x00>;
+			compatible =3D "generic-xhci";
+			interrupts =3D <0x00 0xb0 0x04>;
+			phandle =3D <0xac>;
+			power-domains =3D <0x0c 0x06>;
+			reg =3D <0x00 0x7e9c0000 0x100000>;
+			status =3D "okay";
+		};
 	};
=20
 	soc {
@@ -1889,13 +1901,13 @@
 			clock-names =3D "otg";
 			clocks =3D <0x13>;
 			compatible =3D "brcm,bcm2835-usb";
-			dr_mode =3D "host";
 			interrupts =3D <0x00 0x49 0x04>;
 			phandle =3D <0x8a>;
 			phy-names =3D "usb2-phy";
 			phys =3D <0x14>;
 			power-domains =3D <0x0c 0x06>;
 			reg =3D <0x7e980000 0x10000>;
+			status =3D "disabled";
 		};
=20
 		vec@7ec13000 {

--ys2p3o3qlbkot5o6--

--5uc5qthx4vce3b2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEtg6/KYRFPHDXTPR4/5FK8MKzVSAFAmVkg7YACgkQ/5FK8MKz
VSAceg//aQH1I8U4rJDWs5wJDrvLE5Q3AeJAxf7XWl1YO7oHpx3xe/+Av0ML8I/B
RBc7ub497H2jElNb0XOycnPxjNDiLp1Lx5p/Eij16nw+WFoADVQj4HorCRVpRxwo
zqh2O6B4Lj/BtNoymaI9x963aVMmS9B7QCWjWGZTlG8Q5ws8ArPPr6PzuwP3IqZK
4h5YZ5oyAWhkHMa/2uLL0vq213hEvjgEKsnrJaJPjEbAo+ThPEw7LRu7SvaMsx8U
XGWt30x7RxHvGXTCn730ONPGex/UFJ6lejtZqRjsGP0YMVH2LV3fs8R2WHOWHcfD
4TLv+0jV84UG2SdfmMJTe2dgf2Q+28/7pMqCRdwMO0AqAa8vXyAxjh6/I2n/ivyT
YA8ZrKGEhLqqAacVglyKV9RM8YGFKw2WaXe2cbS6W5cxUv26g55n5Uk0SgIgR5FQ
h3YTKcvSmBO0UsaX0vhjZ2v66qagQfFNnNGf+7i8IbU2XAfB3muaTxHv9spf9yT2
7Q66B/DEZw+dZol8fVaJY6kPwmiCSqeFEKZJis9WTf/5HV6F73Jihn844qA/Zmyj
3BXViDEOaFeaWR7CsNl+5B32PBDUr+OJsDXdCk0KwnmbANIJGpLgpaTzf5k5Ov20
c7Zsp3bfm71pmty8qXwN9tObtm3t6mtPJr7ChtY+M6SZU46oXKQ=
=I2NW
-----END PGP SIGNATURE-----

--5uc5qthx4vce3b2r--

