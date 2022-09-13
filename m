Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 356D05B770B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 19:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbiIMRAo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 13:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbiIMQ74 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 12:59:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69629C228A
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 08:51:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E9284B80F1A
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 15:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED4EC433D6;
        Tue, 13 Sep 2022 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663081359;
        bh=mvWG6uEHI9/Md5pz2zy2PlX8tl+QtRBKp5umlNEcC4A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OnXgpYB2m/S2XplwBdqOWmi/dXCLQ5T6Zb68vowDmg7NPaeD3QXvpn4n3K5+yERfN
         xTAnsysc3VRNSC52QRiPuu4hBK+EcEGvPHNKnMbpdG6I1QQPpk+CbBYmM/9g4eWew8
         s3S4Xpycc1yY5HZwEpXQ5DbPA19Ij4V8xU5Ym7eY49e8UmOpmGvuyEnJgb5rboiMT2
         Tv6gsd8K8/LBhjxNieQLGtZs+qyiieUDT2pyiXrYBuzTi45I4KqXr/C6rn/Y+/pxZZ
         WXsT33JhgNfLMToru6Zm77aGMb87rgZXaLb2D61c+8BkEwd6HhlV3zuQe+TUuBPgy4
         4cNcTt1AmT6CA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY7Qt-0005TG-5I; Tue, 13 Sep 2022 17:02:39 +0200
Date:   Tue, 13 Sep 2022 17:02:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 7/7] USB: serial: ftdi_sio: Fill c_*speed fields with
 real baud rate
Message-ID: <YyCbj8RGQD/gV8U0@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-8-kabel@kernel.org>
 <Yt097+xTMPrMpfvX@hovoldconsulting.com>
 <20220818141738.axssxkaizys4rphl@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818141738.axssxkaizys4rphl@pali>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 18, 2022 at 04:17:38PM +0200, Pali Rohár wrote:
> On Sunday 24 July 2022 14:41:19 Johan Hovold wrote:
> > On Tue, Jul 12, 2022 at 01:53:06PM +0200, Marek Behún wrote:
> > > From: Pali Rohár <pali@kernel.org>
> > > 
> > > Calculate baud rate value in c_*speed fields to the real values which were
> > > set on hardware. For this operation, add a new set of methods
> > > *_divisor_to_baud() for each chip and use them for calculating the real
> > > baud rate values.
> > > 
> > > Each *_divisor_to_baud() method is constructed as an inverse function of
> > > its corresponding *_baud_to_divisor() method.
> > > 
> > > Signed-off-by: Pali Rohár <pali@kernel.org>
> > > Tested-by: Marek Behún <kabel@kernel.org>
> > > Signed-off-by: Marek Behún <kabel@kernel.org>
> > > ---
> > >  drivers/usb/serial/ftdi_sio.c | 83 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 83 insertions(+)

> > >  static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
> > >  {
> > >  	unsigned short int divisor;
> > > @@ -1189,15 +1206,33 @@ static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
> > >  	return divisor;
> > >  }
> > >  
> > > +static int ftdi_232am_divisor_base_to_baud(unsigned short int divisor, int base)
> > 
> > I believe "base" was used as a function name suffix in the inverse
> > function (due to the additional base argument).
> 
> Yes, in the same way as it used in name of ftdi_232am_baud_base_to_divisor.

No, you used "base" as an infix here.

Johan
