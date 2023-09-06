Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 080A1794496
	for <lists+linux-usb@lfdr.de>; Wed,  6 Sep 2023 22:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235926AbjIFUbr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Sep 2023 16:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231821AbjIFUbq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Sep 2023 16:31:46 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9762E199B
        for <linux-usb@vger.kernel.org>; Wed,  6 Sep 2023 13:31:41 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdzBO-0007tE-0P; Wed, 06 Sep 2023 22:31:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdzBL-004VB4-AQ; Wed, 06 Sep 2023 22:31:23 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qdzBK-00Gxo1-Jz; Wed, 06 Sep 2023 22:31:22 +0200
Date:   Wed, 6 Sep 2023 22:31:22 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Minas.Harutyunyan@synopsys.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp15x: adjust USB OTG
 gadget tx fifo sizes
Message-ID: <20230906203122.cfkafjtlnfpxablb@pengutronix.de>
References: <20230112112013.1086787-1-u.kleine-koenig@pengutronix.de>
 <5cdb024e-46cb-6d03-d716-0fdad80d51f5@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7j7lwe2ub74eijcc"
Content-Disposition: inline
In-Reply-To: <5cdb024e-46cb-6d03-d716-0fdad80d51f5@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--7j7lwe2ub74eijcc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Cc +=3D linux-usb, so I keep a bit more context than I'd normally do]

Hello Fabrice,

I stumbled about this old thread while cleaning up my mailbox. I think
this topic is still open, at least stm32mp151.dtsi still uses the
settings I changed with my patch.

