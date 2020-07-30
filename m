Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3794F232C01
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 08:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728791AbgG3GnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 02:43:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:40780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbgG3GnO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jul 2020 02:43:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0269206D7;
        Thu, 30 Jul 2020 06:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596091394;
        bh=fx5s0QFgHVKC4dKTHjz74JWUCKz1djkpMY/M/ccaWUY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WFiUGCqR2ZrpLErcJ/wu/Trf0zP+S+Eja0b2b3QjiOkKAFmGi8Zv+e/jBzaM4Mq9D
         BcV9oAAy629jZ1o+dJoE9hboOYWNDdhcolpRZcsTJtnkDF6n0duM3q2LBgupmB3M5Q
         nj2ZAX4TvXn7QkP/F9OtK65iSgnGB+mLKi/aMJf8=
Date:   Thu, 30 Jul 2020 08:43:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Trevor Woerner <twoerner@gmail.com>, jamesg@zaltys.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-nxp: add support for stotg04 phy
Message-ID: <20200730064303.GA3909742@kroah.com>
References: <20200729172829.GA3679@piout.net>
 <20200729174918.321615-1-alexandre.belloni@bootlin.com>
 <b5389371-3d47-f046-4d34-3d329276cb35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5389371-3d47-f046-4d34-3d329276cb35@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 29, 2020 at 09:00:04PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 7/29/20 8:49 PM, Alexandre Belloni wrote:
> 
> > The STOTG04 phy is used as a drop-in replacement of the ISP1301 but some
> > bits doesn't have exactly the same meaning and this can lead to issues.
> > Detect the phy dynamically and avoid writing to reserved bits.
> > 
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > ---
> > 
> > Hi Trevor, this is totally untested but at least it builds ;)
> > 
> >  drivers/usb/host/ohci-nxp.c | 21 +++++++++++++++------
> >  1 file changed, 15 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
> > index 85878e8ad331..36ab1501c28f 100644
> > --- a/drivers/usb/host/ohci-nxp.c
> > +++ b/drivers/usb/host/ohci-nxp.c
> > @@ -55,6 +55,15 @@ static struct clk *usb_host_clk;
> >  
> >  static void isp1301_configure_lpc32xx(void)
> >  {
> > +	u8 value, atx_is_stotg = 0;
> 
>    Why the flag is not *bool*?

That's not an issue so much as:

> 
> > +	s32 vendor, product;
> > +
> > +	vendor = i2c_smbus_read_word_data(isp1301_i2c_client, 0x00);
> > +	product = i2c_smbus_read_word_data(isp1301_i2c_client, 0x02);

Why are these signed 32bit numbers?  Shouldn't they be unsigned?

> > +
> > +	if (vendor == 0x0483 && product == 0xa0c4)

No endian flips anywhere?

thanks,

greg k-h
