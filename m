Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69ED16971F
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 11:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgBWKCO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 05:02:14 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:43343 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725980AbgBWKCO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 05:02:14 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id B138D700;
        Sun, 23 Feb 2020 05:02:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 23 Feb 2020 05:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=VWANkl3fWfXKI6vN6qGIPsZvGk/
        Vwk+Eb8RLxQe/h3g=; b=d1Mv/VgAK9Jt/x5ycw55sEzfzvOuGd3G4R385jp5k5q
        al2RxgPDKQHcaLRuo/1N8fAQ+FPAVpPcGS8Pt5yZ2LgVmnjHdq7/Erkmrebo0lrF
        FcuTPy/mEKIfrArEQA8wtNyls8Y6L6mBAxn9jR0vDJYE0huAdcPMRGQAlO2nBmGT
        jIlra19/PL3JxgFNm3PSr37zrvGMTbpqxfLUBkrW6Y5X53kaHgXyf9M50Nk/OAHw
        qPoj3OmPG33BR4m4T+K+PK9ZdNCpqs2Xx2qI0UTVNOZwJzmUaVYCfpV8vSqnmQGj
        2gx+QT3uYvv7DhXy+36hbZZF4VsBI6d74VVfS6y2fRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VWANkl
        3fWfXKI6vN6qGIPsZvGk/Vwk+Eb8RLxQe/h3g=; b=2FYG1jTaKmxMTIncO+dOtn
        3wr3DPe1Rs+EVtVN7870KgKByIshgGsF0MohFKVHlFzoLLIMvXc8PrYrYxPGyjTB
        KlXAKO3fJetk75m2Jn6CD33g3xC7rE4EOOkrjiPO+qfCoSfVVVBvfdSBKG3bo8aS
        1fgQbMRAxVjGr7AJV5WMwsSKwgkRG6eIxIOy/n6hVGkJFET76/q9WpgU4s2FWg+z
        5EcqPXvRH/j3sntZmi6DhuAdfAo+m1FlAtbzjq2JhNOJC38R8rpcDiwdlxg60Nvx
        Afx9R64+9NXrJlqf0lksQwzAqtqSnadpsd7/2myK4r2Vm1kd+xl6NFLgLFpYCRPg
        ==
X-ME-Sender: <xms:pU1SXpaxESjbGiBn5f2s6ymx1mDc6QbR0M0wBF1lar_fA-0Ty9CSgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeekgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeelhedrudeguddrleejrdduke
    dtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:pU1SXkpWgmBjjwCZ93hZbh135e0-k714EqfAofBaBWpGTERxAt2Ewg>
    <xmx:pU1SXm8m6KqIAFM9H-MRa761v6u5a3GX-ZF8lk7HBSkGH0MlQ2WjHw>
    <xmx:pU1SXr8gsxYZdDvu9MqW-R6g77W6WV9bBAiElAu6H96-Wfs3IZXrUQ>
    <xmx:pU1SXjdWe0w9ZEEiF6mJSt7YtyFR0LIt3sYdOkwu7VE1C0CKA0zRXA>
Received: from localhost (95-141-97-180.as16211.net [95.141.97.180])
        by mail.messagingengine.com (Postfix) with ESMTPA id BACF43060FCB;
        Sun, 23 Feb 2020 05:02:12 -0500 (EST)
Date:   Sun, 23 Feb 2020 11:02:11 +0100
From:   Greg KH <greg@kroah.com>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] ch341: Replace memory allocations with stack storage
Message-ID: <20200223100211.GC120495@kroah.com>
References: <bdf7db0e0e133f55ac81d39ce9564653e0b5d9ed.1582312740.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdf7db0e0e133f55ac81d39ce9564653e0b5d9ed.1582312740.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 21, 2020 at 07:23:41PM +0000, Michael Hanselmann wrote:
> Storing a memory pointer consumes 4 or 8 bytes, depending on the
> architecture. The replaced buffers are 2 bytes, so this change not only
> avoids the overhead of memory allocation, but it also saves a small
> amount of stack storage.
> 
> Signed-off-by: Michael Hanselmann <public@hansmi.ch>
> ---
>  drivers/usb/serial/ch341.c | 32 ++++++++------------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)

You should have gotten a runtime error with this change if you tested
it.  Did that not happen somehow?

As Johan said, all USB data has to be dynamically allocated.

thanks,

greg k-h
