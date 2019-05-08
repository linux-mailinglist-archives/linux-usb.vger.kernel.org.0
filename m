Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB610171CE
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2019 08:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfEHGk3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 May 2019 02:40:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:58248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbfEHGk3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 May 2019 02:40:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4C6E20989;
        Wed,  8 May 2019 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557297628;
        bh=0xWGA+EZ/5GkIlo+s9YIG7lqwduV4wNlPzhd/EzrDsg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s6HhoRS/2R/hE2yNnVLiHfK+jEEZ07Q6DQUi6HVq318O8z9g+7l9VUHkcIrtw/2cH
         6prpWHn4S9JWWBrSLUqLVMeWRubH4ulfO0Wt5d+KhGClzFUxld4w+/YBsK5OHgMya1
         13JOoXjVPCK4Y+Xb/yOhGmNlXYoohWTwU1JUCazU=
Date:   Wed, 8 May 2019 08:40:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     EJ Hsu <ejh@nvidia.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: storage: Remove warning message
Message-ID: <20190508064026.GC14085@kroah.com>
References: <1557285840-16958-1-git-send-email-ejh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557285840-16958-1-git-send-email-ejh@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 08, 2019 at 11:24:00AM +0800, EJ Hsu wrote:
> --- a/drivers/usb/gadget/function/storage_common.h
> +++ b/drivers/usb/gadget/function/storage_common.h
> @@ -1,4 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
> + */

Same here, why are you claiming copyright for this whole file?

That is just flat out not acceptable at all, again, go talk to your
lawyers.  If you insist on this, I will insist on having one of your
lawyers on the signed-off-by: line as well so that they know what they
are agreeing with.

not ok.

greg k-h
