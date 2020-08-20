Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91BA24C08D
	for <lists+linux-usb@lfdr.de>; Thu, 20 Aug 2020 16:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgHTOZG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Aug 2020 10:25:06 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46905 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725823AbgHTOZF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Aug 2020 10:25:05 -0400
Received: (qmail 218018 invoked by uid 1000); 20 Aug 2020 10:25:03 -0400
Date:   Thu, 20 Aug 2020 10:25:03 -0400
From:   "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2 6/6] Revert "usb: udc: allow adding and removing the
 same gadget device"
Message-ID: <20200820142503.GA217079@rowland.harvard.edu>
References: <20200810022510.6516-1-peter.chen@nxp.com>
 <20200810022510.6516-7-peter.chen@nxp.com>
 <20200818093305.GA34785@kroah.com>
 <AM7PR04MB7157182367D7EEE2BDAD53318B5C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
 <20200818144655.GA144306@rowland.harvard.edu>
 <20200819013014.GA16614@b29397-desktop>
 <20200819145236.GA181847@rowland.harvard.edu>
 <20200820033903.GA24349@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200820033903.GA24349@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 20, 2020 at 03:40:06AM +0000, Peter Chen wrote:
> > 
> > One way or another, the existing code is wrong.  I guess the best we can 
> > do for now is to let it remain wrong during the patch series, rather 
> > than changing it to be wrong in a different way.
> > 
> > To put it another way, we already run the risk of clearing memory that 
> > has been freed.  The series does not make that risk any worse, and it 
> > eventually fixes the problem.
> > 
> > This means your patch should remain in its position at the end of the 
> > series.
> > 
> 
> Thank.
> 
> If you think my sequence during the patch series is OK, would you
> please add your reviewed-by below?
> 
> https://www.spinics.net/lists/linux-usb/msg199291.html

That wouldn't make sense; I can't add Reviewed-by: to patches that I 
wrote myself.  They already have my Signed-off-by:.

However, it is okay to add

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

to the 6/6 patch.

Alan Stern
