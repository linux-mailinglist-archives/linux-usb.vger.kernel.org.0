Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DEA754F23
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jul 2023 17:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjGPO77 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jul 2023 10:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjGPO76 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jul 2023 10:59:58 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016AC1B7
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 07:59:57 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 5C5D55C00B5;
        Sun, 16 Jul 2023 10:59:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 16 Jul 2023 10:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1689519597; x=1689605997; bh=pf
        REtiOiKN4h58YkZFBN2MSi4TAeWLsomHYGgjYaCRc=; b=Lu0dahzr6zggu/TvVa
        Q4FQA7KtbHMFCeY5HivSNMSt8/MPw9iSncch7cTHKKAJZMVYtVt+62qMNDY3rQj5
        MYM/doBEDi0VsbfVznz5CSDBqyxl7YWwDIfk09uQkazK7oEUEi1SN+a57YJh6CWd
        bcN4wu8eWlDjIFV0KeNgokUBWQhpEjxDeNUogJO8Ag80bmN4t+WBQ8tYGceU0N5q
        54Qo1HFNdNAsjVQkIdnia8az5+R0Chg0sGnmGdDLEoYfeXK2E5Rh99984TODvmnP
        QiHqbIb1Nr2eWhyt+/yUfn/BjZ4a1LdR6WwuW3qNHFG8ZK3uCL7In/Zz+fjHjGJs
        CmRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1689519597; x=1689605997; bh=pfREtiOiKN4h5
        8YkZFBN2MSi4TAeWLsomHYGgjYaCRc=; b=xvb17eqLpUMD/XR3lKeteE/xi03l5
        zIO+LQaRPbCUo+uuksIEPiULbtlBoxBon8D+RCNSYuDAOATv6rByJvFRXCT4TNkB
        sJlxY3YNhiuEtCqseaumMWEt+rFGVJ2MLzGFk1p1MUdDiqoUyp/6USStnDJbBgWb
        ZBz0jnD1FevDVCQSFar0+9uV6oydov6tUNOxM217HWOOp6l3p9RLeXjZjTwkieGg
        axpsxTs/1dhrzfP9q+SUV3Cyn3wglS/7IAnCuqO5+MEvnB5xajIktR9GKehC6noZ
        cAPhpaAsSUpxQFInm2cLEOqNbeBkzNc5j6DevOHUiNyc797MBiYHfIg0g==
X-ME-Sender: <xms:7QW0ZPrQjUvC-mzOOBzFeh-anhoS_BMMHel9GZoV1F8IFMy_7ZdRww>
    <xme:7QW0ZJqykE_WHQdFi_0v1P-s9BCPRMvFSnQY17C__DdmFCzS0vGe_SyBHgdua5tZv
    d3-mfUYSGPeVA>
X-ME-Received: <xmr:7QW0ZMO_agqlFCWzSJXG49fih7sJiFg5wvCWlGyFuo7lPjnbygarjHGSQ7svxvfgvuHzAapVs0v2YMomzJfidW03oEevzbzEJUckk-k3yRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrgedtgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiff
    dvudeffeelvedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:7QW0ZC5EZH6jRuXSJqqMgUSPAXcsm3boDuRlMSkzmG33FbbvGD9g8Q>
    <xmx:7QW0ZO4fnuB398ALSrNlL8mAyQRB2AY36zsEAerznvkFX_qRlf95vg>
    <xmx:7QW0ZKgIUgih5a92fCcQENmFyheF7tVsDjaaUJd4qm0uwW5ODlUK8g>
    <xmx:7QW0ZOH8Z1biXDH8G4KDIP93rngf8dY754d29dLUwmqLXjSzAPSO5g>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jul 2023 10:59:56 -0400 (EDT)
Date:   Sun, 16 Jul 2023 16:59:37 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 217670] New: Regression in USB DWC3 driver in kernel 5.15
 branch
Message-ID: <2023071621-relation-unlocking-93ed@gregkh>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 14, 2023 at 01:18:29PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=217670
> 
>             Bug ID: 217670
>            Summary: Regression in USB DWC3 driver in kernel 5.15 branch
>            Product: Drivers
>            Version: 2.5
>           Hardware: ARM
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: tomasz.rostanski@thalesgroup.com
>         Regression: No
> 
> The backport commit to 5.15 branch:
> 9d4f84a15f9c9727bc07f59d9dafc89e65aadb34 "arm64: dts: imx8mp: Add
> snps,gfladj-refclk-lpm-sel quirk to USB nodes"  (from upstream commit
> 5c3d5ecf48ab06c709c012bf1e8f0c91e1fcd7ad)
> switched from "snps,dis-u2-freeclk-exists-quirk" to
> "snps,gfladj-refclk-lpm-sel-quirk".
> 
> The problem is that the gfladj-refclk-lpm-sel-quirk quirk is not implemented /
> backported to 5.15 branch.
> 
> This commit should be either reverted, or the commit introducing
> gfladj-refclk-lpm-sel-quirk needs to be merged to 5.15 kernel branch.

What commit exactly needs to be backported?

thanks,

greg k-h
