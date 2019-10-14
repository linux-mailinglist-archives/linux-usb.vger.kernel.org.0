Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBC64D60CF
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 13:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731723AbfJNLAJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 07:00:09 -0400
Received: from mga12.intel.com ([192.55.52.136]:41434 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731305AbfJNLAJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Oct 2019 07:00:09 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 04:00:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="207948220"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 14 Oct 2019 04:00:05 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 14 Oct 2019 14:00:04 +0300
Date:   Mon, 14 Oct 2019 14:00:04 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: fix an IS_ERR() vs NULL bug in
 hd3ss3220_probe()
Message-ID: <20191014110004.GA17542@kuha.fi.intel.com>
References: <20191011135935.GB32191@kuha.fi.intel.com>
 <20191011185055.GA20972@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011185055.GA20972@mwanda>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 09:50:55PM +0300, Dan Carpenter wrote:
> The device_get_named_child_node() function doesn't return error
> pointers, it returns NULL on error.
> 
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: remove -ENODEV instead of -EIO
> 
>  drivers/usb/typec/hd3ss3220.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 9715600aeb04..8afaf5768a17 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -172,8 +172,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  	hd3ss3220_set_source_pref(hd3ss3220,
>  				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
>  	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
> -	if (IS_ERR(connector))
> -		return PTR_ERR(connector);
> +	if (!connector)
> +		return -ENODEV;
>  
>  	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
>  	fwnode_handle_put(connector);
> -- 
> 2.20.1

thanks,

-- 
heikki
