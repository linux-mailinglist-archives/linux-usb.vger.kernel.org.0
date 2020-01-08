Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A66134668
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 16:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728955AbgAHPkL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 10:40:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:33682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbgAHPkL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 10:40:11 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 686072067D;
        Wed,  8 Jan 2020 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578498010;
        bh=Qt9LDIWUGUO8AwKrR+pqOOWNDm8AieMeRkfzNh2H+kc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vkdCHWTdj0Mpz7RLEyM9kW3sbDdPCR4Zw4TjYrKiptIkaeVqNtkGOPA2GsaQKOoJi
         +Nf/Xwm7WY+ikF/av4J6vEIvqfRQ72CxKH7EKhka3a6PVn9gZgzZ6Hqi/YrzXizPTb
         uzUkzTEHc6x6LdercfjGXe2vVwECzbevU0cGAIKU=
Date:   Wed, 8 Jan 2020 16:40:08 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     pmenzel@molgen.mpg.de, mika.westerberg@linux.intel.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH] xhci: Fix memory leak when caching protocol extended
 capability PSI tables
Message-ID: <20200108154008.GA2448418@kroah.com>
References: <572bea6f-06d4-938a-802e-93386acf59d9@linux.intel.com>
 <20200108151730.21022-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108151730.21022-1-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 08, 2020 at 05:17:30PM +0200, Mathias Nyman wrote:
> xhci driver assumed that xHC controllers have at most one custom
> supported speed table (PSI) for all usb 3.x ports.
> Memory was allocated for one PSI table under the xhci hub structure.
> 
> Turns out this is not the case, some controllers have a separate
> "supported protocol capability" entry with a PSI table for each port.
> This means each usb3 port can in theory support different custom speeds.

Is there a "max" number of port capabilities that can happen?  Or this
this truely dynamic?

> +	for (i = 0; i < xhci->num_port_caps; i++) {
> +		kfree(xhci->port_caps[i].psi);
> +		xhci->port_caps[i].psi = NULL;
> +	}

Nit, no need to set to NULL here :)

thanks,

greg k-h