On Fri, Jan 20, 2023 at 10:18:32AM +0100, Fabrice Gasnier wrote:
> On 1/12/23 12:20, Uwe Kleine-K=F6nig wrote:
> > There are in sum 952 dwords available for g-rx-fifo-size,
> > g-np-tx-fifo-size and the eight entries of g-tx-fifo-size. For high
> > speed endpoints the maximal packet size is 512 (for full speed it's 64)
> > bytes. So a tx-fifo-size of more than 128 (dwords) isn't sensible.
>=20
> The current FIFO tuning in the device tree allows to maximize throughput
> regarding single function device.

Are you sure here? I don't claim to be an expert for usb and/or
stm32mp1, but in my understanding an allocation of 256 dwords (=3D 1024
bytes) will only be used in the first half when a driver requests 512
bytes. If so, it would complicate to implement the idea to dynamically
allocate the fifo chunks (sketched below).

> Having twice the packet size for the endpoint allows the controller to
> simultaneously transfer data to the USB, while gathering next data
> from the system memory.
>=20
> > So instead of one (too) big and several small fifos, use two big fifos
> > and to better use the remaining available space increase one of the
> > small fifos.
>=20
> So, I wouldn't mention "too" big here. That's a performance tuning for
> single function device use case.
>=20
> Drawback is this doesn't allow multi-function device, as you're trying
> to achieve (with 2 x 512 endpoints).
> Hence, the "No suitable fifo found" message you've noticed.
>=20
> So just on the wording, I'd rather talk about allowing multi function
> (composite) device with 512 bytes endpoints. Doing this has an impact on
> the performance for all current users in terms of performance.
>=20
> This change is probably fine, as it enables one additional use case, and
> it is in the SOC dtsi file.
> I'm just wondering a bit if we could/should keep current tuning in some
> board dts files ? (Or let each board vendor do their own tuning ?)
>=20
> Perhaps you could CC people that pushed various boards here ?

Maybe it would make sense to overwrite the setting for the existing
boards such that the boards are not affected by the change. I will
consider this if and when I prepare a v2.
=20
> > This allows to work with CONFIG_USB_CDC_COMPOSITE (i.e. Ethernet and
> > ACM) which requires 4 endpoints with fifo sizes 512, 512, 16 and 10
> > respectively.
>=20
> Just a note, this one looks like a legacy driver. I think the preferred
> method is to use configfs gadget to compose a device.

The nice thing about CONFIG_USB_CDC_COMPOSITE is that it works without
userspace, e.g. for nfsroot.
=20
> > with CONFIG_USB_CDC_COMPOSITE enabled on the old device tree, the driver
> > dies in a rather bad way:
> >=20
> > [    2.472914] dwc2 49000000.usb-otg: dwc2_hsotg_ep_enable: No suitable=
 fifo found
> > [    2.478767] ------------[ cut here ]------------
> > [    2.483369] WARNING: CPU: 0 PID: 0 at kernel/dma/mapping.c:532 dma_f=
ree_attrs+0xc8/0xcc
> > [    2.491363] Modules linked in:
> > [    2.494407] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.15.0-2022102=
6-1 #1
> > [    2.501267] Hardware name: STM32 (Device Tree Support)
> > [    2.506409] [<c01110e8>] (unwind_backtrace) from [<c010c9c0>] (show_=
stack+0x18/0x1c)
> > [    2.514129] [<c010c9c0>] (show_stack) from [<c0a83648>] (dump_stack_=
lvl+0x40/0x4c)
> > [    2.521689] [<c0a83648>] (dump_stack_lvl) from [<c0136228>] (__warn+=
0xf4/0x150)
> > [    2.528986] [<c0136228>] (__warn) from [<c0a7fe2c>] (warn_slowpath_f=
mt+0x6c/0xd0)
> > [    2.536458] [<c0a7fe2c>] (warn_slowpath_fmt) from [<c01ad534>] (dma_=
free_attrs+0xc8/0xcc)
> > [    2.544623] [<c01ad534>] (dma_free_attrs) from [<c01adbc0>] (dmam_fr=
ee_coherent+0x40/0x9c)
> > [    2.552876] [<c01adbc0>] (dmam_free_coherent) from [<c0754570>] (dwc=
2_hsotg_ep_enable+0x63c/0x6b0)
> > [    2.561827] [<c0754570>] (dwc2_hsotg_ep_enable) from [<c0791a44>] (u=
sb_ep_enable+0x40/0xf0)
> > [    2.570167] [<c0791a44>] (usb_ep_enable) from [<c0798364>] (gether_c=
onnect+0x2c/0x1c0)
> > [    2.578073] [<c0798364>] (gether_connect) from [<c0799f70>] (ecm_set=
_alt+0xcc/0x1f8)
> > [    2.585805] [<c0799f70>] (ecm_set_alt) from [<c078d0ec>] (composite_=
setup+0x5bc/0x1d40)
> > [    2.593799] [<c078d0ec>] (composite_setup) from [<c07568f0>] (dwc2_h=
sotg_complete_setup+0x16c/0x68c)
> > [    2.602921] [<c07568f0>] (dwc2_hsotg_complete_setup) from [<c0755474=
>] (dwc2_hsotg_complete_request+0x9c/0x210)
> > [    2.612999] [<c0755474>] (dwc2_hsotg_complete_request) from [<c0757d=
68>] (dwc2_hsotg_epint+0xe0c/0x1248)
> > [    2.622470] [<c0757d68>] (dwc2_hsotg_epint) from [<c075a1a4>] (dwc2_=
hsotg_irq+0x9c4/0x10a4)
> > [    2.630812] [<c075a1a4>] (dwc2_hsotg_irq) from [<c0194238>] (__handl=
e_irq_event_percpu+0x64/0x234)
> > [    2.639762] [<c0194238>] (__handle_irq_event_percpu) from [<c01944f0=
>] (handle_irq_event+0x64/0xc8)
> > [    2.648798] [<c01944f0>] (handle_irq_event) from [<c0199028>] (handl=
e_fasteoi_irq+0xbc/0x214)
> > [    2.657312] [<c0199028>] (handle_fasteoi_irq) from [<c0193a9c>] (han=
dle_domain_irq+0x84/0xb8)
> > [    2.665827] [<c0193a9c>] (handle_domain_irq) from [<c05628b0>] (gic_=
handle_irq+0x84/0x98)
> > [    2.673995] [<c05628b0>] (gic_handle_irq) from [<c0100afc>] (__irq_s=
vc+0x5c/0x90)
> > [    2.681466] Exception stack(0xc1001ef8 to 0xc1001f40)
> > [    2.686509] 1ee0:                                                   =
    00000484 c0d6f994
> > [    2.694680] 1f00: 00000000 c011afe0 c10f5ae0 00000000 ffffe000 c1004=
f54 00000000 00000000
> > [    2.702848] 1f20: c1000000 c0e11af0 c1000000 c1001f48 c01091ec c0109=
1f0 60000013 ffffffff
> > [    2.711008] [<c0100afc>] (__irq_svc) from [<c01091f0>] (arch_cpu_idl=
e+0x40/0x44)
> > [    2.718393] [<c01091f0>] (arch_cpu_idle) from [<c0a91f40>] (default_=
idle_call+0x4c/0x168)
> > [    2.726561] [<c0a91f40>] (default_idle_call) from [<c016f054>] (do_i=
dle+0x23c/0x290)
> > [    2.734294] [<c016f054>] (do_idle) from [<c016f3fc>] (cpu_startup_en=
try+0x20/0x24)
> > [    2.741852] [<c016f3fc>] (cpu_startup_entry) from [<c0f01040>] (star=
t_kernel+0x5e8/0x634)
> > [    2.750020] [<c0f01040>] (start_kernel) from [<00000000>] (0x0)
> > [    2.755929] ---[ end trace febb0e7bfc3d83c0 ]---
> >=20
> > so there might be another change required to fail in a nicer way.
> > (That's the WARN_ON(irqs_disabled()) in dma_free_attrs() that triggers
> > here.)
>=20
> Indeed, probably all dwc2 users could be affected by this (not only
> stm32). IMHO, This could be reported to the USB mailing list.

Indeed. I hope someone picks up this topic.
=20
> > Another thought I had while tuning the tx fifo sizes was: Why is the
> > size allocation not (more) done dynamically? At least only setting a
> > fixed amount of dwords aside for g-tx-fifo-size and allocate from that
> > shouldn't be too hard, should it?
>=20
> Same, better place could be to suggest this directly on the USB ML (with
> Minas in CC).

Minas was already on Cc for the initial mail. I wonder if other host
cores also need this explicit fifo size allocation. Then maybe there is
some place to copy a dynamic allocation from?

> > Note I know very little about USB, so it might well be possible that I
> > missed a use case, but with this change my USB gadget works as expected.
>=20
> See my earlier comment on the use case. It's probably a good idea to
> update the gadget FIFO size to enable composite device with two
> functions (w/512 bytes EP).
> Could you update the commit message with these updates ?
>=20
> Not sure thought, if perf penalty should be handled (and how) for single
> function device use case, possibly affecting all current users.
>=20
> >  arch/arm/boot/dts/stm32mp151.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm3=
2mp151.dtsi
> > index 5491b6c4dec2..af70ca1f9b57 100644
> > --- a/arch/arm/boot/dts/stm32mp151.dtsi
> > +++ b/arch/arm/boot/dts/stm32mp151.dtsi
> > @@ -1137,7 +1137,7 @@ usbotg_hs: usb-otg@49000000 {
> >  			interrupts =3D <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> >  			g-rx-fifo-size =3D <512>;
> >  			g-np-tx-fifo-size =3D <32>;
> > -			g-tx-fifo-size =3D <256 16 16 16 16 16 16 16>;
> > +			g-tx-fifo-size =3D <128 128 64 16 16 16 16 16>;
> >  			dr_mode =3D "otg";
> >  			otg-rev =3D <0x200>;
> >  			usb33d-supply =3D <&usb33>;

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7j7lwe2ub74eijcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmT44ZkACgkQj4D7WH0S
/k4nFAgAqqaT07XAPm1Qzpbna4E+Or3Zu5/u1qhOS79yNd5A1rxF/B3p/xwtVKjb
FAEX/DXdwMcQj3CmlxIMJhdYBKrsktEMIPeJbV1Aas4x9XH+iTsZ4l7SLA9AGUoS
cDFKxBVhUuR0led3DrR3TGDL+QquXVaEyDmuKPZBEbWmQghOqgd0j5N3XxK3tmi/
4dHWVmmlBgQJ0/vrUX6rWpHS9k8K+QxEWMuivjgCLt2lthXi9KQa5M7ucWl72RNx
Ga3btQJsx6fmaWSqEV6Az5S5JSkuoAalvVDkjouxon8Mbz85AGFmuR59p+zkq66h
RDAjbnCFULsgq+oftUhC4wFyXJyokQ==
=Bcel
-----END PGP SIGNATURE-----

--7j7lwe2ub74eijcc--
