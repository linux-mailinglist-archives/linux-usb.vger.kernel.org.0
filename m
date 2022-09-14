Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2E65B8388
	for <lists+linux-usb@lfdr.de>; Wed, 14 Sep 2022 10:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiINI74 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Sep 2022 04:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbiINI72 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Sep 2022 04:59:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5967548D
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 01:58:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 48596B816E1
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 08:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0668BC433B5;
        Wed, 14 Sep 2022 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663145927;
        bh=lvIQtt0FoHOJfVH6CB78zDkn+jpZJ6Nd/EgZ1J7I5TA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QXGjBeTsmEQq80VVbVQOJAIGgPt74ILUhGP5z952wyNcXFn3NZPWcoi0epi9WYLmJ
         GbIXZ3yFr6gHzhSH6kF3SwrGDoBW6enA3X8lEiF8/8nXwfZdLfDfoyHkddiwhMh8bH
         CupAbsC5Vqb5Pv2fASb++KygiNFICxad2MPD+PhZVpVlPwABpNFBjm+0bJNIzj83Gv
         hvGojxeccRVk0IrQldrMk0npPAgSkcckwjQ5skHzohej/7h2h+L0iv8AvBKfnmX8lL
         apT0WjnSHV5aPB1jPv3q8CAm9uGHKSB3G/ftOsKtEaxh9xjlBSSorQza+lrKF1ouFf
         UUDo3pM2AXiDg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oYOEK-00017u-8l; Wed, 14 Sep 2022 10:58:48 +0200
Date:   Wed, 14 Sep 2022 10:58:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and
 c_*speed for ASYNC_SPD_CUST
Message-ID: <YyGXyGvmAD4G1h2b@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-7-kabel@kernel.org>
 <Yt06+wicNYMt/D7f@hovoldconsulting.com>
 <20220724123351.icqqvvfxjm7ogo5u@pali>
 <Yt1BIsPqAVH0ajlf@hovoldconsulting.com>
 <20220724125908.6vu3jveiaisvpocb@pali>
 <Yt1EOcRWi0LdKqrB@hovoldconsulting.com>
 <20220818140952.r4c3plso4mm5s7jb@pali>
 <YyCayj7H/3My2amz@hovoldconsulting.com>
 <20220914084831.wboticmzy33guzam@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220914084831.wboticmzy33guzam@pali>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 14, 2022 at 10:48:31AM +0200, Pali Rohár wrote:
> On Tuesday 13 September 2022 16:59:22 Johan Hovold wrote:
> > On Thu, Aug 18, 2022 at 04:09:52PM +0200, Pali Rohár wrote:
> > > On Sunday 24 July 2022 15:08:09 Johan Hovold wrote:
> > > > On Sun, Jul 24, 2022 at 02:59:08PM +0200, Pali Rohár wrote:
> > > > > On Sunday 24 July 2022 14:54:58 Johan Hovold wrote:
> > > > > > On Sun, Jul 24, 2022 at 02:33:51PM +0200, Pali Rohár wrote:
> > > > 
> > > > > > > What is updated is the real baudrate in c_ispeed and c_ospeed
> > > > > > > extensions.
> > > > > > > 
> > > > > > > It is really wrong? I thought that c_cflag should stay unchanged at
> > > > > > > B38400 when ASYNC_SPD_CUST is used.
> > > > > > 
> > > > > > Yeah, cflags stay unchanged, but you shouldn't touch those fields when
> > > > > > using the deprecated ASYNC_SPD_CUST hack.
> > > > > 
> > > > > Hm... Why? I thought that new extended fields (c_ispeed and c_ospeed)
> > > > > should contain current real speed. What is the reason that c_*speed
> > > > > fields should have 38400 when ASYNC_SPD_CUST hack is set?
> > > > 
> > > > Because we shouldn't go adding new features built around the deprecated
> > > > ASYNC_SPD_CUST hack.
> > > 
> > > But this is not a new feature in the old deprecated hack. It for the
> > > new interface.
> > 
> > I think I understand what you're getting at, but no. Let's not add more
> > features built around ASYNC_SPD_CUST.

> Seems that you did not understand the point. So I will try to explain it
> again. This is not a new feature for _old_ ASYNC_SPD_CUST. This is the
> fix for the _new_ TCGETS2 API, to ensure that driver will always returns
> corrects values in c_*speed fields. If driver is not going to fix this
> _new_ TCGETS2 API then there is _NO_ point to use this new API in
> userspace and it is better to stick with the old ASYNC_SPD_CUST. And
> this is the current userspace state. So based on your input, it is the
> time to deprecate TCGETS2?

Stop being silly. As I've said repeatedly, we don't care about
ASYNC_SPD_CUST. Just return 38400 regardless of whatever magic happens
behind the scenes with the TIOCSSERIAL ioctl.

Johan
