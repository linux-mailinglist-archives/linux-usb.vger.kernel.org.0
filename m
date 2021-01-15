Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A3422F72F4
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 07:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbhAOGgl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 01:36:41 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49561 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726082AbhAOGgl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Jan 2021 01:36:41 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E6E395C013C;
        Fri, 15 Jan 2021 01:35:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 15 Jan 2021 01:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=b1Q7Yeg3vpQOizFz2+rMftLKrgE
        r2XBY4Vice78Ea8k=; b=hF2qYTy6y/Sa+LOA0HA7FBqBqbyCKkP5c1KqDJr/98R
        uCoUMQn6ygiuQfwCAWPZ9BXcdiYwr5w74YuGLFXT5Lefzz3iHKIVqHih5b7k4UGj
        /NlDXMaUUU0Y1wsNzfqXvcLT7fLLCD1noUansCqx1Avvi03vf1hdeCkvqmnZ628C
        eRXasQcVgS2bkzeGk4EG+YLsjidNFYJiqGvSNZVkGo49VXpdOM5ln42MB64xUiwt
        DloI6r0h60W5tX8BZQE6mPo3uKVcVSyWGGIXB6lFifripHcyk9f79kvpvPXef4WZ
        bozbL6jqNqQRwcfS/ENUOlDFX4w+MclUNxg1UWua9ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b1Q7Ye
        g3vpQOizFz2+rMftLKrgEr2XBY4Vice78Ea8k=; b=Y1QO9llmZH9B35ZBw/XqvB
        PuEYzfX/2e0SNK1TT563nCTl05pVqHt+rKhQ7W7efm+cLQ4n5W+upF3AFUSylxQZ
        ZYCPLJvUUqEWbroP8/4bgeOCOgqhYT114yf2sC/I3cse1Wm1Kyz11VR+8TYUn648
        fMwVjtde4YWPh3tTYYwLmk4tiaZ5XBDDnKMWhXTqCuk+ccfeiTKEv/gIBMv5PDEL
        qOpIdV30YQwCjEUDd/0bItEyi0+bLRs8/tYV7Vn9dvWv2t7S7+4GPFTKAff4IxOA
        CYT0oIhBYL/pz8EnjGiT1ZLJPyc45z9YQaFsanfQ7ZHZNi85c0rabU89y7DUt3gQ
        ==
X-ME-Sender: <xms:tjcBYCVMPGt4ETXqnnZaw2qz-c_wqn6vHWU8OAp1culbBaI8kGKyJA>
    <xme:tjcBYOnFJ2U_E2bAB-ApAT7tC1XLwx2_mBPa20heYeOcL5mobwsTP51uQRrmw1VkY
    OC6hXwFK6MFRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddugdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeeuleeltdehkeeltefhleduuddvhfffuedvffduveegheekge
    eiffevheegfeetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:tjcBYGby6kVmLeN0Wfvt5AvJQcyDH8RMHoq6b92OuTfF1ucgMLTYlA>
    <xmx:tjcBYJVFvAlveGIk0lkMjhCMBKD7jMIH4sVHwow4GKae0AxlQzcinA>
    <xmx:tjcBYMlCTeOnsgIbh7l_z8aVh7QGB2dA2uGCEM7cUTkOXl0LmuoFLw>
    <xmx:tjcBYORsfX_NwsclalIfJSDzaPQDHxcLK1psrGdCysfV2c4FsrIIoQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 70AB71080057;
        Fri, 15 Jan 2021 01:35:34 -0500 (EST)
Date:   Fri, 15 Jan 2021 07:35:32 +0100
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 210777] pwc driver doesn't work anymore
Message-ID: <YAE3tPbWxI8COEwQ@kroah.com>
References: <bug-210777-208809@https.bugzilla.kernel.org/>
 <bug-210777-208809-KiNtyviAF8@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-210777-208809-KiNtyviAF8@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 14, 2021 at 09:47:14PM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=210777
> 
> --- Comment #10 from Barto (mister.freeman@laposte.net) ---
> @Harald Jenny : I tested your patch, it works, my webcam works now with kernel
> 5.10.7,
> 
> I hope it will be applied to 5.10 and 5.11 tree.
> 

Please read Documentation/SubmittingPatches for how to properly get a
patch accepted to the kernel.  Attaching it in bugzilla does not work :)
