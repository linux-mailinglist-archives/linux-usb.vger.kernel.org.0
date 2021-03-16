Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFA033CE86
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 08:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbhCPHUJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 03:20:09 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60085 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232223AbhCPHUB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 03:20:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id AFD905C013A;
        Tue, 16 Mar 2021 03:20:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 16 Mar 2021 03:20:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=kPuQRlGVvaJ6jN5oL3AYvMrv85K
        CbYOKAz0ZHcs/jV0=; b=tytf21TUyDcCEyfkbSh3CRSm/4/b+rQBxDYicyNZzxj
        fFaZCtWfeVev1A3M7sox5ogc4yO8xM5iNsfuIhT0pvZ5pbtjve3ZfdP38WbGuy7n
        4xjSk6olpfL7VuB6ZGjQo7F5TlDC7rRs+Ss0cgdITspOJA+8r4QIlZLIUex+ja4C
        jhyThffcOf6SqEOaAMD+AjtYgQoSTh89FD45kyniB2GfZefqfUJp3lBJ/U0i28e3
        +YvLLTv53OhbI7JFVC0uufnD/zp2gQNdc5K+dKwI1ptsnvgwAs02YfvGbVVa4QGJ
        LlrjQeP4O6yvJsMZ5TfqX6RBaH9vDU+oqGLZ815zbzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kPuQRl
        GVvaJ6jN5oL3AYvMrv85KCbYOKAz0ZHcs/jV0=; b=g3lsxbKwwKI4pTqm/h8iom
        Eeb2FUsPLgaAhoLOEKv/Z6FdDq/rSRvUdkbBPXL0oMIpsW+e53tpfubie6faTzsU
        EHUjdEhexldrpPlK75ZrFc5mriyFtGTaYrbJD3GRYTr4O4raR2k/raw2Awt0+bd8
        5jOBU+klDd+JZS4uOKela4qESbKVJxQLOvpbWuBaVQOizwig5ShjEy2y5ltkHSIU
        4zb/01ThflJPEQgr0+/q2SHLVXNZyksPWXtZEVRdohIsGbyE4hpYyq4TIAng49CF
        SYf33A/UCLQtkn9Wr/VXmX59VkFZ5S6NMVEwyBGD2U4c8E/bIAICjVU63NVk/sjg
        ==
X-ME-Sender: <xms:IFxQYCh5CgANuboXtN0QEiivRGbHdK4ZBHbYxNBYtz9jYec7XcryGw>
    <xme:IFxQYDCiJRZGUurqq5IFcPcu2t7pbqPJ1QBdV0o1-Z76CqhmC2G3eRXVaaV-NFJk7
    FiHcT93s2GEgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefuddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeehudfffffhveefjeeugfeigfduvddvffevieeileethe
    eileefleeihfegvdeltdenucffohhmrghinhepmhgrrhgtrdhinhhfohdpkhgvrhhnvghl
    rdhorhhgnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:IFxQYKGGXVlXgvDDKmBXchir7oZtI_kH7UghXJGRZJn7wg2Sor7brw>
    <xmx:IFxQYLRkFhP_PUBN-XuB5FFPM6d4smryKnozN-g0ybaojcfIRluQww>
    <xmx:IFxQYPxcNmkZ459zEnanUi1NJVkGam8GiAwBADQT8HX8OUzG-e4tEw>
    <xmx:IFxQYAvrSevtdIReC-wzKuSi16w86zsj2KJ3uL4fT_5DijWh78nY-Q>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id ED1D61080054;
        Tue, 16 Mar 2021 03:19:59 -0400 (EDT)
Date:   Tue, 16 Mar 2021 08:19:57 +0100
From:   Greg KH <greg@kroah.com>
To:     michaelk@ieee.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: pl2303: TA & TB alternate divider
Message-ID: <YFBcHRVzqvsK+rDa@kroah.com>
References: <20210316014205.748441-1-michaelk@IEEE.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316014205.748441-1-michaelk@IEEE.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 15, 2021 at 09:42:05PM -0400, michaelk@IEEE.org wrote:
> From: Michael Katzmann <michaelk@IEEE.org>
> 
> Use an alternate clock divider algorithm and bit ordering for the TA and
> TB versions of the pl2303. It was discovered that these variants do not
> produce the correct baud rates with the existing scheme.
> 
> see https://marc.info/?t=161392209800002&r=1&w=2

Can you point to a lore.kernel.org thread instead?  We (kernel developer
community) have control over lore, but not over marc.info or any other
archive, so we never know if it will be around or not over time :)

thanks,

greg k-h
