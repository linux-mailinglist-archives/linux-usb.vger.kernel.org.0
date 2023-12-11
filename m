Return-Path: <linux-usb+bounces-3968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 894AD80CF0F
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 16:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15DB2281FEB
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 15:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 469F14A9A4;
	Mon, 11 Dec 2023 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="mpaj3KiH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BE6DF
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 07:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702307252; x=1733843252;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=i3xj39gu9VEV26aFUXSIo1Yj4tPHQOIlSxxf/ZK+g58=;
  b=mpaj3KiHduNH2uvXcnCMFh6Yy6bvH+T7abCiOXP6ABDkKXecEu+5vAgN
   5xPFBLBAsTe+BiTk+xz04xyI1kUkT5HWvY9cBgUhbEb9rZgdCEwzIQnEF
   PVcdffs9ZoBXrCsBVZ5B2juiUwcYGGPBR2ubGczvlkn3usWM5An7BjG5m
   +xavG+qcRV4wFTXEZF1UnmL0RxXpnUrJbnKtTMPCmhYU4fONn5ffjG/bZ
   i97CUWt1GdJEDsRUg/6PwhybBD785vlIIvSHaC3lcWXJXdmaEUZlHzc2l
   l1FJOjKGV9xPezTfNTM7nB+z8GDv0yoITiiPXXSK4uUJa9yKA6kCwjJTM
   g==;
X-IronPort-AV: E=Sophos;i="6.04,268,1695679200"; 
   d="scan'208";a="34436750"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Dec 2023 16:07:30 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0290E280075;
	Mon, 11 Dec 2023 16:07:29 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-usb@vger.kernel.org, dgilbert@interlog.com
Subject: Re: [Announce] lsucpd release 0.91 utility for USB Type-C
Date: Mon, 11 Dec 2023 16:07:31 +0100
Message-ID: <2914483.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5f74a231-e0c2-4be6-ab90-6592f7cfa8df@interlog.com>
References: <5f74a231-e0c2-4be6-ab90-6592f7cfa8df@interlog.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Douglas,

Am Freitag, 8. Dezember 2023, 07:36:02 CET schrieb Douglas Gilbert:
> lsucpd is a command line utility for listing USB Type-C ports, partners
> and any associated PD objects. It is essentially data-mining the
> /sys/class/typec and /sys/class/usb_power_delivery directories. So
> lsucpd performs no magic and root permissions are not required.
>=20
> lsucpd was originally announced in this post on 28 August 2023:
>    https://marc.info/?l=3Dlinux-usb&m=3D169325926403279&w=3D2
> That code has been tagged as 'r0.89'. There is also a 'r0.90' tag
> but it was not announced. This release is tagged as 'r0.91'. The
> code is available at this git mirror at:
>      https://github.com/doug-gilbert/lsucpd

What is the actual license? There is LICENSE (BSP-2-Clause) and COPYING=20
(GPL-2.0-or-later).

Thanks
Alexander

