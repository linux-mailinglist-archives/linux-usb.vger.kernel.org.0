Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 823A859856F
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 16:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245221AbiHROKA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 10:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245156AbiHROJ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 10:09:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303A278581
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 07:09:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0410615B0
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 14:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077BBC433C1;
        Thu, 18 Aug 2022 14:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660831795;
        bh=znqbortG4zqSG+a/vc4XDqCvBZ2yzmtzDvZizPCyf04=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rQ6xsbMH4+AqihIVVw5cVXKdcK2lY2F9vmgBupUZwEo9A2hHFhOyY2d8jJLlMh33o
         zogpDWwxnDtTFXgY6dyugqE6DtXWkVnRJJRnI4+/oSEEqfjgLrcRyie5jXpDjJ85Ec
         s2cGTS/l+wey9bNisbeHvdNiIfWzFwoFS0SU0U9DQLSmyjnnAvuc4sR52GJkoGv2ki
         PTTBu7Ce6hO+B8h6xoPMCHfRGHJNE7ir/vvEm4m+CeJObb2pV6PzEm62UbNnjuwokN
         4MzWIdSyBJH8rPg+HZQD6MljqyQ994O7s3mPQz2wcb5y3TNS61xSBoEYiTz8+SRxYu
         0Nvm6xQhaQYdw==
Received: by pali.im (Postfix)
        id 55070622; Thu, 18 Aug 2022 16:09:52 +0200 (CEST)
Date:   Thu, 18 Aug 2022 16:09:52 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and
 c_*speed for ASYNC_SPD_CUST
Message-ID: <20220818140952.r4c3plso4mm5s7jb@pali>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-7-kabel@kernel.org>
 <Yt06+wicNYMt/D7f@hovoldconsulting.com>
 <20220724123351.icqqvvfxjm7ogo5u@pali>
 <Yt1BIsPqAVH0ajlf@hovoldconsulting.com>
 <20220724125908.6vu3jveiaisvpocb@pali>
 <Yt1EOcRWi0LdKqrB@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yt1EOcRWi0LdKqrB@hovoldconsulting.com>
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

On Sunday 24 July 2022 15:08:09 Johan Hovold wrote:
> On Sun, Jul 24, 2022 at 02:59:08PM +0200, Pali Rohár wrote:
> > On Sunday 24 July 2022 14:54:58 Johan Hovold wrote:
> > > On Sun, Jul 24, 2022 at 02:33:51PM +0200, Pali Rohár wrote:
> 
> > > > What is updated is the real baudrate in c_ispeed and c_ospeed
> > > > extensions.
> > > > 
> > > > It is really wrong? I thought that c_cflag should stay unchanged at
> > > > B38400 when ASYNC_SPD_CUST is used.
> > > 
> > > Yeah, cflags stay unchanged, but you shouldn't touch those fields when
> > > using the deprecated ASYNC_SPD_CUST hack.
> > 
> > Hm... Why? I thought that new extended fields (c_ispeed and c_ospeed)
> > should contain current real speed. What is the reason that c_*speed
> > fields should have 38400 when ASYNC_SPD_CUST hack is set?
> 
> Because we shouldn't go adding new features built around the deprecated
> ASYNC_SPD_CUST hack.

But this is not a new feature in the old deprecated hack. It for the
new interface.

> User picks 38400, sets that flag and magic happens with some drivers for
> a while still while we look the other way.
> 
> This is not something that we should need to care about when using the
> new interfaces.

Exactly and with this patch it work like to described. User of new
interface does not have to care about old deprecated stuff and new
interface would always reports correct value.

> > > Note that this currently only works because the ftdi driver uses
> > > tty_get_baud_rate() instead of c_ospeed directly which is the
> > > recommended (new) way.
> > 
> > Yes, tty_get_baud_rate() helper function is there for this purpose,
> > right?
> 
> No.
> 
> Johan

So for what otherwise?
