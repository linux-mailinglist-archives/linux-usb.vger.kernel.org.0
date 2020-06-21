Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079A62029E3
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 11:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbgFUJ43 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jun 2020 05:56:29 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:41187 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729573AbgFUJ43 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jun 2020 05:56:29 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id A1911406;
        Sun, 21 Jun 2020 05:56:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 21 Jun 2020 05:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=y4E5oBAv5Q20+cicR81onmu6k8a
        42LDADTOKeufsf6E=; b=r84xF5L8zJsFULOm5QekLpz6H0AtN4JbkCF+j7lytZu
        W0MhA6ftp0kKttTDSZT1scD9HpbV92BsWJ+LiZQgPODzAnnVHMT26wvo8k0sJJHA
        ubNbGtPj+6DNRNs2EJZIWjoh/M8dEpfYT0+BEiQ0s2C3CD9Jdj5IeMVpUaZbd+Ha
        W8KPZ4fF57kvzUe6ly+Cq7f82S7ocSAmzZYNiiCWqfRIB7QBlINeO0bEii7jXxya
        wLRvyB+ZnNaZa4rB4+2RfSmrmN2tfYIfMXlQYkv+HccFhKLjBFzTYLTzsIIFMqxj
        XlLgv1XbYg3DCRHb6wy5Jdz8bJCgdXv44JERCpeNAng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y4E5oB
        Av5Q20+cicR81onmu6k8a42LDADTOKeufsf6E=; b=Td6R3bWcBODQHjYOCRrpV8
        hOToSWE79bM35JmpzWOr6ACfmYOjb7AmkFOBLtccXna0OPrfKFh02n9BUQiJqKGL
        vCx89kVJMKSFR/9wMV/OZWDjGgV1mDyPwCv92xCnNYc/KnRs/K3c8JgM2GCalg9x
        RL4O2tGj0VBRA6kvp19RYg2K2/MS75+O5Yeq2S3A9k01Jl41yvKGg9hBEe0GM9Ma
        G3Ur4WOHQlBhui7/n+Vt43mglDKoFG0xpp3n+cLO5ZuTsIVEbLqykOsmboboxNcN
        ueORhQGWmmAEYX/lh47TxB8B+usei5kw4lm4v5YW+g1QADhA46mTpJS1YuJtghAg
        ==
X-ME-Sender: <xms:zC7vXjGQIMFa3cEsmLsuMzdleMydLm3v0mlQQcCdQQqWNcX22f-w9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudektddgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:zC7vXgWHiy8FJYkeAA9o6Uk4BSFu5ilx4vJAV5frwvjN4JJwL1WfaQ>
    <xmx:zC7vXlJTs1-EmG5BWwh2J0hhVKQySleVM-FKWjCKjgF86PpedHUuqg>
    <xmx:zC7vXhGSsQxlAewfjcW0dhoWJEmgIpUcxMa2gM9lUmo4BUAIx8k8qQ>
    <xmx:zC7vXhhwJvEOy_B4gSnlMKWa6C9fCjYjUySe_cidHSQDVqyn8-RxnQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id C43003066D7B;
        Sun, 21 Jun 2020 05:56:27 -0400 (EDT)
Date:   Sun, 21 Jun 2020 11:56:25 +0200
From:   Greg KH <greg@kroah.com>
To:     jaap aarts <jaap.aarts1@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel driver for USB liquid cooler controls
Message-ID: <20200621095625.GB120230@kroah.com>
References: <CACtzdJ2Yu_sHtJpWQ8UtF-yVEp5ON_vTWzaL72TJxW96MydVdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACtzdJ2Yu_sHtJpWQ8UtF-yVEp5ON_vTWzaL72TJxW96MydVdQ@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 21, 2020 at 11:39:27AM +0200, jaap aarts wrote:
> Hello USB mailing list,
> 
> There are all-in-one liquid coolers for your CPU (like the corsair
> h100i), these are populair among gamers and high-end desktop
> enthusiasts for cooling their CPU. Under windows these have
> proprietary software that control the fan speed, pump speed and most
> importantly (for gamers) the RGB led controls.
> Under linux there is software that manages to control these devices by
> talking to the device via USB. But this doesn't allow for the fans to
> be controlled via generic fan control under linux.
> As a hobby project I started to implement some of the features from
> one of these user-space drivers as a kernel module.
> Some features would have to be device specific like RGB controls, but
> fan and pump speed could be controlled just like system fans.
> I was wondering if there would be any interest in having a driver for
> these all-in-one usb controlled coolers in the linux kernel itself?

Sure, why not, just tie into the correct kernel subsystems and all will
be good.  What exact device do you have, I have one here that I could
test with if it's the same one.

thanks,

greg k-h
