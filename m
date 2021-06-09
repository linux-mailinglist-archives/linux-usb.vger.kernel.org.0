Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFF23A0EA9
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 10:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236109AbhFIIVl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 04:21:41 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:56683 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234654AbhFIIVk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 04:21:40 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 7C62924A5;
        Wed,  9 Jun 2021 04:19:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 09 Jun 2021 04:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Ek9B83K1ics4ymSbg91JI5cJlN0
        3+3ZP63DBoFtB7fg=; b=Gp5lVE03nAuLWy0/IBDoNyMkRI/Xu8vWqrg5dyitj3K
        VhYZZkS1otHTdgmtIdb+Y9xQp6NpBb6F6zVULg0HTMizbx18OLWGZL4PoIqHf45F
        xoQpINFsjV1AiI3LQWL/tllKrkLFoe4m/x7YrX1+0YHE3Jocvm7FzpTlYVdM2R1J
        HUlfUkm39PhV9K+u0b7HWzaEtonixRCQ0fJ/1IyGT69omSVDHYsDxj+bFBQMGpc8
        FQiLCAG3VD1BtGoA3eIeNkPAJGpiDoF0Rdpib/WJXE540OyN+HtfyF12RbvcNlTV
        9uHpXqIvvNcPyDYA9aGp0RT+X2GjNOOEQ7n4PNez3Lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ek9B83
        K1ics4ymSbg91JI5cJlN03+3ZP63DBoFtB7fg=; b=I3bejd5RA7xtHXBs+nQQT2
        Q6W5wPJhP2iSiXVZlqrAeZ2FZ6Lexu5iwGsjL0Z+Shg9zQw4+IGqlsEI/H7D1zJZ
        vaVva0O68vnpYcH04E8A16spueUFrTFEcpjMDbmPgK61Q4CgOUR89ar07c5MLZq9
        5NZFAnIj2tfZPk5p0w12fxrUy74D6QKm5agSgO3sqOAESkHmIH82kaVbnNv1y9No
        W4MgOIeDPZ9aOLl8Wa+KTJL2l6tlcqGGEzw8yzwi1ZI/DerS1QjvwdXTcMljaDJN
        hbpz4rSiP9zsIoVh7B64AbO+bDCtWW1Z8CNgHow/4nMEvYOE3slEFjZC3Mjo08Lg
        ==
X-ME-Sender: <xms:n3nAYHmZzrMczrbmk-KOSdMixfR2be8kIFUk514IVnugFqq5h9p17A>
    <xme:n3nAYK0qXN5zxk89xgU6mzyGh0WLGgOyeYJuHAu59wOHr2mrt3Dtiex3-1rUJ_FNw
    NfUO0K6t-o6sA>
X-ME-Received: <xmr:n3nAYNrxcdDlQo2tVCvMYepBFvIlKHXrUA7-f5oH0AfUFWRhuzWP8WX-kZhL9sdeGh91RNBv527qv3Cx732LZLTqnzk_Emvz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:n3nAYPlBqWXEsnDIRcVG75NeqJgrR57WAk_f1vA5RokF7KcezvTBXg>
    <xmx:n3nAYF2RJlZrtMaT3sEjCb8YUnord5f2qNMPXdimQj7Tba9W2IyxnA>
    <xmx:n3nAYOsOqH2Zlz9Dn_x9PfWmp9zOdQWbV0e1l6_qGP6YwREiMNBadg>
    <xmx:oXnAYDOdRWWJiLGjHhbDJWfMS3CjVgcJ8CpgXN6VlmAobVjE6UiRWOKFfL0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 04:19:43 -0400 (EDT)
Date:   Wed, 9 Jun 2021 10:17:31 +0200
From:   Greg KH <greg@kroah.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, paul.elder@ideasonboard.com,
        balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 0/3] usb: gadget: uvc: improve uvc gadget performance
Message-ID: <YMB5G1Lg8Fi64ToT@kroah.com>
References: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530223041.15320-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

<again, please fix your email headers, you didn't have anyone on To:>

On Mon, May 31, 2021 at 12:30:38AM +0200, Michael Grzeschik wrote:
> This series improves the performance of the uvc video gadget by adding a
> zero copy routine using the scatter list interface of the gadget. The
> series also increases the amount of allocated requests depending of the
> speed and it also reduces the interrupt load by only trigger on every
> 16th request in case of super-speed.
> 
> Michael Grzeschik (3):
>   usb: gadget: uvc: make uvc_num_requests depend on gadget speed
>   usb: gadget: uvc: add scatter gather support
>   usb: gadget: uvc: decrease the interrupt load to a quarter
> 
>  drivers/usb/gadget/Kconfig              |   1 +
>  drivers/usb/gadget/function/f_uvc.c     |   1 +
>  drivers/usb/gadget/function/uvc.h       |  15 ++-
>  drivers/usb/gadget/function/uvc_queue.c |  30 ++++-
>  drivers/usb/gadget/function/uvc_queue.h |   5 +-
>  drivers/usb/gadget/function/uvc_video.c | 150 +++++++++++++++++++-----
>  6 files changed, 168 insertions(+), 34 deletions(-)

Please fix up the kbuild issues before resending.

thanks,

greg k-h
