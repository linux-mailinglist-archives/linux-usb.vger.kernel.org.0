Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D394E5FF493
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 22:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbiJNUaP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 16:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231431AbiJNUaM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 16:30:12 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E35E32BB1
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 13:29:58 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id EE56B5C00F8;
        Fri, 14 Oct 2022 16:29:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 14 Oct 2022 16:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1665779381; x=
        1665865781; bh=oWdiDV1qMkqt9iKqHFfgbiLOw2tpa3DOopfW26rGK/0=; b=F
        Gkin683pzFex9F7HMqUaJG8/OHufXgXfvg2fWhSydhPmbYhzRGsr/VLQKXi9n9gN
        YloDqa8/q3oxAmq/8L6/zCz2GHgAOSsP7GYJakHCpipqTtJSdvs1IFI+FFrY+T0j
        lEkrngH/Xme9+3OGkxHmqTMAxSKLoAFwOUfgHi20hXHqnF+nDvCRumw8JCZ6sPMe
        2ZSd4Xmwo4Cu/HvdAYyAdUIwn4YC9SXk3l0DrXkHOq2XLHqzvGyLsdS4J3rpDCRv
        ZphlsCeTUvMc+7y+EoDsiQEF8pO0mBAzUTyKyy3ZclkkNHsQTey0hnzWwjUFpGv+
        /j2css/vSxj4JuARArYOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1665779381; x=1665865781; bh=oWdiDV1qMkqt9iKqHFfgbiLOw2tp
        a3DOopfW26rGK/0=; b=gFGzQsrq8814zFXuUyQbP6VHKDTH8kRU5FTKQa90+0PT
        C/h7mwfhwBfmIfBuRALL1Z/TeLTuaU+P8wgWGoyUUsU6/CU9QI7GGOH002BbKCtO
        N1aUJCh1dxWLGmeUo3wV/RjDOdmCyOHcUEa/apju8+O2hOu7Rn/AljkZZaTJ8/Lj
        8yJU/laUBBQrmvKYuN+6VhgA0wfBuG+gk5+jn3WQrKK9wwZw9Wd0FbBJmgPN0yql
        +UUR4/CD99bSiPrSa0bRq7USRLZBQeTFWqQG0ldHK/3mKD5jC8OC6KQhehLevHd+
        KkQnwHOuwf5c+PnPi9D5yO/GKxplOC1jhG2W4O1xlQ==
X-ME-Sender: <xms:tcZJYyAH807_AdyY86Phdfl95_-VeJeSJ36N26UFKiT5CgZGJzhEZA>
    <xme:tcZJY8jkVo88mqraoZhGk3kzxL2EH-gwTElXOkuoZJaTahVxeJ9RL_k0MUlUCOe5s
    d4JYv_hh0GBSA>
X-ME-Received: <xmr:tcZJY1lxS2ngf1MCI46Jb4ijwX61svUQoSseXgfhDIo2-zhky-Ty6I6W8zM7aoR4kiYHdlXbSLdsxwtG44P6CJ_8ZVXp4iQUEaKX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekvddgudehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tcZJYwyl5I3owE4j6aRtS2mixmRxuCIk5OErymEQyhRZtWE8lm9AJw>
    <xmx:tcZJY3TS9qH1Kkt8KaISXEXcYVw5It6ami1z_jtyva7-9OqKQ52miA>
    <xmx:tcZJY7ZvAtNQsjiO4pLkWtH3wq0z3GQiDfRwSqD5cCSaw7As-jqd7w>
    <xmx:tcZJY6Po9ypjvrVrTbs7AXzRDErpD0AvESxt7OzKskW-0WxB8TQgVg>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Oct 2022 16:29:40 -0400 (EDT)
Date:   Fri, 14 Oct 2022 22:29:36 +0200
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind
Message-ID: <Y0nGsKipsnl3gtrp@mail-itl>
References: <Yw6r7FxMCCYSzfTk@mail-itl>
 <Y0i5h9Tx/1mxvh9A@mail-itl>
 <7eaf9861-5571-584f-b124-fa7076920090@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IQndFRygjsJAyDAP"
Content-Disposition: inline
In-Reply-To: <7eaf9861-5571-584f-b124-fa7076920090@linux.intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--IQndFRygjsJAyDAP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Oct 2022 22:29:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind

On Fri, Oct 14, 2022 at 07:02:13PM +0300, Mathias Nyman wrote:
> This whole software bandwidth issue should only be visible in Intel
> Panther Point PCH xHC (Ivy bridge)

It is indeed Ivy Bridge platform.

> Endpoints should be deleted from bw_table list, and xhci_virt_devices
> should be freed already before xhci_mem_cleanup() is called if all goes w=
ell.
>=20
> Normally endpoints are deleted from bw_table list during usb_disconnect()
>=20
> usb_disconnect()
>   ...
>   usb_hcd_alloc_bandwidth(dev, NULL, NULL, NULL);
>     hcd->driver->drop_endpoint()  // flags endpoint to be dropped
>     hcd->driver->check_bandwidth()
>     ->xhci_check_bandwidth()
>       xhci_configure_endpoint()
>         xhci_reserve_bandwidth()  // only for Panther Point
>           xhci_drop_ep_from_interval_table()
>=20
> But to avoid queuing new commands to a host in XHCI_STATE_DYING or
> XHCI_STATE_REMOVING state we return early, not calling xhci_reserve_bandw=
idth().

Indeed when I remove that early return in xhci_check_bandwidth(), the
crash is gone. What's the proper solution?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--IQndFRygjsJAyDAP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNJxrAACgkQ24/THMrX
1ywB6ggAltvG89scVW77fVJIUmoi28mJGR8Mh/ClPsrNamJONJq4SQzIIPeAFT4v
LFyZDSR/kLoVUY6SPAckGZ4fZgwjOpni3+LCNW2e+pEC6LmE8VwIAE9JwwjDnqhc
IMv5PmQ6BXHn4MkORZ/svrhLIK4jZ9lo5cOTRrCXvUw6USfmmMGfGDRJkdGa+gQ2
zW37HaUWB0PFvm9PR6Lv5/puFoA052wzvy75K9xS3v7gd7EaVorkNUwkIq1HvSNb
XbblaRecp4mYJyAIBEY49OSohRWeXp/XBp2OiaCog87tiCNaRjkFy0m4Fv6D6SxP
SRf106VKUZElc+wRkFtGSV8M16J7Sg==
=odQz
-----END PGP SIGNATURE-----

--IQndFRygjsJAyDAP--
