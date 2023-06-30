Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6A9743C47
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 14:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjF3MwW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 08:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjF3MwT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 08:52:19 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58892D4A
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 05:52:17 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id D39825C16EA;
        Fri, 30 Jun 2023 08:52:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 30 Jun 2023 08:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1688129533; x=1688215933; bh=gL
        Y6aS12Klissc4iSyunFOig24iLdlTneA+7thUQPr0=; b=y/9WqzhpxbxsS6hhKk
        KRjiZzX6u/TY3NwQMZdo2IEJXjjsEAa9MBzFPrwWDF3MeQHJyaeaswVnz4DGoIbP
        PBQeJsoHtFkW0ObJhFIznG+bAFXXD0s6mtYNbNEkj07J9BxNU/8qVA6meuiNxV3G
        Awyd8G9Jbg2ZSai7qCKMA/ru0X+S7+rEV+aR+xqA6FWMhWM4ZOIkQgdo3+5ECrTS
        rgv767SqOFhhoF8mg02K1+bBFDSwkVFtkbxmr5NAAGjaZ1qcklQruukxkWar6joW
        PAqH/bLjVbj8TZlqgZxK9H+FoKpoHAOD4ISkmHlqA5lRQ0lwxxsSA7LPYW3k3aRG
        mzMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1688129533; x=1688215933; bh=gLY6aS12Kliss
        c4iSyunFOig24iLdlTneA+7thUQPr0=; b=Be/ExcapboA7zT4lyEgyVezrmyBa7
        zge5F03mYld+Wmz+d3Cj3u/ZurmLuIrB7Lihr5alS8BVz766gw647HH7ivgaTq+k
        fWi8FLZPYKAyNNUzrDFv37puzVT/CTY8457UxEDOn0QZqEuQYs0z3fhm6OCkV7fq
        LikS7cVRGHmfhb8/l4i4sU9FTpG6IPgv/omcUQQFlciU6PgozcP9VREVHJQqRuNz
        XmK4Qj1Zzxx+VCl1ayFLId8PLrSvAq2rBy8mAle66rQm3sNvUNABIyRs/4VciUtY
        tPPdgIO3pHad6Fry1h8DWXrifUUuu4Ov4JuAq6VLZAMBcsqgo+NcYfmmg==
X-ME-Sender: <xms:_c-eZFVKH2i7h-kQTdzl0JFMkVMU-Yq4ADS6ixzPEnGU8x4lf6Z6YQ>
    <xme:_c-eZFkgbfZY3Biwnge7Y5-t_2iucDVyPBD4SV4OtumfrPdGP5tXAzvdQyF1mhHzo
    caMXnHWMiU2hA>
X-ME-Received: <xmr:_c-eZBYU8-5hvWa__w22JxGvojCNR2T7kANc03mc7O39g1Ia-JOK0hvWY4sVVJGT2tG6PO1wFkg5vSNZklDPdmdVcAO0om3VjsumEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeigdehiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:_c-eZIW9tv7j0HpqMPL432wnkAjijojyQMZ3jsTUkV1yOCJMBjPvfw>
    <xmx:_c-eZPnz8-qr_hZ90pLqpb1WoG1p0zovGZhk0zcFMJWihgc5rChG6g>
    <xmx:_c-eZFczg4-n94T114WexNkha6AFufeCjB2iP9kxfPsXlf8eIuCfjg>
    <xmx:_c-eZEwnwnQaBOxf1IlWfo-A6VGSEPXxClNXTFRW9XrEO05HrV9srA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 08:52:13 -0400 (EDT)
Date:   Fri, 30 Jun 2023 14:52:10 +0200
From:   Greg KH <greg@kroah.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Thunderbolt/USB4 maintenance on vacation during July
Message-ID: <2023063000-define-cardboard-ead6@gregkh>
References: <20230630081350.GR14638@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630081350.GR14638@black.fi.intel.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 30, 2023 at 11:13:50AM +0300, Mika Westerberg wrote:
> Dear all,
> 
> It is that time of the year again :) Finland is pretty much closing up
> as people are heading for a well deserved vacation during the July. This
> puts the Thunderbolt/USB4 into "vacation mode" too but I will be back in
> August gathering whatever was sent to me.
> 
> I wish everyone good summer, remember to relax! See you again in August :)

Nice, have a great break!

greg k-h
