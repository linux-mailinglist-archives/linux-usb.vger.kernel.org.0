Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C53E608FA5
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 23:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbiJVU7S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Oct 2022 16:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiJVU7Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Oct 2022 16:59:16 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E2417ABF
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 13:59:15 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 089765C0079;
        Sat, 22 Oct 2022 16:59:12 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Sat, 22 Oct 2022 16:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1666472352; x=1666558752; bh=R6RqZLSNk0
        sDgSzjq4E/Yl0TrBQeDeYATE3QDxyuXlA=; b=lFLB0nbTvrR8esrNdrABDGZDzf
        WyhqTp9Ip0aB3uUXC9YtAXBoE6L3QUu93x4wm9ylZgSi5NfdJMHnfZPOGXbg+edB
        Hoa6xaGv9JrsyxF3men/QEbmar7uLA3Wnj44ACOSYU4FelGGNoA6lCvDDZEWicqD
        iFaU1KvQsxHIUogA05t8UcuoMmyyo85lFdWZ4uvcY6R+fG+EGMZqoTWIWZWjQ7ky
        CJ8XTooMdi/iwuI6X0jIpzRVX4GQk8O1Ufa5FuGipUhvvnUW8tUr8cykRk8+Gt7S
        scVTKgPC7RG2ujgXpBDBIOGtjsgC7imDm/S1qaINsDOKx2Vzxy/yKtnHuESw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1666472352; x=1666558752; bh=R6RqZLSNk0sDgSzjq4E/Yl0TrBQe
        DeYATE3QDxyuXlA=; b=pXCOGiTKcSyAWryrqgVzgDh1yPFW4W8RZXGqeim0eDNi
        sd+IZB0i+MtuWsNRvyvMtaoTWAreLd/Mjd6mKtFod1s64nwTMsS5krfdgLzjG/ay
        Apx51LKqe6jY6Cgd76XHb0gWWQBHbX4HlcYmN/r8yuXVtwR/+y7K5ZlCz//PeCiR
        AzJd5rr98v9oqY1trc3M54JW8fGPc7t6LTit+XzkodbP23fcHTXOy+AABy/Ns8s4
        nn2NdIGKF3La8FE3Dv2gpRfo1+6waKg6pkTIf10n6bK7+GAtILwJrBEd+OzNZH4j
        IlZAURO5PXe+MQDe4enDweEI6jw1Q6rF4eSLKZF9cg==
X-ME-Sender: <xms:n1lUYx4VS2lb8kjdCRj9bJpCVJJsu6Y6d8QOMCChowcEZ2WXb5qWOA>
    <xme:n1lUY-4Njw2cQS8JLTZtmiN_zIhpaZguGYyu7etGn3--vKYCk01OqtwABh21TEITa
    OmvdSk2kgBkiXe_Ry4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedttddgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:n1lUY4caNX9uSKt5y63z-Jw_TtEhvCT1j8WUJYPyZxhbvcO0IwXtvA>
    <xmx:n1lUY6IByaqmLi5NMQuClPJL0Vz1jtMqaa1UcyaXqUbjOtXr2Ww66g>
    <xmx:n1lUY1ICqYiUg4Ti-OWLViDJ-Kw5i7sehLF8oK-creScJHnsAYIWuw>
    <xmx:oFlUY8VH35b0ysL-J2nq3BdaYlE6GSy_fqmQl_h7XJ2q1XaLo1aj3w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 594D2B60086; Sat, 22 Oct 2022 16:59:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <7e16694e-c52a-4e8f-b138-e22c8ed3f136@app.fastmail.com>
In-Reply-To: <202210230210.NvXmltv5-lkp@intel.com>
References: <202210230210.NvXmltv5-lkp@intel.com>
Date:   Sat, 22 Oct 2022 22:58:51 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "kernel test robot" <lkp@intel.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [usb:usb-testing 12/23] arch/arm/mach-s3c/devs.c:30:10: fatal error:
 'linux/platform_data/s3c-hsudc.h' file not found
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 22, 2022, at 20:04, kernel test robot wrote:
>
> All errors (new ones prefixed by >>):
>
>>> arch/arm/mach-s3c/devs.c:30:10: fatal error: 'linux/platform_data/s3c-hsudc.h' file not found
>    #include <linux/platform_data/s3c-hsudc.h>
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Ah right, so the patch that removed the #include is in a separate branch
and not yet in linux-next. It might be easier if I just take this patch
through the soc tree as well.

      Arnd
