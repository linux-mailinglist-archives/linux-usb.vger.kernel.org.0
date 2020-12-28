Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921B62E3F1D
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 15:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505264AbgL1OfN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 09:35:13 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:55081 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2505225AbgL1OfJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Dec 2020 09:35:09 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 41A295C0097;
        Mon, 28 Dec 2020 09:34:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 28 Dec 2020 09:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=BfRLSqShWRSahls9N5P99ivXn6P
        nVsZ+ufEmJthwJ9U=; b=nJXKBiGTH3/cPak8JNaKdEmMvVTzHgTBF1c+S6eEEek
        Dp88CWZdJ39t0cYcRgMRCP3jtdiEqtlHCJLKDCjYGKA+Fg8EhcHIaN4T1nyrTQhg
        VI06mgrzApPiEWItGdxyburvxEf88jouzEiX32EczLhGFfbgRzDyc0VUHYwjXM+p
        JsT3WzsyKaL7MKvhSJi6GQhSIYEOecl7zyYUc8GVoRTQ6wnuD488Tgd1pDR8YYWY
        Wug/9FohpBlXnCoBRZlDn5ACEiUa/mS9c/nNodxOf8qB44kSTqW8HIocu96uXykJ
        io8qPUor+WHYxdaiqx27tnpYLtV90Odr0xZt+bDPOqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BfRLSq
        ShWRSahls9N5P99ivXn6PnVsZ+ufEmJthwJ9U=; b=hIMOL+3xq2k/N9holjViM9
        SHbp1NSc1ZiaYH/pZ28yUXuSUVuMl7Xnhba92pWrC/TgXWLHTH26HYUPlurz6p8E
        7LT1KlJUiPLe576NGgtEG/9ZYOjpTGhw4ju4z6s7cUpgy5Vc/Hj+GK2+9uCAfo2N
        zlivG6R3qnJADHTaBGKzWmuvt4V0c9JQk2fmM5fHtrWzx7BOoUBBeN5OA25MLsCi
        bPVfl+Mk0PMECos64pPsw+pz6rw7Ak3fqwwK2Iv5AosB+Y8ugGCp2u0shFoXH3JE
        lwm7lJfJ5Nrcz57VldrZKx7s9gwzPz4cEyV2bBdhJ+WGpzTLScXcptxkJz+hgMGw
        ==
X-ME-Sender: <xms:2uzpX0I3fLm53JBh-uXtjZbsRMFsiRPbsoF-MkA_NT9txGhJPSUzAA>
    <xme:2uzpX0LvVgjOtVxoyhyFRirFlNEpps_I-iZxIqrLxxCy7ZX0nuLbwlpZ4HxZHoPJ3
    Ox7bnIidGI2GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdduledgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:2uzpX0uDMWzNgvTtkzlJQz3hNHH13JT6GTbHfijH7-GlHOSdaukW8A>
    <xmx:2uzpXxa1EeUdaFeDw30SGC943R9HVguFeR34NMlb5wW2kcDL2ygfeQ>
    <xmx:2uzpX7aix7EgU9V6iVqKfA9Y6rTEfPVyQmLSz5jIWe6uSusoSsQaJQ>
    <xmx:2-zpX8CeEWowZm9QxNWeJVuwiF368ZXN0HwKoFZH4_nULcR71-1hdw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8E2AB240062;
        Mon, 28 Dec 2020 09:34:02 -0500 (EST)
Date:   Mon, 28 Dec 2020 15:18:41 +0100
From:   Greg KH <greg@kroah.com>
To:     Noam Liron <lnoam@marvell.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Yuval Shaia <yshaia@marvell.com>
Subject: Re: Enforce USB DMA allocations to specific range
Message-ID: <X+npQe45AXcsFGu1@kroah.com>
References: <BYAPR18MB274197EFE1391905899D2F07B9D91@BYAPR18MB2741.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR18MB274197EFE1391905899D2F07B9D91@BYAPR18MB2741.namprd18.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 28, 2020 at 01:54:41PM +0000, Noam Liron wrote:
> Hi Greg and thanks for your reply for my previous q. (Proper way to set a DMA_MASK on a USB device).
> 
> I am rephrasing my questions:
> 
> I am working on LK 4.14.76, on a SOC in which RAM starts at 0x200000000, and need to limit DMA buffer allocations to be at the range 0x200000000 -  0x220000000.
> This is a SoC constraint.
> Setting the controller dma_mask to 0x21FFFFFFF, didn't solve the problem, as I noticed that URB streaming DMA are first allocated by kmalloc and alike, which are not affected by the dma_mask.

Why not get support from who ever is forcing you to use that old kernel
version?  You are paying them for this, right?  :)

> I plan to do the following:
> Alloc coherent memory for the HCD using 'dma_declare_coherent_memory', and use the HCD_LOCAL_MEM so the usb core is told that it must copy data into local memory if the buffers happen to be placed in regular memory.
> 
> Is that the right way to deal with this case?

Have you looked at how all of the existing host controller drivers do
this?  Why will they not "just work" properly for you as well?
What host controller driver are you using?

thanks,

greg k-h
