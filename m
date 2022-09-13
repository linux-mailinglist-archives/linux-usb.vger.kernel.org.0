Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A85B5B769D
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 18:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbiIMQlB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 12:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbiIMQko (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 12:40:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73E7726AC
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 08:35:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E42D614C6
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 15:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BFDC433C1;
        Tue, 13 Sep 2022 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663083258;
        bh=D5iaErh5d9BHkso017KYb9XorE4affS6CGjhUK+ny8Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G5pzvqUGt7mX7titad+/p9eJLx18eV1InkT9rMCCBfcMl7rj+hge/OP8X7TeNE7wF
         iCsmisJZgEn9GIerkGbYw7uIxhQnDpPyfbh2nXoMMZUBUnI2pNsu2O49qXqTXbJr2z
         e+nsny198aGE3IxtgrIhcCPEpLnfRtjv/auuDcO9Emo3Pcgst3jHT+Z1iA5OYbwniS
         zrZA+B6vHkUqV9qfEpWdoJ2+ceMw/AUqXHsWRWtWc2MpIzq61HO4Ve3iaiVf7Hkpe5
         3mm1I3s/FD3m8nS2/M+zvYn5OmTUZw1mWZlN5i8qrJwm3XjyeQFXv2VSb/JeDoKmIa
         3h8l7OeAmIAoQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY7vV-0006mr-1t; Tue, 13 Sep 2022 17:34:17 +0200
Date:   Tue, 13 Sep 2022 17:34:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 7/7] USB: serial: ftdi_sio: Fill c_*speed fields with
 real baud rate
Message-ID: <YyCi+W/mugQBEg18@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-8-kabel@kernel.org>
 <Yt097+xTMPrMpfvX@hovoldconsulting.com>
 <20220818141738.axssxkaizys4rphl@pali>
 <YyCbj8RGQD/gV8U0@hovoldconsulting.com>
 <20220913152405.72qkojbufy5fvjuj@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220913152405.72qkojbufy5fvjuj@pali>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 13, 2022 at 05:24:05PM +0200, Pali Rohár wrote:
> On Tuesday 13 September 2022 17:02:39 Johan Hovold wrote:
> > On Thu, Aug 18, 2022 at 04:17:38PM +0200, Pali Rohár wrote:
> > > On Sunday 24 July 2022 14:41:19 Johan Hovold wrote:

> > > > >  static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
> > > > >  {
> > > > >  	unsigned short int divisor;
> > > > > @@ -1189,15 +1206,33 @@ static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
> > > > >  	return divisor;
> > > > >  }
> > > > >  
> > > > > +static int ftdi_232am_divisor_base_to_baud(unsigned short int divisor, int base)
> > > > 
> > > > I believe "base" was used as a function name suffix in the inverse
> > > > function (due to the additional base argument).
> > > 
> > > Yes, in the same way as it used in name of ftdi_232am_baud_base_to_divisor.
> > 
> > No, you used "base" as an infix here.

> Yes, of course, it is "in the middle" because I said I used it in the
> same way as in ftdi_232am_baud_base_to_divisor.
> 
> ftdi_232am_baud_base_to_divisor converts input "baud" and input "base"
> to return "divisor". Hence baud_base_to_divisor.
> 
> And so ftdi_232am_divisor_base_to_baud converts input "divisor" and
> input "base" to return value "baud". Hence divisor_base_to_baud.
> 
> So what is the problem? I still have not caught.

Ok, I should have looked closer at the code before replying.

I believe I expected "base" to be used as a suffix in the current code
but that doesn't appear to be the case. So you're just following the
current style.

Johan
