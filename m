Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE0A2C502D
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 09:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730128AbgKZISj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 03:18:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:53364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726162AbgKZISi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 03:18:38 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A0C5620872;
        Thu, 26 Nov 2020 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606378718;
        bh=ZVwgCSxOUjB5amUO0I9s5U68Y5DO93KiLrSMGRXD3s8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eeMUG7qrYs7sxhiyhs3+ujDVpYZGLVAdnu378vjYqmSK2/vTdwRUNOhBtpVCAqkSV
         YEPFwRDpSdZe4cK96lblyKshnf4qaxiUt/U3LXEepEqenNiWjzuA8VDMUiH+Ubmbf5
         XrDV3jfPq9iZuRLKqA5oFfo8ZxwOwLw3hw+11hww=
Date:   Thu, 26 Nov 2020 09:19:42 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: Add type sysfs attribute file for
 partners
Message-ID: <X79lHn+aEzFopTWv@kroah.com>
References: <20201125120642.37156-1-heikki.krogerus@linux.intel.com>
 <20201125120642.37156-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125120642.37156-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 25, 2020 at 03:06:42PM +0300, Heikki Krogerus wrote:
> USB Power Delivery Specification defines a set of product
> types for partners and cables. The product type can be read
> from the ID Header VDO which is the first object in the
> response to the Discover Identity command. This attribute
> will display the product type of the partner. The cables
> already have the attribute.
> 
> This sysfs attribute file is only created for the partners
> and cables if the product type is really known in the
> driver. Some interfaces do not give access to the Discover
> Identity response from the partner or cable, but they may
> still supply the product type separately in some cases.
> 
> When the product type of the partner or cable is detected,
> uevent is also raised with PRODUCT_TYPE set to show the
> actual product type (for example PRODUCT_TYPE=host).
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  Documentation/ABI/testing/sysfs-class-typec |  53 ++++++-
>  drivers/usb/typec/class.c                   | 147 +++++++++++++++++---
>  2 files changed, 181 insertions(+), 19 deletions(-)

This patch doesn't apply against my usb-next branch (but patch 1/2 did).
Can  you rebase this and resend it?

thanks,

greg k-h
