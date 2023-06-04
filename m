Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52986721A1F
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jun 2023 23:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbjFDVIP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 17:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjFDVIO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 17:08:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1513AB8;
        Sun,  4 Jun 2023 14:08:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A651260ADE;
        Sun,  4 Jun 2023 21:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE49C433D2;
        Sun,  4 Jun 2023 21:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685912892;
        bh=tBcMEkXrQsgqR/F6ZhRcf1FCjzt6WCA3VYv57KwwRro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YeJvobG8z6dzqRsit5sIsSHMfcoFQJQT0lsk3RpGpNSTXDUpBvLvbZnPp18xsw1Op
         EBQhljqx4fl05CY9+Re1+ccLsuY9GKV+ir1TyjHK5DRSWtN6F8OsTwBNDd8FBU+Pih
         23wuxP4tRvW6pTbWVXhKuUcJiUPfbc2nnuNrgIz2/dapwchbfo1C/5UIGWZ94Sot9I
         Qj5WEi3i9Bm718xXQy+3Rv6VIXijNzlygT89FFhcc2X+0xWR4CYmI35Wj4jGycgU0u
         OS+Ay2auw/kJzPl6KAbpX/AwwWAlGQCxRMTLZhtF4kdvL0EMS6vTnEje9yF2mjMd+n
         eOf7SY6ruMbPQ==
Date:   Sun, 4 Jun 2023 22:08:02 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        Conor Dooley <conor+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Balamanikandan Gunasundar 
        <balamanikandan.gunasundar@microchip.com>,
        mihai.sain@microchip.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
        durai.manickamkr@microchip.com, manikandan.m@microchip.com,
        dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
        balakrishnan.s@microchip.com
Subject: Re: [PATCH 15/21] dt-bindings: irqchip/atmel-aic5: Add support for
 sam9x7 aic
Message-ID: <20230604-cohesive-unmoving-032da3272620@spud>
References: <20230603200243.243878-1-varshini.rajendran@microchip.com>
 <20230603200243.243878-16-varshini.rajendran@microchip.com>
 <20230603-fervor-kilowatt-662c84b94853@spud>
 <20230603-sanded-blunderer-73cdd7c290c1@spud>
 <4d3694b3-8728-42c1-8497-ae38134db37c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3Md+FIkjg+Lb1NW6"
Content-Disposition: inline
In-Reply-To: <4d3694b3-8728-42c1-8497-ae38134db37c@app.fastmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--3Md+FIkjg+Lb1NW6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 11:49:48AM +0200, Arnd Bergmann wrote:
> On Sat, Jun 3, 2023, at 23:23, Conor Dooley wrote:
> > On Sat, Jun 03, 2023 at 10:19:50PM +0100, Conor Dooley wrote:
> >> Hey Varshini,
> >>=20
> >> On Sun, Jun 04, 2023 at 01:32:37AM +0530, Varshini Rajendran wrote:
> >> > Document the support added for the Advanced interrupt controller(AIC)
> >> > chip in the sam9x7 soc family
> >>=20
> >> Please do not add new family based compatibles, but rather use per-soc
> >> compatibles instead.
> >
> > These things leave me penally confused. Afaiu, sam9x60 is a particular

s/penally/perennially/

> > SoC. sam9x7 is actually a family, containing sam9x70, sam9x72 and
> > sam9x75. It would appear to me that each should have its own compatible,
> > no?
>=20
> I think the usual way this works is that the sam9x7 refers to the
> SoC design as in what is actually part of the chip, whereas the 70,
> 72 and 75 models are variants that have a certain subset of the
> features enabled.
>=20
> If that is the case here, then referring to the on-chip parts by
> the sam9x7 name makes sense, and this is similar to what we do
> on TI AM-series chips.

If it is the case that what differentiates them is having bits chopped
off, and there's no implementation differences that seems fair.

> There is a remaining risk that a there would be a future
> sam9x71/73/74/76/... product based on a new chip that uses
> incompatible devices, but at that point we can still use the
> more specific model number to identify those without being
> ambiguous. The same thing can of course happen when a SoC
> vendor reuses a specific name of a prior product with an update
> chip that has software visible changes.
>=20
> I'd just leave this up to Varshini and the other at91 maintainers
> here, provided they understand the exact risks.

Ye, seems fair to me. Nicolas/Claudiu etc, is there a convention to use
the "0" model as the compatible (like the 9x60 did) or have "random"
things been done so far?

> It's different for the parts that are listed as just sam9x60
> compatible in the DT, I think those clearly need to have sam9x7
> in the compatible list, but could have the sam9x60 identifier
> as a fallback if the hardware is compatible.

Aye.

--3Md+FIkjg+Lb1NW6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHz9MgAKCRB4tDGHoIJi
0ldWAP0RQc1PNr/7S0ZoI1mtSvW5rkogdGae6SPbH5C+bLhcmQEApOd41QvYR3Pq
xuVQ4aC0kBM/JFWUKg2lYgoQNcmmEQw=
=Dd5S
-----END PGP SIGNATURE-----

--3Md+FIkjg+Lb1NW6--
