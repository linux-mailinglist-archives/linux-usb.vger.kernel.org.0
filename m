Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9187347CF5
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 16:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbhCXPrl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 11:47:41 -0400
Received: from mga17.intel.com ([192.55.52.151]:42851 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236719AbhCXPri (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Mar 2021 11:47:38 -0400
IronPort-SDR: 7MDjF5SK5T7jXEc8kvzweVveHwvTVj7/0NVjkOSMmQtHCjJL2DJfGdqnbBLLigRtmH36nYPDW6
 /aFqxE5qR9YQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="170710600"
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="170710600"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2021 08:47:38 -0700
IronPort-SDR: lkY6RgyXOpK1aDsL+QEM35OjNEh3k3XZnP/5gPJ0m14E17i+/bk4kj6AxYTYCCiP3AjNyIQAdD
 odnziMSJHpkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,275,1610438400"; 
   d="scan'208";a="514239616"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 24 Mar 2021 08:47:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 24 Mar 2021 17:47:34 +0200
Date:   Wed, 24 Mar 2021 17:47:34 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usb: typec: tcpci_maxim: Make symbol
 'max_tcpci_tcpci_write_table' static
Message-ID: <YFtfFv15JkU+SzE+@kuha.fi.intel.com>
References: <20210324144253.1011234-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324144253.1011234-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Wed, Mar 24, 2021 at 02:42:53PM +0000, 'Wei Yongjun kirjoitti:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/usb/typec/tcpm/tcpci_maxim.c:55:34: warning:
>  symbol 'max_tcpci_tcpci_write_table' was not declared. Should it be static?
> 
> This symbol is not used outside of tcpci_maxim.c, so this
> commit marks it static.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> index 041a1c393594..df2505570f07 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -52,7 +52,7 @@ static const struct regmap_range max_tcpci_tcpci_range[] = {
>  	regmap_reg_range(0x00, 0x95)
>  };
>  
> -const struct regmap_access_table max_tcpci_tcpci_write_table = {
> +static const struct regmap_access_table max_tcpci_tcpci_write_table = {
>  	.yes_ranges = max_tcpci_tcpci_range,
>  	.n_yes_ranges = ARRAY_SIZE(max_tcpci_tcpci_range),
>  };

-- 
heikki
