Return-Path: <linux-usb+bounces-32000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F6ACFE81A
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 16:15:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8219B308584D
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 15:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C56C326930;
	Wed,  7 Jan 2026 15:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p2RMOkXx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15F5305057;
	Wed,  7 Jan 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798080; cv=none; b=HPrrbzAnUELe2M9oUJHApT0Fm2z/eqDKGuZjjHwLsirnyvK2bKD5Lnj5LOPSGHeN0XBrqUkkNmOYQBCg126AdRuWwYhY57aC49LN0Q2uGyDmt5pj1da3CFx9+sXQmpcjw2TDxi9KeQW5QxvMWy5GmHmbhAM1292x75KHHDWpugc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798080; c=relaxed/simple;
	bh=dijqV8ZGclWhY2hYR8eLzWclhnLRSMAezew1RZylMO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sElZ/3SWMVe6GkoLUdSNGoa0Is+hb2Qe/18KtumeT3x/yBsBOyOqwGymMX3nN+nzIfNuUYaavH+wtts5t4+ZEO7LnceXqZawU7T2WPCvwEv0iuIxZSQ3CquxgsW1Y9hAk07mp30BX0mOCtV2/HQGJT07qiR1goPj/wLbocxbu8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p2RMOkXx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD291C4CEF1;
	Wed,  7 Jan 2026 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767798080;
	bh=dijqV8ZGclWhY2hYR8eLzWclhnLRSMAezew1RZylMO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2RMOkXxoxj2CtELuNp4tohGMjXDnTAVv0dFKyfdg5owgHkc8xekUxTMjSrq8lAag
	 ucwEfyhNqvUG5rNAC36oZe9sH3l0zHdQ6rF3uYXXsb8b48pl3YL+9pgGL9X+d2yi+1
	 88E03xz6GbxZXF3wGMJJfxVMLzRlvMlizDfH6eI8=
Date: Wed, 7 Jan 2026 16:01:16 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu, oneukum@suse.com,
	linux-kernel@vger.kernel.org, naveen.v@harman.com,
	sankarkumar.krishnasamy@harman.com
Subject: Re: [PATCH v2 1/3] driver core: add
 device_enumeration_failure_notify() helper
Message-ID: <2026010733-robust-huntress-ce3a@gregkh>
References: <2025100805-resisting-target-419a@gregkh>
 <20251224115808.415753-1-Akshay.Gujar@harman.com>
 <20251224115808.415753-2-Akshay.Gujar@harman.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224115808.415753-2-Akshay.Gujar@harman.com>

On Wed, Dec 24, 2025 at 11:58:06AM +0000, Akshay Gujar wrote:
> Hotpluggable buses can detect that a device is physically present, but
> enumeration may still fail early due to protocol-level errors. Today,
> such failures are only reported via kernel log messages, with no
> structured userspace notification.
> 
> Introduce device_enumeration_failure_notify(), a generic helper that
> emits a KOBJ_CHANGE uevent containing:
> 
>     DEVICE_ENUMERATION_FAILURE=<identifier>
> 
> The <identifier> string is provided by the bus layer and identifies the
> failing port or device instance in a bus-defined format.
> 
> This allows userspace to correlate repeated enumeration failures with
> specific ports or connectors without relying solely on kernel logs.
> 
> Signed-off-by: Akshay Gujar <Akshay.Gujar@harman.com>
> ---
>  drivers/base/core.c    | 30 ++++++++++++++++++++++++++++++
>  include/linux/device.h | 12 ++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 40de2f51a1b1..4c70d9a6dc69 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3747,6 +3747,36 @@ int device_add(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(device_add);
>  
> +/**
> + * device_enumeration_failure_notify - send uevent for enumeration failure
> + * @parent: the device to send the uevent from
> + * @id_name: textual identifier for the failing device
> + *
> + * Emits a KOBJ_CHANGE uevent with:
> + *
> + *    DEVICE_ENUMERATION_FAILURE=<id_name>
> + *
> + * Buses such as USB/PCI may use this helper when hardware is detected
> + * but enumeration cannot proceed.
> + */
> +void device_enumeration_failure_notify(struct device *parent, const char *id_name)
> +{
> +	char *envp[2] = { NULL, NULL };
> +
> +	if (!parent || !id_name)
> +		return;
> +
> +	envp[0] = kasprintf(GFP_KERNEL,
> +			    "DEVICE_ENUMERATION_FAILURE=%s",
> +			    id_name);
> +	if (!envp[0])
> +		return;
> +
> +	kobject_uevent_env(&parent->kobj, KOBJ_CHANGE, envp);
> +	kfree(envp[0]);
> +}
> +EXPORT_SYMBOL_GPL(device_enumeration_failure_notify);
> +
>  /**
>   * device_register - register a device with the system.
>   * @dev: pointer to the device structure
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 0be95294b6e6..dedc5e9e0ade 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1197,4 +1197,16 @@ static inline bool device_link_test(const struct device_link *link, u32 flags)
>  #define MODULE_ALIAS_CHARDEV_MAJOR(major) \
>  	MODULE_ALIAS("char-major-" __stringify(major) "-*")
>  
> +/**
> + * device_enumeration_failure_notify - notify userspace about enumeration failure
> + * @parent: device to emit the uevent from

Why is this called "parent"?  SHouldn't this just be the device that
caused the failure?

> + * @id_name: textual identifier for the failed endpoint/device instance

Any hints on what this is going to contain?  Should this be documented
somewhere?

thanks,

greg k-h

