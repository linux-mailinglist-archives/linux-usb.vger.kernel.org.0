Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B061C042F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 19:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgD3RvJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 13:51:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:38220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726285AbgD3RvJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Apr 2020 13:51:09 -0400
Received: from Mani-XPS-13-9360 (unknown [157.46.61.111])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6CBA120836;
        Thu, 30 Apr 2020 17:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588269069;
        bh=s0ZLWIebLLG9C9za1M9+8uJGTp7EmdpVe+KDYImzCWE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=S3DILHDVl7KtxGTDbH2sOlCWQhE9X2OGG3gbjOlenQzZdVZ3ZfcR5RndCe2xY9q7O
         C90+KaDU4Zvjwy+SeASZwvEu2VIklEa5Ef06YS0ZM3qbOqcmWlxukOUn7nWY7IUNSC
         Wu7G+EAFC0v2cC8tOaoLcFJkesNNOxrRaFrZXvKo=
Date:   Thu, 30 Apr 2020 23:20:59 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, patong.mxl@gmail.com
Subject: Re: [PATCH v2 1/2] usb: serial: Add MaxLinear/Exar USB to Serial
 driver
Message-ID: <20200430175059.GJ9449@Mani-XPS-13-9360>
References: <20200430043636.8468-1-mani@kernel.org>
 <20200430043636.8468-2-mani@kernel.org>
 <20200430062737.GA2376664@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430062737.GA2376664@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 30, 2020 at 08:27:37AM +0200, Greg KH wrote:
> On Thu, Apr 30, 2020 at 10:06:35AM +0530, mani@kernel.org wrote:
> > +	port_priv->idProduct = le16_to_cpu(serial->dev->descriptor.idProduct);
> > +
> > +	/* XR21V141X specific settings */
> > +	if (port_priv->idProduct == XR21V141X_ID) {
> > +		port_priv->regs = &xr21v141x_regs;
> > +		port_priv->reg_width = 1;
> > +	}
> 
> Shouldn't you abort here if idProduct does not have this value, as
> that's all you test for everywhere else.  Do you even need to have this
> test and save the value everywhere at all?
> 

You're right. It's not required now. Will remove it and also the reg_width.

Thanks,
Mani

> thanks,
> 
> greg k-h
