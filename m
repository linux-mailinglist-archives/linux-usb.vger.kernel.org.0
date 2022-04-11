Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0247E4FB64A
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 10:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240964AbiDKIsu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 04:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238979AbiDKIst (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 04:48:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477623EA83
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 01:46:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E11CC61534
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 08:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499FFC385A5;
        Mon, 11 Apr 2022 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649666794;
        bh=gTAQyLFBcbonSDceocyv9Ia6/FBh7L5+IQWc91AzgCY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yjy3Nhbd3b0PDiMVcsWmF37OjWCE9fIkMLr9dXpmfYa8HbQGjJXrtzkEIhCECkI9Z
         laHmiCFaV6ScffOLvUFXPkz9/qD6HoO4Typw+0wr06cyjvkvqXCgRQ/ME7iNytkcbC
         JHqFu2Bd/cHDhCC0Y5xvSE9HhucDKEOV5Dpfih5O7yVXtDeOY5pWQX3KU4PIVjXTOQ
         5w05plkRGzLcl9bRsfILFa5Df6L3kE6LToVkmBwBqVR0ZYHkCGJ/mma5SbcFbhZsPy
         M+pgN22Z9MG4o1yDqXTJbXTJ0eQ20l1FyfvfUtzfxG5Ljb63ZUDdEW+7oe5TvMmAcL
         5pW38zHxR93Ww==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ndpgp-0002GG-Nk; Mon, 11 Apr 2022 10:46:27 +0200
Date:   Mon, 11 Apr 2022 10:46:27 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "embedded (VIVAVIS AG)" <embedded@vivavis.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ftdi_sio: Problem when changing the baud rate after a transfer
Message-ID: <YlPq45YtOoMrsLRn@hovoldconsulting.com>
References: <5aae37a8029549d8a9ef28f2e39fe58f@vivavis.com>
 <1ec54d4f592c46b7a14109df559072e4@vivavis.com>
 <YfeV6f6hnz7Cgrt/@hovoldconsulting.com>
 <73e3d18172e24f6092ecb6e3998d6b9c@vivavis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73e3d18172e24f6092ecb6e3998d6b9c@vivavis.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 21, 2022 at 03:08:43PM +0000, embedded (VIVAVIS AG) wrote:
> Hi,
> thanks for the suggestion.
> 
> > > > Hi,
> > > > there seems to be a problem with the ftdi_sio driver in conjunction 
> > > > with an FT2232C and changing the baud rate.
> > > > This behavior is observable at least on linux 4.19.190.
> > 
> > You need to reproduce any issues you have with a more recent kernel such as 5.16.
> Unfortunately, I cannot use a more recent kernel due to restrictions
> with the development environment I am using. I did compare the code of
> the ftdi_sio driver in version 4.19.190 with code included in a more
> recent kernel release. I did not spot any fundamental changes that would
> suggest that the problem was fixed.

Then you're on your own, sorry. Perhaps you can bring it up with FTDI in
case it is a known firmware issue.

> > > > I verified that the driver does in fact ask the hardware if it's tx 
> > > > buffer is empty when the hardware status is reported.
> > 
> > How exactly did you verify that?
> I checked the code of the ftdi_sio driver, which captures the state of
> the tx empty flag that is reported by the IC every time a specific USB
> message is sent to it.

Yeah, the driver supports that, but did you make sure that that function
is actually called *before* changing the baud rate when you observe the
problem? Note that it is also called during close.

You need to trace the calls (or USB requests) to make sure that what you
think is happening is indeed happening. The missing TCSADRAIN in your
test program is an example of why that is needed.

> > Unless you use TCSADRAIN (or TCSAFLUSH) the driver is not supposed
> > to wait for the outgoing buffer to drain.
> > 
> > Please confirm if changing this fixes the problem you're seeing.
> I can still observe the same behavior, even after changing the calls
> to tcsetattr to use TCSADRAIN instead of TCSANOW. The last byte of a
> transfer is still being shifted out with the wrong baud rate.
> Is there anything else that can be done in software to possibly
> prevent this behavior?

If you can reproduce this on a recent mainline kernel and show that it
is indeed a driver or firmware issue, perhaps we can try to find a way
to work around it.

Good luck!

Johan
