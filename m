Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF053A2B97
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 14:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhFJMbh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 08:31:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:25808 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230349AbhFJMbg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 08:31:36 -0400
IronPort-SDR: pfDhI9nXof7VdYThIweUDsvDfTJU66pKHCZaVZiu/ZQQY7+pdXEC86f/YYp3DRlHaM1R9w9tCL
 h8u9Q0m4HvIg==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="205319776"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="205319776"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 05:29:31 -0700
IronPort-SDR: zpA0ZZxF75K68uTIe1ciykYV9G3kIG+OozDmixKAO+vQAjgAKbUfJTKuEiMBNDMeqzUNIxzHOW
 PAp5j+KsOxwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="553050336"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 Jun 2021 05:29:29 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 10 Jun 2021 15:29:28 +0300
Date:   Thu, 10 Jun 2021 15:29:28 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        Mayank Rana <mrana@codeaurora.org>
Subject: Re: [PATCH] usb: typec: ucsi: Fix a comment in ucsi_init()
Message-ID: <YMIFqCKbdREW7YRf@kuha.fi.intel.com>
References: <1623274076-6287-1-git-send-email-subbaram@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623274076-6287-1-git-send-email-subbaram@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 09, 2021 at 02:27:56PM -0700, Subbaraman Narayanamurthy wrote:
> ucsi_unregister_ppm() got replaced with ucsi_unregister(). Fix
> the comment in ucsi_init() as well.
> 
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index b433169..96cf541 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1219,7 +1219,7 @@ static int ucsi_init(struct ucsi *ucsi)
>  		goto err_reset;
>  	}
>  
> -	/* Allocate the connectors. Released in ucsi_unregister_ppm() */
> +	/* Allocate the connectors. Released in ucsi_unregister() */
>  	ucsi->connector = kcalloc(ucsi->cap.num_connectors + 1,
>  				  sizeof(*ucsi->connector), GFP_KERNEL);
>  	if (!ucsi->connector) {


-- 
heikki
