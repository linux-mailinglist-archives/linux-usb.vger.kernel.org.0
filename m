Return-Path: <linux-usb+bounces-1161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4FC7BA9D4
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 21:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 8EFB5281F19
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 19:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07634122E;
	Thu,  5 Oct 2023 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BMNINJF/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778E266D5
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 19:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747A2C433C8;
	Thu,  5 Oct 2023 19:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696533189;
	bh=kCTE7Zf6a9TnDufuQtirBe+LuEsM7mPAix8NoM3EDp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMNINJF/3tKIBHzK5+RdXx6QW3Zlwc1X1rFxDcNB5449cy6WrBIuJdjMDWU8zapf0
	 JNc8Tiq+R9IlSqzhqRui8tcqqigAtHLcGH3fqlIPqu7j8bMrfLfodwsc6QiDVO/SOf
	 DvfO27mym49Yubi6ZW+0E/jvYyjPxr0DyDxC2Lro=
Date: Thu, 5 Oct 2023 21:13:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Alex Deucher <alexander.deucher@amd.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Richard Gong <Richard.Gong@amd.com>
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: Use GET_CAPABILITY attributes
 data to set power supply scope
Message-ID: <2023100548-corncob-viewless-3b0a@gregkh>
References: <20231005175230.232764-1-mario.limonciello@amd.com>
 <20231005175230.232764-2-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005175230.232764-2-mario.limonciello@amd.com>

On Thu, Oct 05, 2023 at 12:52:29PM -0500, Mario Limonciello wrote:
> On some OEM systems, adding a W7900 dGPU triggers RAS errors and hangs
> at a black screen on startup.  This issue occurs only if `ucsi_acpi` has
> loaded before `amdgpu` has loaded.  The reason for this failure is that
> `amdgpu` uses power_supply_is_system_supplied() to determine if running
> on AC or DC power at startup. If this value is reported incorrectly the
> dGPU will also be programmed incorrectly and trigger errors.
> 
> power_supply_is_system_supplied() reports the wrong value because UCSI
> power supplies provided as part of the system don't properly report the
> scope as "DEVICE" scope (not powering the system).
> 
> In order to fix this issue check the capabilities reported from the UCSI
> power supply to ensure that it supports charging a battery and that it can
> be powered by AC.  Mark the scope accordingly.
> 
> Fixes: a7fbfd44c020 ("usb: typec: ucsi: Mark dGPUs as DEVICE scope")
> Link: https://www.intel.com/content/www/us/en/products/docs/io/universal-serial-bus/usb-type-c-ucsi-spec.html p28
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>>
> Cc: Richard Gong <Richard.Gong@amd.com>
> ---
>  drivers/usb/typec/ucsi/psy.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
> index 384b42267f1f..b35c6e07911e 100644
> --- a/drivers/usb/typec/ucsi/psy.c
> +++ b/drivers/usb/typec/ucsi/psy.c
> @@ -37,6 +37,15 @@ static int ucsi_psy_get_scope(struct ucsi_connector *con,
>  	struct device *dev = con->ucsi->dev;
>  
>  	device_property_read_u8(dev, "scope", &scope);
> +	if (scope == POWER_SUPPLY_SCOPE_UNKNOWN) {
> +		u32 mask = UCSI_CAP_ATTR_POWER_AC_SUPPLY |
> +			   UCSI_CAP_ATTR_BATTERY_CHARGING;
> +
> +		if (con->ucsi->cap.attributes & mask)
> +			scope = POWER_SUPPLY_SCOPE_SYSTEM;
> +		else
> +			scope = POWER_SUPPLY_SCOPE_DEVICE;
> +	}
>  	val->intval = scope;
>  	return 0;
>  }
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

