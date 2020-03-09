Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CEF17DDBE
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2020 11:35:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCIKft (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Mar 2020 06:35:49 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54863 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726469AbgCIKft (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Mar 2020 06:35:49 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 84419220E1;
        Mon,  9 Mar 2020 06:35:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 09 Mar 2020 06:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=+2q3p0XkcfVoJ8/QouEmSmi2Zis
        Whp75pScRqFiNcgg=; b=hzpOBTDeP7izXx+ghParprkM3UTyGFWSAmuXinGE9th
        Y5aCk7OKsNnDY5VOFByGHX4y/mkmAB/W4q2STN2OzAZY3DMzupT6PCuUgvIj27D6
        5vUGLj0VCQdlhuVf2fJQAh5J8dXLD7mwKCECXYV6glmsjQBlnEiJ/qGP3xQwFCWu
        YId42fa7QDOjZeOyT8POpHr4kDM58if5ls6I0Ri37OiDvtuXVEv1JIQLWFCGiWjY
        J6pS3rhAwW8HqwnRTU4KrZFXiY3e5Ui8ILJxlaFO13RsCkWjguz7hGqy9SGiQBRO
        Iq/2/vsxGOZk2HCOxYFfLOITT/oqOKawC2kcePFvZSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+2q3p0
        XkcfVoJ8/QouEmSmi2ZisWhp75pScRqFiNcgg=; b=VjbVN+ksVwbaX79q+KkjpQ
        rbZwVohYUCUFxFhIbGo8tHzXn+AnZIrSuwrKhAHgrYL96N/c9xlSYmUfaPJrfLZ8
        NWqlQ5Sbu7GNp5EY3jBDY6/9KywgocebaTJrJyFBQFSrJMHojf2LrO8HLtyhLlEI
        a3WkjduBkds+9GHx+9C1aGXY+tpADcwpSekkpcbBCO1GlZ6Er9pFdk8RA5P1McUA
        L2wjEJjeuCxOXP4Niq3yY+SRFwwvKueZp3JoBtWnP1746M9pQGKiYN9az2GMMxaj
        DwfhffvCBudV4b+6bgty2g3kruZVC11ON+bmCzLvjTlUGga/IsDiByJgr6e1EV7w
        ==
X-ME-Sender: <xms:BBxmXu3s32sdrqtBtTLHR2f0--4SIiatW-WiSDOeAn_FgcC9XdMy8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddukedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhr
    vghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:BBxmXlXE1a7fzLMOrcyUv07rd8KQddd-2ZkWSFz3RqEwQFv-pIdC6Q>
    <xmx:BBxmXh7jb_WClVZ_J2XSA5IChqkSpdq_TaF_YiZ-dLJry7-8xv8M_w>
    <xmx:BBxmXkKxV3n7RbqNw-7eDiPgFWsRDRRq2rT5eHXQMSYRUpNrg_-STg>
    <xmx:BBxmXqJaLPP-L1L_d7v-r0ReisLBbFBwRGkFjkmhCbnmaFhs6goz6g>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id BDA4B328005A;
        Mon,  9 Mar 2020 06:35:47 -0400 (EDT)
Date:   Mon, 9 Mar 2020 11:35:44 +0100
From:   Greg KH <greg@kroah.com>
To:     Anthony Mallet <anthony.mallet@laas.fr>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: cdc-acm: fix close_delay and closing_wait units
 in TIOCSSERIAL
Message-ID: <20200309103544.GC180589@kroah.com>
References: <20200309095159.14163-1-anthony.mallet@laas.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309095159.14163-1-anthony.mallet@laas.fr>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 09, 2020 at 10:51:58AM +0100, Anthony Mallet wrote:
> close_delay and closing_wait are specified in hundredth of a second but stored
> internally in jiffies. Use the jiffies_to_msecs() and msecs_to_jiffies()
> functions to convert from each other.
> 
> Signed-off-by: Anthony Mallet <anthony.mallet@laas.fr>
> ---
>  drivers/usb/class/cdc-acm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Is this a "v2" of this series?  If so, then can you please properly
version the patches and put below the --- line what changed from the
previous versions?

The kernel submitting patches documentation says how to do this, take a
look at that for the details, or see one of the many examples on the
mailing list archives here.

Can you please fix this up and send a v3 for both of these?

thanks,

greg k-h
