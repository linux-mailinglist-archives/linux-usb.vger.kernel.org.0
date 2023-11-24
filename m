Return-Path: <linux-usb+bounces-3292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F247F7460
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 13:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDF77B21632
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 12:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF9125778;
	Fri, 24 Nov 2023 12:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGO9GYcV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 682B710E4;
	Fri, 24 Nov 2023 04:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700830553; x=1732366553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0CJxRztR8sP9yMA/a6oz2vAEEQEj6uTdKxgPbgOsEUU=;
  b=XGO9GYcVle02jjOEVNlICY6HYMhVWz1vInqD0ra3Rx8s2A3TvaWnODgm
   D8vU/m7mVqaZaXkQ4TY3+9WNL3A1veHB93FuBNUS+HfgqK+If/+ITqX1E
   4m1gjLaSMKqcS9jxaddrC+57wWZ+RQVVfLsVVTSaapVA5VU1Y4V8otdDK
   UZ+vt7yIibH4ldFr6tC3X8uAq/OygCO9RJATQtNfkyorSNncTwMgVw8Qi
   SV2x0zWpWkqIRk7IbUyWf56Nzdbw/DP/OXu0EGzGBZlifY95nwVOGlrtx
   oyvbbnD+UtjVoxH2XMzlbgefkGXCori8QQwdSAJZppbhfvHdCdC3gSXHI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="372582127"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="372582127"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 04:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="858380941"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="858380941"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by FMSMGA003.fm.intel.com with SMTP; 24 Nov 2023 04:55:50 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Nov 2023 14:55:49 +0200
Date: Fri, 24 Nov 2023 14:55:49 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: Unplugging USB-C charger cable causes `ucsi_acpi USBC000:00:
 ucsi_handle_connector_change: ACK failed (-110)`
Message-ID: <ZWCdVWRGzh/2RSs3@kuha.fi.intel.com>
References: <b2466bc2-b62c-4328-94a4-b60af4135ba7@molgen.mpg.de>
 <ZVy5+AxnOZNmUZ15@kuha.fi.intel.com>
 <2bfe2311-27a6-46b5-8662-ba3cbb409f81@molgen.mpg.de>
 <ZV3CTg03IPnZTVL0@kuha.fi.intel.com>
 <6288389c-59cb-4eb4-bbe6-163413db7b7e@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6288389c-59cb-4eb4-bbe6-163413db7b7e@molgen.mpg.de>

Hi,

> > Just list what you have in /sys/class/typec/ before and after plugging
> > a device to the port:
> > 
> >          ls /sys/class/typec/
> 
> Sorry, here you go:
> 
> With charger:
> 
>     $ ls /sys/class/typec/
>     port0  port0-partner
> 
> After unplugging the charger:
> 
>     $ LANG= ls /sys/class/typec/
>     port0

Thanks. The interface does not appear to be completely stuck, which is
what I wanted to check.

> By the way, Linux logs the ucsi_handle_connector_change line around five
> second after unplugging the USB Type-C charger cable.
> 
> Kind regards,
> Paul
> 
> PS: In the logs since October 30th, I see the three distinct lines below:
> 
> 1.  ucsi_acpi USBC000:00: failed to re-enable notifications (-110)
> 2.  ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-110)
> 3.  ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK failed (-110)
> 
> Is it documented somewhere what -100 means?

That is the error code, and 110 means Timeout. The driver waits 5s,
which should be more than enough. If the firmware does not respond
within that 5s, it will most likely never respond.

Two of those errors mean that the driver has sent a command to the
firmware but the firmware never completes the command.

The ACK failure means that the driver tries to acknowledge a connector
change event (that you get for example when you plug or unplug the
cable) indicating that the driver has now processed the event, but the
firmware does not react to that acknowledgement like it should.

So the firmware is not behaving correctly in all these cases. I could
try to see if we can workaround those issues, but I would need to be
able reproduce the problems. Unfortunately I do not have XPS 13 9360.

But none of those problems are critical if the interface really
continues to work.

thanks,

-- 
heikki

