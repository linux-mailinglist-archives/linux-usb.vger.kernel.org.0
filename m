Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4804C5729
	for <lists+linux-usb@lfdr.de>; Sat, 26 Feb 2022 18:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiBZRxi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Feb 2022 12:53:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiBZRxi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Feb 2022 12:53:38 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7822C237D3
        for <linux-usb@vger.kernel.org>; Sat, 26 Feb 2022 09:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1645897980;
        bh=J1fEgeDAjc62/uXfha6qfhoUQg1KJjKKiqdX25k/SvI=;
        h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
        b=gRFUA7WBl1sR5xsQpqJFnnMQ4ivxrQ5H7T6/9qK1VBBqucndG4+CkdlpPkRcTu5xU
         f8SYGIHeQ9cQDXOvLW55q28IFRhkLVrFwocZ6vFgOsMlxoB7miv1StsKzz6m8Bzp27
         zxXg5zeA9MT2utzg6spsvWCQ4nduiMrXmriV63ac=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from felics-pocket.localdomain ([2.247.251.17]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MCsQ4-1nWmg02mtU-008qNm for <linux-usb@vger.kernel.org>; Sat, 26 Feb 2022
 18:53:00 +0100
Received: from localhost.localdomain (localhost.localdomain [IPv6:::1])
        by felics-pocket.localdomain (Elektropostamt) with ESMTP id A5F585C4A83C
        for <linux-usb@vger.kernel.org>; Sat, 26 Feb 2022 18:52:44 +0100 (CET)
Date:   Sat, 26 Feb 2022 18:52:44 +0100
From:   Felix Becker <linux.felixbecker2@gmx.de>
To:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple: add Nokia phone driver
Message-ID: <20220226185244.1080e666@gmx.de>
In-Reply-To: <20220224133109.10523-1-johan@kernel.org>
References: <20220224133109.10523-1-johan@kernel.org>
X-Mailer: Claws Mail 3.18.0git303 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/++AQrVP1f2yTVCsWXBeU1H6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:a8BNh/C5lpyiq4uZU4PNGyVKJ1xO186fx0HXRSjCojuKvGiR14Y
 8wKC3tycdEDUtZFX8RiEWvdmip4q2NrskrElj31yxoKrI2Yq3SKp/RPQVpTkYtZDEtcRqXJ
 F/nHCH5PedUPqKe3djPtjtVwl4YCZndr/GLVCq7cgsFeDGRmpqGBUj/vaX8nQknrgb/tFDd
 p4NniH6KBKoZOaQIca7XA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2fQXwnu/BuE=:sXD9N8ZCipvt0JXhp3Q/HK
 tijZlLKpMtQLx5TGFdz6tddCjX67aNWYg/4GQ2FqF5nKevP+eBt/l4eZeRHipUiINaUaUyeqx
 GniWmYZIJEP4O2RsgxiOS0Sf759MXWEAuB8/0O97LKsmByI3SDKtd7zmmzjDJiArdilxydUqF
 UG/YSpEyI3PpX3/mb0ycXlb+ovGNE++is+WgsK5wRtH+6abXxgFyDh5/jYlhp8z6TToOkQhhP
 R5TwfoRiOUdBCxX10G6NoigwFZ/k/p3KD+bFEKuxnXC1NpfV/T3jKmvH100CU6q27Qz7/lGyY
 IIg7HhSiAUKix1X5O8AHafpFUXqjFX7P4adGGX9bpl3tJPQ+wbHQOXEzVLptsHLK02YySt+FM
 R2HFmFbwBkAHB6WlBG+P8vpudpy3Qep69VkVYcmRWzZWLRDMx7ONFtfpBAmp0Q4M94yACnbU7
 kkT4X2pStiBeyK059pfNjazTRi/bu8pe8z3j5Lk2UJclvt3h4Q7Mjs06s9k2QxCF/gLKB5vOq
 g5pGmuiBoMzNakV2pkKLuJJLHRLsPd64EapJ9TVKgGjb4MTXuNY4c1wVRwst0buIqjTSXydTQ
 k0ENO0D/PGV/zZcWCChjJfLvyRl5U93AffdK6uVUKW7/mxwa9Ms7Pu9v3ysR9VQQKkD/gCpS4
 SGWi3H/DJEmfkfD51d70Saflg1Agk3OTeOE+fuOo7GhHYxnmgsE/hhfAY9pXBPhRwtX+WdDHp
 CC2iE36yRfSULfMpqtW3pFFA43Xm+kWeFxdJt8p0zzSX9b2q4JuWua3FRGWmrhPi+bTrKJBeJ
 nKm3tGdK4Ue+dyNjJme9oL162eA1xwkWyX0WIIC9BxJb0RRTRRl0pWW+7DDMGAM3Pi30OBRp5
 FETiljN0srDldXGSLySSToxrqaINiN58CzVoHB1ra/ULait33GloVHqiD9IA/HqVzD48qy5wF
 pp0yBqQ18OagoiRdjdADPWZ+fLhgjEW5b8T51fROKWgm7+jltmNH+r71TdbjYovbD7hiX/W4f
 YF+HqGbSbdGAy2UPUMSndGMSQ+d1iW5mNvw9we4FQdTvqh0VhcpKPPRBpMv3++IYGeNh+zd1u
 4iNeUPGpxADjJw=
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--Sig_/++AQrVP1f2yTVCsWXBeU1H6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Johan,
dear people.

I see that this includes my email address publicly in a non-obfuscated
form, and this is also available freely on the web at
https://lore.kernel.org/r/20220208201506.6c65834d@gmx.de.

I do not want to have my Email address publicly available (e.g. against
automated email address harvesting).

According to the GPDR, I want that you remove my email address from the
patch before it is published somewhere on the web or/and in
downloadable source code (if already done, I wish that it get's removed
from everything published), and that you remove it from publicly
accessible email list archives.

Please confirm back to me when you have done that, or please refer to
me whom I should contact to get my email address removed.

Regards!


On Thu, 24 Feb 2022 14:31:09 +0100, Johan Hovold <johan@kernel.org>
wrote about "[PATCH] USB: serial: simple: add Nokia phone driver":

> Add a new "simple" driver for certain Nokia phones, including Nokia
> 130 (RM-1035) which exposes two serial ports in "charging only" mode.
>=20
> Reported-by: Felix Becker <linux.felixbecker2@gmx.de>
> Link: https://lore.kernel.org/r/20220208201506.6c65834d@gmx.de
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/Kconfig             | 1 +
>  drivers/usb/serial/usb-serial-simple.c | 7 +++++++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
> index de5c01257060..ef8d1c73c754 100644
> --- a/drivers/usb/serial/Kconfig
> +++ b/drivers/usb/serial/Kconfig
> @@ -66,6 +66,7 @@ config USB_SERIAL_SIMPLE
>  		- Libtransistor USB console
>  		- a number of Motorola phones
>  		- Motorola Tetra devices
> +		- Nokia mobile phones
>  		- Novatel Wireless GPS receivers
>  		- Siemens USB/MPI adapter.
>  		- ViVOtech ViVOpay USB device.
> diff --git a/drivers/usb/serial/usb-serial-simple.c
> b/drivers/usb/serial/usb-serial-simple.c index
> bd23a7cb1be2..c95dfe4a6f0f 100644 ---
> a/drivers/usb/serial/usb-serial-simple.c +++
> b/drivers/usb/serial/usb-serial-simple.c @@ -91,6 +91,11 @@
> DEVICE(moto_modem, MOTO_IDS); { USB_DEVICE(0x0cad, 0x9016) }
> /* TPG2200 */ DEVICE(motorola_tetra, MOTOROLA_TETRA_IDS);
> =20
> +/* Nokia mobile phone driver */
> +#define NOKIA_IDS()			\
> +	{ USB_DEVICE(0x0421, 0x069a) }	/* Nokia 130 (RM-1035)
> */ +DEVICE_N(nokia, NOKIA_IDS, 2);
> +
>  /* Novatel Wireless GPS driver */
>  #define NOVATEL_IDS()			\
>  	{ USB_DEVICE(0x09d7, 0x0100) }	/* NovAtel FlexPack
> GPS */ @@ -123,6 +128,7 @@ static struct usb_serial_driver * const
> serial_drivers[] =3D { &vivopay_device,
>  	&moto_modem_device,
>  	&motorola_tetra_device,
> +	&nokia_device,
>  	&novatel_gps_device,
>  	&hp4x_device,
>  	&suunto_device,
> @@ -140,6 +146,7 @@ static const struct usb_device_id id_table[] =3D {
>  	VIVOPAY_IDS(),
>  	MOTO_IDS(),
>  	MOTOROLA_TETRA_IDS(),
> +	NOKIA_IDS(),
>  	NOVATEL_IDS(),
>  	HP4X_IDS(),
>  	SUUNTO_IDS(),



--=20
Machen ist wie wollen, nur krasser.

--Sig_/++AQrVP1f2yTVCsWXBeU1H6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoQC1DtG8M9RevkfXW6j9HlIpTekFAmIaaOwACgkQW6j9HlIp
TemgThAAh1hif5Aew736zCQyl9TaGkeY4MMy8HbRNqnb+9wiEAeB+iUL0dADRRLZ
OmDJ9SEFvKz51gGMoSP7rIX9Hxt8J0OZkzrltq5MkZRcnLkpgBlV0oBJViiUa3v/
l+p29WEl4kgX1gB0/u4+y2l0Y0k3FRlUOAYpLNfalDLkJYUrlIjJpoxIsMLmS85j
kaR9pKpGEVOoeOf5V7KVavRd64x3ge0/e+Vinu8Wz7eoMEpWLkAdWjMXVuGoHvUH
HCYPW6X64W0ILhW5Y3+kLwqmyo/NmkZUDH2+3JtcFMiwm/oST24Kq5by8D7ywYLD
bCFZAvEMSVYCPnrk97nbdCtN0xsQWhmhgey5WxPng1juexIj7HAGbSuGVKQOnRA0
/r/LZX6RB2ZvJ8RHZCYKFLCG5aFk8T38MxcAznG4NxTu24+mq793JQ9iMFOL7uVY
omW9tWIH79ts/3Us6nYcW5PHIlyepT957eKdvYeF2PF1b5UTP1MZ0OG6qstgbxjz
rjtyhTJ9qSA1EHN/rS4eLPcdBdEftA1ddGiT5kb63XS/WDNmDJov74isDJOZPS8E
/Nbqk3mJzYPvzTVmiatAMDbWBlJr9jWyyplTsqz2XnGy6ZLp+3+eCEPTXl/BmEVr
6uAqt8ImA43JY4/rhyRYEc14ZLTghrNFKeBw8KNe/S3q/16oz6Q=
=TXlU
-----END PGP SIGNATURE-----

--Sig_/++AQrVP1f2yTVCsWXBeU1H6--
