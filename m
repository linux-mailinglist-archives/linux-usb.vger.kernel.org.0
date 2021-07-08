Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326A33BF570
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jul 2021 08:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbhGHGUf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jul 2021 02:20:35 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59823 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229658AbhGHGUe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jul 2021 02:20:34 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id E4E1D5C00E6;
        Thu,  8 Jul 2021 02:17:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 08 Jul 2021 02:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=qJr6/XutY8X8NyuozIa9nkcxlar
        Nm26YSQ/XYcf/t9k=; b=D1oRuwySivjQi+Dk2EWquKLlcTCHvj5Tf6AMTalQTzA
        FIMwTxDHOYT3QfKgYKpYLNvhtpcwzwkXoiMwn+4fYfrUWkeY97CfBAkzXYgCNnmz
        mX8VvvAN2gl59RLUnl/CQuHx94fGzbRKRwWVJKDQz1uqAbCJAXA0f26MRdt5CnfE
        gezGRxyPct42k6ogjmz3a3oGQylt4yaXrhsdH9fOOF3WI6FMpWsIU0R8VkB1pP67
        15yNiIhe0X3RQz+u5KXopddlb562uzIfRsq68y/zbO1gIkgLq019xGGwCDf87Cqv
        vdd1r65goPWBFsXQKiDzQ6yJRGqRZy7J/INQugRPvqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qJr6/X
        utY8X8NyuozIa9nkcxlarNm26YSQ/XYcf/t9k=; b=tiX1ietj3mIN6pfI40vVu2
        y/fSjUTiLZp2bqG/t8X4JCAzzPZkHqaXSfKuK8rwLe/IXsfkCO51o25H2Lo7TIlv
        oWgaqw/CgHEuBtOuNTsOV8R3jSxm4GsKeH64mMMSOcva+4wm7sn8eS/RcmLDjkKt
        AQXm5tk74ktpeDgTvnaANNnMA/mkp1MvVofvcL/YXpTJEYFio+hG5XJjSG11wgsV
        uqTSSJFKZStI5jrrI31gM3vWysmAG9+GhH4B3JVn5/tp1OI7h7bN3gtCLdWzpodT
        3wWxe63RHdavzc6Lr05mZwZVpyM6QvXMCa2CD+0lkZYM0WnBXO6tzv7CHkcvYAqg
        ==
X-ME-Sender: <xms:kJjmYP9KLhEZR1HUpuvhxS0Jx_7zlJhHoCxoZ1grLUiigmcqbBNtXw>
    <xme:kJjmYLskIXWOc_99-nvv6ubGnqnUbdZ4RTu8euZNBKtx3jEsXRr6X073Q0-ApUZ2V
    8bSyPjt6UFXOQ>
X-ME-Received: <xmr:kJjmYND94KN_aZNjjO-1OSpDWgQurIaz7ET4bkR2GLemRNh0JoD99KvntwOIV8dEkZLPNV_M3nCNgEslI8DReQVt1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdefgdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeejkefhhfegtdefueevgfduueehtdeiiefhjeefteejkeefhe
    ejfeeuuddttdffheenucffohhmrghinhepvghlmhgvlhgvtghtrhhonhhitghsrdgtohhm
    pdgrmhgriihonhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:kJjmYLddeItSSoGyn8Zceu3QIRRsa8jUomC31BW2o2PwjAMrG3cZfA>
    <xmx:kJjmYEMVatkEyUNTVUxczXcpFiJOCCLIecIm6j6tZV1U2rgU5dpkpg>
    <xmx:kJjmYNnb7xWxLJGzTWs0Ogj758aH4z8goD_uuraozqFFfAFLgC_h2g>
    <xmx:kJjmYNZnW1YDcCGA-axzKQb9LoU7Rss8HxZ36PFcH_qwEsMV70uDrA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 02:17:52 -0400 (EDT)
Date:   Thu, 8 Jul 2021 08:17:49 +0200
From:   Greg KH <greg@kroah.com>
To:     Jeffrey Walton <noloader@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CH341 driver and the 5.4 kernel
Message-ID: <YOaYjVXvo3kacgg3@kroah.com>
References: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
 <CAH8yC8nqqwcn0xXgKpzum-4YHkaX+YAMdVfaL_2yHyuNteU1BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH8yC8nqqwcn0xXgKpzum-4YHkaX+YAMdVfaL_2yHyuNteU1BA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 07, 2021 at 05:48:48PM -0400, Jeffrey Walton wrote:
> > I'm trying to track down the cause of some garbage in a response when
> > using an ELM327 (https://www.elmelectronics.com/ic/elm327/) with a
> > CH341 serial controller.
> 
> To follow up on this...
> 
> Here's the device I am working with: OBD2 Scanner Adapter OBD2 ELM327
> USB Cable Car Code Reader Diagnostic Scan Tool v1.5,
> https://www.amazon.com/gp/product/B0897G6BMZ. It has a controller for
> interfacing with a vehicle's OBD II, and a CH340 for USB
> communications.
> 
> I contacted ELM Electronics Support [1] about the garbage I was
> seeing. I thought I may have the serial port misconfigured in a subtle
> way. Support wrote back that they did not make the OBD controller in a
> v1.5. They make, among others, v1.4b and v2.0 [2]. It appears the OBD
> chip is a knockoff.
> 
> I also think I tracked down the vendor for the CH340. It is a company
> called WCH. It looks like they provide a GPL'd driver for Linux [3]
> and name the driver ch34x. The driver is a lot different than the one
> provided by the Linux kernel [4].
> 
> What I don't know is, if the WCH serial controller is another
> knock-off. If it is an ill-performing knock-off, then that may explain
> the problems using the existing Linux driver. Using the WCH driver
> probably explains why things work under Windows. The WCH driver may
> fix the problems I am seeing under Linux.

If you could try the latest 5.13 kernel release to let us know if that
solves the issues for you or not, that would be great as a lot of work
has recently gone in for these "odd" ch340-like devices.

thanks,

greg k-h
