Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CAF03A0F3B
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 11:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbhFIJFF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 05:05:05 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:38095 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232991AbhFIJFE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 05:05:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 085132177;
        Wed,  9 Jun 2021 05:03:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 09 Jun 2021 05:03:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=JlYkEEP1yg8u3CUMq4IuG30YtZ7
        afuZvo2nvmx7zT9M=; b=Sq0dOs6p99HZEqJTNV6bkEhFLsij+95w2R9VchbPKUe
        RvmbYTNMkhsbo1I7/GvAk217GRkw772RLNezRjcJr6eo+C02+pAEHG5XK+0YkG21
        ZZA2WfQkokI8MKXIOUK3lxFT4ipBeq9DfCt/1Y8/JZGE+8WrKTJENkUFwnqbW5eM
        yT3P04lShcIosDL7OTZsuk5eMgUgegnakjjrTG26xGc/byO36zxxJZN1KJ2C11ca
        mUeSv6PbUtrzO4NWvaMEl36yoJl//jDlyxGYtXR8XIdnaq92fNm820nhcqeQn8JJ
        wk2zItx4wx2T9UND5unYWrM/ArDWiM90KBUUXBNJzbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JlYkEE
        P1yg8u3CUMq4IuG30YtZ7afuZvo2nvmx7zT9M=; b=G65qU8/Mgx4N/RLw4GJnH8
        DmCZgSu7LQg+AlEOJgubYVViwz9UWM58KSpUUguuVVV1TjnTINZK9xarR5UqH+Xw
        4Y7A2yDmJIJVO7eNcqxtyKBkN0ew6Lx/73ulwmh907Ggtzet9Pj8TI7hF100vfHG
        JhI8HKthpI7pBw/Aaridd/BM3EUX5hvVkP2yummMn3DC0vsF/wpBQCXnhJ+VguR0
        f5D6X19BMoKmo+ZinH5EQQWH1hNhuT77nZdI6napl/QgRQ8L1o33s1MPS5hW8/wo
        ubn5Kxv0pUl0Rw4PpWyFATF0Gst7doM406Kg6flg8XLeliFt1IZX4C5kg4FTqY/Q
        ==
X-ME-Sender: <xms:y4PAYPdED_3_ed5h6hU-xtXvVJMlqpnyRCe0JILEJ8TDIDZ-FHEKjw>
    <xme:y4PAYFNjIIWn0hOCFZ5CTEmSjmaFoklofOqYd6vRB9aq_RQCcFqj-BrsTi9hKTKxy
    oxaLprnNXRbbA>
X-ME-Received: <xmr:y4PAYIg060mlj2nkGTlh1GEVsjdHI8SL0YP3IFdv7k3PIdxBkJciN4eMflo3dOpO3-vJMPKXmcL9bxgZafUBEdNI0BR0HyoC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:y4PAYA_6mmwTJuEULIcX5Eylrly9ygE5VhwJ1VAeMvciPQ-PAGVSGA>
    <xmx:y4PAYLu2vT7nps8jZsY6sty7iWP5f-Jyon3eOJQQBfg8HePDZdG55w>
    <xmx:y4PAYPFrPUgab1JBVQh_7v-qwkRqHLVm5FGAhBsoexm3M_o-xu1eEg>
    <xmx:y4PAYFL9dVZqVBzkfrJltdUSGjHEo2-Ns59LkIzBzJ6hRIItjHpBWg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 05:03:06 -0400 (EDT)
Date:   Wed, 9 Jun 2021 11:03:04 +0200
From:   Greg KH <greg@kroah.com>
To:     Marian-Cristian Rotariu <marian.c.rotariu@gmail.com>
Cc:     linux-usb@vger.kernel.org, mircescu@gmail.com
Subject: Re: [PATCH] usb: dwc3: ep0: fix NULL pointer exception
Message-ID: <YMCDyCgwOaTBKg9f@kroah.com>
References: <20210608162650.58426-1-marian.c.rotariu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608162650.58426-1-marian.c.rotariu@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 08, 2021 at 07:26:50PM +0300, Marian-Cristian Rotariu wrote:
> There is no validation of the index from dwc3_wIndex_to_dep() and we might
> be referring a non-existing ep and trigger a NULL pointer exception. In
> certain configurations we might use fewer eps and the index might wrongly
> indicate a larger ep index than existing.
> 
> By adding this validation from the patch we can actually report a wrong
> index back to the caller.
> 
> In our usecase we are using a composite device on an older kernel, but
> upstream might use this fix also. Unfortunately, I cannot describe the
> hardware for others to reproduce the issue as it is a proprietary
> implementation.
> 
> [   82.958261] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a4
> [   82.966891] Mem abort info:
> [   82.969663]   ESR = 0x96000006
> [   82.972703]   Exception class = DABT (current EL), IL = 32 bits
> [   82.978603]   SET = 0, FnV = 0
> [   82.981642]   EA = 0, S1PTW = 0
> [   82.984765] Data abort info:
> [   82.987631]   ISV = 0, ISS = 0x00000006
> [   82.991449]   CM = 0, WnR = 0
> [   82.994409] user pgtable: 4k pages, 39-bit VAs, pgdp = 00000000c6210ccc
> [   83.000999] [00000000000000a4] pgd=0000000053aa5003, pud=0000000053aa5003, pmd=0000000000000000
> [   83.009685] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [   83.026433] Process irq/62-dwc3 (pid: 303, stack limit = 0x000000003985154c)
> [   83.033470] CPU: 0 PID: 303 Comm: irq/62-dwc3 Not tainted 4.19.124 #1
> [   83.044836] pstate: 60000085 (nZCv daIf -PAN -UAO)
> [   83.049628] pc : dwc3_ep0_handle_feature+0x414/0x43c
> [   83.054558] lr : dwc3_ep0_interrupt+0x3b4/0xc94
> 
> ...
> 
> [   83.141788] Call trace:
> [   83.144227]  dwc3_ep0_handle_feature+0x414/0x43c
> [   83.148823]  dwc3_ep0_interrupt+0x3b4/0xc94
> [   83.181546] ---[ end trace aac6b5267d84c32f ]---
> 
> Signed-off-by: Marian-Cristian Rotariu <marian.c.rotariu@gmail.com>
> ---
>  linux-4.19.124/drivers/usb/dwc3/ep0.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/linux-4.19.124/drivers/usb/dwc3/ep0.c b/linux-4.19.124/drivers/usb/dwc3/ep0.c
> index 662a1298b..3a55bbdde 100644
> --- a/linux-4.19.124/drivers/usb/dwc3/ep0.c
> +++ b/linux-4.19.124/drivers/usb/dwc3/ep0.c

How did you create this?  It's one level too "deep" for git.

I'll go edit it by hand, but next time be more careful.

thanks,

greg k-h
