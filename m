Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77EC416D9F
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 10:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244736AbhIXIWZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 04:22:25 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48119 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244657AbhIXIWU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Sep 2021 04:22:20 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 034E25810CA;
        Fri, 24 Sep 2021 04:20:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 24 Sep 2021 04:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=rbxJ4OHlKNMf2t34GJ9ogmDmL36
        Za6VIebkv3zf2hiw=; b=uVvqlhd/sBCcsyTFCnbjjzbPxttS32C9mU0Q+y3NWkd
        W8w6zqoCJ5KfVaTQpR7qLOQ1fDiCi6UXmlxZGmMdhTID7det//VCsbcOpK6j8Ptt
        TBz4gEGVitwXNSGTLOaN0yvWtVYluELMZb1vdy+EJ/frORfyvn8IkYqEsOLL7jSm
        ST+owt+fxSutuA/7EX7nPNo9l53GrKZa9NG+gssifjvPTmHAUmZp+fQ4gQbz++eK
        TpaT0OiJmidTRj2IN/9E+GZCz8AtAJ2IMlxAgHZrcfyM4G9Gaq0Wnz9NJiPpIkCE
        qSQFFd/uATjjVbgLLRxBSSbeghRJ/W4qYI9z2UFbiuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=rbxJ4O
        HlKNMf2t34GJ9ogmDmL36Za6VIebkv3zf2hiw=; b=FJbrhIZQnEnfW7z5Mcnn+6
        J9h5J0vgIbQ20DRGj4m86oZBx6BofJdNWTQ6UsOxiBgxXcCCBHXGWDYLpSP4QLWt
        VOMXh/HsnVTHrFQ9dzwp3n//wWOmypyGtEze6y1B6fAW0t75JrvWTkjgl7SxeoDZ
        V7B0BSYxx/mhrIh4SoVF3cK6jUe13jLjdRofdVSf2Bd5qq5Uc1zCe7khRoz9bqS5
        QsMqDFO52njteQ8E3DowrUn3Cin2spJ/hblEXRC4yYyK5P5lHMbHJE8voqq2Rde7
        Wr7iiPXuk4GwjpqLjBL+oJy3AgD7eR0mZMjFCSdLC7LF4954HAZHXE0P8xYXygOA
        ==
X-ME-Sender: <xms:X4pNYZtlyCzzBVYT3NDGzCERiuUePCunmN2XbaDblWgXUZ5N_tpltA>
    <xme:X4pNYSehdnlncy2Ri6Tv1y9utB4V3uHdGl3pOT8BgMWxNbrY3LQPG--pg6dTDczdV
    wGX_qYcrm4KBw>
X-ME-Received: <xmr:X4pNYcz_n6VEV-F_WxPaEh0XSlWuM-Ke9lA3Znghwt-tMiM0JW-nI8enbv_UVJiGd1lYZCZ9g1qY_kZLEo3uUQvIIf_0yWDa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejuddgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:X4pNYQOe5EHv0NF48j8nDN6UXGlFhCoR3Uw6OHkjD5MwZeir_pZJQA>
    <xmx:X4pNYZ-9VfV7bJjiJb5r7cBUV1eH48ipgQgFba2BTxTteWXavTxWIA>
    <xmx:X4pNYQUzWa-0r8r36Ra80aWfeYRVbsfVFYxdb0pzdunrm8Vp4cqdrQ>
    <xmx:X4pNYa31shLsBbE-NWaTpR1775cVVOBXVN65utqGbiemF7iDqc27ow>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 04:20:47 -0400 (EDT)
Date:   Fri, 24 Sep 2021 10:20:44 +0200
From:   Greg KH <greg@kroah.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize
Message-ID: <YU2KXJ/4Q2tq+ANv@kroah.com>
References: <20210924080027.5362-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924080027.5362-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 24, 2021 at 10:00:27AM +0200, Pavel Hofman wrote:
> Async feedback patches broke enumeration on Windows 10 previously fixed
> by commit 789ea77310f0 ("usb: gadget: f_uac2: always increase endpoint
> max_packet_size by one audio slot").
> 
> While the existing calculation for EP OUT capture for async mode yields
> size+1 frame due to uac2_opts->fb_max > 0, playback side lost the +1
> feature.  Therefore the +1 frame addition must be re-introduced for
> playback. Win10 enumerates the device only when both EP IN and EP OUT
> max packet sizes are (at least) +1 frame.
> 
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
> Tested-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

What commit does this fix?

Should it go to stable kernel(s)?

thanks,

greg k-h
