Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1D2116EDA
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 15:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727684AbfLIOUE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 09:20:04 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44539 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727200AbfLIOUE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 09:20:04 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 399AD221FD;
        Mon,  9 Dec 2019 09:20:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Mon, 09 Dec 2019 09:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Pyl+QP
        Wi4HChi3i61TddahIyrZS0CsyxGR6W3Mzvakw=; b=X2BY2AYYHDQcTnw80ydiz2
        BlLyx/Gba+MNeenAMRzpiQG5AvQf82zVbUECC6KjwEq22u5l8nV8Kp5DLa7A4NZq
        wIGfoMtqcXRvAITsaJ0nymkony75don5oyugs+6UXUF/sA5pVaOB8bhZ5jm7nd2s
        u094+Xk4hA41GXakQMPMrbvThji7mtY9t873IE9buSAMUatgYelYHwpcDWOzfZ2i
        mbuCQ7nrncW8oOi0fns6LdYjFHZt860hSsc0zbaaBSZncdVcxhzoVCCFUrmp8oGT
        N0DQ27eIjpV5t/QACaozz5oY2D7MCHn/WB2tyrB0egNdHTDY2be6an7GxMu6eWKw
        ==
X-ME-Sender: <xms:EljuXdGSVz514VHnEopOSgvgdfhGbV61rzCep6HmWRlncmMfMBsLrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
    feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:EljuXTC3jF4LW7xtL5wF4QqG2gf2Euwd1bLeYR4NF25OBzHDXiR82A>
    <xmx:EljuXdXzc3YeITUDTnAbjVMWi3hg2bl3DCozjaEheJSfMKKtimpdhA>
    <xmx:EljuXXqPGW3MkXI-reo8Xh6LwhpIHkP_snN1qL9q17yUtD9ZbiJDcg>
    <xmx:E1juXd8JJwPrngx367JuTwcGIBRdiYknV9mO_H0r3qWJPc2ts3IvTQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id EBA2C30600FE;
        Mon,  9 Dec 2019 09:20:01 -0500 (EST)
Date:   Mon, 9 Dec 2019 15:19:59 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191209141959.GC11116@mail-itl>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
 <20191209033740.GA27394@mail-itl>
 <20191209063543.GA2473@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline
In-Reply-To: <20191209063543.GA2473@localhost.localdomain>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock

On Mon, Dec 09, 2019 at 03:35:43PM +0900, Suwan Kim wrote:
> On Mon, Dec 09, 2019 at 04:37:40AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Dec 09, 2019 at 11:01:30AM +0900, Suwan Kim wrote:
> > > On Fri, Dec 06, 2019 at 09:57:42PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > [  212.890519] usb 1-1: recv xbuf, 42
> > >=20
> > > This message is printed by receive error and before that, driver
> > > canceled URB transmission. we need to know the exact situation
> > > before this message.
> >=20
> > I've added some more messages and found recv_size is 0.
>=20
> That is the bug point. "size" is urb->actual_length that means
> amount of data actually received from device. And "copy" is
> amount of data received from usbip server. So, in this situation,
> vhci-hcd received all the data from usbip server even if there
> are more sg entries left. So, "copy =3D=3D 0" means vhci-hcd receives
> all data from the server and we should check "if (copy =3D=3D 0)" in
> for_each_sg() loop of usbip_recv_xbuff() to exit the loop and not
> to add error event.

That makes sense. But I think there is also another issue here: hang in
case of an error. Here it was EINVAL, but there are probably other
reasons why usbip_recv can fail, like network error or misbehaving
server. This definitely should not cause the client to fail this way...
And also, the actual error code is lost.

> > > Could you send me a longer log messages showing the situation
> > > before "[  212.890519] usb 1-1: recv xbuf, 42"?
> >=20
> > Sure, with added extra messages (debug patch below).
> >=20
> > [  131.397522] usb 1-1: num_sgs 0
> > [  131.406588] usb 1-1: num_sgs 0
> > [  131.410621] usb 1-1: num_sgs 0
> > [  131.411950] usb 1-1: num_sgs 0
> > [  131.413186] usb 1-1: num_sgs 0
> > [  131.414590] usb 1-1: num_sgs 0
> > [  131.417086] usb 1-1: num_sgs 0
> > [  131.418188] usb 1-1: num_sgs 0
> > [  131.419228] usb 1-1: num_sgs 0
> > [  131.420248] usb 1-1: num_sgs 0
> > [  131.457315] usb 1-1: num_sgs 5
> > [  131.457345] usb 1-1: size 42, copy 42 recv 42, recv_size 42, sg->len=
gth 16384
>=20
> Device sent 42 bytes data (size 42) and vhci-hcd received 42 bytes
> data from the server. vhci-hcd received all the data and It should
> exit the loop.
>=20
> > [  131.457359] usb 1-1: size 42, copy 0 recv -22, recv_size 0, sg->leng=
th 16384
> > [  131.457372] usb 1-1: recv xbuf, 42 size 42
> > [  131.458263] vhci_hcd: vhci_shutdown_connection:1024: stop threads
> > [  131.458318] vhci_hcd: vhci_shutdown_connection:1032: release socket
> > [  131.458431] vhci_hcd: vhci_shutdown_connection:1058: disconnect devi=
ce
> > [  131.460171] usb 1-1: USB disconnect, device number 2
> >=20
> > (...)
> >=20
> > If I add "if (!recv_size) continue;" there, it works!
>=20
> I think we should check "copy" not the "recv_size" because "copy"
> shows the amount of data received from the server.
>=20
> int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
> ...
> ...
> 	if (urb->num_sgs) {
> 		copy =3D size;
> 		for_each_sg(urb->sg, sg, urb->num_sgs, i) {
> 			int recv_size;
>=20
> 			if (copy < sg->length)
> 				recv_size =3D copy;
> 			else
> 				recv_size =3D sg->length;
>=20
> 			recv =3D usbip_recv(ud->tcp_socket, sg_virt(sg),
> 						recv_size);
>=20
> 			if (recv !=3D recv_size)
> 				goto error;
>=20
> 			copy -=3D recv;
> 			ret +=3D recv;
> 		=09
> 			/* Add here */
> 			if (!copy)
> 				break;
> 			^^^^^^^^^^^^^^
> 		}

This helps too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3uWA8ACgkQ24/THMrX
1ywZbgf9FTycdCtUFBi/l1GMqZA9bjUYsqLLhvVFPcKHlLEZhP8E49MMMGI+ng2B
7JpSnhg9otGfeQ6U1zXduyM17gG8e9XicNOoM8BvKOoiBZewlLDxE076hPAJTkuh
/flg8iIDhzKwDc6v3g1Nbzd61PdQStyJE89sBe6FZzn9hHf6aFQpLNRjb16FtmFU
vJrME+go/y0G/VpweVCh9K5DIdfRiwvBu0dxLhKjojkvToIjgLPMyQERyePSa+8q
6NCPvJAtCw0HNaCZovEhawSQjjBIfGE1ZjGG3YegDa5nJY0EPwDT04FaxuT9UI4T
hfePv5Sr9Eahqy4RiTa3ohtrv7sPdw==
=fz1Z
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
