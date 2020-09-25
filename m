Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E502278C2C
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 17:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgIYPKu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 11:10:50 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52389 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728333AbgIYPKu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 11:10:50 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 800BE5C016C;
        Fri, 25 Sep 2020 11:10:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 25 Sep 2020 11:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ZjyiV4ZLaZhd9qCoOmBaw6cI9e6
        s2oreSnUOxVr7WW0=; b=KJMy3H3khtzgIBKL/jGMtx26vHLE6CI0jryt5WT+Tw9
        v+Dv9VnhBoQiANjyqk6fWvoZsXc2zCbkuMhDhiMVDQYighsmRiBrjiI75ZxwRBxG
        bvLpf+nEteFNZey3mGRng1RbNuizKqYClg9cbbNKGQjPGKRlMOmBf1IwaWd6xpQU
        BTZIaD3qM57VEmusnIUykkn3WjeFe45eTrr9DmogcL6vvAeKSniroyHXmx3aRfwF
        PdBxFGvY76QNEsMmC7kd3afmwvpwNoEFHhEcKy35KpyIBYFNNuF7mS2Uyui830ME
        TOGMtS/JFPWJXNnxBSDA32jw1IFrk5Ny3BqZQpYI5cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZjyiV4
        ZLaZhd9qCoOmBaw6cI9e6s2oreSnUOxVr7WW0=; b=afPMLPwEopY9NH+f1HzkFl
        GmLhNDEoVVGaK/XcxlXk9x286WGhgj7hQGfIPwlV1X9MqSrmSMviYLhEny9maFc4
        L0GlWA+fLnKKQcAuPXPWiFIIqmldr/b29qEm5W+SNNfbWfmep7HW+too0BFhrTM8
        shXZFP8/iY8/ERiNVm9fuk1fnLRmlxq+/nL9isw3VKXHvPgDwvyJZGoqS8apZCWn
        b4pOrSdtP9OUFvaOQHUfG7cM8RyRPKpvJzDkayvVCfH5fOwi5xi/+RJ0NXRG64cg
        d+ueZNhG6gV7DXhOgZwGn057oEGgX7eho+KYX8J4l+0CtyAJM21JjoHSZedqLj0g
        ==
X-ME-Sender: <xms:eAhuX5D7lUIK6m1-n62WTUKpxMh68VQBPlWmfV1zYWJ5f3E9s3_iBQ>
    <xme:eAhuX3iYlSp_tFaiKV3S8Q9lDMGxEJuSoDQPpvDVzi5uQDbN0UA-v65Sg0Vt9zvJP
    7RrMnWo4nj-3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:eAhuX0kTrh79MoC_M--Vi_25yf6M2uNyVhg_FJpWJ2jY5cWlF3nhXg>
    <xmx:eAhuXzw4oc-SFCAyqqb_-WebWlWZSY95Ahwf6bqtouTGDmdLe6ehyg>
    <xmx:eAhuX-SdvltE1v6Qlz0T9Lephfl5M5P7wcXB6NtNMz2HaelJT2ktaw>
    <xmx:eQhuXxKPuGU7CyoqKtxzsziQhyN1CpG7_Q_L3JHvG_adGelGK3lRkA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6BE733064684;
        Fri, 25 Sep 2020 11:10:48 -0400 (EDT)
Date:   Fri, 25 Sep 2020 17:11:03 +0200
From:   Greg KH <greg@kroah.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     penguin-kernel@i-love.sakura.ne.jp, bjorn@mork.no,
        linux-usb@vger.kernel.org
Subject: Re: [RFC] fixes for hangs and error reporting in CDC_WDM
Message-ID: <20200925151103.GB3173449@kroah.com>
References: <20200922112126.16919-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922112126.16919-1-oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 01:21:19PM +0200, Oliver Neukum wrote:
> Stress testing has shown that CDC-WDM has some issues with hangs
> and error reporting
> 
> 1. wakeups are not correctly handled in multhreaded environments
> 2. unresponsive hardware is not handled
> 3. errors are not correctly reported. This needs flush() to be
> implemented.
> 
> This version makes wdm_flush() use interruptible sleep.
> 
> For easier review all squashed together:
> 

I have like 3 or 4 different "RFC" series here from you for this driver,
which one is the "newest"?

And can you send a series that isn't RFC so that I can know you feel it
is good enough to be merged?

thanks,

greg k-h
