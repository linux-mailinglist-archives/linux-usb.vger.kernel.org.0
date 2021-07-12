Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2EA3C630E
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 20:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbhGLTCO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 15:02:14 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:45427 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234157AbhGLTCO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jul 2021 15:02:14 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 109CC320096D;
        Mon, 12 Jul 2021 14:59:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 12 Jul 2021 14:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=cusF6eBE9dyfiGdnca5cjPSXPMw
        VcCIaYjQtsJUvpfg=; b=xby0uVo4EeuVU9BHOl8ZSmG422T56PR9pjvDP6x3qOR
        0o4TKtmjYMf34o88nL9W7g/xfFLlPIVN6HcmWynxZNmpdgjGvgiCMY6qPtGLqaxH
        VA5EsRAWS+dNtFlpDU+Ml2IAsDhvQ/q5P6h02qXd4rdp6ETIgWd9S72YyrQSmgyP
        XtzzjEdpUjrg8La+/YcDSopr+/MKB5HarUSp3LU172vHLaAw4hFBYKGRUjZXcjJ6
        QHGPLNpEd+WW1I+9b7He+7aUvN5pcMnJCBININXIL6F7jqeOEphYziOMVyhfUxZo
        AI8QKkKMTcP+LNfARoHI6zqkKa67zNDk9D2SWqhuHBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=cusF6e
        BE9dyfiGdnca5cjPSXPMwVcCIaYjQtsJUvpfg=; b=XY5HUL5Be6EF1dA//YsvQk
        abMFa1U0tu11NkjTfBzvreXKyfcVeVfKyrYIIgyoUpCFm+kcUEFEgfeCx0rbSVLd
        g5/3002BPtUxMtbzcmdqRSynS+GhdwAf69+v7K0GSIC7boiwIEoKqX8Kga41t/Wg
        xZYRvREoVdAIT05AUl/GduyZ4NUgcbiCp0mOr+hlTkFysrnU6CXjtrB2l+5ICIvl
        GuM+6YGPW3JWDmkcCGAPwMw9xfnqOC64JJrq7abBYpOpfjJANn90+Yq7b0bjZFsi
        XX2xO3rjn0HrB7FrAKJ4/rol0n08AVmTFH2N0uJKJpnZNml44Kya47W6YY0eqHEw
        ==
X-ME-Sender: <xms:DJHsYJm6GAQvoPZistJwyaE_pm1z7VC_tMrHepY7kTvhn1H2KXSeVQ>
    <xme:DJHsYE0FL_GnO6k59-XZ4XEjq3zu28oby6uSPMp8pDihvpPIUuQPm_0ZGq1tJRwI-
    5aJfi9f_QW2CQ>
X-ME-Received: <xmr:DJHsYPrHJJAzGb2CGvjwgmCeA1YzOWAqJ33TE-V4ititJfKzmpWrJCPkOeKJkWxput9qHyoz2z1d4UYaX76RdQPKpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:DJHsYJktr9ZZTru7siJS7qoJZmnkmJTGJXM0n3mOW3lcTYNXfmA4JQ>
    <xmx:DJHsYH2k3b4cw9K4z9F41zWSthn8UYUm2Dqo4cjWrwowpubLQA7C5Q>
    <xmx:DJHsYIvzSfBSZLp5vQUZZ83AtRy9TYqfB93ItSepSUVW1V_uQY49BQ>
    <xmx:DJHsYFDkl2k9ey0Ft-OwTKc7tPQU8r0dtyjRHtUk7LgmeTBN9Kbjjw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jul 2021 14:59:24 -0400 (EDT)
Date:   Mon, 12 Jul 2021 20:59:22 +0200
From:   Greg KH <greg@kroah.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Fix incorrect pipe calculation in
 do_proc_control()
Message-ID: <YOyRCr+1oIPSAEOO@kroah.com>
References: <20210712185436.GB326369@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712185436.GB326369@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 12, 2021 at 02:54:36PM -0400, Alan Stern wrote:
> When the user submits a control URB via usbfs, the user supplies the
> bRequestType value and the kernel uses it to compute the pipe value.
> However, do_proc_control() performs this computation incorrectly in
> the case where the bRequestType direction bit is set to USB_DIR_IN and
> the URB's transfer length is 0: The pipe's direction is also set to IN
> but it should be OUT, which is the direction the actual transfer will
> use regardless of bRequestType.
> 
> Commit 5cc59c418fde ("USB: core: WARN if pipe direction != setup
> packet direction") added a check to compare the direction bit in the
> pipe value to a control URB's actual direction and to WARN if they are
> different.  This can be triggered by the incorrect computation
> mentioned above, as found by syzbot.
> 
> This patch fixes the computation, thus avoiding the WARNing.
> 
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reported-and-tested-by: syzbot+72af3105289dcb4c055b@syzkaller.appspotmail.com
> 
> ---
> 
> Greg, I'm not sure which -stable kernels, if any, need this.  It should 
> go into any kernel which contains 5cc59c418fde.

That's just 5.14-rc1, I asked for AUTOSEL to not take it so we should be
fine.

Thanks for the fix, I'll queue it up now.

greg k-h
