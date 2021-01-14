Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40102F5D1C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jan 2021 10:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbhANJQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 04:16:59 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:37543 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726478AbhANJQ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jan 2021 04:16:57 -0500
X-Greylist: delayed 526 seconds by postgrey-1.27 at vger.kernel.org; Thu, 14 Jan 2021 04:16:57 EST
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 224F01404;
        Thu, 14 Jan 2021 04:07:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 14 Jan 2021 04:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=MzQEL5nXPUgFtFul0I81bz1aKr8
        E0pkihlMDkujhjtg=; b=iEIRil5QccyTB2U1KiSTyB9IsBq3GdM4AwzcU1TN63T
        N7QwuI4Xbg3wfEBWYWDDGJribIcnM79kKrtdZAjQ/fdwd7nzrwEhc0h2foJogVpJ
        326FXMJLnYBkycmONREjinhLoTI3MJEFbZQ1oTvtsjgDY0jB7h6aTrAiAXR4X1Gc
        zG+E2KkD1k568dXhRA9xQF14EYdL5tMZ5TVJmzZqI7aI+VhYVn42j6cDPEXKhVKH
        TJUYYRrnNKt6tM/MB4QJVNw3faRhGzKkmFJ7VsWOfOgUD3YCvuE0b8kX+oHwtJYS
        JrVZ88tqjrvPTDDSAC7OGHTFY4ulY7KmBdegl/3FPKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MzQEL5
        nXPUgFtFul0I81bz1aKr8E0pkihlMDkujhjtg=; b=rpqMXhMGxw6Py1R8f81/ut
        sBc1OsjdMG+huqSrg6NQFKWvPFOUbA82dCsux2X6XNPKFWF7nJY1SLmtM44TDEGU
        WXaWailSY1nOxKQrwYYqkJIGdM36QAVf7FzjKqsYMcsy2SbZVrN4WnZLRXX2POTY
        Kr/CtL+YyWe6hVRQKFLWUH/K9vk8ybeQfAb4R4L+ORvLKsvg3DGX5ZzKX/y/G3+n
        TzLzr0IBsc4aZsV1NhblwAbSrYUXlJZB+WMBhgf2tC2BvLUIWvGESK3MBQyKP9E5
        IEx+fV2BjLsWuOJtpNGUUGc+A82yYcuMEXsYffYCx3H7xkuvSRN3o+qKVXi2ehaA
        ==
X-ME-Sender: <xms:yQkAYP2guwVB_L-aYscfh-MPwPu7bVNilMjWjnVqEXZ4-_mOWiEDDw>
    <xme:yQkAYOH1uBrFvnjbHvLTv5tVwO4Giy8hyV5Vwxgm6L5pJJ3RTrKslA6Ni1J5s8Kd5
    BZfwknDhOAO7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:yQkAYP4udU49hQGNBy8LavGDX7d2QCO-AsZzcPeBVvDMnsmmeW00wA>
    <xmx:yQkAYE2iKIs5UkZer54VwWLaYOyhohCYo10V1vfK5nctLZXjgMDMLQ>
    <xmx:yQkAYCENXmO62xzm0HlBW2_aFl97LrBSD0kgHYA81hbVgDrcJsiweQ>
    <xmx:ywkAYFDwji62qW9MMc2jq5tLkfXQvG2KqkO4lIYB197uDQjCtHtSHQXCDVU>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id B0A1D1080057;
        Thu, 14 Jan 2021 04:07:20 -0500 (EST)
Date:   Thu, 14 Jan 2021 10:08:26 +0100
From:   Greg KH <greg@kroah.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix broken  references at next-20210114 due to yaml
 conversion
Message-ID: <YAAKCjARs6JZrknd@kroah.com>
References: <cover.1610605373.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1610605373.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 14, 2021 at 07:25:57AM +0100, Mauro Carvalho Chehab wrote:
> Three new broken references were added between next-20210113 and
> next-20210114, due to yaml conversion. 
> 
> Address them.
> 
> Please add those patches  at the same tree as the respective
> conversion changesets were added.

I've taken the USB patches here, thanks.

greg k-h
