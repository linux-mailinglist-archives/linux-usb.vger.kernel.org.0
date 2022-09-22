Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5645E6513
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 16:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiIVOYO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 10:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiIVOXu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 10:23:50 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA4F8EBBE5
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663856629; x=1695392629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3A+I4asDrA1I9biGax3YhNc+qDQvzHRXMVVOYMGB0Ho=;
  b=iFfGBpkeqDL4gwhZaK2ewJdw0k9/3R9kI8bZrsSElW+vMjIcVwS1whS2
   WpWGok4HwTRU5kVjOhe3F0a+oqkRNcKp/4XNMXzRlOBm3RjSuv8uJxybc
   qMsyJY6V+VmlmhGmA3nWhNDxmuXXWRE4oUAUl+5d/cNr3+f+THaOeje1Z
   BJCvsqVA1RvWw1HtlmGrObVc1On0ZcCyhtRsS9FE9mpFUBBxl0X7rJUzL
   y3xIQgDLJ9q2QGOF7wG7SF/PjkIukS2YurBYBQrY1n+EOH+e5aTvrA/GQ
   wao3BhBOUSYmsy3v7BdUb5NCiv/uDfwGTu9Vm22jWSG2DQN6ap0ekQweU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="283362070"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="283362070"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 07:23:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="762201058"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 22 Sep 2022 07:23:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 22 Sep 2022 17:23:46 +0300
Date:   Thu, 22 Sep 2022 17:23:46 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Liu Shixin <liushixin2@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: ulpi: use DEFINE_SHOW_ATTRIBUTE to simplify
 ulpi_regs
Message-ID: <Yyxv8ksuLGncYf+X@kuha.fi.intel.com>
References: <20220922142505.3248167-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922142505.3248167-1-liushixin2@huawei.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 22, 2022 at 10:25:05PM +0800, Liu Shixin wrote:
> Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
> No functional change.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/common/ulpi.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
> index 0a4f441aff8f..d7c8461976ce 100644
> --- a/drivers/usb/common/ulpi.c
> +++ b/drivers/usb/common/ulpi.c
> @@ -233,7 +233,7 @@ static int ulpi_read_id(struct ulpi *ulpi)
>  	return 0;
>  }
>  
> -static int ulpi_regs_read(struct seq_file *seq, void *data)
> +static int ulpi_regs_show(struct seq_file *seq, void *data)
>  {
>  	struct ulpi *ulpi = seq->private;
>  
> @@ -269,21 +269,7 @@ static int ulpi_regs_read(struct seq_file *seq, void *data)
>  
>  	return 0;
>  }
> -
> -static int ulpi_regs_open(struct inode *inode, struct file *f)
> -{
> -	struct ulpi *ulpi = inode->i_private;
> -
> -	return single_open(f, ulpi_regs_read, ulpi);
> -}
> -
> -static const struct file_operations ulpi_regs_ops = {
> -	.owner = THIS_MODULE,
> -	.open = ulpi_regs_open,
> -	.release = single_release,
> -	.read = seq_read,
> -	.llseek = seq_lseek
> -};
> +DEFINE_SHOW_ATTRIBUTE(ulpi_regs);
>  
>  #define ULPI_ROOT debugfs_lookup(KBUILD_MODNAME, NULL)
>  
> @@ -316,7 +302,7 @@ static int ulpi_register(struct device *dev, struct ulpi *ulpi)
>  	}
>  
>  	root = debugfs_create_dir(dev_name(dev), ULPI_ROOT);
> -	debugfs_create_file("regs", 0444, root, ulpi, &ulpi_regs_ops);
> +	debugfs_create_file("regs", 0444, root, ulpi, &ulpi_regs_fops);
>  
>  	dev_dbg(&ulpi->dev, "registered ULPI PHY: vendor %04x, product %04x\n",
>  		ulpi->id.vendor, ulpi->id.product);
> -- 
> 2.25.1

-- 
heikki
