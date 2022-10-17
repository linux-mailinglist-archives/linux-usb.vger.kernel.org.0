Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99115601686
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 20:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbiJQSnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 14:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiJQSnM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 14:43:12 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1E10733EB
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 11:43:11 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 49AE85C015C;
        Mon, 17 Oct 2022 14:43:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 17 Oct 2022 14:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1666032189; x=
        1666118589; bh=BKXjtqsy5tSVY9vQM8jxa3EuMKGPG9t1h0kU6rWdjvE=; b=a
        GnlBoQQUQMWNyVFB5OsR4nrhECMxdEXyJkBTFg+nDUk5+ECXbrL72nr5cQwhBDOl
        cCagt2v/J+3h602dWxmU8pU6KdykNIxFjyPJOSHtzQMVMcWncyBMGn0UXMrW6cwI
        frP1PTK8llaEcMlUy3Dy16FanmM0EYAnz2yQA61lcWagVgIWK1+tJGrXaQ394C8U
        JILEPRyOHOy0zrFJ9lCQFimfY+egfVq7yJR5FAkDEyXuLoXPCg75ecpbQrh1v2RH
        6TydXh00l23WCTNF4ZOuWn1SO8rbJnW3lNXhMD3zRyhAu+2K6jA6RNqRYbgoauNv
        Tcbkfj0NgP/dyvoTBwzfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666032189; x=1666118589; bh=BKXjtqsy5tSVY9vQM8jxa3EuMKGP
        G9t1h0kU6rWdjvE=; b=LyqhLGyuZJTc67zYBpgxf6vS1TCgD85SsXW9lfdUyoOp
        Nv7SrWMX6vMLgg2HsgDPP/lCUJTncHG/Ew8tiLg8nD27bHqUgQcHWwRTLqDMrAKQ
        gmxQA1OenAEsSsgXssOhaboZVHr0wczN57snBQKj8wcRm/PiE3f1GIfutKOYfoyV
        G6Xk3o67IgKF8aRT384Z9cHrQALuNldF6vuMLiS6OpFFATwI9jZMT9cVooEYyJkx
        flaCMCYF3DIizq26jdM1I0MmdvNPcT5bnjNfz7M21+4M30DdnPAqoVj3dZ1/BEi8
        32BwopbJjWSaPQFzAep0hzLvjkRIobFQ9C8rt0xQnw==
X-ME-Sender: <xms:PKJNY0MDsD068WmeQUxqP5XKPSTVN_hedJIW-YHAgECcRkNFbATwhQ>
    <xme:PKJNY6-xmcq_8R1XCTwnlWCFQNBtu_JpsxrNxWst3B29sorLQuK_kfB_060OcaR7l
    zW8mhEGaAyL8g>
X-ME-Received: <xmr:PKJNY7Q5yN_gbayhXyKhQ0JH3JWBnFB7XjsYUiqZhKpJBxVY1iQEol0z7dgW7pMI-ILT-7WOVBC6oCHis98VvvcoF5BIvUAqcx_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekledguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PKJNY8u167r_lNclYUKx72VPN66MLvUTHNd2HINOsZicM4jr3kcaMw>
    <xmx:PKJNY8eNGDnOfs979-BKfCl7etnyFAo4ej5A1MthqbUzvvxZOO42Yg>
    <xmx:PKJNYw3ELyWc1B5LBSiTSebpnlOX2bwnztxj5_TfOLcztTOerklOzQ>
    <xmx:PaJNY2rLOmLSgB18eLucnSg-WExtyeZRM2N3GSM1LNAQT3a7mkGopA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Oct 2022 14:43:08 -0400 (EDT)
Date:   Mon, 17 Oct 2022 20:43:04 +0200
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind
Message-ID: <Y02iOUbJd8mFNLYd@mail-itl>
References: <Yw6r7FxMCCYSzfTk@mail-itl>
 <Y0i5h9Tx/1mxvh9A@mail-itl>
 <7eaf9861-5571-584f-b124-fa7076920090@linux.intel.com>
 <Y0nGsKipsnl3gtrp@mail-itl>
 <e56eb603-56b0-373b-b52b-c0098d669b73@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Y8nKPaEzW/fT2Eyc"
