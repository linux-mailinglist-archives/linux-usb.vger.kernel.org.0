Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B161B213494
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 09:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgGCHCR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 03:02:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725764AbgGCHCR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 03:02:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA9BC206DF;
        Fri,  3 Jul 2020 07:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593759737;
        bh=BgND3EEs+d8uxCUH6k4pODMG5kSA1ZdIdK8o28GS5U0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WdzsXHjSYVyx1OL7BFS5pmV1UfIjn59q4VEl3zORWCnMBZ9Vpu3q1NMz+tbC4ACwQ
         nPrc0jykxyEQtDl4y+aleTrNj/N/V+IgZs5dk7/UCrNVnjqHVIyGEOxoSOsvYx6PHZ
         6yogSUX+6/ecOdLlGjifiD3Cv6S6VWcAyOJzvwSE=
Date:   Fri, 3 Jul 2020 09:02:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>, Leo Li <leoyang.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] USB: phy: fsl-usb: remove character device usage
Message-ID: <20200703070221.GA2221524@kroah.com>
References: <20200702072914.1072878-1-gregkh@linuxfoundation.org>
 <20200702072914.1072878-2-gregkh@linuxfoundation.org>
 <AM7PR04MB71575977E680A7F6405D8B3F8B6D0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <AM6PR04MB54133D6402EE1FDC7E44CB32F16A0@AM6PR04MB5413.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR04MB54133D6402EE1FDC7E44CB32F16A0@AM6PR04MB5413.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 01:56:28AM +0000, Ran Wang wrote:
> Hi
> 
> On Thursday, July 2, 2020 5:08 PM, Peter Chen wrote
> > >
> > > No idea why this driver is using a char device node, statically
> > > allocated, with no dynamic allocation or hook up with devtmpfs, along
> > > with a reserverd major number, for "special" operations, not all of which ever
> > were implemented.
> > >
> > > So just rip it out, as no one must be using it because no modern
> > > system will ever actually create the /dev/ node it needs.
> > >
> > 
> > Add related people from NXP.
> > 
> 
> Reviewed-by: Ran Wang <ran.wang_1@nxp.com>

Thanks for the review!

greg k-h
