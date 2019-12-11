Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BF511A2EF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 04:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLKDUi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 22:20:38 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37535 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbfLKDUi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 22:20:38 -0500
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 99CFA2252B;
        Tue, 10 Dec 2019 22:20:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 10 Dec 2019 22:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hmeOdr
        QSQl9nAraJEL7Ml4gGwxvXv/I84+b5imrpO3U=; b=g9czpGvPGkwKVE/dT9fL3E
        dKW8jzu0VrA8Rwt4n/WaADhb8sYTFVj7Bt62SDAMoaoUpGWJd5rl4JvPIfQbpgoy
        WNsJzH/Yy9vk7XlpSc05EqICeNZLAyoTcLFwOvAij7HTGlnEAV/wwMdCsXzWoO1r
        S03UrQZfYpcd9dkHMPrukznGEVafKDvN0CaduQjKUQSVHBJtP2UHvBE9oz4qPedb
        Hg248f6+fDZ/bMjq1WuDIDqm/OzAkPiPjqQFmUCY9heVnlqpZGfEloq9i+BJBVLi
        pxdPAWWYsnoCOfR3RtHguYAqbe4aLKACx7Tzb7ce0Wesk72Xxsp+CuzqiUKzRP1w
        ==
X-ME-Sender: <xms:hGDwXS5qfhduUix7u0PsmCKyceQUiQP8AloPwOFPnoq5FV7xLRZerA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelgedgheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
    feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
    gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:hGDwXVP5jT4I6UxNj_FhAPmSZOp8m3vpkngHHMnyp5DwauKK6FzojQ>
    <xmx:hGDwXYuJbWmW-1AjS0bqrY7ZovC6LHHER0-QRG3WlUuAtlJ6NOEkHg>
    <xmx:hGDwXQaRijJCJ74qnZhYtuUDEuPZ0R5Xkn5mvla9MFrk3OwHm_84iA>
    <xmx:hGDwXfJHKR_p_KaPJ-cZVYWzr5QOlcfephp0btjUQ0SCGyCqyhjaJQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
        by mail.messagingengine.com (Postfix) with ESMTPA id C0C9D30600D7;
        Tue, 10 Dec 2019 22:20:35 -0500 (EST)
Date:   Wed, 11 Dec 2019 04:20:32 +0100
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191211032032.GL11116@mail-itl>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
 <20191209033740.GA27394@mail-itl>
 <20191209063543.GA2473@localhost.localdomain>
 <20191209141959.GC11116@mail-itl>
 <20191210142535.GA4489@localhost.localdomain>
 <20191210153221.GG11116@mail-itl>
 <20191211030754.GA5190@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OX2aLCKeO1apYW07"
Content-Disposition: inline
In-Reply-To: <20191211030754.GA5190@localhost.localdomain>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--OX2aLCKeO1apYW07
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock

On Wed, Dec 11, 2019 at 12:07:54PM +0900, Suwan Kim wrote:
> HCD should giveback URB to driver calling usb_hcd_giveback_urb().
> But in the case of transaction error, vhci_recv_ret_submit()
> terminates without giveback URB. So, I think the error path in
> usbip_recv_xbuff and usbip_recv_iso should unlink URB from ep and
> insert proper error code in urb->status that indicates error
> status to driver and handle giveback URB to driver.
>=20
> Then hub_irq doesn't need to flush error URB.
> That will be helpful to graceful connection shutdown.
>=20
>=20
> static void vhci_recv_ret_submit(struct vhci_device *vdev,
> 				 struct usbip_header *pdu)
> ...
> ...
> 	if (usbip_recv_xbuff(ud, urb) < 0) {
> 		urb->status =3D -EPIPE;
> 		goto error;	// goto error path
> 	}
>=20
> 	/* recv iso_packet_descriptor */
> 	if (usbip_recv_iso(ud, urb) < 0) {
> 		urb->status =3D -EPIPE;
> 		goto error;	// goto error path
> 	}
> ...
> ...
> error://error path
> 	spin_lock_irqsave(&vhci->lock, flags);
> 	usb_hcd_unlink_urb_from_ep(vhci_hcd_to_hcd(vhci_hcd), urb);
> 	spin_unlock_irqrestore(&vhci->lock, flags);
>=20
> 	usb_hcd_giveback_urb(vhci_hcd_to_hcd(vhci_hcd), urb, urb->status);
>=20
> 	usbip_dbg_vhci_rx("Leave\n");
> }

Yup, that works! Now the error is handled gracefully instead of hanging.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--OX2aLCKeO1apYW07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3wYIEACgkQ24/THMrX
1yxq9Af/fv/dD+cEO7CvwjD56Ij4fu1Y1uYWZvz+L1pk4vIyYX2dr2V3fgbVxuxN
6eX/TfxDgzxxaeErHAQRYm1VYAJW1ByaR1yWJjdX0hGMgGMR7Vj6Ms+cmbfncE0G
fUMpn7uiIj4wxMoe2oOFzYzcT+w4nwbWMH6fNmJniUPdDDPE/e1CN/CsMXY2xyy+
UsQVRFqopVA+RagXOivvAZSAFUIrxQabICrdSWKxh2oLipgKSMkmIJE73ZAENzuq
FI3Qq6R7diNDsHbSVw5Cd4fkjTMOhtk3J6q7J7e/emfROa04qmvHeXguCLg8rqbQ
jtPSTLlhNzv02lWFAQqFqp9ip4IfvQ==
=+MI9
-----END PGP SIGNATURE-----

--OX2aLCKeO1apYW07--
