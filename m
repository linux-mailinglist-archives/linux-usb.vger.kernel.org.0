Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 925A378EB27
	for <lists+linux-usb@lfdr.de>; Thu, 31 Aug 2023 12:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236511AbjHaK40 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 06:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjHaK40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 06:56:26 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A05D5CDD
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 03:56:23 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 190975C00AB;
        Thu, 31 Aug 2023 06:56:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 31 Aug 2023 06:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1693479383; x=1693565783; bh=8V
        UNUtPjQnCpWyuAECKDpWp6L7NH3cJVpvav4oRL5/E=; b=ZW1eFj07PFw8kGZFsf
        Lw0VQwYF4rcX4TjrR3CF4B9YiZxXm/9thlxGFEwPJE0DMWI2esmSZNJjewKSgaMN
        sVDlNbpHh7wQevsHLGVKgXdzGReov59oyS7rwT/XZYWmTafWf3s++JWE5/1lCO+n
        jk9afjDymvAQkFMrSCPpkBiGZBffsostyc49PXO2RDkmloZ5sjG6m/jmSvqDrgAM
        7M/it33oVXWkKG4A5eL0IqLlNOEdaVddx5MmsoCATbKxUxwSi6h02+c/ClVg5TGJ
        wmXU6CWr3bvz+WcHbm/H94L52y7vEQQobwSXQxZdPjbw50ZNyoRw0GZ2WBY9f+qE
        KAFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1693479383; x=1693565783; bh=8VUNUtPjQnCpW
        yuAECKDpWp6L7NH3cJVpvav4oRL5/E=; b=ZC4Ad7N5p9KJb4z5EVYcI5i6itTxA
        2EgDaVNcGiIZUPwSdGer2dyuun0P5vJ/aMo/+x8u70P8a2VaRFkNams7LABjKsxs
        gwjhv887Ddzttk48sNdqfebOQ7SZBWgjpOiDoBMz4FqRjwVzRNAY8lQz+12BhX+K
        sevyxKnrTXcaxIGBDJUwLtNc5F0rlg1n2ZPryWrWwhkdPpsOOmLq8KSMjICDnkew
        4KVMLw549RWTM2QC7FjMnDbnzujwkLBck9cPzeIRuFgUlEaW5Ml8jki2POiy1uk7
        WAIS+uA4+4Wl40VCLZNrAFgRUbwVtS/tCgGGPvCAO31vX9Tn/GW11T8pQ==
X-ME-Sender: <xms:1nHwZGvoZzQyj-fLxQYIVlEzV8-wD-8LSgecP_WB3v6ewlX4HfVDvg>
    <xme:1nHwZLczqP89Ct1KQTCpPI80lwm33SvkviEA0-LysxKUbcf3v_8L5HlLsUcg7MN_H
    yBx7tvI2I5uFg>
X-ME-Received: <xmr:1nHwZBzHKE8hGE9apipkcpoiNhwVPSolS2qM7HaA2Ox49wss3h1TW35lxPALXMxj6IoBmTXyDhUjtPkbBH6_qNsbD9LtUZuq-XQzUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudegtddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduie
    ffvddufeefleevtddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:1nHwZBNb83Gq6YyS37TNghrrA2oapr5wPZvjY4zq9po-IkNLqUfhxQ>
    <xmx:1nHwZG-dONQ1Ir6xy6mcpHyXPohtFqFmGAGVM4Kz8CruU5GMFQzf2g>
    <xmx:1nHwZJVexx4C704koNaVJCVwmq8PjEFI_11zDrMbkeKuI_zpeJgzUA>
    <xmx:13HwZIJJ6vMAhEtBsuoiXanqs0LRbc8P6_9i1mvH1cS5keKSq5wOeA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Aug 2023 06:56:22 -0400 (EDT)
Date:   Thu, 31 Aug 2023 12:56:20 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Message-ID: <2023083140-filtrate-ebook-082f@gregkh>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
 <bug-217670-208809-mthqKYqLLi@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-217670-208809-mthqKYqLLi@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 31, 2023 at 09:31:51AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=217670
> 
> --- Comment #11 from The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leemhuis.info) ---
> Greg, guess it fell through the cracks on your side then. You afaics intended
> to apply these to 5.15.y to fix the regression that was caused by backporting 
> 5c3d5ecf48a ("arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB
> nodes") [v6.1-rc1] to 5.15.y:
> 
> >>> 7bee318838890 usb: dwc3: reference clock period configuration
> >>> a5ae3cbe9dfcc usb: dwc3: Get clocks individually
> >>> 5114c3ee24875 usb: dwc3: Calculate REFCLKPER based on reference clock
> >>> 596c87856e08d usb: dwc3: Program GFLADJ
> >>> a6fc2f1b09278 usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
> 
> Thomas confirmed that they fix the regression here:
> https://bugzilla.kernel.org/show_bug.cgi?id=217670#c8

Those ids do not match up properly.  Can we please take this to email on
the stable@vger.kernel.org list?  I thought we resolved this there
already, if not, I need a real list of ids, in the correct order, to
apply please.

thanks,

greg k-h
