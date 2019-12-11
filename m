Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D61E11A97E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 12:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfLKLBg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 06:01:36 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49783 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726119AbfLKLBf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 06:01:35 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 674457B6;
        Wed, 11 Dec 2019 06:01:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 11 Dec 2019 06:01:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=minl+l
        j6gld7DBVnKHwWMwpuPw+xvOiIt1WxNBoig3M=; b=bk5htCbLG0E6Q8iY6O6HW1
        zgj2AupEN9Ny+SN6mof37lAGSTd/1noqUe+SbKfwOKwBAemAtLp8lCY7ZM5oP4p9
        9Yg6jAI9sr5KOeXcV3L5banXMwPkB+DqFYujd/fYFcUYc7iISlOMzB05/C9ULRpt
        /rneYLswlI0LI2UuNzPt5NVZg4F9PXFwOR4xMBFWxeLkMH0yBq/IxR0cOj1EtxbJ
        azpu/F5itf6E8kSsiVMYuVNFSwNxHJqcLx+bS93R3MLaIocwN34VsxmYknbdkAXL
        jyIw4+V0i14U/Hqd2pSPOUjZs9Fj6iWsa7BlEDsGKYZdqCMR/AnmX3jIAb1nfUsA
        ==
X-ME-Sender: <xms:jczwXYOzDt6eLZg8-Lm339thiVYYtQGywSP8d4pLyjVMZwxnchL0OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelhedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
    feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:jczwXZCAmyqXSQ8qSIQo58cgoRjChIoFkwZ-Z_w6fomUu1HY2Da1AA>
    <xmx:jczwXfJ4UbKo81-JvhB8hkrVsyzpohk67bXp8xnm7hGqcwQ0fxWlgw>
    <xmx:jczwXSPm2gi6JwWl_IN8iuoYgompiJhWM8Ia1UrgkniEVDRGSl3_nw>
    <xmx:jszwXaKnYvD9WGGhZ61IKJjnD9fc4uZJxz9U8DuKWWTR6w9bP8yQMg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2215030600D4;
        Wed, 11 Dec 2019 06:01:33 -0500 (EST)
Date:   Wed, 11 Dec 2019 12:01:30 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191211110130.GN11116@mail-itl>
References: <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
 <20191209033740.GA27394@mail-itl>
 <20191209063543.GA2473@localhost.localdomain>
 <20191209141959.GC11116@mail-itl>
 <20191210142535.GA4489@localhost.localdomain>
 <20191210153221.GG11116@mail-itl>
 <20191211030754.GA5190@localhost.localdomain>
 <20191211032032.GL11116@mail-itl>
 <20191211062705.GA11367@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pFpMklMRdxwSC3Yi"
Content-Disposition: inline
In-Reply-To: <20191211062705.GA11367@localhost.localdomain>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--pFpMklMRdxwSC3Yi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock

On Wed, Dec 11, 2019 at 03:27:05PM +0900, Suwan Kim wrote:
> On Wed, Dec 11, 2019 at 04:20:32AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Dec 11, 2019 at 12:07:54PM +0900, Suwan Kim wrote:
> > > HCD should giveback URB to driver calling usb_hcd_giveback_urb().
> > > But in the case of transaction error, vhci_recv_ret_submit()
> > > terminates without giveback URB. So, I think the error path in
> > > usbip_recv_xbuff and usbip_recv_iso should unlink URB from ep and
> > > insert proper error code in urb->status that indicates error
> > > status to driver and handle giveback URB to driver.
> > >=20
> > > Then hub_irq doesn't need to flush error URB.
> > > That will be helpful to graceful connection shutdown.
> > >=20
> > >=20
> > > static void vhci_recv_ret_submit(struct vhci_device *vdev,
> > > 				 struct usbip_header *pdu)
> > > ...
> > > ...
> > > 	if (usbip_recv_xbuff(ud, urb) < 0) {
> > > 		urb->status =3D -EPIPE;
> > > 		goto error;	// goto error path
> > > 	}
> > >=20
> > > 	/* recv iso_packet_descriptor */
> > > 	if (usbip_recv_iso(ud, urb) < 0) {
> > > 		urb->status =3D -EPIPE;
> > > 		goto error;	// goto error path
> > > 	}
> > > ...
> > > ...
> > > error://error path
> > > 	spin_lock_irqsave(&vhci->lock, flags);
> > > 	usb_hcd_unlink_urb_from_ep(vhci_hcd_to_hcd(vhci_hcd), urb);
> > > 	spin_unlock_irqrestore(&vhci->lock, flags);
> > >=20
> > > 	usb_hcd_giveback_urb(vhci_hcd_to_hcd(vhci_hcd), urb, urb->status);
> > >=20
> > > 	usbip_dbg_vhci_rx("Leave\n");
> > > }
> >=20
> > Yup, that works! Now the error is handled gracefully instead of hanging.
>=20
> Marek, Could you test if it works too?

Yes, this seems to work too.


> Regards,
> Suwan Kim
>=20
>=20
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index 33f8972ba842..19a807e398eb 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -78,11 +78,11 @@ static void vhci_recv_ret_submit(struct vhci_device *=
vdev,
>=20
>         /* recv transfer buffer */
>         if (usbip_recv_xbuff(ud, urb) < 0)
> -               return;
> +               urb->status =3D -EPIPE;
>=20
>         /* recv iso_packet_descriptor */
>         if (usbip_recv_iso(ud, urb) < 0)
> -               return;
> +               urb->status =3D -EPIPE;
>=20
>         /* restore the padding in iso packets */
>         usbip_pad_iso(ud, urb);

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--pFpMklMRdxwSC3Yi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3wzIoACgkQ24/THMrX
1ywwRAf9HX8Gj3ZD8QzcbD7VQD0ylnmqtveWzSvlvLpuyOxwvLGCt8o7fpiGxeAB
3K9vTZs2Z4rrEC4FVwcuK6Jyzrlh02lrbo27TF8UQU0GAw0rGIUyGd1v3KTe09i/
aex2TG7yrxKacWXfRyrHDeeGjVsNfObJzJu+j0rQAmqBBxxRmTKUByc515Nn1OhY
WVGqSUFsKdbnW8wCyYUX/EXkTAegOdLnQAmG8v3qE0vx0rbP8lihp+e/P3jGoj1/
vIr8x9DCTOK+0bc67YzGNywT12gphzHWHLmTggPr1jdcxd8n6nhBLdnrAQP0SJ9J
UCRWbjZQp2MyHmX32AcN4vJLi752UQ==
=rhkm
-----END PGP SIGNATURE-----

--pFpMklMRdxwSC3Yi--
