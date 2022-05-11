Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C40B2523304
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 14:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235191AbiEKMVj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 08:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239244AbiEKMVg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 08:21:36 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37CAF119900
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 05:21:27 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 0532532001AB;
        Wed, 11 May 2022 08:21:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 11 May 2022 08:21:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1652271684; x=1652358084; bh=mn64guT9g2
        /Vsk9QltAQj2QtP8J4kXQX7/AXKKU+LjQ=; b=Gqa1zE1MrqYkwfrP1D7mhyhhe3
        hAefL6AVzxFlNoTFIms8frs56s5PGM/JaotxKRVPyxNYWSnaGg5PjR+Nh3pan89i
        67RrVhyGs35Jg4ewkCPSzrtBbpT9Qg6ujReJ+rAuqY4Kqbyk9zTTAYmkVXZVbW3W
        q2dcBnUS3BGJ+cnXAiLSMqErT7UuUiPE8Enuq/CzYi7+GUD50VZhgxRIpIeFm+kR
        aprR72EfJsmK3yO8dLJVhkqrPP8CcwsE8P9z0a4ZWNa1Od5vr3ggHsPJd5OMoe5U
        UIcBWK87USeHYw7UdKI0+xxx4Sm6FOD7hZAjpE8ha3Pk52t4MrT2YZhFuoAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652271684; x=
        1652358084; bh=mn64guT9g2/Vsk9QltAQj2QtP8J4kXQX7/AXKKU+LjQ=; b=F
        is8YWB6PUOQd592hWu7Kp7UZxd6jVduRHtajij2teDxD6zgwgCH6qNVtGRjClMq/
        nWdeSm6syJq6UdbH+WlPRguAs/iwPCZFBVS3ghaFDmLbZehTJ6n+7IEX+GV/H3pN
        j3NMsJpyonu/N743W5SVcty9DKcSgtPvNIorYjcnuQJzCQQY+uG46nqosnr7czJf
        pPYvrHDVqpIK5N77Idbc29xVEPqyJxnnB+7lTYjW3wx5/oGWF1CNIqeIb9c6tOaE
        NAAJSK+oq4hvEy+oNFD2IHz1o0wOgXEqD6j6sCyj2tt1mnYczX41/R95nsslwK7K
        4qp+fi5VwySUaUUnMjzQw==
X-ME-Sender: <xms:RKp7Yt16qzb79GFKRjMX2Mq8szlQjS7tNjXWUXOwWGHoHsu6dm2PrQ>
    <xme:RKp7YkH6F4nyZzg9hekmoZTfnjMW7OZJvEDfvl6QTxUjpZ4DF4JXdsPt_EJwpSSfp
    oDc7nMHTwFbow>
X-ME-Received: <xmr:RKp7Yt5LWPObKZm4MT1dXuzarOoFf6Sqw_fJmjaJFMseLCfig21oe4-GpZCECjmdRgmpE2Yq6sapeA9GSLYGCyaabYRuEiPt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiff
    dvudeffeelvedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:RKp7Yq0tTaq4JhiYUb7-5zjq97FMAALeQ1D6MWwWyAvjHD4Yrx6JlA>
    <xmx:RKp7YgGlpTclyNBaWzpBzBI7V3ftRGFScX3yzLcf6uAEIxpYZYrhJg>
    <xmx:RKp7Yr_DmP-ipUBrLlsv1jxJ1a7OXU6J2BlgZLLo715CGQ_6Yy0ghw>
    <xmx:RKp7YlTxxUKqa-FAHkOZUFAPTveNg-vBlc28e3AkQ7_CvM6tv6waaw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 08:21:23 -0400 (EDT)
Date:   Wed, 11 May 2022 14:21:20 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 215967] New: Kernel build fails if CONFIG_REGULATOR is unset
Message-ID: <YnuqQAb2CIRyfZPX@kroah.com>
References: <bug-215967-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-215967-208809@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 11, 2022 at 07:44:39AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215967
> 
>             Bug ID: 215967
>            Summary: Kernel build fails if CONFIG_REGULATOR is unset
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.10.114
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: trallala@onlinehome.de
>         Regression: No
> 
> Compilation of "drivers/usb/phy/phy-generic.c" fails reproducible if
> CONFIG_REGULATOR is unset, because function "devm_regulator_get_exclusive" is
> undeclared but nevertheless used.
> The offending patch propably is commit 03e607cbb2931374db1825f371e9c7f28526d3f4
> upstream

Can you please send this information to the stable@vger.kernel.org
mailing list and we will work on it there?

thanks,

greg k-h
