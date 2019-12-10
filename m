Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D149118C91
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 16:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbfLJPc0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 10:32:26 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:53061 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727320AbfLJPc0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 10:32:26 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id DBD2F156C;
        Tue, 10 Dec 2019 10:32:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Tue, 10 Dec 2019 10:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qh2n53
        HY+e2Jt32vxm6PPZwxORGMb5LjVzTap0AG2sU=; b=g/SIHGmjf4Ok0F1uI5t8mr
        B7Gj+5uyFXpSugBaHjmgh0LJBR5iQGS/ZUCTKyPb9dv32U1I5x4jT46Xap9yHzev
        47wSd8sDCB14GJ9EJ88n1vyqOLXbQ+zPX9OWeUpzVaI4KZM0ZBs7rcpiZ5zYLZEN
        9s/Yepj9yeA/Q6JKAyobsi+LMb6lMH2tSndsaO23+aXsmT6RsSohGju7quAL5vUW
        j/yq/KJVETR/JhVhujejq/kxuhVsBOc1+ooihwPSy0afs7rgge0PzfL5Crz8/Hn0
        zdWEheyzVYQ6BAqlShStIrL13JkG0bRwss615sFXfSOX4mx4TxsoT+xgiQBl9mJA
        ==
X-ME-Sender: <xms:iLrvXXTjrFS8BaOCWHswSJ-pho47EvtpROcnsq7IrL2jcX4D6KjTgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
    feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:iLrvXQobksN7qoc0voNfi9RGzLBM6Lz-QLcHureGKP0Ul_v2hMaWqQ>
    <xmx:iLrvXcPea9bChYKSWdaKslE7C6piZBK4CKcxWQSP2J4z7B7Se7U9Gw>
    <xmx:iLrvXeySJsBsbuRU2ZWXHGuR3WpSHWSved--cXjF3JV3AKiEgwvaxQ>
    <xmx:iLrvXfkHaMBQCSDmCvi8gTHSnTq5zapdWGxHTt_ufsK089XFBVtrSQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9DAAE8005B;
        Tue, 10 Dec 2019 10:32:23 -0500 (EST)
Date:   Tue, 10 Dec 2019 16:32:21 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191210153221.GG11116@mail-itl>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
 <20191209033740.GA27394@mail-itl>
 <20191209063543.GA2473@localhost.localdomain>
 <20191209141959.GC11116@mail-itl>
 <20191210142535.GA4489@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XRI2XbIfl/05pQwm"
Content-Disposition: inline
In-Reply-To: <20191210142535.GA4489@localhost.localdomain>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--XRI2XbIfl/05pQwm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock

On Tue, Dec 10, 2019 at 11:25:35PM +0900, Suwan Kim wrote:
> On Mon, Dec 09, 2019 at 03:19:59PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Dec 09, 2019 at 03:35:43PM +0900, Suwan Kim wrote:
> > > On Mon, Dec 09, 2019 at 04:37:40AM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Mon, Dec 09, 2019 at 11:01:30AM +0900, Suwan Kim wrote:
> > > > > On Fri, Dec 06, 2019 at 09:57:42PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > [  212.890519] usb 1-1: recv xbuf, 42
> > > > >=20
> > > > > This message is printed by receive error and before that, driver
> > > > > canceled URB transmission. we need to know the exact situation
> > > > > before this message.
> > > >=20
> > > > I've added some more messages and found recv_size is 0.
> > >=20
> > > That is the bug point. "size" is urb->actual_length that means
> > > amount of data actually received from device. And "copy" is
> > > amount of data received from usbip server. So, in this situation,
> > > vhci-hcd received all the data from usbip server even if there
> > > are more sg entries left. So, "copy =3D=3D 0" means vhci-hcd receives
> > > all data from the server and we should check "if (copy =3D=3D 0)" in
> > > for_each_sg() loop of usbip_recv_xbuff() to exit the loop and not
> > > to add error event.
> >=20
> > That makes sense. But I think there is also another issue here: hang in
> > case of an error. Here it was EINVAL, but there are probably other
> > reasons why usbip_recv can fail, like network error or misbehaving
> > server. This definitely should not cause the client to fail this way...
> > And also, the actual error code is lost.
>=20
> I agree. I have been taking a look at it and trying to reproduce
> the same issue on my machine. I guess race condition between hub
> irq thread and driver (vhci_urb_enqueue or hcd?)
> But I'm not sure...

I've tried it some more time and one time I've got a traceback pointing
at lock_release() called from vhci_urb_dequeue, not lock_acquire(). This
get me thinking it may not be deadlock on a spinlock, but some infinite
loop. Looking at the source, I think it's about usb_hcd_flush_endpoint
looping indefinitely because vhci_urb_dequeue() exit early on this:


    spin_lock_irqsave(&vhci->lock, flags);

    priv =3D urb->hcpriv;
    if (!priv) {
        /* URB was never linked! or will be soon given back by
         * vhci_rx. */
        spin_unlock_irqrestore(&vhci->lock, flags);
        return -EIDRM;
    }

Adding a print there confirms it.

And I think it's because of vhci_recv_ret_submit():


    spin_lock_irqsave(&vdev->priv_lock, flags);
    urb =3D pickup_urb_and_free_priv(vdev, pdu->base.seqnum);

// ****** priv freed here

    spin_unlock_irqrestore(&vdev->priv_lock, flags);

    if (!urb) {
        pr_err("cannot find a urb of seqnum %u max seqnum %d\n",
            pdu->base.seqnum,
            atomic_read(&vhci_hcd->seqnum));
        usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
        return;
    }
   =20
    /* unpack the pdu to a urb */
    usbip_pack_pdu(pdu, urb, USBIP_RET_SUBMIT, 0);

    /* recv transfer buffer */
    if (usbip_recv_xbuff(ud, urb) < 0)
// ***** exit early here
        return;

    /* recv iso_packet_descriptor */
    if (usbip_recv_iso(ud, urb) < 0)
        return;

I'm not really sure what should happen, but I think some cleanup in case
of usbip_recv_xbuff() failure is missing. And probably in case of
usbip_recv_iso() failure too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--XRI2XbIfl/05pQwm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3vuoUACgkQ24/THMrX
1yyOBQf/Xm0i9d7IFgOnT2sNM5TqHFHTW9EqfDu+g6cVcJaudGmC+EyV9/9bmQ0n
6ATRl+dt7gJtoqBbyx4/E1sggbsiYDCUFaPGaZHR7pR7Nm/suAZEX71o6Mchq3sI
jHacZUjWTb+v0JFvqvBfFz2OHfvnHONpF7PWE52dWsxyTsKXFG2UIMrEfg5A9dxU
VnC3XApbmMHuovrYbmJvC3KdsbizEpIQ7kpY3mvyD9ZvQ5yvx/9e3DXHu68Q4LAR
fR/l4J37JT0ReumdQLw1U+XAQhGlVnyRw76xeb5J636hEPJFN1+myFYjjW0zd68s
ON09X0al5gVWxToYS4j0rgD3JiDwlA==
=9vOQ
-----END PGP SIGNATURE-----

--XRI2XbIfl/05pQwm--
