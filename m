Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B403732937
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jun 2023 09:49:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243117AbjFPHtr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jun 2023 03:49:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241866AbjFPHtj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jun 2023 03:49:39 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5372719
        for <linux-usb@vger.kernel.org>; Fri, 16 Jun 2023 00:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686901777; x=1718437777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tbn1hDfuch/QEL8abacpVpyigS9u1Y8P+maCW+uU0Gg=;
  b=jg7eaQHRAahiHE8X+FSl0m+0CTSMfDZKQZlEQ8zqH9TAa9oC0zTJmVWx
   K7J2eVlaj1OtBRmFH9RkjQtn57oWlvMyPpEnHalC7sX1u1xjv8gRRCUsP
   TUZYYMi4UZPj1NAHNTrTaMkN9BJY1/U29kbMVHuQpItEo1Qmc3RldosuH
   mKEInwQxoAR/CoH8miZNXsGBLYrB5LwNS/H1TkGmw+8XrNYeVmg2T3Tkn
   cB9tP396xeh2Dtqed0ZfK8yZKGxIk6ETA9Wrm9jLfPoaF0EANUgHcUKoz
   jTF8a44OR29zsHyu5wmI/9FOecpjht9Zk1JkB4T7Qu7z99itDImyQsL1v
   w==;
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="asc'?scan'208";a="218841717"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jun 2023 00:49:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 16 Jun 2023 00:49:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 16 Jun 2023 00:49:35 -0700
Date:   Fri, 16 Jun 2023 08:49:09 +0100
From:   Conor Dooley <conor.dooley@microchip.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     kernel test robot <lkp@intel.com>, <linux-usb@vger.kernel.org>,
        <palmer@dabbelt.com>
Subject: Re: [usb:usb-next] BUILD SUCCESS WITH WARNING
 df49f2a0ac4a34c0cb4b5c233fcfa0add644c43c
Message-ID: <20230616-unnerving-surface-a78ff2c38a18@wendy>
References: <202306160658.E79gCwiR-lkp@intel.com>
 <2023061617-unnoticed-snugly-a110@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OmqeLEK+5VEdJLVR"
Content-Disposition: inline
In-Reply-To: <2023061617-unnoticed-snugly-a110@gregkh>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--OmqeLEK+5VEdJLVR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 16, 2023 at 08:14:05AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 16, 2023 at 06:12:01AM +0800, kernel test robot wrote:
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb=
=2Egit usb-next
> > branch HEAD: df49f2a0ac4a34c0cb4b5c233fcfa0add644c43c  Revert "usb: com=
mon: usb-conn-gpio: Set last role to unknown before initial detection"
> >=20
> > Warning: (recently discovered and may have been fixed)
> >=20
> > drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for=
 cdns3(). Prototype was for USB_STRAP_HOST() instead
>=20
> I keep seeing this "warning" by the test robot for a while, but I do not
> understand it at all, and can not duplicate it here locally.  Are you
> sure your riscv toolchain is correct as :
>=20
> > Warning ids grouped by kconfigs:
> >=20
> > gcc_recent_errors
> > |-- riscv-allmodconfig
> > |   `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-=
for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
> > `-- riscv-allyesconfig
> >     `-- drivers-usb-cdns3-cdns3-starfive.c:warning:expecting-prototype-=
for-cdns3().-Prototype-was-for-USB_STRAP_HOST()-instead
>=20
> It only seems to trigger there.

I dunno if it has anything to do with the LKP folks, my copes of gcc-11.3,
gcc-12.2 & gcc-13.1 complain in a similar way on riscv.

Palmer, any clue?

USB_STRAP_HOST is `#define USB_STRAP_HOST BIT(17)` and cdn3s() doesn't
seem to even exist?


--OmqeLEK+5VEdJLVR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIwT9QAKCRB4tDGHoIJi
0qJNAQClfIrNS8ayOHTgLciGhPv5cseoHesGPLWgK+T9q5FvUwD6A3GOe+d3qgtZ
Wqx8iF+FTgmGd6coIF39mWG8Bp1aLAg=
=CLWV
-----END PGP SIGNATURE-----

--OmqeLEK+5VEdJLVR--
