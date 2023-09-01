Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106B578FE20
	for <lists+linux-usb@lfdr.de>; Fri,  1 Sep 2023 15:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239166AbjIANOm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Sep 2023 09:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjIANOm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Sep 2023 09:14:42 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB365E7E
        for <linux-usb@vger.kernel.org>; Fri,  1 Sep 2023 06:14:38 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id BA60F5C01D5;
        Fri,  1 Sep 2023 09:14:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 01 Sep 2023 09:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1693574075; x=1693660475; bh=ZU
        JFGHhbWjFzQsQYgwKZ6OyaXhkZ5QHox3l6mSRvs5k=; b=NsfuG+0ueAZ8UjVvLW
        EzRYebDDiSn4pkJn2eDYCvACEQf+/yMZuNFsNSlz7eFKrHeS/Ef2tfD8YJj/85IG
        LvWpZkm585X+jZHbsrLK+d5eurQ4bgJ76qu6M0i6BIFjUPA3NlgVqTlxcZ4t9Gk4
        eZd8v3Ms4R1JKkODsPfOwDK2cDOSRnG0csQo1HETqDDP+1IopjtTKAizNaw7IUFE
        /ZO9MLKB90rVKMXOBy0TJ2NghRjz9nJJSYRjdwZsMZEVHzAph3xf4gm+m1fROeuJ
        04toM3Ys4TLfx8oMcY+HFXNisIMDHQh337QKIMcSlH8up+5OT1fuupnRRiyCbnvM
        3qcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1693574075; x=1693660475; bh=ZUJFGHhbWjFzQ
        sQYgwKZ6OyaXhkZ5QHox3l6mSRvs5k=; b=sJtxHVW+n0KIquIsJMaIfVLY93l7T
        csnkJEaJ2S/Jn0TO6xqOP0F0gU947BBOI8Ky+NfwLYHUpfVYbdnMBESVkQ9RNuM2
        EVe+mxGiKcKg1UxYa6swvPTjsEcQVLKLsvtFnCGl8KjxbNfE36GyPqKsxq+vO5OA
        iZZUhVUETRdF/qzsALzoSMEvPSeH1XIlEKjV5H5uRjkQg3gv/VUx9N+5o1uBE01I
        I1Rm/wdpflaijqxCyeDnjULZ+H186tSh/P7FM5lzOUNNrdThIgd6mqMqTw7vwzWV
        ssAEiHR4FOLbBt/uVl/AF4Etpw2DhqK+GbNnR6aMU5HsfXNyUPegW6bKA==
X-ME-Sender: <xms:u-PxZKs9YkX_FjG3CaZlPK1B1Q8y5bLbFSsHu0MNOS1_-8l-uD4C0Q>
    <xme:u-PxZPf_1TleqzzTa964c8jTKE9NAoDwwcGWXYJjQzRI92kXbtJ5A8dOaHZwNsifq
    r0EG6NSUAPwWg>
X-ME-Received: <xmr:u-PxZFw-KgWN9zCaQrE_03f8PWsmFjBTHY7VFXvF7hlwX5Wq6YtFq9Upzlx-vz-nRGuOX2WMFj0P8T4fiprlLrBUvdaAONk-gNzq0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
    ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
    qeenucggtffrrghtthgvrhhnpeegheeuhefgtdeluddtleekfeegjeetgeeikeehfeduie
    ffvddufeefleevtddtvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:u-PxZFOhtrB-Yo1_BWt-enkxdguJrBBFuMjsMNfwyRqM4NNw3yTKJQ>
    <xmx:u-PxZK8Ge0FVllzfkbvEXrGtCcoOH-wO0S7K-AA4QeyZBF65mhOQhA>
    <xmx:u-PxZNWundVoFh7ujeE60yVwDsd2lHqVsgHtlhg4E_FkbxncxxaCrQ>
    <xmx:u-PxZMKaGD-s3-GXZGw9JxMrnOP2FVKa7jSG8TuKRAZyEu6zt-zYeg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Sep 2023 09:14:35 -0400 (EDT)
Date:   Fri, 1 Sep 2023 15:14:32 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Message-ID: <2023090123-entail-uneatable-3796@gregkh>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
 <bug-217670-208809-n7b2fLHqQy@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-217670-208809-n7b2fLHqQy@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 01, 2023 at 12:57:47PM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=217670
> 
> --- Comment #24 from Tomasz Rostanski (tomasz.rostanski@thalesgroup.com) ---
> I have attached rebased patches against 5.15.129:
> 0001-usb-dwc3-reference-clock-period-configuration.patch
> 0002-usb-dwc3-Get-clocks-individually.patch
> 0003-usb-dwc3-Calculate-REFCLKPER-based-on-reference-cloc.patch
> 0004-usb-dwc3-Program-GFLADJ.patch
> 0005-usb-dwc3-core-add-gfladj_refclk_lpm_sel-quirk.patch
> apply with git am.

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
