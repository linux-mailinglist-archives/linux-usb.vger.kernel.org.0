Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CABF1602DA9
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 15:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiJRN6m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 09:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiJRN6l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 09:58:41 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F09CD01A6
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 06:58:31 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id CE4B95C00CD;
        Tue, 18 Oct 2022 09:58:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 18 Oct 2022 09:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1666101510; x=
        1666187910; bh=X/wECp80nHSAwicdnE6faeV61fT3eGyqEMX8Y/mVC0U=; b=j
        Vk6EcXP3v+//d4rBwkHX+/Q1w9nWVkd77YB5sfjrTKJ0qTlPldrgDHEbMxupq/yH
        E1+yzmr0f6gn60zojieffvYfbro8LmiiC+u/ZWHBK0AIqubzxjz1TWnDjvtJATr3
        OKc3vowia9dK6axzmNiLmsgFFrIppT17mOjruLo+SlJlah/kaNeYw47QexcK57UP
        0hFtw4fSWzPb0q9B2jc7kT6UEooSAYDclPxQ7rQ0iXp46nNgjYKbSd/boCIuamnB
        H2pIJC+qAI7rg+UtR4orO2M9K053BXM4bOraYTw9pNE0xKtTB3UVRnnNJVoUI1ID
        9VcCRH0RplHgGsCzhEFCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666101510; x=1666187910; bh=X/wECp80nHSAwicdnE6faeV61fT3
        eGyqEMX8Y/mVC0U=; b=UMOAIhffFMGO1/a4YrH15LtVGb47fwe7QmIY5/nQytys
        iiur/I0/Utb4NgHEWj7nrMH1YqWkIq9tkwBkOW5v8o2GMLznvX8aacFgqd/HlNR+
        VOHypvCjHcwKRr4V7KZJzpJXaIvqSC6rgLOkif2S1RwFySo8jnKHfmroct1wgCrc
        92PuAPAFJL6ShyVeJFiAl8am18TlIkww8obBPqV0CzQSApR0Rgqk4qwGMudWVosp
        j7loyxe5FDVmgfz3VydiFf96mWo6GJEEg4C6aCPNaQpPYkeLnGmp28kUmYjUOnae
        CHD91lFb3rawUUcy4pLbxPgfFs1SZGMeV2AcDFWvlQ==
X-ME-Sender: <xms:BrFOY3yOAIK-9-CKZNCIrZquzCk_VScijNG9qmi8jl8vEsKX387G2w>
    <xme:BrFOY_QuhgTBXi0RRmVF8_4soh6lbrJstH6b3gAd9dd4GldRIUXQ4rvQkYy4K1lCA
    CtfUPwFrfjXeQ>
X-ME-Received: <xmr:BrFOYxWOoVPbjyfRQjOVnnLUiDUNO3OilBx7xnCSq35xyFnawTkpL6eOyXKg1Dj-41C-YQG4qVRkWNUeIJTNiA6KmRznsWR5VzFH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:BrFOYxjJrzeSBXJtyZLdQYHaCQnIMBqF5GtLox1om0gGiqEOaC0cTQ>
    <xmx:BrFOY5Dz5xIKNpM1_Vsh417rLzPUAasPeckP_8YyQWJOYZbid6vcVQ>
    <xmx:BrFOY6KwPFvSLZmBTRWSINWOATLc5V0fJe_8ErHo6ndLsLHFC7Idqw>
    <xmx:BrFOY0_MfbGyVIf6ilasT5_jHmQJWb6SAsT9NrXOfaoLKdQIxgorsA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 09:58:30 -0400 (EDT)
Date:   Tue, 18 Oct 2022 15:58:27 +0200
From:   Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= 
        <marmarek@invisiblethingslab.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind
Message-ID: <Y06xBADJlWzGnKuF@mail-itl>
References: <Yw6r7FxMCCYSzfTk@mail-itl>
 <Y0i5h9Tx/1mxvh9A@mail-itl>
 <7eaf9861-5571-584f-b124-fa7076920090@linux.intel.com>
 <Y0nGsKipsnl3gtrp@mail-itl>
 <e56eb603-56b0-373b-b52b-c0098d669b73@linux.intel.com>
 <Y02iOUbJd8mFNLYd@mail-itl>
 <fc4ba1ad-3104-e538-ec63-713cda7c2984@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="c4K7bllHY/YqD2Kz"
Content-Disposition: inline
In-Reply-To: <fc4ba1ad-3104-e538-ec63-713cda7c2984@linux.intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--c4K7bllHY/YqD2Kz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Oct 2022 15:58:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind

On Tue, Oct 18, 2022 at 04:36:54PM +0300, Mathias Nyman wrote:
> Great, thanks, I'll turn it into a proper patch.
> Can I add your Reported-by and Tested-by tags to it?

Yes.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--c4K7bllHY/YqD2Kz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNOsQMACgkQ24/THMrX
1yyaEQf+OOL2Ir6iUXSr9ltevPPCNdyIyfI96n2YBhpADXUvcFDv4QViSzfY2ZQx
plXRnp7CLJIRewm5VTLxwOWNnlehzcAl6JkdKsr9NnC6JOiIODClhO2vR6V+gZzZ
3JAaX+3miGZUYqO0TG+zys8ICnhqMgCl7UZc/5gxnjITFY6S+U+NNchBeylee2H0
KB80hbJT3jrx47y2Go/CAhGexaY0jkcz+IjzeLXIfjiKpq12mGmVZQAY0oymWIsb
EMpDCVDUoWKgprt3CBB8vm/acQPzfAUnOz0Pz7dDBc4PJM4Wgi1NMCl+ZCy4rvG9
qRXs00aE2Sy7HidWw3M8X0SSJ++oBA==
=q6sS
-----END PGP SIGNATURE-----

--c4K7bllHY/YqD2Kz--
