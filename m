Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F546756659
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 16:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjGQOah (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 10:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjGQOaf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 10:30:35 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA3CC0
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 07:30:34 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id D1A945C0063;
        Mon, 17 Jul 2023 10:30:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 17 Jul 2023 10:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1689604231; x=1689690631; bh=9V
        8DTfuyVylfm6ZDdLS3JyNga1gP14UTsf1eW5xLWKI=; b=l0sxcftka3v0lky2Nh
        XMQYa3Htj8wcdbIxguCuqZg5TV1oQrAYq7p3Z9CKSRpJ7Nj76XL791h877sCLLd2
        p1dT8za3BqUSVih3lApGIXhDjpoK2Gv5JkaYuxiB0WHs0qEr8ZhT3yPoYf4/i6qI
        fQWMmYwmP+soMi0yEDGlRB9j3xMYO1rrcWg5HD/AAVIHijomOVEAsGHrgazxLADr
        UgqlL2xeUK4AFK5D7bmwghUw6IFuVPhPXqTrZj/RxrW8dsj+Zf/ch7zDQ6YCg2AR
        98mamn/xrdz0NtjqVgp8pooi4F4RlG7b/Yaxt289fzWY6CspjcBIbSvDT3F5t1Fw
        Fw1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1689604231; x=1689690631; bh=9V8DTfuyVylfm
        6ZDdLS3JyNga1gP14UTsf1eW5xLWKI=; b=GfUNsLzx9SE/t/1SDyJeGX1oauKQa
        6D7TjiGa8eR83/lXHAjhTXO54XUUiC3tx1dlbwvKakfRixT7Rq5GGEFQu7xo7XZH
        yStevZAeX0xD2cWDomC2Tktw/s7p8hrw4Wg1tSLbLLoUJRmrbMnMu2HOLJcTGgph
        rgver9HLIP2LHq5WVb+LOh+S7XfICW0k62UnmyLMuZMYQuSdI2vOEtAP69HjSa98
        E3gMLqtvwomRgmisl3m1+h+Z/cSn+urlmU/jARlAc/pgHQBcXKAGE0/q/bb+eXCn
        5imW+FggX4ycxPS1KOqPjUcLzFQQD+Y7dG4aCW+UXR5vZAHh90Nyc5rpQ==
X-ME-Sender: <xms:h1C1ZIDAj3B2DawQ1BQlFZwyEMMP7pXKb0hf4t_lTo0Kufrk6miDzA>
    <xme:h1C1ZKgSHtLtvECsMAbbYfqjniiWI0dOaOxio1-4MjF-ti3RdPAh67ThNT_7yO-PF
    m0qklyXViPDww>
X-ME-Received: <xmr:h1C1ZLk50VVBeQDT3qs4hamJUMu4fn--8nn0vTM2TLvpGe2RECcTClDoIE6FJjRoSmIxDzQobxVU88WxQzSOoeLxWmafKFxbpEe9jmbHRMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedvgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiff
    dvudeffeelvedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:h1C1ZOw1YW0x5YNgERhs3zMUhIYE8KYve4rm_Pr7sYs43c6qJzV1iQ>
    <xmx:h1C1ZNTBqYJviu_OV75FUtNkC_pHaMwCOtxbIESqFBZbiIc9nTDyNw>
    <xmx:h1C1ZJabwi5PnrufMemlZDqiDdX1t6PnECcmS6z0Ej5d6fPTYqRXxg>
    <xmx:h1C1ZIe1s7P2z3sjCf8YMfAvoVEdY42T8JhXA3HDWO6jnO4XBlUmPw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jul 2023 10:30:31 -0400 (EDT)
Date:   Mon, 17 Jul 2023 16:30:29 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Message-ID: <2023071714-robbing-aluminum-2b80@gregkh>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
 <bug-217670-208809-3qv1fgMPi9@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-217670-208809-3qv1fgMPi9@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 17, 2023 at 06:36:08AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=217670
> 
> --- Comment #6 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
> The commit a6fc2f1b092787e9d7dbe472d720cede81680315 has dependencies of
> previous commits, so at the minimum the following commits needs to be
> backported:
> 
> 7bee318838890 usb: dwc3: reference clock period configuration
> a5ae3cbe9dfcc usb: dwc3: Get clocks individually
> 5114c3ee24875 usb: dwc3: Calculate REFCLKPER based on reference clock
> 596c87856e08d usb: dwc3: Program GFLADJ
> a6fc2f1b09278 usb: dwc3: core: add gfladj_refclk_lpm_sel quirk

Can you test this to verify that it does actually work for you?

thanks,

greg k-h
