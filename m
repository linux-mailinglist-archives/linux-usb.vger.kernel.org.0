Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF6E764E9E1
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 12:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230317AbiLPLBD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 06:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbiLPLA6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 06:00:58 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D3E2AC0
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 03:00:56 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6B3915C0062;
        Fri, 16 Dec 2022 06:00:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 16 Dec 2022 06:00:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1671188456; x=1671274856; bh=vg+V55kKjH
        iiK0WqR1vA7obDS2PuZgFnXvKFCuA6ArI=; b=FLOlg2J6+9wthVLVLNJ1FWry6T
        4Iajug7W4N9ZjMUsm31+q/MNLoEJSIOgApu5okpxtzukjYcCFbZyvsqSRwAoRh1F
        alsUykoNbQ6jH1U6YQoH+TWf3uirXdq7Da1p9Lt/YhUKpuTwW8LUDHecHfC5mJg8
        NHGBbmO0SQz8g0yh7wMoYdBfgo0HYE/LpsOny/dWMj6zdhJpLeogp/rLtyDNWfdf
        E1/xH0a/U73VR3hdZlHSV2HToLXAPYz1RXzArtQ1hKtNjyymD8VZ2Ka4H/IbURbB
        yiMxcUBl8AKm/zW6JMCXdY9CiQQRa1x2/4XxFYYFzxgWDmFv9iKQNLxU911w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1671188456; x=1671274856; bh=vg+V55kKjHiiK0WqR1vA7obDS2Pu
        ZgFnXvKFCuA6ArI=; b=jFL+msxNYqnTPwkj6wthnXbM0R4+0tfMCu8noF+pGRz0
        RJz/xQnxoA/KIw1gx8PdBj3ISvl5gBfYPm+jQlPB+R1Cu2bEzYZg+paZWP+1dTG7
        FX6tyKBJ85tpTtfM52ev5Vkg/bgd0VspLggBg3qyEgvTS5HYZLdWBKDE4wWBeVct
        OXtjqNkAaG0HPnWiGtYU0dK2/TRAbK6XSg23/piUWDeSt7d778JF5+cXQnKsu218
        vb/1CS2tulapTw5K6z0HckFKRv+I3K26jghEfs8A+LxU330y/Q59MvYYDKEfQdFW
        IdC6Z3yy2r3DwdP504RyBneUJ0cS48Ca1JyrHAVncA==
X-ME-Sender: <xms:6E-cY7FBY1oA-FsZ8AKt9w8Cnignzj3mtQ1RBjClgqdtAO3eRSNGBg>
    <xme:6E-cY4Uaav71Z9litXKWYngWkQdrZ9YJKddA99Yr5e35eik3_GbQNXmXM_KPY8Squ
    YThlwXJ38ov6w>
X-ME-Received: <xmr:6E-cY9Ig_WY1bos63nVHJHSF2qnK5_9fP5QbB66tfu5uM3f6yn98ApuXEKZsaWD052udgVWjiekdSTinDXvof2rhC7Gw0YXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeejgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvve
    dvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:6E-cY5ERv-dreeOrJJi6MfS804oQ-yYB9yO9XIpSBAMXGowNoHM3bA>
    <xmx:6E-cYxWFEoLyfkgsAhW7rfquo_yPS9P4JpjHX2Z_ijfZ_OQsAKvxxg>
    <xmx:6E-cY0MktmuwWy9QpqJ4L4GtF0aW29kHw8e23No7yBIykz3tW2Qdow>
    <xmx:6E-cY-g_30hBf0YAH6ye5B1SanYYV3KDGmsHHVwg9PZTb2ogbtalZA>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Dec 2022 06:00:55 -0500 (EST)
Date:   Fri, 16 Dec 2022 12:00:54 +0100
From:   Greg KH <greg@kroah.com>
To:     Artem Egorkine <arteme@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] sound: line6: correct midi status byte when
 receiving data from podxt
Message-ID: <Y5xP5ihBfHXUA7Un@kroah.com>
References: <20221216100239.577805-1-arteme@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216100239.577805-1-arteme@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 16, 2022 at 12:02:38PM +0200, Artem Egorkine wrote:
> A PODxt device sends 0xb2, 0xc2 or 0xf2 as a status byte for MIDI
> messages over USB that should otherwise have a 0xb0, 0xc0 or 0xf0
> status byte. This is usually corrected by the driver on other OSes.
> 
> This fixes MIDI sysex messages sent by PODxt.
> 
> Signed-off-by: Artem Egorkine <arteme@gmail.com>

Note, you also add debug logic here, that should be a separate patch,
right?

thanks,

greg k-h
