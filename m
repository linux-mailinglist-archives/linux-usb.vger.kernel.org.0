Return-Path: <linux-usb+bounces-636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3751E7B0385
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 14:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 656AC1C20842
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 12:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C3527EFA;
	Wed, 27 Sep 2023 12:10:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED1B1C39
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 12:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF3AC433C8;
	Wed, 27 Sep 2023 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695816641;
	bh=TlR/Ik9Fn+YSeM4btcGzmjeBCyJQpNkUK5qDrEZhqX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6BEGwJtDIs8xZnpuu2wxhw6FDi/dut8gZZ7+fne6ienYQAsB1GI/j/1iNQY8BhZi
	 v6gNMWqFJZR/5yGI0JjnT5OBbQBXIIhi9/NaEhRn9ftOc+N2LhTj4lkSFr8Fw0L6Qx
	 +4QnFTUTo/NRAJmL+AjARsjZ72W9YaRCCGNv4ceM=
Date: Wed, 27 Sep 2023 14:10:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	Douglas Gilbert <dgilbert@interlog.com>
Subject: Re: [PATCH] usb: pd: Exposing the Peak Current value of Fixed
 Supplies to user space
Message-ID: <2023092721-barrier-geranium-ec0e@gregkh>
References: <20230927111031.1059096-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927111031.1059096-1-heikki.krogerus@linux.intel.com>

On Wed, Sep 27, 2023 at 02:10:31PM +0300, Heikki Krogerus wrote:
> Exposing the value of the field as is.
> 
> The Peak Current value has to be interpreted as described
> in Table 6-10 (Fixed Power Source Peak Current Capability)
> of the USB Power Delivery Specification, but that
> interpretation will be done in user space, not in kernel.
> 
> Suggested-by: Douglas Gilbert <dgilbert@interlog.com>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/pd.c | 10 ++++------
>  include/linux/usb/pd.h |  1 +
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index 8cc66e4467c4..85d015cdbe1f 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -83,14 +83,12 @@ unchunked_extended_messages_supported_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(unchunked_extended_messages_supported);
>  
> -/*
> - * REVISIT: Peak Current requires access also to the RDO.
>  static ssize_t
>  peak_current_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
> -	...
> +	return sysfs_emit(buf, "%u\n", (to_pdo(dev)->pdo >> PDO_FIXED_PEAK_CURR_SHIFT) & 3);
>  }
> -*/
> +static DEVICE_ATTR_RO(peak_current);

Don't you need to add a Documentation/ABI/ entry for this new field?

thanks,

greg k-h

