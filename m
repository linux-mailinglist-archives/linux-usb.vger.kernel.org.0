Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD36577922
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jul 2022 03:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbiGRBBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Jul 2022 21:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiGRBBA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Jul 2022 21:01:00 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E614B10FE2
        for <linux-usb@vger.kernel.org>; Sun, 17 Jul 2022 18:00:59 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id E8E9B32004AE;
        Sun, 17 Jul 2022 21:00:57 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 17 Jul 2022 21:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1658106057; x=1658192457; bh=pZ2SMsvoEU
        9jMk4Qeosj7aj6d+ArzaS+GKQ/JX9WfCs=; b=a05vVXTc0DM43XiFUYBVw/L68j
        Pd7veUWZL88TdTrqYJ1ndndlpX9lNqh96523/w8Ez7BqcXrFxUCsD4w9kD1Ttj8v
        5WqpxTTMHotHXkxx+/4VnOe4Y8dbvRtSp7BXvl+MSrKfduE7Z6+COqUbgR41X2Xy
        cikiZNpOsWnMz9WyVkcYGfm7gKpMAmu/lzpMEzIlt+yBx5Vr/IXEI+ZZTttsZO+X
        BNXr0aVSBI8McWmG5y5MHqFSkXET0lnB+gWDlOuaO2lvdohUeOfFauBVKxx9CuSO
        DJ+UWbdLc1EcytyD5R6nEFfyzhwCizSfTK8C75JuKO9gc62UI+IrKM39Ax7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1658106057; x=1658192457; bh=pZ2SMsvoEU9jMk4Qeosj7aj6d+Ar
        zaS+GKQ/JX9WfCs=; b=zVMA6HpEG2vdMYtJv8phE182r+LrH58zyY3VQJTiHikH
        G5GAZ3imzaKLyfk7E4sfSATSrIZTrmvUu1OCx7YBuAoBJ+yg992lCE5TUK2iYtgW
        eaEEVm3aDa/WFmn7y2lQiyeslXydYsiCs+ugQamd7RcDBEvQsiZmH6oX3aNkYBz0
        1LDUx8INvJ+RG9eLkKJJBPNRwLFZpBwlH37/I3HrhR11VGJ8pa3MfpsEMSTl4CMb
        I3ICSkVIJF12aUQ8ZnJvoo+q2x8MjQyZG3rPo1GdgFz808DrTjANe9LGuo1QmOmh
        kwm6dWTTkNI1228Lafi2iZessRSYb3ac65b1e0ffiQ==
X-ME-Sender: <xms:yLDUYtV6eSymNvBrAi0VjXf5YQHQGsQWjmwamPgsa1Mcphe2z4AKGQ>
    <xme:yLDUYtnGZk4ALLiD4ReyNa9QSlArj8iKI5xxWCcQrCcjatot0SqRfA0IvNM3gStGl
    en0tQEOiKGpW9aFTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:yLDUYpb41S1SW8hHoFCBNj8AH5zE4PJIXEIeoZmmLOJAblIjpjNCRA>
    <xmx:yLDUYgUInUS40Y7vOx8cFtNcu_vctdAaciLr2luaHTs1NM3LCRfOQg>
    <xmx:yLDUYnms8EKv7djS0s4MrhzigsUfj6gi5iuo2zkq9bd1mvjkzzyBng>
    <xmx:ybDUYsxvbe3IgR9RndMDmcrMPUv8XQyRIR9pSp-YEpQPnBv7q27z_g>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id BE73F170007E; Sun, 17 Jul 2022 21:00:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <031f66b9-8e68-4026-8ef0-5fa70027abef@www.fastmail.com>
In-Reply-To: <20220713120528.368168-1-windhl@126.com>
References: <20220713120528.368168-1-windhl@126.com>
Date:   Mon, 18 Jul 2022 10:30:35 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Liang He" <windhl@126.com>, "Felipe Balbi" <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Joel Stanley" <joel@jms.id.au>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: aspeed-vhub: Fix refcount leak bug in ast_vhub_init_desc()
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On Wed, 13 Jul 2022, at 21:35, Liang He wrote:
> We should call of_node_put() for the reference returned by
> of_get_child_by_name() which has increased the refcount.
>
> Fixes: 30d2617fd7ed ("usb: gadget: aspeed: allow to set usb strings in 
> device tree")
> Signed-off-by: Liang He <windhl@126.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
