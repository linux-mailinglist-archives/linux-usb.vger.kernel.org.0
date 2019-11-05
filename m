Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 937C7EFD6C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 13:42:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388697AbfKEMmX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Nov 2019 07:42:23 -0500
Received: from mga09.intel.com ([134.134.136.24]:12238 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388649AbfKEMmX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Nov 2019 07:42:23 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Nov 2019 04:42:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,271,1569308400"; 
   d="scan'208";a="212534516"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 05 Nov 2019 04:42:19 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 05 Nov 2019 14:42:18 +0200
Date:   Tue, 5 Nov 2019 14:42:18 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Mao Wenan <maowenan@huawei.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] usb: roles: Hide option USB_ROLE_SWITCH
Message-ID: <20191105124218.GB12204@kuha.fi.intel.com>
References: <20191104135312.GD996639@ulmo>
 <20191104144850.91305-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104144850.91305-1-maowenan@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 10:48:50PM +0800, Mao Wenan wrote:
> The USB role switch class is, after all,
> not useful by itself. Hiding USB_ROLE_SWITCH
> so we can avoid any of the pitfalls associated
> with user-visible symbols and "select".
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/usb/roles/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/roles/Kconfig b/drivers/usb/roles/Kconfig
> index f8b31aa..1da58d4 100644
> --- a/drivers/usb/roles/Kconfig
> +++ b/drivers/usb/roles/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  config USB_ROLE_SWITCH
> -	tristate "USB Role Switch Support"
> +	tristate
>  	help
>  	  USB Role Switch is a device that can select the USB role - host or
>  	  device - for a USB port (connector). In most cases dual-role capable

You didn't actually convert the "depends on USB_ROLE_SWTICH" to
"select USB_ROLE_SWITCH" before this. You also left the help text that
is now useless.

I really think that instead of this, we should just convert all
"select USB_ROLE_SWTICH" to "depends on USB_ROLE_SWITCH".

thanks,

-- 
heikki
