Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8E44522BDA
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 07:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238819AbiEKFo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 01:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237350AbiEKFoZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 01:44:25 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33B2244F1C
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 22:44:24 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id DB2D6320034E;
        Wed, 11 May 2022 01:44:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 11 May 2022 01:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1652247863; x=1652334263; bh=/MXybowLOi
        fvFgtfiMyGphzlj4TW9KlsVno87yDDiCU=; b=PUDL0Bb3BadLxz748pXbCAQp3O
        tFEsz9ayyrmkGaiBpM9KRc0hZ3TKzACMZq1G8YtXaRPuF3lcuoLBQjj4uOaE2sEA
        /QrPY2vHpHJXaHHS6vQFQnES50aos0qmD+UStg/u+ilnBQULvNRmOCrpub02H4hI
        fsirZi7HmCDDoGDODKU4vJCAXMswwV99D1LaPK/4u9b8xiiHhWzAX2W5K8uWNKVk
        U9QaXqFkYf4Qc1DoEYemKsOsVL8Rze//0OUagQwTcNvg5z+Beae3rWQ5opU9CWem
        cksNbCWnIzkzsh1x99b4IR04j/aYpN3AOLNE3ODRnmi/7vsIHMlGPydK1zMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652247863; x=
        1652334263; bh=/MXybowLOifvFgtfiMyGphzlj4TW9KlsVno87yDDiCU=; b=n
        a+CJ6xp5gFDZf00w6uYFtXjmfx2oiqrmjRPSDLHp5Oa+lao/93UqnY66qC7euRYB
        Qea6ZNP/3r3uSSA9LPCatTgcpiRMBi99Q4+m1oZx5ppoxTGUA2PQFDdF3KJeCTvv
        3R/rfN0TR1yBnXC7XfTbYCE4+NbZnl6YzULzORdUVOiH0XLRyDxvwO1OjOsR0vPj
        TQD0sHLqlTJ3K0ZoFe0T1rkQ9Lc2Rv6coDwa6VseAACnIy4vP4x/4y+hsCgrkjVV
        GGKyFgYs42k3EkLkz64QydnBF+5+XiLN5aXTtg8lwaiojs2GCDvvgXpJ+wuC6MK5
        QmJpVpBYs5Ju1n174YZtg==
X-ME-Sender: <xms:N017YmOjyjKZtjE2sPCBl1xkoqr8eePSd95vgqV_guJt4DXyEwvgfQ>
    <xme:N017Yk-fTHAduUxLlfEdiTXy7Ial3lnNf9sY5RcysYNv0YlyO0UwLDxyT36mssWSs
    pwDXK5GLa7NEQ>
X-ME-Received: <xmr:N017YtQm9f31SwbUJnFzcHUBMeSCpDDSWjepAXCBR44AnJARJoz9CoAWCbDbLyB-TDhPVo92-L6vffiFRp8S0yltRSGVvj0r>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeeggdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiff
    dvudeffeelvedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:N017Ymtsl0qlTw4IacEPkQzUqbi7Kj3xjHnAEObJALmamHAnqEvRBQ>
    <xmx:N017YucPycYszWceJQKi3r5aKGZiSVMjOJJd1ndjhY0J2fvPAmCZmA>
    <xmx:N017Yq3rv8OgY3MF8GvBNTO5Rsokagu8HQBwcH3Kijj9Zp3wfu2C9g>
    <xmx:N017YvqS-QKg9anznVMfLv_pV5SfHJIyUifBKZRd0r-FgVyfMsLssA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 01:44:22 -0400 (EDT)
Date:   Wed, 11 May 2022 07:44:20 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Message-ID: <YntNNINiPP1WCHoU@kroah.com>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
 <bug-215890-208809-HJx1Rs5PDP@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-215890-208809-HJx1Rs5PDP@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 10, 2022 at 08:50:40PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=215890
> 
> --- Comment #5 from Satadru Pramanik (satadru@umich.edu) ---
> 5.18-rc1 has the same issue...
> 
> Is it worth bisecting between 5.17 ad 5.18-rc1?
> 
> Maybe there are obvious suspect commits to start with?

Yes, please bisect.

