Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E25C27A06F
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 12:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgI0KQV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 06:16:21 -0400
Received: from forward2-smtp.messagingengine.com ([66.111.4.226]:58945 "EHLO
        forward2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726196AbgI0KQV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 06:16:21 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailforward.nyi.internal (Postfix) with ESMTP id DF3851940B92;
        Sun, 27 Sep 2020 06:16:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 27 Sep 2020 06:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5Oru/5
        IcYLWavJ4kYKtwn2UvLsACoekx7cvpwePIbgE=; b=Kkn660UBsN5LDBwrEx1pJy
        K2C4Hx76ZHA7FblC5zonVmtWr8LIVltAIEY144/av0g52oS0CE34tn0RI+cDT+ad
        I7rkT8/5QbtGZfd+Fp8HiCFGHXh8kjMhLuk5QJHZiLk+kkanUgtYFOfWrrhF/RIq
        M97k9pXP6C/48P7saqBr26jMgghL39JJJysaWZNEzdVhChTcUjuzmAnaPbutW6QJ
        eTmPlFUcga62tlDIZBFjZePVRTxPwAe8u5HUyJyo/DeVKwjCLbig+OlnSepNYwuh
        YhKvuGCmVVcorr+2BPIXZskSQyvYaEnsF1xEuHPSz01W3T0rrE37eo1W+eeZnnKA
        ==
X-ME-Sender: <xms:dGZwX_fw-E8l3eL_NPhhosKOWXDY9wgRdnbXa3EpHQdwmF9TW5SauA>
    <xme:dGZwX1OfJlM9ZN1NRjb4cMuFppgSTIBfpmpvYo0cZ3LGp0J3ORo2Ls1Fsl3xGMfoa
    JUURTVNICNUGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeggddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvghfmjfeslhhinhhugihfohhunhgurghtihhonhdrohhrgheqnecuggftrf
    grthhtvghrnhepveffleehhfetheelveevhfehffehieevtddtteehieefudegkefgleek
    gedugedvnecuffhomhgrihhnpegrphhirdhnvghtnecukfhppeekfedrkeeirdejgedrie
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:dGZwX4jAeuz16BxYcMUbSL4wjhScMwf-huKt8AkoShi79Ikhh3GQFw>
    <xmx:dGZwXw-Wgas__e86o374TFfuYAFi7CCx_aId7hcOC1F9EjMaHkzsTQ>
    <xmx:dGZwX7siFgdrQ0rc6Wig5ydwSDk6HqzQ-59MeRyKgq9uulO0Bt6qGg>
    <xmx:dGZwX0W0abSv0GCOlrKDPkqvcMPIJiHQjALm8n98yy6w-akCkbX4EA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id F3B83328005A;
        Sun, 27 Sep 2020 06:16:19 -0400 (EDT)
Date:   Sun, 27 Sep 2020 12:16:31 +0200
From:   Greg KH <gregKH@linuxfoundation.org>
To:     Petko Manolov <petkan@nucleusys.com>
Cc:     oneukum@suse.com, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: Re: [PATCH v3 0/2] Use the new usb control message API.
Message-ID: <20200927101631.GA85411@kroah.com>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200926091327.8021-1-petkan@nucleusys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200926091327.8021-1-petkan@nucleusys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 26, 2020 at 12:13:25PM +0300, Petko Manolov wrote:
> From: Petko Manolov <petko.manolov@konsulko.com>
> 
> Open coding, ccasional improper error handling by the caller of
> usb_control_msg() and not flagging partial read as an error requires a new API
> that takes care of these issues.  It took the form of
> usb_control_msg_send/recv() and this patch series is converting Pegasus and
> RTL8150 drivers to using the proper calls.
> 
> Petko Manolov (2):
>   net: pegasus: Use the new usb control message API.
>   net: rtl8150: Use the new usb control message API.
> 
>  drivers/net/usb/pegasus.c | 61 ++++++++++-----------------------------
>  drivers/net/usb/rtl8150.c | 32 ++++----------------
>  2 files changed, 21 insertions(+), 72 deletions(-)

Normally drivers/net/ stuff gets sent to the netdev mailing list.

I don't want to take patches that those maintainers/developers have not
seen and acked yet, so can you resend this series and also cc: them?

thanks,

greg k-h
