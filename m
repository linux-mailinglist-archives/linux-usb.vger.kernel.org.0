Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE30C6C35A0
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 16:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbjCUP1Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 11:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbjCUP1U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 11:27:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D0FE4FAAF
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 08:27:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D6D58B818A7
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 15:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B780C433EF;
        Tue, 21 Mar 2023 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679412430;
        bh=1ITtkpX+h6a3H04HWdZGwiMrEUj4nxhyg7gufTe1Efk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HPhC9rk87kmIR4tHmo5omut3vYQeK7nECA8WjXt7F4WZMtmd5Pw49ub6uE1IFYBeb
         3jIp2XHr2OctgrPW3e7RDMFIoh3nOZ2MczXfmT0DmqNcI1fIqm+ex8V/Qau5bQGIDS
         UM3tfTqFtUs2NFtszwSGrF5z0yacaah1/D7IsFMc=
Date:   Tue, 21 Mar 2023 16:27:07 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Ard Biesheuvel <ardb@kernel.org>, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] usb: ftdi-elan: Delete driver
Message-ID: <ZBnMy+lg3zvyNz2e@kroah.com>
References: <20230321114508.345825-1-u.kleine-koenig@pengutronix.de>
 <20230321150950.u3uc2xe5pvofxogy@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321150950.u3uc2xe5pvofxogy@pengutronix.de>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 21, 2023 at 04:09:50PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Mar 21, 2023 at 12:45:08PM +0100, Uwe Kleine-König wrote:
> > This driver didn't see real maintainance since several years. It has
> > several trivial issues (check $(scripts/checkpatch.pl -f
> > drivers/usb/misc/ftdi-elan.c)) and some harder ones (difficult locking,
> > explict kref handling, ...). Also today it's hard to find hardware to
> > make actually use of such a card and I suspect the driver is completely
> > unused.
> > 
> > So remove it.
> > 
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/usb/misc/ftdi-elan.c | 2780 ----------------------------------
> 
> This patch is incomplete, just sent a v2.

Oops, will go drop this and apply v2 instead, thanks.

greg k-h
