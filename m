Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F36348A39
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 08:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhCYHhT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Mar 2021 03:37:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:32318 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhCYHgv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Mar 2021 03:36:51 -0400
IronPort-SDR: +A3+G+DSwIU5W6oGuktVUqrBrEpx3/fkcCRspa1/5JCFAX1vTtkhiJAW8fxlC7hks8Ne2vqWKv
 qp0bQ62CFpeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="178425104"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="178425104"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2021 00:36:50 -0700
IronPort-SDR: S4G0ESSJgR/vuPB2QVHJaZPvvX6xc8TMapTg62ndJBKFdo28iQFjiwhsK9n/mVZ4iiXxlBz6j8
 leuZYuIcC7lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; 
   d="scan'208";a="514504416"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 25 Mar 2021 00:36:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 25 Mar 2021 09:36:44 +0200
Date:   Thu, 25 Mar 2021 09:36:44 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     'Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usb: typec: tipd: Remove duplicated include from
 core.c
Message-ID: <YFw9jIk/QLBAHpXo@kuha.fi.intel.com>
References: <20210325031255.120479-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325031255.120479-1-miaoqinglang@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 25, 2021 at 11:12:55AM +0800, 'Qinglang Miao wrote:
> From: Qinglang Miao <miaoqinglang@huawei.com>
> 
> Remove duplicated include.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index d8212b15f6f9..938219bc1b4b 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -6,8 +6,6 @@
>   * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>   */
>  
> -#include "tps6598x.h"
> -
>  #include <linux/i2c.h>
>  #include <linux/acpi.h>
>  #include <linux/module.h>

thanks,

-- 
heikki