> Changelog since 0.89 [20230827] [svn: r9]
>    - add the first stage of JSON support
>    - add --pdo-snk=3D and --pdo-src=3D options to decode PDOs
>    - add --rdo=3D option to decode RDOs
>    - make preparations for PD revision 3.2
>=20
> The last one is a bit optimistic as the kernel PD stack can't yet handle
> the additions in PD 3.1 (e.g. fixed 28, 36 and 48 Volts, plus AVS from
> 15 to 48 Volts). Recently PD 3.1 dropped all support for 3.3 to < 5 Volts.
> PD 3.2 splits AVS (Adjustable Voltage Supply) into SPR (Standard Power
> Range [<=3D 21 Volts]) and EPR (Extended ...) variants. SPR AVS is the new
> one going from 9 to 20 Volts. What is the difference between AVS and PPS
> (Programmable PS)? Answer: PPS does current limiting, AVS doesn't ***.
>=20
>=20
> Note: USB TypeC/PD standards have been in place for almost 10 years
> and now almost all new mobile devices use TypeC/PD . However visibility
> of TypeC/PD to host operating systems is relatively new and immature.
> Previously mobile devices handled TypeC/PD in their BIOS or Embedded
> Controllers and left the host OS "in the dark".
> Please keep this in mind if reporting issues.
>=20
> Here is a debian binary package built on Ubuntu 23.10 :
>      https://doug-gilbert.github.io/p/lsucpd_0.91-0.1_amd64.deb
>=20
> Here is a rpm built on Fedora 39 :
>      https://doug-gilbert.github.io/p/lsucpd-0.91-1.x86_64.rpm
>=20
> Doug Gilbert
>=20
>=20
> *** "current limiting" as defined by PPS. AVS (and PPS) still does
>       OCP (Over Current Protection) but that is pretty brutal (i.e.
>       the source removes power for a few hundred milliseconds to
>       let the sink cool off)
>=20
>=20
> Examples from a Thinkpad X13 Gen 3, U 23.10 lk 6.7.0-rc1
>    [port0-partner: is an alternate mode DP dongle,
>     port1-partner: is a PD power adapter (source)]
>=20
> $ lsucpd
>   port0 [pd0]  =3D=3D=3D=3D>>  partner [pd3]
>   port1 [pd1]  <<=3D=3D=3D=3D  partner [pd2]
>=20
> $ lsucpd -c
>   port0 [pd0]  =3D=3D=3D=3D>>  partner [pd3]
>   port1 [pd1]  <<=3D=3D=3D=3D  partner [pd2]
>=20
>  > pd0: has NO source-capabilities
>  >=20
>  >  pd0: sink-capabilities:
>     >> 1:fixed_supply; fixed: 5.00 Volts, 3.00 Amps (op)
>     >> 2:variable_supply; variable: 5.00 to 20.00 Volts, 3.25 Amps (op)
>     >> 3:battery; battery: 5.00 to 20.00 Volts, 65.00 Watts (op)
>  >=20
>  > pd1: source-capabilities:
>    >> 1:fixed_supply; fixed: 0.00 Volts, 7.21 Amps (max)
>  > =20
>  >  pd1: sink-capabilities:
>     >> 1:fixed_supply; fixed: 5.00 Volts, 3.00 Amps (op)
>     >> 2:variable_supply; variable: 5.00 to 20.00 Volts, 3.25 Amps (op)
>     >> 3:battery; battery: 5.00 to 20.00 Volts, 65.00 Watts (op)
>  >=20
>  > pd2: source-capabilities:
>    >> 1:fixed_supply; fixed: 5.00 Volts, 3.00 Amps (max)
>    >> 2:fixed_supply; fixed: 9.00 Volts, 3.00 Amps (max)
>    >> 3:fixed_supply; fixed: 12.00 Volts, 3.00 Amps (max)
>    >> 4:fixed_supply; fixed: 15.00 Volts, 3.00 Amps (max)
>    >> 5:fixed_supply; fixed: 20.00 Volts, 3.00 Amps (max)
>  > =20
>  >  pd2: has NO sink-capabilities
>  >=20
>  > pd3: has NO source-capabilities
>  >=20
>  >  pd3: has NO sink-capabilities
>=20
> $ lsucpd -ll
>   port0 [pd0]  =3D=3D=3D=3D>>  partner [pd3]
>   port1 [pd1]  <<=3D=3D=3D=3D  partner [pd2]
>=20
>  > port0  [pd0]:
>        data_role=3D'[host] device'
>        power_operation_mode=3D'usb_power_delivery'
>        power_role=3D'[source] sink'
>        preferred_role=3D''
>        supported_accessory_modes=3D'none'
>        usb_power_delivery_revision=3D'2.0'
>        usb_typec_revision=3D'1.0'
>        vconn_source=3D'no'
>        waiting_for_supplier=3D'0'
>     port0-partner  [pd3]:
>        accessory_mode=3D'none'
>        number_of_alternate_modes=3D'1'
>        supports_usb_power_delivery=3D'yes'
>        usb_power_delivery_revision=3D'0.0'
>        Alternate mode: /sys/class/typec/port0-partner/port0-partner.0
>          active=3D'yes'
>          description=3D'DisplayPort'
>          mode=3D'1'
>          svid=3D'ff01'
>          vdo=3D'0x00001085'
>=20
>  > port1  [pd1]:
>        data_role=3D'host [device]'
>        power_operation_mode=3D'usb_power_delivery'
>        power_role=3D'source [sink]'
>        preferred_role=3D''
>        supported_accessory_modes=3D'none'
>        usb_power_delivery_revision=3D'2.0'
>        usb_typec_revision=3D'1.0'
>        vconn_source=3D'no'
>        waiting_for_supplier=3D'0'
>     port1-partner  [pd2]:
>        accessory_mode=3D'none'
>        supports_usb_power_delivery=3D'yes'
>        usb_power_delivery_revision=3D'0.0'
>=20
>=20
> Note: not all that output is believable (e.g. '0.00 Volts, 7.21 Amps (max=
)')
> so some common sense is required interpreting the output from lsucpd .


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



