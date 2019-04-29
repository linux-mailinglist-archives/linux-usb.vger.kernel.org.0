Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65F6DE21A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 14:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbfD2MTp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 08:19:45 -0400
Received: from mga18.intel.com ([134.134.136.126]:10309 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727710AbfD2MTo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 08:19:44 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 Apr 2019 05:19:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; 
   d="scan'208";a="168933063"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 29 Apr 2019 05:19:41 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 29 Apr 2019 15:19:40 +0300
Date:   Mon, 29 Apr 2019 15:19:40 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] usb: typec: ucsi: ccg: fix missing unlock on error
 in ccg_cmd_write_flash_row()
Message-ID: <20190429121940.GA15384@kuha.fi.intel.com>
References: <20190429122630.59334-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429122630.59334-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 29, 2019 at 12:26:30PM +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function ccg_cmd_write_flash_row()
> in the error handling case.
> 
> Fixes: 5c9ae5a87573 ("usb: typec: ucsi: ccg: add firmware flashing support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 4632b91a04a6..9d46aa9e4e35 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -631,6 +631,7 @@ ccg_cmd_write_flash_row(struct ucsi_ccg *uc, u16 row,
>  	ret = i2c_master_send(client, buf, CCG4_ROW_SIZE + 2);
>  	if (ret != CCG4_ROW_SIZE + 2) {
>  		dev_err(uc->dev, "REG_FLASH_RW_MEM write fail %d\n", ret);
> +		mutex_unlock(&uc->lock);
>  		return ret < 0 ? ret : -EIO;
>  	}
> 
> 

thanks,

-- 
heikki
