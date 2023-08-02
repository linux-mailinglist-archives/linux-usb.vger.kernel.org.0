Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E20676CB5F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 12:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjHBK7a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 06:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232628AbjHBK72 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 06:59:28 -0400
Received: from mgamail.intel.com (unknown [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083B610FB
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 03:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690973968; x=1722509968;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ls2G1xZpM5/lbUHq74LPMKvPhw29G+3cVxNx/NY0Txo=;
  b=PSTkrnyF7eXh/lI17AkuyKJ4vmnMldZb98KEQn+gfYpLWjhr9fWJfSSp
   M/4LKcZnWsG7pCYylsj06DcC2NlGhAV0qjQIjEWS7RSiPaKu1GzWCKJTB
   1hOC7NKitmGO+hGgPtYP2k+RIkpCGeQJbHdXb1JQQB1B73m8xbMmqsttR
   rKeQE9n4p+7FKgRdx9RG0pF06sYE54GGTIr/79xh/d5j8q1h9sM7fka1o
   rppykGE2DloX+R+V3JIVMg8Tzh9VSp9DE2kmDa7H7b9/M6rcyPJLi3BgC
   XSDsJVRsQefgE9bGun2Jv7hZ8R55jgGnTZfz94D6dWLJ/CFY4Fmt7c8Sm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="455916752"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="455916752"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 03:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="872437933"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 02 Aug 2023 03:59:27 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 02 Aug 2023 13:59:24 +0300
Date:   Wed, 2 Aug 2023 13:59:24 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH -next] usb: typec: tcpci_mt6370: remove redundant
 dev_err_probe()
Message-ID: <ZMo3DNX4yHkuTnpF@kuha.fi.intel.com>
References: <20230801122834.89168-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801122834.89168-1-wangzhu9@huawei.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 01, 2023 at 08:28:34PM +0800, Zhu Wang wrote:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to present error messages.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_mt6370.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index 2a079464b398..9cda1005ef01 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -147,7 +147,7 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> -		return dev_err_probe(dev, irq, "Failed to get irq\n");
> +		return irq;
>  
>  	/* Assign TCPCI feature and ops */
>  	priv->tcpci_data.auto_discharge_disconnect = 1;
> -- 
> 2.17.1

-- 
heikki
