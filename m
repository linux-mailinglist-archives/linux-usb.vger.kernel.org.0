Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DED1B178CE5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 09:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgCDIzo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 03:55:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:57948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728301AbgCDIzo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 03:55:44 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BAA92166E;
        Wed,  4 Mar 2020 08:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583312142;
        bh=s93NcPbQpzzREmZBWdZdqJ+3gnicEka7PxgC64WPN2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nw7Xol3TmlsJ8oHFig/9+krQXrAALyhdKnaG7HgAQtwuQvNgfmGcaU/EdxDfJZL7R
         kq12v1Q6LGYEIRJRiJuUnxVxCsofWVac+nHarlQUayKB251kG87e57HEZ2PT8UD6Ik
         hgfy2TspAY7VNeXklnSbBAnPoSzQ1VRVpyk+URdQ=
Date:   Wed, 4 Mar 2020 09:55:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>, balbi@kernel.org,
        USB list <linux-usb@vger.kernel.org>, linux-imx@nxp.com,
        pawell@cadence.com, rogerq@ti.com, jun.li@nxp.com
Subject: Re: [PATCH v2 0/2] usb: cdns3: two fixes for gadget
Message-ID: <20200304085539.GA1428695@kroah.com>
References: <20200219141455.23257-1-peter.chen@nxp.com>
 <CAL411-o_nGQ3VkvLt-brffjOk8YjDYLyxmN6_6jnpW3NkRhbQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL411-o_nGQ3VkvLt-brffjOk8YjDYLyxmN6_6jnpW3NkRhbQw@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 27, 2020 at 09:26:49AM +0800, Peter Chen wrote:
> On Wed, Feb 19, 2020 at 10:16 PM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > These two issues are found during run "Error Recovery Test"
> > for the latest USB CV MSC test, the TRB doesn't advance correctly
> > after dequeue and clear halt. With these two fixes, the test
> > can be passed.
> >
> > Peter Chen (2):
> >   usb: cdns3: gadget: link trb should point to next request
> >   usb: cdns3: gadget: toggle cycle bit before reset endpoint
> >
> >  drivers/usb/cdns3/gadget.c | 19 +++++++++++++++----
> >  1 file changed, 15 insertions(+), 4 deletions(-)
> >
> 
> A gentle ping...

I can take these now, thanks.

greg k-h
