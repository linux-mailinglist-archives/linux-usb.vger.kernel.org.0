Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D28346163
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 15:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhCWOWm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 10:22:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:46471 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231438AbhCWOW3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 10:22:29 -0400
IronPort-SDR: GjEfadTcBpJQTJyChi7xpR3yDx97Ijk39zZsWjfdp8hLUps3gQsqz8ZynzHM35VtqaUWNba0dR
 LVmsq0NverNA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="189886665"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="189886665"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 07:22:12 -0700
IronPort-SDR: iv+HvTurjOnEkDLuhu8g2pBp4rv9JtBbVxD/AQB5x/EDymNpe9Q1GjpFxkl0iT2HQz07X9zoQJ
 mxiNKD+QJn7w==
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; 
   d="scan'208";a="513758880"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 07:22:02 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 23 Mar 2021 16:21:54 +0200
Date:   Tue, 23 Mar 2021 16:21:54 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Richard Weinberger <richard@nod.at>, linux-usb@vger.kernel.org,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] thunderbolt: unlock on error path in tb_domain_add()
Message-ID: <20210323142154.GW2542@lahna.fi.intel.com>
References: <YFnqyqDzSHenVN9O@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFnqyqDzSHenVN9O@mwanda>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 23, 2021 at 04:19:06PM +0300, Dan Carpenter wrote:
> We accidentally deleted this unlock on the error path.  Undelete it.
> 
> Fixes: 7f0a34d7900b ("thunderbolt: Decrease control channel timeout for software connection manager")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Julia also reported this yesterday and I was just about to send a patch
that fixes it too :) Applied this one now, thanks!

> ---
>  drivers/thunderbolt/domain.c | 1 +
>  1 files changed, 1 insertions(+), 0 deletion(-)
> 
> diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> index a7d83eec3d15..98f4056f89ff 100644
> --- a/drivers/thunderbolt/domain.c
> +++ b/drivers/thunderbolt/domain.c
> @@ -493,6 +493,7 @@ int tb_domain_add(struct tb *tb)
>  	device_del(&tb->dev);
>  err_ctl_stop:
>  	tb_ctl_stop(tb->ctl);
> +	mutex_unlock(&tb->lock);
>  
>  	return ret;
>  }
