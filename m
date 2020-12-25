Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB232E2B65
	for <lists+linux-usb@lfdr.de>; Fri, 25 Dec 2020 12:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729236AbgLYL56 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Dec 2020 06:57:58 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:57281 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726164AbgLYL55 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Dec 2020 06:57:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id A9F1C2FF;
        Fri, 25 Dec 2020 06:56:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 25 Dec 2020 06:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=ZiIhKGtsvLVZ1D5IIFuny0nzI8M
        FcHNouaGtBRZ5QF8=; b=KNcIPvMryZfk1nzBFno894dT4vm+kApGP58hBElTrU+
        UoE/OPIF4Hh5jqiezAwITTEi8Jq4cPd4lA02dzIpIQSj0TTw03mhJrVbFGxts89d
        aTDqOjreqWVui+5kVNwabXnWSbBtecGQ0U1repB2+KQRHKQqtLRuDArs1ody+VSC
        3XZsNQUe0HaN8WxyV727v/XMCJ/ytJk/PGJ112+iC6/P3B18JBFsB+jhcYbyT+SM
        lbZIu5chEElQygbAcBd1TFShC5SDD221Zh/TxMjy+KKHuO/4OdQU3peTks/D8L2p
        nHBLy/vOoKEeXYkVzIVredFx2X7jY3Akv+C3O/sdbPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZiIhKG
        tsvLVZ1D5IIFuny0nzI8MFcHNouaGtBRZ5QF8=; b=HXrqPAZc6W0b84zrv939De
        mTjqP1ZchuA9qUsQhYB3GvqjwjPhDEmD26Cub+IGgop0D4+x5TUwqgaS5ofC7jhu
        UhHM9K9Fm55+WnovltTIFF3FLSHYLCN0AiPqU9kz5EI49cGe0nBrFMDezHVnhNkw
        MVPWCSuhG7jj1L+k7tfLvFZJY18ewZZbVMsAfA3Hz5xMp17InBB/A+LyenvXd+ww
        4pEZQMW4h2fdhbPKgMqwDhF7hoq95N/2XQ23Ljn/PCJVh1AcJrcXfsx8QwRRJ/Fu
        7eVgvYYGbK5WaKEaUJgp2MP8Rd4GBkTZCZwx7zVh1rCPjOehJolZV2Hrdy/zAxPA
        ==
X-ME-Sender: <xms:gtPlXzNw5fZl_cR_Fl3L4dDN0mmd1NDVPMg_oKQCDqh4oAEdFKx5hQ>
    <xme:gtPlX9-zeDN9qivGlz-LYv2ctLPxn7P48utZvrgL7U6Wr_koWV9g-1ncROSs09qII
    FygEfh06pknIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdduuddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeffjeekud
    ehtdffjedvheejleegjeduudehhfduudeifeefleejjeelgfevudffudenucffohhmrghi
    nhepmhgrrhgtrdhinhhfohenucfkphepkeefrdekiedrjeegrdeigeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdr
    tghomh
X-ME-Proxy: <xmx:gtPlXyRI84ah0y1vS4JxFxW9CRdkF8S2O7BEbjp4sCO9wOYzbItvGA>
    <xmx:gtPlX3t7eQaMTeuSohWEI9swI1UkXOZW6V5WWAMnoGNJnX5fBAnZyg>
    <xmx:gtPlX7fZUaJW78hQri1hTfJyVaYLjYILNuYATCiv1OVtMpXQC5A1hg>
    <xmx:g9PlX5rjRYoO9VCo_pbZFvcuu-eegEHFC378f9Qk4JSgmEPviK3Ypw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3D017108005F;
        Fri, 25 Dec 2020 06:56:49 -0500 (EST)
Date:   Fri, 25 Dec 2020 12:56:48 +0100
From:   Greg KH <greg@kroah.com>
To:     Noam Liron <lnoam@marvell.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Proper way to set a DMA_MASK on a USB device
Message-ID: <X+XTgIX7lJTEw+wS@kroah.com>
References: <BYAPR18MB274144B768FE04DB641ACA90B9DC1@BYAPR18MB2741.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR18MB274144B768FE04DB641ACA90B9DC1@BYAPR18MB2741.namprd18.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 25, 2020 at 08:18:14AM +0000, Noam Liron wrote:
> Hi All,
> 
> I am working on LK 4.14.76, on a SOC in which RAM starts at 0x200000000, and need to limit DMA buffer allocations to be below 0x220000000. 
> I planned to do it by setting dma_mask to 0x21FFFFFFF.
> 
> But in drivers/usb/core/usb.c:590 I see the following:
> Note: calling dma_set_mask() on a USB device would set the
>            mask for the entire HCD, so don't do that.
> 
> I also found  related message:
> https://marc.info/?l=linux-usb&m=160023769800697&w=2 : "... as the dma_mask is set by default for most busses".
> 
> So how can I set properly the dma_mask?

Your USB host controller device sets that up properly, no need to do it
for any individual USB device.  I think the resources that the
controller gets assigned for this should handle it for you.

greg k-h

> 
> 
