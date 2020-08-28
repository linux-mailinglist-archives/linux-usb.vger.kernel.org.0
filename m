Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E0C2555A6
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 09:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbgH1HvH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 03:51:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgH1HvG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Aug 2020 03:51:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8E092078A;
        Fri, 28 Aug 2020 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598601066;
        bh=qKGlOjqmmZiIbctIub0jqOFgst14PZmbtq7P8Cuo2rI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hmM4Z6/g2GU5ws0Pb9uW4Z/A7JfANPowNLiu5O+0jj2oDuLG5gETBykBCj3xhL7yX
         mUoxBBZf6hZGiclHUEKmxppEKO2dRCz1SNCEGF9gj/0S03hiG0EtTJw5c8hfDWwJgr
         RKymm5S+mws9nmTM5GDx7ue7V1G0l0fLzWeeJ+no=
Date:   Fri, 28 Aug 2020 09:51:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: xhci-dbgtty: convert tasklets to use new
 tasklet_setup() API
Message-ID: <20200828075118.GA993816@kroah.com>
References: <20200819101157.74147-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819101157.74147-1-andriy.shevchenko@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 01:11:57PM +0300, Andy Shevchenko wrote:
> In preparation for unconditionally passing the struct tasklet_struct
> pointer to all tasklet callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/usb/host/xhci-dbgtty.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Does not apply to my tree :(
