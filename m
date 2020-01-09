Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D83613560E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 10:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbgAIJq2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 04:46:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:33410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729493AbgAIJq2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jan 2020 04:46:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0500620678;
        Thu,  9 Jan 2020 09:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578563187;
        bh=Vc1pOy+Wyt70LGFk04Nuw/UUegLUIV6WKPZoIMr2Cbg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a3E2BJX2u+nDIOlWOHIP6H6cGUj8RES3N1ZebwBFyrEvQhSoa8hj+oq1XZLSvUIh+
         39ed8lM6PCAykQYyO5om3+Crf35mVmYHLAZBE8v22xyrUcbjGH0o79Jx9mH2vhWruC
         vo/32xUAwqVs/8bSia6GQe8v/MS9FNWBJgMDHNOc=
Date:   Thu, 9 Jan 2020 10:46:25 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 04/15] usb: typec: Make the attributes read-only when
 writing is not possible
Message-ID: <20200109094625.GA50000@kroah.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
 <20191230142611.24921-5-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230142611.24921-5-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 30, 2019 at 05:26:00PM +0300, Heikki Krogerus wrote:
> For now the read-writable attribute files have made a check
> in their store callback function to see does the underlying
> port interface support changing the value or not, and when
> it didn't, the callbacks returned -EOPNOTSUPP. From user
> perspective that is not ideal, as there is no way to know is
> changing the value possible beforehand.
> 
> Instead of returning -EOPNOTSUPP, making the attribute file
> read-only when the operation is not supported.

As fun as this is, if someone then changes the permission on the sysfs
file, trying to write to them will now crash the kernel, right?

So I think you need to leave this check in:

> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 08923637cd88..3abcfa09ecdf 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -373,12 +373,9 @@ static ssize_t active_store(struct device *dev, struct device_attribute *attr,
>  		}
>  	}
>  
> -	/* Note: If there is no driver, the mode will not be entered */
> -	if (adev->ops && adev->ops->activate) {
> -		ret = adev->ops->activate(adev, enter);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = adev->ops->activate(adev, enter);
> +	if (ret)
> +		return ret;
>  
>  	return size;
>  }

We had to go add this type of check to some subsystems recently that had
this same problem, I don't want to have to go and add it back for this
one as well :)

thanks,

greg k-h
