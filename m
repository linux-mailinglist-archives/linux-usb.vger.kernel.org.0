Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90BE498EC5
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 11:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbfHVJHv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 05:07:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37030 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728903AbfHVJHv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Aug 2019 05:07:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id d16so4948248wme.2;
        Thu, 22 Aug 2019 02:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=anZxiHUSK863ya9dmMTzujdG5ylmaCDlZaEGIY0R7Vo=;
        b=KVi3DEvCyRCxT+OMDwSOcluBwNqUd+CKCxEnL2QWyKBu5+WDw1xmDHRJZs4Zy7+6i1
         XHD6BBwECcjg4J+1jpDt+AfsgaGus/Xc+hqKwjLMIeuPBvfKMOpNz383PaSWoU1Sdggl
         TjHRdMF3I1jjrsCM/wOpBQvX3XBovnLSoMONIZCIITcD6X8Pv8oWdSLq5xxYv0vmENVf
         u2nJULzPq9taX+EKeKdvUGVGGY5eW8HQyOQ8XOVOJbIDjqw3Jf7Kfws8VpR1edO9AJZf
         GlI8dT52/PGiLUlI8Hf2DxUlpnyEtK1ISXW/vME7Qgv5eDSGHiyhBmzfX0C97+C2Kkvn
         yYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=anZxiHUSK863ya9dmMTzujdG5ylmaCDlZaEGIY0R7Vo=;
        b=Z2o3Jz0i/dk6nEGKxDSO3RRtbtFA2D3ujkJ8YWj8WdVAhfndb4nBeKXext8crEYQ2U
         5cKbVj3kKvRYhlEIew4HPuZ2uz58x8ti+Lknzz4TW5s1TsdGp5O9KUusmwODOIvKFiMl
         K9UP5At7/hhwlLngbm1XKANuSjk9RZumApivDigp3V2HEWCSd8i3xWP7slqQjdgl7Ovd
         ZDicN/JKoRAd3SDjmH3akxCicdixF18UQbW71V42TfQ9t0gp+vGCe7Q2Mg+4OvqZE4Yl
         p5+dsJpXenjBDCo3OS4BKoypaAx9UhGQEkhx6+LZ2TIP1CxxnEtXBzktYJDcYYmc1L5J
         0AGQ==
X-Gm-Message-State: APjAAAVDDZy9v/ZeKN/VhHRI+25wFfnAiDUIxWUcq6lRk4oHPKdjVlmB
        KbAd+FldcdQUfhjPwtXBx2E=
X-Google-Smtp-Source: APXvYqy9i2O7+ZIOf0JBNsFxRKqlHorCHUBTLtHVLp7ySbJmb3+Zq7JS3XMfFsHbPTfliZSwaGuAhA==
X-Received: by 2002:a1c:cc09:: with SMTP id h9mr4913750wmb.32.1566464868084;
        Thu, 22 Aug 2019 02:07:48 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id f10sm21542180wrm.31.2019.08.22.02.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 02:07:46 -0700 (PDT)
Date:   Thu, 22 Aug 2019 11:07:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nagarjuna Kristam <nkristam@nvidia.com>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [Patch V6 0/8] Tegra XUSB gadget driver support
Message-ID: <20190822090745.GC23873@ulmo>
References: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <1565257046-9890-1-git-send-email-nkristam@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 08, 2019 at 03:07:18PM +0530, Nagarjuna Kristam wrote:
> This is the sixth version of series "Tegra XUSB gadget driver support"
>=20
> Patches 1-3 are phy driver changes to add support for device
> mode.
> Patches 4-7 are changes related to XUSB device mode
> controller driver.
> Patch 8 is to enable XUDC driver in defconfig
>=20
> Test Steps(USB 2.0):
> - Enable "USB Gadget precomposed configurations" in defconfig
> - Build, flash and boot Jetson TX1
> - Connect Jetson TX1 and Ubuntu device using USB A to Micro B
>   cable
> - After boot on Jetson TX1 terminal usb0 network device should be
>   enumerated
> - Assign static ip to usb0 on Jetson TX1 and corresponding net
>   device on ubuntu
> - Run ping test and transfer test(used scp) to check data transfer
>   communication
>=20
> SS mode is verified by enabling Type A port as peripheral
>=20
> This patch series is dependent[1] on
> https://patchwork.kernel.org/cover/11056429/
>=20
> [1] Dependent series doesnot compile on Master branch due to removal of
>     switch_fwnode_match() in file drivers/usb/roles/class.c.
>     Hence verified current series changes on 5.3-RC3 branch.
> ---
> v6:
> * Patches 1,2,3,7,8 - No changes
> * Patch 4,5,6 - Comments from Rob addressed, updated usb connector driver
>   compatibility string.
> ---
> v5:
> * Patches 1-3 - Commit subject updated as per inputs from Thierry
> * Patch 4 - Added reg-names used on Tegra210 in the bindings doc
> * Enabled xudc driver as module instead of part of kernel in patch 8
> * Patched 5-8 - No changes
> ---
> v4:
> * patch 1 - no changes
> * corrected companion device search based on inputs from Thierry in patch=
 2
