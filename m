Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DF030B8B6
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 08:36:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231739AbhBBHfy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 02:35:54 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:49145 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231701AbhBBHfs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 02:35:48 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 42321528;
        Tue,  2 Feb 2021 02:34:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 02 Feb 2021 02:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=w0TteEqMlwUd+feceKdyxFkFiad
        fAzKbz98qeSgtl1U=; b=URYsgl4a/r43F/UwdQ5ZVoLK6Bxlp68HZtzAp/eMn9+
        zZY00dSfQvCoo+y70AIFnLS9OChGjLkIB9n570ektf4qhHG76z2k7ppXSFGJxNY7
        vgD1QuzK21UXHkSsA59WXMMimZ9sAfvFZAdtwCK9Yio3XTIRThZgKtC9l5H8Bf11
        i/8HqQzO1ZKlcjVOeV8xIYslQeopdzBSIeC97ydYhOzAo5hFm38sgMvOPBaamLWJ
        uEM/WFBXX4NMs1GbjWUeqcQa1l7kaplR+RCy7EMXeQNcbGkAayHHiA6OPBIbFwzs
        PZBeUPt653249Ugj/5DCsq/7567wtCgBZ/jOsJGhqnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=w0TteE
        qMlwUd+feceKdyxFkFiadfAzKbz98qeSgtl1U=; b=lkSbW7xvx/JASfEjlp92XO
        9g1NMB5IQaj/tilGGEH3XAsJot6mKOMmYVRTBXe89MYnEed01/JJvLgHRRw9F9T0
        z2/cjBAMRrSqmOCPGyRbTIbJNvdgPwTxF9v2Ixftp5xre+qR9vOUZXlGaClNBG6j
        /N+RYs0IWeZrIB/yq18BpJ0IZgV5NM8SzU8JWPNOPq5oTudaiBCdPGjw3nY4Ga+R
        BL2svaczmh7Wq6y8U4soifMkVxhk9gDR0nkji6J/OsLr90Xc2Vq4RGk3m2h9dk5g
        l0Khffv3LGUxK6RvkfYdUBRRS0krQSH48GuEgDZH1W+TZT16ULulNFjHk2/Us3PQ
        ==
X-ME-Sender: <xms:nwAZYCOSt03PbFUeAJ6tmTcuLOIHny-nNNVIxbRZ4E8Rpd_Navltow>
    <xme:nwAZYA_Hrl7KwHDp1P5snsGBix69NtwkdNCyIcyZSfFtl2ygX4JmVERTNg0I6ZU0z
    Z3pXTmaOjp7ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeelgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepueelledtheekleethfeludduvdfhffeuvdffudevgeehke
    egieffveehgeeftefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:nwAZYJSTdtJf9LPAld404pqtga3TRJkxwVx7TEbcP-hRrgpbgTADWQ>
    <xmx:nwAZYCs6Z84B-UCDJG-UOr2YbAX7FQQOWSFrnlPQVoUCA8DLAd5fHQ>
    <xmx:nwAZYKcqHsZxrblT94x35IFjJnngV-pC0Sze49iWDtgMnlc2VVEzTw>
    <xmx:nwAZYMosGUisfYUIKcyV8f-Wgf8Qi6UGkCDLwtu1t9niKjU2-nOJVw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 721C2108005B;
        Tue,  2 Feb 2021 02:34:55 -0500 (EST)
Date:   Tue, 2 Feb 2021 08:34:53 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 211525] New: USB Canon DSLR camera seen (lsusb/dmesg) but
 no longer accessible (not mountable)
Message-ID: <YBkAnQqjRh+0+puc@kroah.com>
References: <bug-211525-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-211525-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 02, 2021 at 03:49:04AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=211525
> 
>             Bug ID: 211525
>            Summary: USB Canon DSLR camera seen (lsusb/dmesg) but no longer
>                     accessible (not mountable)
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.4.0-65-generic

As this is a Ubuntu kernel, please ask for support from Canonical, they
are the only ones that can provide it.

thanks,

greg k-h
