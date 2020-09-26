Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B09B279724
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 07:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgIZFkg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 01:40:36 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54675 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbgIZFkg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 01:40:36 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id CE2226E6;
        Sat, 26 Sep 2020 01:40:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 26 Sep 2020 01:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=2/euN90N+9He/lfcnKUitT42xYJ
        MiolMW/SmRpTyCGA=; b=LmaN9XSmT0kWuy15OIqqht/I2ngw/NHvLPw7I8wHcKe
        HXn18yqCIt8lmPeEr8TnvSuEbziMaV7nm7fndwaZDPVVFnwpkYEs7pra426ZaDVP
        fVil3z46+LmtqVa9ICIaUFU/5j1ocv0nmrNc9UnFwj1JYg7F9qnLAV3NFPA+q/41
        NAccr78WajgQgEvOHEciE4KDwvWV+7/GXoKux4tJpWcD8hZVR+8wzYwAbengtBIi
        x9c2EwDbXETK8mwgyeiJRk5+0xAJVtJ9ODPXOJdLFPtMla/Zq6gq9P9PgXLjcIhP
        M9hJEXmU8M9iihe5bw0sc1glkvN22GkKTA1gNDS4RLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2/euN9
        0N+9He/lfcnKUitT42xYJMiolMW/SmRpTyCGA=; b=BdimsgP0l37dQfA4EAOtpg
        Pewc82DHnC6VDct3gzNHxQQi0fn02IERQ6gTG5ytxAkUtJAZmR5RV4XmO5USWP7S
        sUYJJoMRmS5X0GxpWaYCXlefZDFLmZTm9yDYcL4D4zpXOoWuC/cA6VI1jdlyNEo4
        4emofdDHI2piYclM14uGevWUUsz98VDqvL7FGOfNaS5YlOadX0POfbgiT5lYmUMS
        7uS9ocUnFh4DAxOZ0jpDtAr+N5HwuOKXVQU4zDnP0HLoVTmBBeUplBR0D+/i/viw
        KPFlU39LazRL3D/deIGdBiZn6Q6IsMo78RzhwHtcrZ+9jdt2bnOe5+v8QlehkjRA
        ==
X-ME-Sender: <xms:UtRuX7BEHMX_ItniC7s18m2EUn6cXku2PBfYqifADQ0f_b4YRl2UVw>
    <xme:UtRuXxh79YyFr4O_-nUNLRPknkxF3EFAnsGGr_TYEarwYSBWC9KBw0DfxNDSZdZnp
    mL3ksiJXhKY0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddugdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:UtRuX2lRndLnVgTC_L0vu1PghDqnGuFMjFeXneiaTHjZirlEqX4Dcg>
    <xmx:UtRuX9xrz2PzwTwihNOK5IXhJLhX_u-UikxVstsIJuw6xNfr6pb5QQ>
    <xmx:UtRuXwRZTE1olDZKWc1EnXYcYj8gF1vfA7TSI3Q9BNb4gB3zkQ1seg>
    <xmx:UtRuX7KW3Qfak3PNQqaMZdtX9RRHz5TVAQoTrqGUcpl0PTzZ_K7RDw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id B56FD3064680;
        Sat, 26 Sep 2020 01:40:33 -0400 (EDT)
Date:   Sat, 26 Sep 2020 07:40:32 +0200
From:   Greg KH <greg@kroah.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Oliver Neukum <oneukum@suse.com>, bjorn@mork.no,
        linux-usb@vger.kernel.org
Subject: Re: [RFC] fixes for hangs and error reporting in CDC_WDM
Message-ID: <20200926054032.GB631346@kroah.com>
References: <20200922112126.16919-1-oneukum@suse.com>
 <20200925151103.GB3173449@kroah.com>
 <22e1b8f3-947a-6f15-a788-d639cbabde5c@i-love.sakura.ne.jp>
 <20200925152832.GA3191454@kroah.com>
 <c82c8fda-e9a1-ec70-21b1-761f75be5a43@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c82c8fda-e9a1-ec70-21b1-761f75be5a43@i-love.sakura.ne.jp>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 26, 2020 at 12:34:24AM +0900, Tetsuo Handa wrote:
> On 2020/09/26 0:28, Greg KH wrote:
> >> Do you want this fix as a series of patches (the former link)?
> >> Since I think that the changeset should be atomically applied, I posted the latter link.
> > 
> > A single patch would be good to send to me again, burried at the end of
> > a long thread is hard to dig out.
> > 
> > Also with proper authorship is needed, did Oliver write this, or did
> > you?
> 
> Oliver wrote the majority part. I just squashed the series and updated comments
> and deduplicated the code. Thus, I think main authorship should be given to Oliver.
> 
> > 
> > There is the co-developed-by: tag, which looks like it might be relevant
> > here, can you do that?
> 
> If you prefer the co-developed-by: tag, you can add:
> 
> Co-developed-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

That seems reasonable, then put Oliver's address on the first line with
a "From:" line to make this all work correctly when I apply it.

thanks,

greg k-h
