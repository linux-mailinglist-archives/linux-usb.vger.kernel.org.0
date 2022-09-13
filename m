Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2B35B76C7
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 18:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiIMQxP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 12:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiIMQw5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 12:52:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C37EC00E1
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 08:46:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 678AEB8100F
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 15:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9175C433D6;
        Tue, 13 Sep 2022 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663083054;
        bh=VR7w4CTX9FNj6/waqQ58KRcwy2g07j+T75IYsUkmpCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bg7Z/UT9V6BdGGO4OCj8U5PuYSVaz0n2a/pxfB27TvDTPsE7y5RZ/dJgcaj1nFzBp
         GGXJDk7HBIYIMQefoFGNw8ZI9cPWvqk82hvzqH/GFqvyieEizast6nIiApTUl/rjV9
         kEdT6aXOCAdSyXNmhfqWocUIcg8KEm2Uw6WEw8uO8rYc1Eidnt1WQtyRTqOx67dP2x
         3sg6H6PQNfzJapfKQB4ZqAnkebq0CCkqLNLWh3SFZHDjFV7dBdPZ2DR08d2uh8q+JA
         f7aotvfF0ZBqFGF45Tqswp2LjAIkfePGUSJWHuhN1yMZ+/oyRTixFNHGHQoAzQR8eF
         ZoHQtrGfhlW1w==
Received: by pali.im (Postfix)
        id 3DE85BE3; Tue, 13 Sep 2022 17:30:51 +0200 (CEST)
Date:   Tue, 13 Sep 2022 17:30:51 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <20220913153051.zv5oqhoqfytd5rhj@pali>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-4-kabel@kernel.org>
 <Yt01zjWx7VTWnQo9@hovoldconsulting.com>
 <20220818141140.m2yitpbeaddw3xjt@pali>
 <YyCYXar28dIkEnf2@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyCYXar28dIkEnf2@hovoldconsulting.com>
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

On Tuesday 13 September 2022 16:49:01 Johan Hovold wrote:
> > > > @@ -1286,7 +1303,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> > > >  {
> > > >  	struct ftdi_private *priv = usb_get_serial_port_data(port);
> > > >  	struct device *dev = &port->dev;
> > > > -	u32 div_value = 0;
> > > > +	int div_value = 0;
> > > 
> > > And don't change the type here.
> > 
> > This type change was explicitly asked during v1 review. v1 had u32.
> 
> Ok, but don't. This variable is used in other parts of this function.

As I said, I changed it just because I was explicitly asked for it
during v1 review. I'm just doing what I was asked.

Maybe... I can change it into union?

  union {
    s32 signed;
    u32 unsigned;
  } div_value;

I really do not see any other option how to achieve requirement that it
should be type of "int" with your another requirement that "do not do it".
