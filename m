Return-Path: <linux-usb+bounces-310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E99317A46E6
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 12:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E99FA1C20B45
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 10:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F821C6A2;
	Mon, 18 Sep 2023 10:27:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954DE1C687
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 10:27:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D8CD1
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695032821; x=1726568821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JQmufLGR5fmrLvM5oKrA2FVqksr8peM/TJOgolt5oTY=;
  b=FFIVcKBFfX8/FQMdRPLgr1PsvZtqhil2zzp/zBDxs6ur49wqlzq+rgab
   tWGdIlHUZVB0Vij1ADGZvyS0OHDvMlCVX8ZJ5b05K+VFAATw8+Y0bCdP/
   wOwzgkzbnhgUuliB/Thd5kT7bs7kBvXizIhsNB6sHdYmSu07zl07Ytj2t
   6gFBNkIguEbeCKUavszzZMKjkFOsKbHXd36R75X94s1n17uv88LApBFiv
   h/qtab40B7uKRLkO9P8z+1iVz/Ov/kq8sj0pI6O+YXXiZNUMhOBVhmW2a
   U4dWcVqxHeZ5WJEeqvZtnCEHl6NtgQM7Vec1dDzkVZxUe4w9KNL4vSnVl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="379527547"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="379527547"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 03:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="869500860"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="869500860"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga004.jf.intel.com with SMTP; 18 Sep 2023 03:26:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Sep 2023 13:26:57 +0300
Date: Mon, 18 Sep 2023 13:26:57 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: linux@roeck-us.net, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, jun.li@nxp.com
Subject: Re: [PATCH v2 1/2] usb: typec: tcpci: add check code for
 tcpci/regmap_read/write()
Message-ID: <ZQgl8byyZNqe5Af1@kuha.fi.intel.com>
References: <20230914121158.2955900-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914121158.2955900-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 14, 2023 at 08:11:57PM +0800, Xu Yang wrote:
> The return value from tcpci/regmap_read/write() must be checked to get
> rid of the bad influence of other modules. This will add check code for
> all of the rest read/write() callbacks and will show error when failed
> to get ALERT register.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - remove printing code
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 34 +++++++++++++++++++++++++---------
>  1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 0ee3e6e29bb1..8ccc2d1a8ffc 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -657,21 +657,28 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  	int ret;
>  	unsigned int raw;
>  
> -	tcpci_read16(tcpci, TCPC_ALERT, &status);
> +	ret = tcpci_read16(tcpci, TCPC_ALERT, &status);
> +	if (ret < 0)
> +		return ret;
>  
>  	/*
>  	 * Clear alert status for everything except RX_STATUS, which shouldn't
>  	 * be cleared until we have successfully retrieved message.
>  	 */
> -	if (status & ~TCPC_ALERT_RX_STATUS)
> -		tcpci_write16(tcpci, TCPC_ALERT,
> +	if (status & ~TCPC_ALERT_RX_STATUS) {
> +		ret = tcpci_write16(tcpci, TCPC_ALERT,
>  			      status & ~TCPC_ALERT_RX_STATUS);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	if (status & TCPC_ALERT_CC_STATUS)
>  		tcpm_cc_change(tcpci->port);
>  
>  	if (status & TCPC_ALERT_POWER_STATUS) {
> -		regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
> +		ret = regmap_read(tcpci->regmap, TCPC_POWER_STATUS_MASK, &raw);
> +		if (ret < 0)
> +			return ret;
>  		/*
>  		 * If power status mask has been reset, then the TCPC
>  		 * has reset.
> @@ -687,7 +694,9 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		unsigned int cnt, payload_cnt;
>  		u16 header;
>  
> -		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> +		ret = regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> +		if (ret < 0)
> +			return ret;

I think you still need to clear TCPC_ALERT_RX_STATUS in this case.
Guenter, can you check this?

>  		/*
>  		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
>  		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
> @@ -699,18 +708,25 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		else
>  			payload_cnt = 0;
>  
> -		tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> +		ret = tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> +		if (ret < 0)
> +			return ret;
>  		msg.header = cpu_to_le16(header);
>  
>  		if (WARN_ON(payload_cnt > sizeof(msg.payload)))
>  			payload_cnt = sizeof(msg.payload);
>  
> -		if (payload_cnt > 0)
> -			regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
> +		if (payload_cnt > 0) {
> +			ret = regmap_raw_read(tcpci->regmap, TCPC_RX_DATA,
>  					&msg.payload, payload_cnt);
> +			if (ret < 0)
> +				return ret;
> +		}
>  
>  		/* Read complete, clear RX status alert bit */
> -		tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> +		ret = tcpci_write16(tcpci, TCPC_ALERT, TCPC_ALERT_RX_STATUS);
> +		if (ret < 0)
> +			return ret;
>  
>  		tcpm_pd_receive(tcpci->port, &msg);
>  	}
> -- 
> 2.34.1

-- 
heikki

