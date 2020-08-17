Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECAEC2466FA
	for <lists+linux-usb@lfdr.de>; Mon, 17 Aug 2020 15:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgHQNII (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Aug 2020 09:08:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:35598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728452AbgHQNH5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Aug 2020 09:07:57 -0400
Received: from saruman (unknown [194.34.132.59])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44A452072E;
        Mon, 17 Aug 2020 13:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597669677;
        bh=xwyykuhLIqd8lJXY3lF+ynZrlW/7BhvBcLPdfEjkWYI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qSiwX457ElCILfZ4SrWtDEtrzAbFsdYyD9oUC/oe+e/5nTxU1qSQsFxZsUUUE5PKM
         FdsLUhbE4UHqePjox6fMspNbCYwCtNoYLmlsnCzCQh0wl1FlqZwogZO7tHMB6H+6Zu
         BEZPemewtz4fRKB/EujCKwyZmUVJ5jbf5ipkUQgI=
From:   Felipe Balbi <balbi@kernel.org>
To:     Maciej =?utf-8?Q?=C5=BBenczykowski?= <zenczykowski@gmail.com>,
        Lorenzo Colitti <lorenzo@google.com>
Cc:     linux-usb@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: gadget: f_ncm: allow using NCM in SuperSpeed Plus
 gadgets.
In-Reply-To: <CAHo-Ooyk_uqciWJ=2L+OwM+DBfPCRKLQz6-5SCxKSRTV8-FCHA@mail.gmail.com>
References: <20200805075810.604063-1-lorenzo@google.com>
 <87mu39tmu6.fsf@kernel.org>
 <CAKD1Yr17hFju=xvDHWWcLjwj=nuSBBVJn9xQ5ocHHXQm6PAw_A@mail.gmail.com>
 <CAHo-Ooyk_uqciWJ=2L+OwM+DBfPCRKLQz6-5SCxKSRTV8-FCHA@mail.gmail.com>
Date:   Mon, 17 Aug 2020 16:07:50 +0300
Message-ID: <87d03pzahl.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Maciej =C5=BBenczykowski <zenczykowski@gmail.com> writes:
> USB3.0 / USB3.1 gen1 / USB3.2 gen 1x1 / 5gbps overhead is upwards of
> 20% (8b10b coding is 80% efficient).
>
> USB3.1 gen2 / USB3.2 gen 2x1 / 10gbps overhead is upwards of 3%
> (128b132b coding is nearly 97% efficient).
>
> however:
> USB3.2 gen 1x2 / 10gbps overhead is again 20% (since this is 8b10b on
> two 5gbps links on one cable)
>
> USB3.2 gen 2x2 / 20gbps overhead is again 3% (since this is 128b132b
> on two 10gbps links on one cable)
>
> On top of that you need to layer usb protocol overhead (the above is
> just link layer overhead).
>
> AFAICT for optimal xfer you need to transfer in 16KiB chunks, which
> get split into 16 1KiB pieces,
> each piece has overhead, plus there's a begin packet and final ack
> packet (ie. 18 packets total).
> I'm not entirely sure what the overhead is here, but my estimate:
> 16384 / (32 + 16*(32 + 1024) + 32)
> puts it at another 3.5% loss on top of the previous L1 overhead (ie.
> multiplicative).
>
> [Note: I'm not entirely sure if the first and final 32 are correct,
> but I'm pretty sure it's at least this much,
> if anything stuff is worse due to some unavoidable delays between data
> reception and ack, the upstream direction to host is even worse, since
> host asks for data, device provides it, host acks it, thus there's 2
> data direction flip delays]
>
> This means:
>   5 gbps -> 5*8/10*0.965 =3D 3.86 gbps (USB 3.0 / USB3.1 gen1 / USB3.2 ge=
n 1x1)
>   10 gbps -> 10*128/132*0.965 =3D 9.35 gbps (this is USB3.1 gen2 / USB3.2=
 gen 2x1)
>   10 gbps -> 10*8/10*0.965 =3D 7.72 gbps (this is dual link USB3.2 gen 1x=
2)
>   20 gbps -> 20*128/132*0.965 =3D 18.72 gbps (this is dual link USB3.2 ge=
n 2x2)

thanks for going through the trouble of digging all this information,
much appreciated. Unless anyone has any concerns with these numbers, I
think this is much closer to reality. Any further limitation is SW/HW
overhead.

> At least I'm pretty sure you physically can't go faster, though there
> might still be extra overhead I missed (which would make it even
> slower).
> (in particular the dual link cases seem to duplicate some control
> stuff across both cables, so overhead is probably a tad higher)

possible, yeah.

>> > > +     /* the following 2 values can be tweaked if necessary */
>> > > +     /* .bMaxBurst =3D         0, */
>> >
>> > should you add bMaxBurst =3D 15 here?
>>
>> I'm not sure. On my setup, it provides a fair performance boost (goes
>> from ~1.7Gbps to ~2.3Gbps in, and ~620Mbps to ~720Mbps out). But I
>> don't know whether there might be any compatibility constraints or
>> hardware dependencies. I do see that the f_mass_storage driver sets it
>> to 15:
>>
>>          /* Calculate bMaxBurst, we know packet size is 1024 */
>>         max_burst =3D min_t(unsigned, FSG_BUFLEN / 1024, 15);
>>
>> so perhaps this is fine to do in NCM too? If we want to set bMaxBurst
>> to 15, should that be in this patch, or in a separate patch?
>
> I think we should.  I would imagine this is the 16*1024 I reference up ab=
ove.
> Though it should probably be bumped in a different commit.

fair enough :-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl86gScRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZA/BAAjbxaL/G6z7C3Dfjep10YZSEiuf6KfB/1
RfYJEVGZGejX1T8k2b9NyUVygh1oZC5swHa/p5gwbQV2v1grozxhYnV/lMHIjhxo
bWnvO6p8QaT/SE7vLjwGMqpU4hiLspwMTwDOU9hHCziMX1u763PBkfUOBbq0mpYe
D8eS/HFZdi9WXskupF/DZcodhg1A/flhSOdlxyzj9RNlxEnVJ3tAIplmrTaJx1v3
CDLRxKtHTcgYxMGOlLnr1PsIbk2FcTPQc7La3MezV8TUiaAyA+focTDsFHbafbCa
cDZXmCBEJWusTHdAwpP2r91FjIjJshZjvdV07KZbq+bzPHe6cl9kaB/6ypk+RscI
EbZtf1H2dT1AqbtB0FOtKDPi4zt4JnpFNucG9ml8/icv6JwVGxE98zkOGIicbIAp
6VGWAKxMRvt5wpB5wVNMKM6qRq9nfDpy3NvNwAvKmVTys6I0YQ0R1laZVzeNWvb7
4eskbPliiddecSiVjDNPU+cF1PJcKES17bSyn+HTnqQM8hpAVExd4v0OxumKQgxK
H0jdSG88v3hv9aNeJan0NamXUVB10vcb8hSHNnbPQ2LBv+FhykKRwfcS+XUTN3ft
zBrR4cBbNdqeKWSxmtrF/s+xbL85ulTnGAiIux2rLODNpt0zOnN94OMh15jkibFk
thnXEQ4mSHk=
=wXAJ
-----END PGP SIGNATURE-----
--=-=-=--
