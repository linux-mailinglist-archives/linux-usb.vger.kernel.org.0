Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18BA927BD20
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 08:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgI2G3o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 02:29:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgI2G3o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 02:29:44 -0400
Received: from saruman (91-155-214-30.elisa-laajakaista.fi [91.155.214.30])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E14FB206A4;
        Tue, 29 Sep 2020 06:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601360984;
        bh=jHZPYp1zJtnb36VNEWpufhEu5kfJ4ZvX3yHbx36++Sw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VaGJzCExDs5cbDm0u3zbyfVnWBJYv1pqm3yyIzuL3D6f2b7deUKSj/kWrTzWPbroW
         cu1zolsXvr6y4TnjOJ70k1eYi9eMCGgKVTefseOxXeqDPeWntNviFQDsMl8FpvvewH
         uwuGttG1HmtlhogTeQWSQBd/3ymdt0K1Pdnb1KSs=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <hzpeterchen@gmail.com>, Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 1/8] usb: cdns3: gadget: using correct sg operations
In-Reply-To: <CAL411-oSXmabZ06TB4sZNhbbPsk3fz6St=QRDzDpc2T=Hg3dfw@mail.gmail.com>
References: <20200910091130.20937-1-peter.chen@nxp.com>
 <20200910091130.20937-2-peter.chen@nxp.com> <87ft77eisu.fsf@kernel.org>
 <AM7PR04MB7157E8B31971129B3E5113968B390@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <CAL411-oSXmabZ06TB4sZNhbbPsk3fz6St=QRDzDpc2T=Hg3dfw@mail.gmail.com>
Date:   Tue, 29 Sep 2020 09:29:36 +0300
Message-ID: <87mu199ju7.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <hzpeterchen@gmail.com> writes:
>> > > It needs to use request->num_mapped_sgs to indicate mapped sg number,
>> > > the request->num_sgs is the sg number before the mapping. These two
>> > > entries have different values for the platforms which iommu or swiot=
lb
>> > > is used. Besides, it needs to use correct sg APIs for mapped sg list
>> > > for TRB assignment.
>> > >
>> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>> >
>> > fails to apply to my testing/next
>> >
>> > checking file drivers/usb/cdns3/gadget.c Hunk #1 succeeded at 1099 (of=
fset 1
>> > line).
>> > Hunk #2 succeeded at 1165 (offset 1 line).
>> > Hunk #3 FAILED at 1176.
>> > Hunk #4 succeeded at 1221 with fuzz 2 (offset 1 line).
>> > 1 out of 4 hunks FAILED
>> >
>>
>> It could work now, I think the possible reason is you have already appli=
ed other cdns3 patches during
>> these two hours. My git log likes below:
>>
>> ca71afbe0c52 (HEAD -> felipe_testing_next) usb: cdns3: gadget: enlarge t=
he TRB ring length
>> 50599e28f626 usb: cdns3: gadget: sg_support is only for DEV_VER_V2 or ab=
ove
>> ed1e5b0fe5b2 usb: cdns3: gadget: need to handle sg case for workaround 2=
 case
>> 95c952507262 usb: cdns3: gadget: handle sg list use case at completion c=
orrectly
>> 9d45b67cf0c3 usb: cdns3: gadget: add CHAIN and ISP bit for sg list use c=
ase
>> 28e5fd2c3fae usb: cdns3: gadget: calculate TDL correctly
>> f57692f1a9a4 usb: cdns3: gadget: improve the dump TRB operation at cdns3=
_ep_run_transfer
>> 5f94832916b5 usb: cdns3: gadget: using correct sg operations
>> bed7c9e9a5aa (felipe/testing/next) usb: dwc3: gadget: Rename misleading =
function names
>> 3d7ce113c2d0 usb: dwc3: gadget: Refactor preparing last TRBs
>> 43365b1e90af usb: dwc3: gadget: Set IOC if not enough for extra TRBs
>> ea52ca3fdefb usb: dwc3: gadget: Check for number of TRBs prepared
>> e6ccecf58b1b usb: dwc3: gadget: Return the number of prepared TRBs
>>
>> Thanks,
>> Peter
>
> Hi Felipe,
>
> I have still not seen these patches on your tree, would you please
> help to queue them for v5.10-rc1?

Should be in testing/next now

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9y1FARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYcLBAAp09UlKPS2Z58okQEk8xBYBagi88phvR3
0w0gUWkXPI3tPjJMwPoVGF3HdjQxmG7R+W0P3Ah5NEm80iuTxS2k21poDghlrALD
/nkpYdH/mTwLYTykWR0TqRBhQRRfxDHz/eI/SyqT0lJB3r/yS2ji56OXFkBqyHq9
r5TgopI8d0kVE1Ru0bDvYtLgMNvRcru7Q7KFwyNPQdUCGTlz0sObvru1dEuDV9rO
IxmAaFEIkCm5pw26wBuSrn14QhunzS1QxkhueyrBztqD0sE9bGIVlQ0mwSe6VIvU
7qulLL3/fTXu5nr+m3SHx1eapxUIIfwb4ByMjUNGhYewOvs/XjRgvgphfHvNXh9k
hknFoidbbWb/8JqnlC3oELOCgC1Wof0NsJOW6AuUakf5rAoBJDHsIGGmw7xHMiIL
cgNNzOXsGCLKs6b3y+cYOQdNAXcpcUhHJpltBOuX4Q/E8bvWVGIX39cE1ZC1wvNU
E9QSEOt558tDP5lasM9KXuOST2xeY1xGR3CpqlXLNoidla3GSH/14rU7CY7bKcjn
+pNcZo7VYL7OjxaAd0mA0VWmGyq8edTuAQ4J+TOAkFzbokSf6M5xQvwEn4FPc3Ra
oYGn+ZupPyxf940FM6so/BQkB8AMrr9TMrHdiXOh+L+D6tShm52Z9nlTVLdaysJA
8pfFQq10Zlk=
=GWPn
-----END PGP SIGNATURE-----
--=-=-=--
