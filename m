Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6604328213
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 16:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236937AbhCAPRK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 10:17:10 -0500
Received: from mga11.intel.com ([192.55.52.93]:23003 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236841AbhCAPRG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 10:17:06 -0500
IronPort-SDR: 0RFnrA3Dc91wowx2lKt0toOARcWyRZVluE8+00WVuBVYlg1ERye2+3nkuhkfXfT6vSWi2Rzi2V
 mL/xRmqRjygw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="183097269"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="183097269"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 07:15:19 -0800
IronPort-SDR: DZlUIw+KzQjYRy/sND8v1NPNdLrw3cbt6SZZS++J5R/4OqqG6tYSlt7g/Zlkw4Uoz809eH+pro
 lLqLrCvO2sqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="505099922"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 01 Mar 2021 07:15:17 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 01 Mar 2021 17:15:17 +0200
Date:   Mon, 1 Mar 2021 17:15:17 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 5/6] USB: typec: fusb302: create debugfs subdir for the
 driver
Message-ID: <YD0FBQ+mOwfZEYfj@kuha.fi.intel.com>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
 <20210216144645.3813043-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216144645.3813043-5-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 16, 2021 at 03:46:44PM +0100, Greg Kroah-Hartman wrote:
> The single debugfs file for this driver really is a log file, so make a
> subdir and call it "log" to make it obvious this is what it is for.
> This makes cleanup simpler as we just remove the whole directory, no
> need to handle individual files anymore.
> 
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index ebc46b9f776c..7a2a17866a82 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -213,8 +213,9 @@ static void fusb302_debugfs_init(struct fusb302_chip *chip)
>  
>  	mutex_init(&chip->logbuffer_lock);
>  	snprintf(name, NAME_MAX, "fusb302-%s", dev_name(chip->dev));
> -	chip->dentry = debugfs_create_file(name, S_IFREG | 0444, usb_debug_root,
> -					   chip, &fusb302_debug_fops);
> +	chip->dentry = debugfs_create_dir(name, usb_debug_root);
> +	debugfs_create_file("log", S_IFREG | 0444, chip->dentry, chip,
> +			    &fusb302_debug_fops);
>  }
>  
>  static void fusb302_debugfs_exit(struct fusb302_chip *chip)
> -- 
> 2.30.1

-- 
heikki
