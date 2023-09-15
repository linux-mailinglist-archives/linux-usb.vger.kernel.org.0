Return-Path: <linux-usb+bounces-136-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E0B7A1CE6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 12:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91EA01C20DB0
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 10:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50D84101D2;
	Fri, 15 Sep 2023 10:59:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B3BDF5E
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 10:59:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE2E01BB
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694775556; x=1726311556;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yMlyn9XewDSHoQ62IU/P4fZpPttYXURPO85qAQsatzo=;
  b=BkA5uQnEgXNBpr5pmX5llc19GF3pRzVD3BFm9wXaIEpkjGmqA41rNdEU
   Pgej7iZ8VYY7i3zmgYJARY2dv75KY3Su2/qaBUnIO7IRTci+8HegeuS7r
   vQGbEo+f85y7e6Lslz+pYZp+1XB9sUTcCoX8BNKgX5wHOSnNkCLzu2x78
   IYoUdKyEq13t5XxpLrHWlsWnpm0c+MciD71S8r3JYyCRaxFi3maSaAThP
   JIYBzCFm5YlOQAPMEdXIYU8KKpKKTGSgoxuC9ddjoTrex6bBz9LGmCC4+
   x9DZCGvg/JKc9D/cR4WH+vZnyMmya3mosqdBGaJm4SLSD8CqfiEzZYm0r
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376558912"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="376558912"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 03:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868669763"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="868669763"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga004.jf.intel.com with ESMTP; 15 Sep 2023 03:59:14 -0700
Message-ID: <a4e54c3c-6a8e-97fd-b954-eb5c7d42b7e6@intel.com>
Date: Fri, 15 Sep 2023 14:00:35 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [RFC] usb: XHCI: Implement xhci_handshake_check_state() API
Content-Language: en-US
To: Udipto Goswami <quic_ugoswami@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <20230915091737.31721-1-quic_ugoswami@quicinc.com>
From: Mathias Nyman <mathias.nyman@intel.com>
In-Reply-To: <20230915091737.31721-1-quic_ugoswami@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 15.9.2023 12.17, Udipto Goswami wrote:
> In some situations where xhci removal happens parallel to
> xhci_handshake, we enoughter a scenario where the
> xhci_handshake will fails because the status does not change
> the entire duration of polling. This causes the xhci_handshake
> to timeout resulting in long wait which might lead to watchdog
> timeout.
> 
> The API  handles command timeout which may happen upon XHCI
> stack removal. Check for xhci state and exit the handshake if
> xhci is removed.
> 
> Signed-off-by: Udipto Goswami <quic_ugoswami@quicinc.com>
> ---
>   drivers/usb/host/xhci-ring.c |  2 +-
>   drivers/usb/host/xhci.c      | 27 ++++++++++++++++++++++++++-
>   drivers/usb/host/xhci.h      |  2 ++
>   3 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 1dde53f6eb31..af9e27d3d303 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -450,7 +450,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
>   	 * In the future we should distinguish between -ENODEV and -ETIMEDOUT
>   	 * and try to recover a -ETIMEDOUT with a host controller reset.
>   	 */
> -	ret = xhci_handshake(&xhci->op_regs->cmd_ring,
> +	ret = xhci_handshake_check_state(xhci, &xhci->op_regs->cmd_ring,
>   			CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
>   	if (ret < 0) {
>   		xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index e1b1b64a0723..7bfcb09bcad0 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -84,6 +84,30 @@ int xhci_handshake(void __iomem *ptr, u32 mask, u32 done, u64 timeout_us)
>   /*
>    * Disable interrupts and begin the xHCI halting process.
>    */
> +int xhci_handshake_check_state(struct xhci_hcd *xhci,
> +	void __iomem *ptr, u32 mask, u32 done, int usec)
> +{
> +	u32	result;
> +
> +	do {
> +		result = readl_relaxed(ptr);
> +		if (result == ~(u32)0)
> +			return -ENODEV;
> +
> +		if (xhci->xhc_state & XHCI_STATE_REMOVING)
> +			return -ENODEV;
> +
> +		result &= mask;
> +		if (result == done)
> +			return 0;
> +
> +		udelay(1);
> +		usec--;
> +	} while (usec > 0);
> +
> +	return -ETIMEDOUT;
> +}
> +

Could we use the same readl_poll_timeout_atomic() macro that xhci_handshake() does?

Something like:

int xhci_handshake_check_state(struct xhci_hcd *xhci, void __iomem *ptr,
				u32 mask, u32 done, int usec, unsigned int exit_state)
{
	...

	ret = readl_poll_timeout_atomic(ptr, result,
                                         (result & mask) == done ||
                                         result == U32_MAX ||
					xhci->xhc_state & exit_state,
                                         1, timeout_us);

         if (result == U32_MAX || xhci->xch_state & exit_state)
                 return -ENODEV;
	
	return ret;
}

-Mathias