Content-Disposition: inline
In-Reply-To: <e56eb603-56b0-373b-b52b-c0098d669b73@linux.intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--Y8nKPaEzW/fT2Eyc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Oct 2022 20:43:04 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind

On Mon, Oct 17, 2022 at 07:12:36PM +0300, Mathias Nyman wrote:
> On 14.10.2022 23.29, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Oct 14, 2022 at 07:02:13PM +0300, Mathias Nyman wrote:
> > > This whole software bandwidth issue should only be visible in Intel
> > > Panther Point PCH xHC (Ivy bridge)
> >=20
> > It is indeed Ivy Bridge platform.
> >=20
> > > Endpoints should be deleted from bw_table list, and xhci_virt_devices
> > > should be freed already before xhci_mem_cleanup() is called if all go=
es well.
> > >=20
> > > Normally endpoints are deleted from bw_table list during usb_disconne=
ct()
> > >=20
> > > usb_disconnect()
> > >    ...
> > >    usb_hcd_alloc_bandwidth(dev, NULL, NULL, NULL);
> > >      hcd->driver->drop_endpoint()  // flags endpoint to be dropped
> > >      hcd->driver->check_bandwidth()
> > >      ->xhci_check_bandwidth()
> > >        xhci_configure_endpoint()
> > >          xhci_reserve_bandwidth()  // only for Panther Point
> > >            xhci_drop_ep_from_interval_table()
> > >=20
> > > But to avoid queuing new commands to a host in XHCI_STATE_DYING or
> > > XHCI_STATE_REMOVING state we return early, not calling xhci_reserve_b=
andwidth().
> >=20
> > Indeed when I remove that early return in xhci_check_bandwidth(), the
> > crash is gone. What's the proper solution?
> >=20
>=20
> We could probably just delete the endpoint from the bw list when freeing =
the device and
> endpoints. Currently we just print that "endpoint x not removed from BW l=
ist!" message
>=20
> does the below help?

Yes, this helps!

xhci_drop_ep_from_interval_table() does few more things, but I assume
this all doesn't matter at the xhci_free_virt_device() time, right?

> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 9e56aa28efcd..2adc0c2b470c 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -894,10 +894,12 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, i=
nt slot_id)
>                  * We can't drop them anyway, because the udev might have=
 gone
>                  * away by this point, and we can't tell what speed it wa=
s.
>                  */
> -               if (!list_empty(&dev->eps[i].bw_endpoint_list))
> +               if (!list_empty(&dev->eps[i].bw_endpoint_list)) {
> +                       list_del_init(&dev->eps[i].bw_endpoint_list);
>                         xhci_warn(xhci, "Slot %u endpoint %u "
>                                         "not removed from BW list!\n",
>                                         slot_id, i);
> +               }
>         }
>         /* If this is a hub, free the TT(s) from the TT list */
>         xhci_free_tt_info(xhci, dev, slot_id);
>=20
> Thanks
> -Mathias

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Y8nKPaEzW/fT2Eyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNNojgACgkQ24/THMrX
1yzJ5Af/ZEsPH+vSSxA2hBfc71hyD/LSRJ9aBRrQnVxQm76a+LGsp6liF0HkSnkm
6nF9eSDjKxJrn9UsT5FoNpy6R107+k6C5XiF1iBi8se5hm5kqbGHMv46c4IoSB+c
IqFKwDZMLIYycBzQ1z59chADHXGNC5fsuOVAhUs5zx4Ql4E1dUtQ43HOV8HqqnYq
omgudve/hRY+beMaTdQ3abxOYRZQ1hzJNHp4RHcLrgJv1bPE7UObY0uu+/j9Hitw
mJdz2gaafEN/stxsxbo70MF01i/u8drsQgYWKkqP6qIMhjimSEFJWlG83vIf9HLw
YXd9XxRcRjpMWYKNfT+/P1ndXKlnkw==
=q/ms
-----END PGP SIGNATURE-----

--Y8nKPaEzW/fT2Eyc--
