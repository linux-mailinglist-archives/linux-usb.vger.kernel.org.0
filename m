Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD3F5B76A9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 18:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbiIMQoK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 12:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiIMQnu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 12:43:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5010F5F7F1
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 08:38:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1297561494
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 14:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755B5C433D6;
        Tue, 13 Sep 2022 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663081162;
        bh=cSyvyJwD0x8+qqSmJj0XCYGahbowAcdGRoyBTXyPor8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IVCKBlhJzSK+9aSh4XcInsSlG6hpkQy3R1GZgLl9lRVfsgHG0AcG68hLHFIKoA+o7
         vhbovW/0id/CAyH8gKC5kUhMZPwtY4YY/lhPjq4Z90MigAJEA2RXy457MA2vNUAP0r
         gymgaXVj5A8bHSqZK4oTiUCtoRExAj9DSpuhY2G2URuFyoeKezCjE2rz9bekOcj5jk
         OLA3S7cgKe1/umlB8CUwyZFakdwVM4tyCHGW1iTi9qD89kZALDoigMN03hTTQw8v1H
         QQCXoPG6P56qu4v4YIsxEe4btBAJQ0jsZ7sJWm6b1kJVFlZqlQXwhlKnVIrFmmsDyL
         JBED4yqQU8jCw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY7Ni-0005Rz-6e; Tue, 13 Sep 2022 16:59:22 +0200
Date:   Tue, 13 Sep 2022 16:59:22 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 6/7] USB: serial: ftdi_sio: Fix custom_divisor and
 c_*speed for ASYNC_SPD_CUST
Message-ID: <YyCayj7H/3My2amz@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-7-kabel@kernel.org>
 <Yt06+wicNYMt/D7f@hovoldconsulting.com>
 <20220724123351.icqqvvfxjm7ogo5u@pali>
 <Yt1BIsPqAVH0ajlf@hovoldconsulting.com>
 <20220724125908.6vu3jveiaisvpocb@pali>
 <Yt1EOcRWi0LdKqrB@hovoldconsulting.com>
 <20220818140952.r4c3plso4mm5s7jb@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818140952.r4c3plso4mm5s7jb@pali>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 18, 2022 at 04:09:52PM +0200, Pali Rohár wrote:
> On Sunday 24 July 2022 15:08:09 Johan Hovold wrote:
> > On Sun, Jul 24, 2022 at 02:59:08PM +0200, Pali Rohár wrote:
> > > On Sunday 24 July 2022 14:54:58 Johan Hovold wrote:
> > > > On Sun, Jul 24, 2022 at 02:33:51PM +0200, Pali Rohár wrote:
> > 
> > > > > What is updated is the real baudrate in c_ispeed and c_ospeed
> > > > > extensions.
> > > > > 
> > > > > It is really wrong? I thought that c_cflag should stay unchanged at
> > > > > B38400 when ASYNC_SPD_CUST is used.
> > > > 
> > > > Yeah, cflags stay unchanged, but you shouldn't touch those fields when
> > > > using the deprecated ASYNC_SPD_CUST hack.
> > > 
> > > Hm... Why? I thought that new extended fields (c_ispeed and c_ospeed)
> > > should contain current real speed. What is the reason that c_*speed
> > > fields should have 38400 when ASYNC_SPD_CUST hack is set?
> > 
> > Because we shouldn't go adding new features built around the deprecated
> > ASYNC_SPD_CUST hack.
> 
> But this is not a new feature in the old deprecated hack. It for the
> new interface.

I think I understand what you're getting at, but no. Let's not add more
features built around ASYNC_SPD_CUST.

Johan
