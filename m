Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1BB074F12D
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jul 2023 16:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbjGKOHC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jul 2023 10:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbjGKOHA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jul 2023 10:07:00 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2627610CB
        for <linux-usb@vger.kernel.org>; Tue, 11 Jul 2023 07:06:59 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 1865D5C0120;
        Tue, 11 Jul 2023 10:06:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 11 Jul 2023 10:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1689084415; x=1689170815; bh=i4
        mOetI070V8dCW9A9Abc526GH4dhWkaeqJRqFS9x5U=; b=0XB99zT5EBl9JSdbbh
        EA2xmzSc4zoeOZHC8NUSOwQftnhtcH2SCJWXDHbI/PJfbQyh0MaCOteFh/ZynaDA
        7KB0zNLcyyS//nPCM5XN9WZ78mh7o4S3wQjEKaLfNqzZYYpwmSsdW21d2wkzPgBt
        10aIk3MLGF2eUTKVV0vs6QQokoLGJlDHK8klGbYJKEImqCEEWu0MaYcbcvdzB0IM
        9otiHBzi8xoQraVU4NkM3hvm12w9fbxPGNOgvRNBEYjOuwywuZUISwObc0RNmbgn
        RUAAPsWx6oz7k3Iw3V4dLacaywHzQi9xw4qJpBQH+G5uYQLFl3dLCKuAEdlLpW+7
        rdJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1689084415; x=1689170815; bh=i4mOetI070V8d
        CW9A9Abc526GH4dhWkaeqJRqFS9x5U=; b=BMRT87pboNKOYBPbZtP9kpte3QsEs
        FHQuLuEIpzdgmlo/3JzD/ipzwGVv6qJlK62ZZlKE5/UAKKTr0V+as1uVDScZJO+e
        IxpKUP894xmgguVZqAoj1kTdfcyqjORFFTZSrLfdhUx9hgs/DZLSgHdaYgrCYoJn
        d7Q3NOPSGQmPZgdUF7k+OnXJSJUgogddbtD6SWVIBpzfMDTDu75D90a9emnDzfFb
        NeXTmxtQGAz3mlN8T5KcwvS4Mn9F1M7EdvHO0XM8KejDTO7tB/M6i5fgSrVWAso5
        n4/Mn+tcEK2iWEVfDBSeu3EMgZIo5XcdPxxeu2iBASZXJ4z9vBJJRXYeQ==
X-ME-Sender: <xms:_mGtZBKjl1ljBfJfe_TRLcgCNy2Ye2LkLhSlXVyl4R4oKwmG9B4BgQ>
    <xme:_mGtZNK2oJrtRvQy1YlM3UOP1vX-UNJ_fsa0bt-JJ5s4A3qyJx6J6tY6-q8URRfq1
    qJLoD0T4k8-Xg>
X-ME-Received: <xmr:_mGtZJvbptcVckjb6J2POF0u3q1asWJhtSnmzLcCVegCw1MqRSXfav6fI-qAyMdvkHGe40ZgepQHqe31YM68fasQnBxFJFCIJWLFpse0Aeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:_mGtZCYvIN056CTPtyALjkuk2OOmZ2flPGtQhlwWBCQjulG9XTgqZA>
    <xmx:_mGtZIb7W7j097p78BKWFvb9NMjfjO4Xa_Qhx7UgQCxU7IQ4_tF4lw>
    <xmx:_mGtZGAYk7flsodbrKTC6g7tnZgLV1tYf1uDvUouQEZzP_1MN_rCzA>
    <xmx:_2GtZESYOq0wTKJL9wv4lb0PNrCC2jrA-OCw8PUFC__5-F12UHnbdw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jul 2023 10:06:54 -0400 (EDT)
Date:   Tue, 11 Jul 2023 16:06:52 +0200
From:   Greg KH <greg@kroah.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     mika.westerberg@linux.intel.com, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH] thunderbolt: Fix Thunderbolt 3 display flickering issue
 on 2nd hot plug onwards
Message-ID: <2023071115-makeshift-babbling-530a@gregkh>
References: <1689060470-88947-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689060470-88947-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 11, 2023 at 02:27:50AM -0500, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> Previously, on unplug events, the TMU mode was disabled first
> followed by the Time Synchronization Handshake, irrespective of
> whether the tb_switch_tmu_rate_write() API was successful or not.
> 
> However, this caused a problem with Thunderbolt 3 (TBT3)
> devices, as the TSPacketInterval bits were always enabled by default,
> leading the host router to assume that the device router's TMU was
> already enabled and preventing it from initiating the Time
> Synchronization Handshake. As a result, TBT3 monitors experienced
> display flickering from the second hot plug onwards.
> 
> To address this issue, we have modified the code to only disable the
> Time Synchronization Handshake during TMU disable if the
> tb_switch_tmu_rate_write() function is successful. This ensures that
> the TBT3 devices function correctly and eliminates the display
> flickering issue.
> 
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>

If "Sanath S" authored this patch, then the From: line is incorrect.

If they did not, then the ordering here is incorrect.

Either way, this isn't correct at all, please fix.

thanks,

greg k-h
