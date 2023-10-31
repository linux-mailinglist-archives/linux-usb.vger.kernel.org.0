Return-Path: <linux-usb+bounces-2403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333A7DCF51
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 15:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB6B52817C8
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 14:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1D01946E;
	Tue, 31 Oct 2023 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EDF134DB
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 14:39:21 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 0EBCFDA
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 07:39:19 -0700 (PDT)
Received: (qmail 717485 invoked by uid 1000); 31 Oct 2023 10:39:19 -0400
Date: Tue, 31 Oct 2023 10:39:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, len.brown@intel.com,
  pavel@ucw.cz, heikki.krogerus@linux.intel.com, mkl@pengutronix.de,
  hadess@hadess.net, mailhol.vincent@wanadoo.fr, ivan.orlov0322@gmail.com,
  linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-pm@vger.kernel.org, pumahsu@google.com, raychi@google.com,
  albertccwang@google.com
Subject: Re: [PATCH] rpm: pm: enable PM_RPM_EXCEPTION config flag
Message-ID: <f75d6cd2-fa9f-4820-969f-2a8839d78c9e@rowland.harvard.edu>
References: <20231031093921.755204-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031093921.755204-1-guanyulin@google.com>

On Tue, Oct 31, 2023 at 05:38:55PM +0800, Guan-Yu Lin wrote:
> Introducing PM_RPM_EXCEPTION config flag, which may alter the priority
> between system power management and runtime power management. In
> suspend-to-idle flow, PM core will suspend all devices to avoid device

Your patch affects all forms of system suspend, not just 
suspend-to-idle.  What do you actually mean here?

> interact with the system. However, chances are devices might be used by
> other systems rather than a single system. In this case, PM core shouldn't
> suspend the devices. One may use PM_RPM_EXCEPTION config flag to mark
> such exception, and determine the power state of a device with runtime
> power management rather than system power management.

This sort of arrangement -- a device shared between two different 
systems -- could happen with any sort of device.  Why does your patch 
affect only USB devices?

> diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> index 4b31629c5be4..beba7a0f3947 100644
> --- a/kernel/power/Kconfig
> +++ b/kernel/power/Kconfig
> @@ -193,6 +193,14 @@ config PM
>  	  responsible for the actual handling of device suspend requests and
>  	  wake-up events.
>  
> +config PM_RPM_EXCEPTION
> +	bool "Prioritize Runtime Power Management more than Power Management"

Runtime Power Management is a form of Power Management, so what you 
wrote doesn't make sense.  What you really meant is: Prioritize Runtime 
Power Management more than System Power Management.

> +	default n
> +	help
> +	Provides a way to prioritize Runtime Power Management more than Power
> +	Management. This way system can suspnd with maintaining specific

s/suspnd/suspend/
s/with/while/

> +	components in operation.

Your patch does not allow _specific_ components to be kept in operation.  
_All_ in-use components that support prioritized PM (with this patch, 
all USB components) will remain powered during system suspend, even if 
the user wants only _some_ of them to be kept powered.

Alan Stern

> +
>  config PM_DEBUG
>  	bool "Power Management Debug Support"
>  	depends on PM
> -- 
> 2.42.0.820.g83a721a137-goog
> 

