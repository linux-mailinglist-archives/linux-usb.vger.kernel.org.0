Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86EAD4A476B
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 13:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241128AbiAaMni (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 07:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbiAaMng (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 07:43:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF28DC061714
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 04:43:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C0C5B61175
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 12:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB115C340E8;
        Mon, 31 Jan 2022 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643633014;
        bh=NjRVVJ5JSZ40aKWpgWapNcQntF6k3u0Rdqtz434OqXc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p+dWpSJubbF0QumjsU/H/ruNQqHKMCEcuWG1ScO7y7WQ9Sbu/GCcLwmmn/pj9Nkm0
         YDQGVu+sfXnGUwr/fl6mGqV92Juxgl5tqhTK3U5VpZQtXPrdQM1BQUJNCWxWfWYQBe
         S8qp1KPYRnKBGAh4HFeu0+V/APElDhDAFDbtntdk=
Date:   Mon, 31 Jan 2022 13:43:31 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca
Subject: Re: [PATCH] dummy_hcd: add isoc support
Message-ID: <YffZc90SSVrcBWxL@kroah.com>
References: <164154749753.1224575.16682991529695492259@Monstersaurus>
 <20220126132249.2133168-1-m.grzeschik@pengutronix.de>
 <YfFyM9Dadim3t88s@rowland.harvard.edu>
 <20220126183138.GB6506@pengutronix.de>
 <164363090018.533872.2376373763275566038@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164363090018.533872.2376373763275566038@Monstersaurus>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 31, 2022 at 12:08:20PM +0000, Kieran Bingham wrote:
> Hi Michael, Alan,
> 
> Quoting Michael Grzeschik (2022-01-26 18:31:38)
> > On Wed, Jan 26, 2022 at 11:09:23AM -0500, Alan Stern wrote:
> > >On Wed, Jan 26, 2022 at 02:22:49PM +0100, Michael Grzeschik wrote:
> > >> With this patch, the dummy_hcd gains first support for isoc transfers.
> > >> It will complete the whole urb with all packages.
> > >
> > >"packets", not "packages".
> > 
> > Right.
> > 
> > >>  Even if the gadget
> > >> side did not enqueue any request, the urb will be handled.
> > >>
> > >> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > >
> > >I don't like this idea.  If support for isochronous transfers is added,
> > >it should be done correctly.  That is, the implementation should support
> > >scheduling of transfers, periodic bandwidth reservation, high-bandwidth
> > >transfers, and so on.
> > >
> > >The whole point of dummy-hcd is to emulate a real host controller as
> > >closely as possible.  Real isochronous transfers do not complete all at
> > >once.
> 
> Being able to at least test uvc-gadget in a virtual environment would
> already be a big benefit. As this is emulation, not simulation is it
> essential that an exact mapping of the hardware is in place?

Bindly being a sink for all data is not emulation for drivers that
require some sort of feedback loop.

> Is there anything we can do to support the progression of this
> development?
> 
> I.e. could we support this method first with a 
>   WARN_ONCE("This does not fully emulate Isochronous support");

That would instantly trigger syzbot to send us reports for no good
reason.  Please don't do that :(

thanks,

greg k-h
