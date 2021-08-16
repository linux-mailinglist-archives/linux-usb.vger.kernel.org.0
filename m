Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 434C43EDBD6
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 18:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhHPQ51 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 12:57:27 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:59659 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230351AbhHPQ51 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Aug 2021 12:57:27 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 739CA32004CE;
        Mon, 16 Aug 2021 12:56:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 16 Aug 2021 12:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=w6Np71C9c2OqyYHZCtvBnfzBDrk
        360rSB3/6RpTrD8E=; b=urdg0Wdvhfze19yGUUxl95ayNZz5LvVg6kwRaXJZcLK
        FS18btqWQpZYj2byLFZ6spc8RAYDumGy4J+ZZAEGwt0uCC+WiokXUYBgx15lQP/w
        JJUluaurOUjmqYrYKs6TDfJ4LqXx3sutGR3cNLyl4AffohVQe6oXMit4isTC7qaT
        eA7HSlMMzETkoBiFdqTTsSkdiJcRhonp1IuWofhK3pFKWlqr/fW6PDauumQiW4ZF
        zQJtgynYt7wc8cOHHZ8YuylGWpdUyvrN3aIuWPPuiAVHIqq9Hgc8TGHzQlgJXvhN
        nB/mCxvZiohEcFxa2yBrgPKScBEtmTqwDOXIHYO7h6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=w6Np71
        C9c2OqyYHZCtvBnfzBDrk360rSB3/6RpTrD8E=; b=oYw3HYhiHguL9v4JTzdb+8
        AUnG5BxnwO12B67ECHp0gN8JZTsUGXAshP0GglREYYHCJYyNaYsXtvpme8JJJveR
        nA6y08L43SK0G7CGcUlAv8WRCTbhWpwZ1lkfKqMhVPMjS0jDMLuW4bySoAZy6tjg
        3EsFvoqbpC42pN3wMSnjVljqlKZgYj9pYEd9eGxHCuw83z6wGXera+Q8AE+wlp3u
        +3SsrFyHPVUT7K/FzvjEG2mEFRj9eeoI1pEHHB87fUtTH0fobgeZ+ECSCMe06ONJ
        fu9L/ecbssRYucgb/Jrfi+N4TAObowQ1OWMCMMnd53vcfXCqgwXVDkWTr37VZjHQ
        ==
X-ME-Sender: <xms:1ZgaYQ3jPCEqM3oxqvkAu2uwRNEdm2Cd7BWfDOU_sj-MbhQStegHag>
    <xme:1ZgaYbF23LjIKZor5NMEHLRIiEiTHl2-WfZcQ7BZ_NlUuw0nhDI-2QLmuyaRqtYZ5
    kcF7JFFV2j-XA>
X-ME-Received: <xmr:1ZgaYY7nDamSqMXBu3-2dvnU5s_4_UV_2_pX_0443qDx2SAq7g_Gg29FB4ZEBDjNx3xh5oX122pgNmhAbZ96w_DiHal0FC6q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledugddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:1ZgaYZ2XwFhIHBtueAcyoqWp6QgkUbs71TBfFBMRFmJX0ZCpOl6MHQ>
    <xmx:1ZgaYTFgN_nLMoVwfTsYq6TcJ8F-8YacdXBuI2Yl0sGt8zSWhRRVlw>
    <xmx:1ZgaYS-XEomLc1VhbLsWGhNqzis0dMmd1SzB5EAflgIlNrCYAHmpVw>
    <xmx:1pgaYY4ljVe3Gv_3WNpGrh2m3dJvQCcg6CylqKjoDMgyU-0Xa_12pA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Aug 2021 12:56:53 -0400 (EDT)
Date:   Mon, 16 Aug 2021 18:56:50 +0200
From:   Greg KH <greg@kroah.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH]  usb: gadget: f_uac1: fixing inconsistent indenting
Message-ID: <YRqY0iBYFozlveJz@kroah.com>
References: <20210814072214.4893-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210814072214.4893-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 14, 2021 at 09:22:14AM +0200, Pavel Hofman wrote:
>  Fixing inconsistent indenting identified by kernel test
>  robot.
> 
>  Signed-off-by: Pavel Hofman<pavel.hofman@ivitera.com>

Please do not indent your changelog and signed-off-by line by a space.

Also, you need a space after your 'n' and before the '<'.

And drop the extra space in the subject line.

thanks,

greg k-h
