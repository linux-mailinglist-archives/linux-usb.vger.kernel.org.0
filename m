Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D13AA2480E1
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 10:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgHRIpn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 04:45:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:38738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbgHRIpm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 04:45:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31C0A2067C;
        Tue, 18 Aug 2020 08:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597740341;
        bh=ak+y5BoFBVfW8paleI+5GaKh+4eEBA0XSb9vh8DWjBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d8dhDn3mfjAbebIyQe71qhjzJlE02m6fYxbU49B6KA/1dYS5xcDjUItb6ej4GhNmc
         h93KXvX1tvvKK1ODJvuQz8CCn27BS4v6nMcTrV1XS0JDPIxPW2i9kIlSP7Y2dp3QBO
         mSKygM2a1FupGQxQW44MQyncnhzg5Xo1L3VVS7S8=
Date:   Tue, 18 Aug 2020 10:46:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: renesas-xhci: remove version check
Message-ID: <20200818084605.GA27455@kroah.com>
References: <20200818071739.789720-1-vkoul@kernel.org>
 <20200818073108.GE9254@kroah.com>
 <20200818083919.GY2639@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818083919.GY2639@vkoul-mobl>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 02:09:19PM +0530, Vinod Koul wrote:
> On 18-08-20, 09:31, Greg Kroah-Hartman wrote:
> > On Tue, Aug 18, 2020 at 12:47:39PM +0530, Vinod Koul wrote:
> > > Some devices in wild are reporting bunch of firmware versions, so remove
> > > the check for versions in driver
> > > 
> > > Reported by: Anastasios Vacharakis <vacharakis@gmail.com>
> > > Reported by: Glen Journeay <journeay@gmail.com>
> > > Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
> > > Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=208911
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > > Changes in v3:
> > >  - drop additional firmware versions and remove the check
> > > 
> > > Greg, this fixes regression for folks with preprogrammed controllers
> > > please mark as stable material
> > 
> > You could have done so by putting "Cc: stable..." in the s-o-b of the
> > kernel, why force me to do that by hand?
> 
> Oops, wasnt sure of your preference. Btw am sure you would have scripted
> it :-)
> 
> Would you like me to send an update with stable tagged or this is fine
> for now?

I can do it now, but in the future please be nice to maintainers, we are
overworked as you well know :)

thanks,

greg k-h