> * removed unneeded dev variable and corrected value read in
>   tegra210_utmi_port_reset function in patch 3
> * dt binding doc and dtb files are corrected for alignments.
>   Replaced extcon-usb-gpio with usb role switch.
> * Added support for USB role switch instead of extcon-usb-gpio and other =
minor
>   comments as suggested by Chunfeng.
> * Enabled xudc driver as module instead of part of kernel in patch 8
> ---
> V3:
> * Rebased patch 1 to top of tree.
> * Fixed bug in patch 2, where xudc interrupts dont get generated if USB h=
ost
>   mode fails to probe. Moved fake port detection logic to generic xusb.c.=
 fake
>   usb port data is updated based on soc flag need_fake_usb3_port.
> * Added extra lines whereever necessary to make code more readable in pat=
ch 3
>   and 7.
> * dt binding doc is corrected for typos and extcon references. Also added
>   details for clocks and removed xusb_ references to clock and power-doma=
in
>   names and accordingly patch 5 is updated.
> * removed avdd-pll-utmip-supply in patch 6, as its now part of padctl dri=
ver.
> * Patch 8 has no changes.
> ---
> V2:
> * Patches 1-3 are new patches in this series, which splits unified featur=
es
>   patch to speprated features and removes need of port-fake entry in DT.
> * Patch 4 is re-arragend dt-bindings patch which incorporates previous
>   patch comments to sort DT entries alphabetically, addresses name changes
>   and PM domain details added.
> * Patch 5-6 are re-arranged DT patches with major changes - sort entries
>   alphabetically, and adds clock names.
> * Patch 7 is UDC driver tegra XUSB device mode controller with major
>   changes - remove un-used module params, lockinng for device_mode flag,
>   moving un-needed info logs to debug level, making changes feature flag
>   dependent rather than SOC based macros and other error handling in prob=
e.
> * Patch 8 has no changes.
>=20
> Nagarjuna Kristam (8):
>   phy: tegra: xusb: Add XUSB dual mode support on Tegra210
>   phy: tegra: xusb: Add usb3 port fake support on Tegra210
>   phy: tegra: xusb: Add vbus override support on Tegra210

I just noticed that you haven't Cc'ed the PHY framework maintainer
(Kishon) on these patches. Please make sure to Cc him (on the whole set)
when you send out v7.

Thierry

>   dt-bindings: usb: Add NVIDIA Tegra XUSB device mode controller binding
>   arm64: tegra: Add xudc node for Tegra210
>   arm64: tegra: Enable xudc on Jetson TX1
>   usb: gadget: Add UDC driver for tegra XUSB device mode controller
>   arm64: defconfig: Enable tegra XUDC driver
>=20
>  .../devicetree/bindings/usb/nvidia,tegra-xudc.txt  |  110 +
>  arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   31 +-
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   19 +
>  arch/arm64/configs/defconfig                       |    1 +
>  drivers/phy/tegra/xusb-tegra210.c                  |  133 +-
>  drivers/phy/tegra/xusb.c                           |   87 +
>  drivers/phy/tegra/xusb.h                           |    4 +
>  drivers/usb/gadget/udc/Kconfig                     |   11 +
>  drivers/usb/gadget/udc/Makefile                    |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c                | 3808 ++++++++++++++=
++++++
>  include/linux/phy/tegra/xusb.h                     |    4 +-
>  11 files changed, 4205 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra-xu=
dc.txt
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>=20
> --=20
> 2.7.4
>=20

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1eW2EACgkQ3SOs138+
s6H0bQ/7BC/tb8Co4+PoPFXZ5uXpTayVsQTCbNAUjIR7rB+TIJHAIRrAkt2iBApD
wL/YCbKCLSBWu/NuMNzLEnZydBwOxYbgjtOBjWD+4UpIfpsedbzj51QeeXYSc83k
t7+k8GZ+SbLITwJstSALxib5d77Odhng41j3amB7YaO0pYqMQn4AxT1GK2Gzn1rk
SZ0MrlZpVqGh4xPM7VfDQ6O3fGP2WMOlmTP1gjofIAhRMCyCuA6X3xw5gvBdq32J
TiIG6CfL3Hksa5hf9laBJ9D9J9wqd+5wrMqKmh6GwjpSq0aPZgMsYUVN8dZ47i2c
BVzTcI1p5479wMxfyxx5Xt5THqVxwgrmtNxRGsLfFmV5JGEyc7tjPg8CU2yRTh96
+oDF9QAcrMzl+XjA637GGWMoG7i4ePN8kADQRII9EGl/gafXNbznVsJQxkFEQkYK
TF1T7KxqbKUpR5GIY5FQV90283oPrNbedje0B7OkcjSZJMKhhoo9wolrLMSN4Wc5
9q0mcR/1lG70Vjb5kI4n1XkKqpP/0h4Qi1QtYKED1FwutQJziKmNXkV2B+Mgcbcp
NZgazAvkBIogC3W4vLeKLGVvf2F3bfq+hEF6m86NrbGKw0HYvhPZT37qDkbee+oP
cAXxpiRd3SvSSRbDbsUwYVO+djeCounvyFN/EBjhEepliNiYnAk=
=f0zu
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
