Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF70532CF3
	for <lists+linux-usb@lfdr.de>; Tue, 24 May 2022 17:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237750AbiEXPHs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 May 2022 11:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235226AbiEXPHr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 May 2022 11:07:47 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E453D4B4
        for <linux-usb@vger.kernel.org>; Tue, 24 May 2022 08:07:46 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 50A695C01B5;
        Tue, 24 May 2022 11:07:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 24 May 2022 11:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1653404864; x=1653491264; bh=j4B4VXLg6Y
        AXQJkgNZQ5BDtjY50PVhjmyqw2wvlBo7c=; b=jOEG9q/oKCP1Zh/B25TwiDFQBr
        hhb+BEG1vG/5LQ67Fn9Uc11EHUCT/clWPspteWcqQ4qP9MTopW2vW01jdnuPJt2A
        VuG9KWVTC0L8weCpxjgbc/qHqx2CWoztnHqE37KOQo1DnYkT8cKsBttNQNs0w+Dq
        /nhlikDOWSaaJZaEaYSs11iY9tbUKiYWxmN28HcsFVyyRC0WqnzNEUgRV9xkGvDV
        riV6istN+dEVrYlLUuw+lLlq7HREsXGG8y8pNtWLFZVHMWfjcMSYKmEfYFC1o3ip
        eVRUjsLG8aJI7no6HwXSozJ/UOdRBWS/KOP59kI6pvsccS9RtG2qbDVkMtGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1653404864; x=1653491264; bh=j4B4VXLg6YAXQJkgNZQ5BDtjY50P
        Vhjmyqw2wvlBo7c=; b=OMBh1729LS06Mbyu9Rrj3hS6skBEMo04oBRJbmnnAFhG
        yjNR4BawFHzRACcT/Bg0Dixa8ahKItqNkH42N/kdztIV406K2aOYYDi8+U74laiL
        GUbhpBj0/fJ13pPGV9LnhJDC5M1QDvEXtOk2HN6UMbyVWpRYdyxxr9FMr3p1qRnE
        QvWRo3dRUg3fhLWH634mH/9uQNseBTFwJCAAmCXKdwdn0Lh0D8L85eW/QP+EP0I8
        IbL6/XzJmwUG9S6iElxPbfEQNvD/GdM6DRwK86rMF5/wdlLlI5+bEFUw0alVVT00
        lzDl3Ibk43zwGfMGU59ff+H2b1rfT9mhKAXMBIo4Wg==
X-ME-Sender: <xms:v_SMYsSddOWHLNnGtVvPJo3aX8a47IHRS1EcoYPszoM1gbjTI9H_eQ>
    <xme:v_SMYpxgCylNkEL3ZEDtU6a37htp6q3_LICHNiA23_kh_I9mpJFmTykEDrwaSlEY_
    YGzJPQv-yZJKA>
X-ME-Received: <xmr:v_SMYp2i1AEEgcQotWyeN8PPxaIWHh_K1lXez3R5yovn5COrKEbYIlH0NA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeefgdekhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiff
    dvudeffeelvedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:wPSMYgC3QSXa2FGrldk-ghYJ-n-SBHXEhHv7Zf6p1ShFMaZo4GwOHw>
    <xmx:wPSMYlivqNcV8FsZCCv0_gdA3n1GBu970MK2VqbSDqZX0AIzTHTZdQ>
    <xmx:wPSMYspUYtZPOyTFirhg94A3lKEGdr36pLgV31aeezYfvjyTQFsYZg>
    <xmx:wPSMYotPKU75Ze6kxIbBTZMRhG24-l4T80R77q4IvSQd3LGQv0Nd_A>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 May 2022 11:07:43 -0400 (EDT)
Date:   Tue, 24 May 2022 17:07:40 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 216020] New: drivers/usb/ folder compilation with
 allyesconfig fails
Message-ID: <Yoz0vGMOCDv1FlZc@kroah.com>
References: <bug-216020-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-216020-208809@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 24, 2022 at 02:58:45PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=216020
> 
>             Bug ID: 216020
>            Summary: drivers/usb/ folder compilation with allyesconfig
>                     fails
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.18
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: kushagra765@outlook.com
>         Regression: No
> 
> When compiling the drivers/usb/ folder with GCC version 12.1.0, the compilation
> fails with the following errors:

There are numerous errors when building the kernel with gcc 12.1 right
now.  It is being worked on, please see the development efforts on the
linux-kernel mailing list if you wish to help out.

Also, patches for this are always gladly accepted, no need to file a
bugzilla report for this.

thanks,

greg k-h
