Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97C75737FE5
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 13:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjFUKyL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 06:54:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbjFUKxj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 06:53:39 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E93710E6
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 03:52:48 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 8A3CA5C00F0;
        Wed, 21 Jun 2023 06:52:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 21 Jun 2023 06:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1687344767; x=1687431167; bh=LQ
        kfcbULRLO9kKNDbi6ElBetwP1j4XZkDoINXw3fudw=; b=A0psC3DMeYJ0qgVvDj
        Nvs0TyYWghKA5Q/H6lVRzRjL00nnvKV/DJN+g82aUd7+JSJvPsZmvvgf4isveSRp
        zUAUh80NVH7TnMC8DSCxoIN5XgkUtO4ch66ueP+qLMOfqhFnBLHvm4Bmmu/bziJM
        0Vs+CgpeuzZkR52TguxOxkiXY1BXYp8eAY7zVihXrCqz9yMo1riEayGySBm9Q7OC
        LK1/4DvC22bHR0kJLEyiawTswATA614zdzpswFAd0nyuxeFY41O+pAayrR+3X+RU
        czgQ4pz0zola8zyUKwpwPML0owUZbWvN87J4GqMJAXDQXC5Pxgw5p9ksFSjcXBhF
        x8NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1687344767; x=1687431167; bh=LQkfcbULRLO9k
        KNDbi6ElBetwP1j4XZkDoINXw3fudw=; b=gQRXiRJagY9WJyOplx7zWFlRz1r9e
        C8AFOA3R8nVTX3jDviwiki3mTTwrS2YiCToFhgo35HKgjjbIJpwp/trmLIk4mZRh
        oheiKq3shBwNzzb4TCI7od3sahv1LaJ8cYNOJ7J47M+9pk+RxMuJkc/vCI3GZStn
        RFdukh4OHP2NZwqlaiPvTU3Oy+YD5fJ4KlAWx298am/ZKYnE1NeZWr471bj1K00a
        NoQGoWQhlekGtmiJee5xGhtc/0qovwhTI46yM1c1vAFXso0KUdK0HEQ1JaGMK2Q2
        q80aCZspt8W9MevmpLP5a89pF6lAwOIUdIOUryJEcGp5ZfrE0WDF1v9yg==
X-ME-Sender: <xms:f9aSZGlHcKJkrVvcURFfiMnI4WrrzM3BhQHYXI58La8UVYSALdCfmA>
    <xme:f9aSZN3ZuDTCj9G0GYRtoYhDtF7A5hiQ7e3xMHeNHJkS3OqxmoJwh207PzPxOnYwg
    alN39scUFFybQ>
X-ME-Received: <xmr:f9aSZEqpjfvDeSHJ4tHW_8GM5-3TXosTuYQedOZHqdb7Goztc0vNGz8Bu3Dww5_VTh0T9O5liLFLc1yzxgQb_oNm7q8Ogc_3MiFRkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeefkedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:f9aSZKn8hOJKDb3xTHtHrzc_mQSkBQ8K1UBhDnV_wn6fNgWcSIGGVg>
    <xmx:f9aSZE0ur6PSADLgqt3iNxF5EhZeHOqUDRqahvK-rm9N8nlwrg6fzQ>
    <xmx:f9aSZBuBEgsUNkeoPcm4zy-H9hPowD-GvZsYKzxiKdmafD-HxJ-4EA>
    <xmx:f9aSZKPXGwuqz5qybiajtuPk5Fqgi4wi2s-x41TxRSAVKUW1aKdOKQ>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jun 2023 06:52:47 -0400 (EDT)
Date:   Wed, 21 Jun 2023 12:52:43 +0200
From:   Greg KH <greg@kroah.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU
 based on CLx
Message-ID: <2023062136-canine-editor-e9fd@gregkh>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 05:37:22AM -0500, Sanjay R Mehta wrote:
> From: Sanath S <Sanath.S@amd.com>
> 
> Since TMU is enabled by default on Intel SOCs for USB4 before Alpine
> Ridge, explicit enabling or disabling of TMU is not required.
> 
> However, the current implementation of enabling or disabling TMU based
> on CLx state is inadequate as not all SOCs with CLx disabled have TMU
> enabled by default, such as AMD Yellow Carp and Pink Sardine.
> 
> To address this, a quirk named "QUIRK_TMU_DEFAULT_ENABLED" is
> implemented to skip the enabling or disabling of TMU for SOCs where it
> is already enabled by default, such as Intel SOCs prior to Alpine Ridge.
> 
> Fixes: 7af9da8ce8f9 ("thunderbolt: Add quirk to disable CLx")
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>

Wrong ordering :(
