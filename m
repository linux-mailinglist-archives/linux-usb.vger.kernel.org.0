Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A71D3DA328
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 14:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236993AbhG2M3r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 08:29:47 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:53471 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236868AbhG2M3q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jul 2021 08:29:46 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id C298F5C00BC;
        Thu, 29 Jul 2021 08:29:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 29 Jul 2021 08:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=6
        Fzowjt81NyaUnF7+p0gjmnL8GZGPKJTWRJZvkPp5zI=; b=t5hVYCm7duDUEFcP6
        3WwSXJaFRoCc4zRc3hX+btqmFT+DyvnNUJ4sRbdle+jxSXIETePlw0gzeAtwm7VE
        J93QgY4ygk6rKzrxizRV/eWXAs7wzsWQ3r+1BuMGr+zsmA31sxqe2Q+n5oNLKSgz
        Lcjkpn1v6Oh2IrIDqyyyILloohEKQ5Jg/tlPYyzqDBhuoazkDUcNIB7eXWjNjmOZ
        /FybOC5O3faOf6QR4tqcQADTrx93FxwlwAetYWnxqlSkr1xlAum1Znfo+siQOJgW
        r4jQ24UczLcLXJw+y+y3f0bje7j5cLuZCNYmfXyVO9m0gF4e0HLaQQnHXsl/ej7p
        O8sDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=6Fzowjt81NyaUnF7+p0gjmnL8GZGPKJTWRJZvkPp5
        zI=; b=keTZeIBGLbbkPxUAgv2Hafk98V4NlP0BFbHN01qov27OJTv6gMSe2QUc+
        IFZkF08DEyhC3eR8iRvWb1XH2SOZGXDkAMzUPVeNhrvbGvElg7LOnepHrhSCIsO5
        HRcPBMAjgP7p+nNKX8zZTZbIh1IKE0ydeAiLPRiyYNYbg/hzoFdhZ8BGWSN2INsd
        hUSO4BZz6XwQYXC0xOuBvwxafKd+t3lHS9ly3Wzc1rPSvQf/F4bJ/L+QQadmejAq
        dvD1pXksY2FQwN1MqtleVGsEF6vrXlajAkBX+/50mDHtt0vzhTgFN6KCqiv1QPaN
        HLNVcuuQG8saKYN4eEIBM7xpr0mFw==
X-ME-Sender: <xms:NZ8CYcTHIN6xmeVJDIxz2KudLbw5Df31dfSObHDLuecls6rmOGDYcA>
    <xme:NZ8CYZxCFXBFtotLLucdN_-xNvhxrRt9aib6X3dfJShzWNKsdfyHlvTdDywPuML_i
    7O1Vrc_M4L-NN3o4jU>
X-ME-Received: <xmr:NZ8CYZ3cFXoNAjp_k2G-9kQFI8NwPCtLHj6LHZb7PR35E8LzM_Mvqav0UZx1i71nKAloDj4u-zT9fbxOq-JGTDH-SkSkvA1QV3xb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrheefgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
    vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NZ8CYQBpI2vYE6tBctjdgHOeSu0jIs5CpwQdfJ13_XXCk4-aZ3n9bg>
    <xmx:NZ8CYVh5rXZtuNCPu20Ck2I4e5hUPXCM4qTYaKIDmCRVJ1ayTvZl5A>
    <xmx:NZ8CYcpW6BDZNjmSEyrmgorMC1RMlm3YQW4mrnQ7B94midOaS2RHvw>
    <xmx:Np8CYWUmGToKWIX0ePRHeX7V5kL5ugho4GkVhrBDebyZjBz2wP3iyw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jul 2021 08:29:40 -0400 (EDT)
Date:   Thu, 29 Jul 2021 14:29:38 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Rob Herring <robh@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 35/54] dt-bindings: usb: dwc3: Fix usb-phy check
Message-ID: <20210729122938.t432abpl2dm2p46c@gilmour>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-36-maxime@cerno.tech>
 <20210723221530.GA2684283@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210723221530.GA2684283@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rob,

On Fri, Jul 23, 2021 at 04:15:30PM -0600, Rob Herring wrote:
> On Wed, Jul 21, 2021 at 04:04:05PM +0200, Maxime Ripard wrote:
> > The original binding was allowing any combination of usb2-phy and
> > usb3-phy in the phys and phy-names properties.
> >=20
> > However, the current binding enforces that those properties must be a
> > list of usb2-phy and usb3-phy, with exactly one element, effectively
> > making usb2-phy the only value being valid.
>=20
> Huh? If 'maxItems' is not specified, then it's the length of 'items'=20
> list.

Even if minItems is set?

This doesn't really change anything to my issue though.

"""
 - phy-names: from the *Generic PHY* bindings; supported names are "usb2-ph=
y"
        or "usb3-phy".
"""

The YAML binding has

  phy-names:
    minItems: 1
    items:
      - const: usb2-phy
      - const: usb3-phy

which means that only usb2-phy is accepted (and possibly usb2-phy,
usb3-phy) but only usb3-phy isn't anymore, while it was valid according
to the original binding and used in multiple DT across multiple vendors
(arch/arm64/boot/dts/hisilicon/hi3660.dtsi,
arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi)

> > Let's rework the properties description to allow either one or two
> > element picked with values either usb2-phy or usb3-phy. The rest of the
> > tooling makes sure that we don't get any duplicate value, so this should
> > be what we want.
>=20
> Is it really valid to have only a USB3 PHY and what you want here? That=
=20
> would mean the USB3 phy also handles USB2, right?

IIRC that's how it works for the H6 at least yes.

Maxime
