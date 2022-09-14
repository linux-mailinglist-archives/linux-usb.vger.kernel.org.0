Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC525B84D7
	for <lists+linux-usb@lfdr.de>; Wed, 14 Sep 2022 11:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiINJV7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Sep 2022 05:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbiINJVp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Sep 2022 05:21:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D03981B3B
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 02:11:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3D4061A32
        for <linux-usb@vger.kernel.org>; Wed, 14 Sep 2022 09:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11E4C433D6;
        Wed, 14 Sep 2022 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663146610;
        bh=j+dbOBrG+KbPw8VXez2eFLciNY8VHvjZdgcS5u7IZqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KduSG7gxKGZoDDJL7JfSHQBnH9H4TvFg/PJSekXyjkO7r0Y5DsoPEPxJTDiqI7JCc
         goIePbxIs6d5AL5gPKKBXtzkgn5wqHZVwtBgJgoaN2lHW2yJRJJgrg6MdQob43qaGF
         L94/19tdP+nJ6DlXUjjyYLps616xyxoclOwZWzSncJG/WGUM1sC9fA+NP5fWWySoXj
         nP8+D8okao77T8IhNCx9qVjeYeIM9AHvfo4RU4vKIE/VfS2GQezqVRgNVH3kal4e2v
         EDguFIjvQLi1hsxTxZRF3oj5Bq6q6syZU2ZPXiCxWHfxvBzmfyRfckRDs78K+Fai8i
         ndaA8EO5f2Qvg==
Received: by pali.im (Postfix)
        id EBE677B8; Wed, 14 Sep 2022 11:10:06 +0200 (CEST)
Date:   Wed, 14 Sep 2022 11:10:06 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and
 c_*speed for ASYNC_SPD_CUST
Message-ID: <20220914091006.bltnzb4gmwomc3yo@pali>
References: <20220712115306.26471-7-kabel@kernel.org>
 <Yt06+wicNYMt/D7f@hovoldconsulting.com>
 <20220724123351.icqqvvfxjm7ogo5u@pali>
 <Yt1BIsPqAVH0ajlf@hovoldconsulting.com>
 <20220724125908.6vu3jveiaisvpocb@pali>
 <Yt1EOcRWi0LdKqrB@hovoldconsulting.com>
 <20220818140952.r4c3plso4mm5s7jb@pali>
 <YyCayj7H/3My2amz@hovoldconsulting.com>
 <20220914084831.wboticmzy33guzam@pali>
 <YyGXyGvmAD4G1h2b@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyGXyGvmAD4G1h2b@hovoldconsulting.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wednesday 14 September 2022 10:58:48 Johan Hovold wrote:
> On Wed, Sep 14, 2022 at 10:48:31AM +0200, Pali Rohár wrote:
> > On Tuesday 13 September 2022 16:59:22 Johan Hovold wrote:
> > > On Thu, Aug 18, 2022 at 04:09:52PM +0200, Pali Rohár wrote:
> > > > On Sunday 24 July 2022 15:08:09 Johan Hovold wrote:
> > > > > On Sun, Jul 24, 2022 at 02:59:08PM +0200, Pali Rohár wrote:
> > > > > > On Sunday 24 July 2022 14:54:58 Johan Hovold wrote:
> > > > > > > On Sun, Jul 24, 2022 at 02:33:51PM +0200, Pali Rohár wrote:
> > > > > 
> > > > > > > > What is updated is the real baudrate in c_ispeed and c_ospeed
> > > > > > > > extensions.
> > > > > > > > 
> > > > > > > > It is really wrong? I thought that c_cflag should stay unchanged at
> > > > > > > > B38400 when ASYNC_SPD_CUST is used.
> > > > > > > 
> > > > > > > Yeah, cflags stay unchanged, but you shouldn't touch those fields when
> > > > > > > using the deprecated ASYNC_SPD_CUST hack.
> > > > > > 
> > > > > > Hm... Why? I thought that new extended fields (c_ispeed and c_ospeed)
> > > > > > should contain current real speed. What is the reason that c_*speed
> > > > > > fields should have 38400 when ASYNC_SPD_CUST hack is set?
> > > > > 
> > > > > Because we shouldn't go adding new features built around the deprecated
> > > > > ASYNC_SPD_CUST hack.
> > > > 
> > > > But this is not a new feature in the old deprecated hack. It for the
> > > > new interface.
> > > 
> > > I think I understand what you're getting at, but no. Let's not add more
> > > features built around ASYNC_SPD_CUST.
> 
> > Seems that you did not understand the point. So I will try to explain it
> > again. This is not a new feature for _old_ ASYNC_SPD_CUST. This is the
> > fix for the _new_ TCGETS2 API, to ensure that driver will always returns
> > corrects values in c_*speed fields. If driver is not going to fix this
> > _new_ TCGETS2 API then there is _NO_ point to use this new API in
> > userspace and it is better to stick with the old ASYNC_SPD_CUST. And
> > this is the current userspace state. So based on your input, it is the
> > time to deprecate TCGETS2?
> 
> Stop being silly. As I've said repeatedly, we don't care about
> ASYNC_SPD_CUST. Just return 38400 regardless of whatever magic happens
> behind the scenes with the TIOCSSERIAL ioctl.
> 
> Johan

I'm not silly here. Look, those APIs are for userspace. And if userspace
application cannot use this new TCGETS2 API (for more reasons) then they
stick with the old one TIOCSSERIAL. And your inputs just say that it is
not a good idea to switch TCGETS2 as this API stay broken in some
drivers. Silly is the one who do not see (or do not want to see it;
because of own API perfectionism) the reasons why new "proposed API" is
still not (widely) used and applications stick with TCGETS + TIOCSSERIAL.

That is why I'm asking, it is time to starting deprecating TCGETS2 and
create for example TCGETS3? Only just few application use TCGETS2, so
deprecation of TCGETS2 can be done _now_ without pain as this API is not
widely used.
