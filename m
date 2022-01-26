Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13E349CF41
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 17:09:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238708AbiAZQJZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 11:09:25 -0500
Received: from netrider.rowland.org ([192.131.102.5]:56867 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235786AbiAZQJY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 11:09:24 -0500
Received: (qmail 141771 invoked by uid 1000); 26 Jan 2022 11:09:23 -0500
Date:   Wed, 26 Jan 2022 11:09:23 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     kieran.bingham@ideasonboard.com, linux-usb@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca
Subject: Re: [PATCH] dummy_hcd: add isoc support
Message-ID: <YfFyM9Dadim3t88s@rowland.harvard.edu>
References: <164154749753.1224575.16682991529695492259@Monstersaurus>
 <20220126132249.2133168-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126132249.2133168-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 26, 2022 at 02:22:49PM +0100, Michael Grzeschik wrote:
> With this patch, the dummy_hcd gains first support for isoc transfers.
> It will complete the whole urb with all packages.

"packets", not "packages".

>  Even if the gadget
> side did not enqueue any request, the urb will be handled.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

I don't like this idea.  If support for isochronous transfers is added, 
it should be done correctly.  That is, the implementation should support 
scheduling of transfers, periodic bandwidth reservation, high-bandwidth 
transfers, and so on.

The whole point of dummy-hcd is to emulate a real host controller as 
closely as possible.  Real isochronous transfers do not complete all at 
once.

Alan Stern
