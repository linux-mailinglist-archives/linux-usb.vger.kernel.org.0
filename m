Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB71328223
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 16:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbhCAPSL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 10:18:11 -0500
Received: from mga05.intel.com ([192.55.52.43]:12029 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237072AbhCAPRw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 10:17:52 -0500
IronPort-SDR: rVgk9nTCAdna65Puesq8AWScpmFtof4csECzRwjkvE9OJzW+UB00oEWiRke5vXmAsUCgvZ/RqG
 0bMxHqjubPOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="271494475"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="271494475"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2021 07:16:06 -0800
IronPort-SDR: uDnww3p8DFr02Fh9XC1DAFem1v/PM/jBGkt5t7T4b84uC8Cgo+Zsmk/QxQ0UZlBGmbJR2OKcrG
 ShocbghVvSwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; 
   d="scan'208";a="505100257"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 01 Mar 2021 07:16:04 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 01 Mar 2021 17:16:03 +0200
Date:   Mon, 1 Mar 2021 17:16:03 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 6/6] USB: typec: tcpm: create debugfs subdir for the
 driver
Message-ID: <YD0FM/jBEwpdwZ7q@kuha.fi.intel.com>
References: <20210216144645.3813043-1-gregkh@linuxfoundation.org>
 <20210216144645.3813043-6-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216144645.3813043-6-gregkh@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 16, 2021 at 03:46:45PM +0100, Greg Kroah-Hartman wrote:
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
>  drivers/usb/typec/tcpm/tcpm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 22a85b396f69..d4dd40c95a56 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -636,8 +636,9 @@ static void tcpm_debugfs_init(struct tcpm_port *port)
>  
>  	mutex_init(&port->logbuffer_lock);
>  	snprintf(name, NAME_MAX, "tcpm-%s", dev_name(port->dev));
> -	port->dentry = debugfs_create_file(name, S_IFREG | 0444, usb_debug_root,
> -					   port, &tcpm_debug_fops);
> +	port->dentry = debugfs_create_dir(name, usb_debug_root);
> +	debugfs_create_file("log", S_IFREG | 0444, port->dentry, port,
> +			    &tcpm_debug_fops);
>  }
>  
>  static void tcpm_debugfs_exit(struct tcpm_port *port)
> -- 
> 2.30.1

-- 
heikki
