Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06DAB115A72
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2019 01:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfLGA6M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 19:58:12 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:38001 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726377AbfLGA6L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 19:58:11 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id A567F22779;
        Fri,  6 Dec 2019 19:58:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Fri, 06 Dec 2019 19:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=m4jD/J
        cWNVWweueCdPtJZopsoCDmrb0R2TVVc2eENC0=; b=UUhFUa+XuYZfkMYsi6q83r
        4Wp7G0JhwiXtmFx3lBL0N6DFQL0gI/ZSwhLL/ZpeSJZEO3ay1bRp9T1abEJ6rX6P
        y8WW34euQQXd3Zh2VKC6jqF4FGvfO3jKiIBqzDNUg8/w4t9tYot8p9FRcnJb6tf4
        aX5FgiXBCADRXYW9JO0BGIqjVRj8XhLyffuoDbsfVxuNQp+2xp4wfmxPa7Yll3Q3
        UQwCjdZwc7L8r+kopkOBPVsLOK66Lf8rzXmbf15w76VGoR28n8wHDAI45UXdEMd0
        mkq/d0XAM6WL2JvOxNWcsneZE3JqnhyBfe7cBVSq4dXm0ChYuntJ1O7Chapq7KIA
        ==
X-ME-Sender: <xms:IvnqXSwr_J1AykBnQcEN7OVIL5j3BZzrMhhhTQNF7f_3nGYM0yP-9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekgedgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
    feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:IvnqXZcnt5dBGcCCd0FQOJUyg3GXn4OFDGJec6wdVOXLDpG99gqjpw>
    <xmx:IvnqXYID-tOK91SzFUZuReNnvXqe_nwUkLWHWBzqzBcWee-PU2Xj6w>
    <xmx:IvnqXS1QH7f62Fehcq15IAmvzl_tXfAfHoIw8iPTzHr0Zd7-Hh_jFw>
    <xmx:IvnqXX5VZJdpk5iNIYSCdTSPW2KHEgpT6vXwo5TWCYki8FKZCGGa_A>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id B947530600D3;
        Fri,  6 Dec 2019 19:58:09 -0500 (EST)
Date:   Sat, 7 Dec 2019 01:58:07 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Suwan Kim <suwan.kim027@gmail.com>, linux-usb@vger.kernel.org,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191207005807.GQ1122@mail-itl>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <49f180e4-0e36-1615-0988-31b0199c4e2b@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xn9xNsWbHJd/50IB"
Content-Disposition: inline
In-Reply-To: <49f180e4-0e36-1615-0988-31b0199c4e2b@linuxfoundation.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--xn9xNsWbHJd/50IB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock

On Fri, Dec 06, 2019 at 02:12:08PM -0700, Shuah Khan wrote:
> On 12/6/19 1:57 PM, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Dec 06, 2019 at 03:50:58PM +0900, Suwan Kim wrote:
> > > On Fri, Dec 06, 2019 at 04:24:06AM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hello,
> > > >=20
> > > > I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
> > > > connect Yubikey 4 and use its CCID interface (for example `ykman oa=
th
> > > > list` command), the client side hangs (100% reliably). After 60s I =
get a
> > > > message that a CPU hangs waiting for a spinlock (see below).
> > > >=20
> > > > I've bisected it to a ea44d190764b4422af ("usbip: Implement SG supp=
ort
> > > > to vhci-hcd and stub driver") commit. Which indeed is also backport=
ed to
> > > > 4.19.
> > > >=20
> > > > Any idea what is going on here? I can easily provide more informati=
on,
> > > > if you tell me how to get it.
> > > >=20
> > >=20
> > > Hi,
> > >=20
> > > Thanks for reporting. Could you turn on lockdep and USBIP_DEBUG
> > > in kernel config and send dmesg log? It will be helpful to figure
> > > out lock dependency in vhci_hcd.
> >=20
> > Hmm, I've tried, but I don't see much more information there (see
> > below). I've just enabled PROVE_LOCKING and USBIP_DEBUG. Do I need to do
> > anything more, like some boot option?
> >=20
> > Also, this one (as the previous one) is from 4.19.84. Interestingly, on
> > 4.19.87 I don't get the message at all.
> >=20
> > Hmm, I've done also another test: got 4.19.84 with "usbip: Implement SG
> > support to vhci-hcd and stub driver" reverted and it still hangs...
> >=20
> > I'm going for another bisect round (4.19.81 works, 4.19.84 doesn't).
>=20
> Does 4.19.82 work?

Yes, it does, or at least something after 4.19.82 works (9da271c1c).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--xn9xNsWbHJd/50IB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3q+R4ACgkQ24/THMrX
1ywQuggAj0l82ZNqfTNKPifDGHnGTYrwsHTO2gzCQ7Bso5iU74fe+f8IocCJqoSp
Kms9gZcH14Jtc7uIfkSFLUBr19p/JbmK5uFtw5wookpcVqJAP1R+3lQmFz/xqBsf
7B5SGsxk2VpplH58WLemOOvLxt7nYSwfXb0EKiadAj7ZjJyT7egMRRVxfQsK5J53
NTEe4KE4ENiwG2ko/4spa6aoyfYmznulilsTkePDJvVsSPbwy4P1NvJ5BEa2U63U
dOQ2zQxDn79EW+TXFPQ7+FiyQaT/q4HR014O9d072KU3yv7kyWUAdmeDL+PGdnEi
rHJtZdZGMEglgod+dn33TwCNcwFJoA==
=kWqC
-----END PGP SIGNATURE-----

--xn9xNsWbHJd/50IB--
