Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95531BBBF8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 13:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgD1LIj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 07:08:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:60996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbgD1LIj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 07:08:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 736E320661;
        Tue, 28 Apr 2020 11:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588072118;
        bh=Z49se1qYpX3X6jalbuAacnYIZf6qEkiFiIaRwmnl2tw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E9I5y7Z3Zp/pHdRvM2xQfms68jdQ1DtJ3phcptqmMeJcFFSaFxdRbGMYpRgvwZlPX
         oMYtrUS/b6UoQy/Vw3RNISK+6mfrDMuWqX2kLRpwH9rIjfl1hMc2VlMAOJlIr68nCC
         rcM1l7lkoEkPS8rOiZclW/BdyCX7wt6vpxIH31g8=
Date:   Tue, 28 Apr 2020 13:08:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     vladimir.stankovic@displaylink.com
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mausb-host-devel@displaylink.com
Subject: Re: [PATCH v5 7/8] usb: mausb_host: MA-USB PAL events processing
Message-ID: <20200428110836.GD1145239@kroah.com>
References: <20200327152614.26833-1-vladimir.stankovic@displaylink.com>
 <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
 <20200425091954.1610-8-vladimir.stankovic@displaylink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425091954.1610-8-vladimir.stankovic@displaylink.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 25, 2020 at 11:19:53AM +0200, vladimir.stankovic@displaylink.com wrote:
> +static int mausb_device_assign_address(struct mausb_device *dev,
> +				       struct mausb_usb_device_ctx *usb_dev_ctx)
> +{
> +	int status =
> +		mausb_setusbdevaddress_event_to_user(dev,
> +						     usb_dev_ctx->dev_handle,
> +						     RESPONSE_TIMEOUT);
> +
> +	mausb_pr_info("dev_handle=%#x, status=%d", usb_dev_ctx->dev_handle,
> +		      status);

When drivers are working properly, they are totally silent.  Please
remove this type of debugging code from the driver entirely, or change
it to be dev_dbg().

Otherwise this really looks like a very noisy driver.

greg k-h
