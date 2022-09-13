Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4580F5B76C6
	for <lists+linux-usb@lfdr.de>; Tue, 13 Sep 2022 18:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiIMQwk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Sep 2022 12:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiIMQwM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Sep 2022 12:52:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989DF86067
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 08:45:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F332B614CE
        for <linux-usb@vger.kernel.org>; Tue, 13 Sep 2022 15:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F81C433D6;
        Tue, 13 Sep 2022 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663083857;
        bh=m1/1+9bSiG/IIStK2c5BY6wGuAfxx+sjS1fD395W/ug=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bwLmkdCST+o4+DlqlY1qGQBFORBaUOcFcAtNJuzvUfn1FtgVtKyouSxYtTEBwUPhk
         IqHWOEZYWDZuNpsRI05SbT2SURYHRUdupaHY5BtAq3D6KLSrFllF2hpHdQXI2UPpYY
         Zdb8G8Cca6PglHJg+6+OH6zYPz2ubBKe3Yv+hWiQGVqu4JtqgreJUlB7y0rGqgBhC7
         3pThFqZDA0wXksiQ80ePtNTAZd2jTbw8onenHQxsNz/2gtUcvppX4Wkle9RC6bvBWs
         IveFgfMDLjcA5PfmuixDCq7iFf14lspge2dWVOjELXH/9d8Pg4Mzhg2g8T559xTbid
         PtdE/rXnKDXsg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oY85B-0006r8-2E; Tue, 13 Sep 2022 17:44:17 +0200
Date:   Tue, 13 Sep 2022 17:44:17 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 3/7] USB: serial: ftdi_sio: Extract SIO divisor code
 to function
Message-ID: <YyClUQaTAyGRE9EQ@hovoldconsulting.com>
References: <20220712115306.26471-1-kabel@kernel.org>
 <20220712115306.26471-4-kabel@kernel.org>
 <Yt01zjWx7VTWnQo9@hovoldconsulting.com>
 <20220818141140.m2yitpbeaddw3xjt@pali>
 <YyCYXar28dIkEnf2@hovoldconsulting.com>
 <20220913153051.zv5oqhoqfytd5rhj@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220913153051.zv5oqhoqfytd5rhj@pali>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 13, 2022 at 05:30:51PM +0200, Pali Rohár wrote:
> On Tuesday 13 September 2022 16:49:01 Johan Hovold wrote:
> > > > > @@ -1286,7 +1303,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
> > > > >  {
> > > > >  	struct ftdi_private *priv = usb_get_serial_port_data(port);
> > > > >  	struct device *dev = &port->dev;
> > > > > -	u32 div_value = 0;
> > > > > +	int div_value = 0;
> > > > 
> > > > And don't change the type here.
> > > 
> > > This type change was explicitly asked during v1 review. v1 had u32.
> > 
> > Ok, but don't. This variable is used in other parts of this function.
> 
> As I said, I changed it just because I was explicitly asked for it
> during v1 review. I'm just doing what I was asked.
> 
> Maybe... I can change it into union?
> 
>   union {
>     s32 signed;
>     u32 unsigned;
>   } div_value;
> 
> I really do not see any other option how to achieve requirement that it
> should be type of "int" with your another requirement that "do not do it".

I'm pretty sure I didn't review v1.

Perhaps you're referring to this:

	https://lore.kernel.org/all/Ysb3ORyUAPEOntqK@kroah.com/

But that doesn't mean you should change the type of div_value.

Johan
