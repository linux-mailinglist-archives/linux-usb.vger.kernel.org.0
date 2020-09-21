Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69368273243
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 20:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIUSyK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 14:54:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:41776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726395AbgIUSyK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 21 Sep 2020 14:54:10 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FA4220888;
        Mon, 21 Sep 2020 18:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600714449;
        bh=Bt0GZ1Baa85REr94RnUUbCIDGdV1dRvYCd2pQKZNqSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RXL0T4WXPJq9stwgCpd53PmZQF/owSTrCxXl7VG6/jsn+kntUmJiuk51NyvI4BhEt
         2mYPY04qMMEHjPNLjqL+sdeyLjNv3Xh3l3z1Vk2oB9cGrDfdFlDNBpUU9cp6VlVQcs
         xXdhE50v+z5y3N2CMn1Ltd1AO4JOw3YxSQq2VKPA=
Date:   Mon, 21 Sep 2020 20:54:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH] usb: typec: ucsi_ccg: use dev_info for timeout error
Message-ID: <20200921185432.GA1484407@kroah.com>
References: <20200921174216.2862-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921174216.2862-1-ajayg@nvidia.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 10:42:16AM -0700, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> Timeout error may be seen due to missing USB Type-C UCSI controller
> on some NVIDIA GPU card. Currently we don't have a correct way to
> identify these cards.

No unique id anywhere???  That feels like someone really messed up :(

> 
> Tools like Plymouth (splashscreen) doesn't like dev_err so
> changing timeout status log to dev_info.
> 
> Bug information:
> https://bugzilla.kernel.org/show_bug.cgi?id=206653
> 
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index bff96d64dddf..d69432df866e 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -252,7 +252,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
>  		put_unaligned_le16(rab, buf);
>  		status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>  		if (status < 0) {
> -			dev_err(uc->dev, "i2c_transfer failed %d\n", status);
> +			dev_info(uc->dev, "i2c_transfer failed %d\n", status);

It's an error, leave it an error.

If it's not an error, don't log it.

Or better yet, fix the hardware :)

thanks,

greg k-h
