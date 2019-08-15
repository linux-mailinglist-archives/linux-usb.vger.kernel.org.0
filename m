Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC8E78EC10
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 14:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731954AbfHOMzr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 08:55:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:41054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729649AbfHOMzr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 08:55:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DDD90206C1;
        Thu, 15 Aug 2019 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565873746;
        bh=VmCloNb/xfgJz/sV6/R5lq6ky6sKNBaakUCXudqB6O8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uvZmENs8shu2/OfyxxMlBOBL5JxvyyE9B56vfjosRx24B7xvhR/VckU4OIUxSX7V/
         KsG6ON77b9gnqbrC9MjLX3ucDx4C9q8vLOetCS5n4U4pGXFkJiBXEEn8seLTTx6BGy
         0kNuh+6OfbMlwX+baBR+ZqZqquIYsB5l/7p52DKs=
Date:   Thu, 15 Aug 2019 14:55:44 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] usb: typec: fusb302: Small changes
Message-ID: <20190815125544.GC24270@kroah.com>
References: <20190814132419.39759-1-heikki.krogerus@linux.intel.com>
 <a826c351-4e9d-8a33-ad0f-764d13aeb1ed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a826c351-4e9d-8a33-ad0f-764d13aeb1ed@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 14, 2019 at 03:42:46PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 14-08-19 15:24, Heikki Krogerus wrote:
> > Hi,
> > 
> > This series removes the deprecated fusb302 specific properties, and
> > stops using struct tcpc_config in the driver.
> 
> Series looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> This has a small conflict with my
> "[PATCH] usb: typec: fusb302: Call fusb302_debugfs_init earlier"
> patch.
> 
> Since we've agreed to do the rootdir leak fix as a separate patch
> (which I will write when I find some time probably tomorrow), I
> was wondering if we can merge my patch first. I would like to see
> a "Cc: stable@vger.kernel.org" added to my patch and then it would
> be good to have it merged first.
> 
> Regardless we should probable prepare one series with all patches
> for Greg to make this easy to merge for him.

I'll take this series now, and you can redo your patch based on my
usb-next branch with them in it.

thanks,

greg k-h
