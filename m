Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D778EB09E2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 10:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbfILIIR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 04:08:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:59169 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbfILIIR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Sep 2019 04:08:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Sep 2019 01:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; 
   d="scan'208";a="184732621"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 12 Sep 2019 01:08:14 -0700
Subject: Re: [PATCH v2] usb: host: xhci: wait CNR when doing xhci resume
To:     Rick Tseng <rtseng@nvidia.com>, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <1567748218-6656-1-git-send-email-rtseng@nvidia.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <2c771924-920f-c81a-b69b-806df8687838@linux.intel.com>
Date:   Thu, 12 Sep 2019 11:10:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567748218-6656-1-git-send-email-rtseng@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6.9.2019 8.36, Rick Tseng wrote:
> NVIDIA 3.1 xHCI card would lose power when moving power state into D3Cold.
> Thus we need to wait CNR bit to clear when xhci resmue as xhci init.
> 
> Signed-off-by: Rick Tseng <rtseng@nvidia.com>
> ---
>   drivers/usb/host/xhci.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 03d1e55..6c7102c 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -1108,6 +1108,15 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>   		hibernated = true;
>   
>   	if (!hibernated) {
> +		/* Some xHC would lose power during suspend, so wait for
> +		 * controller ready from resume as xHC init.
> +		 */
> +		if (xhci_handshake(&xhci->op_regs->status,
> +				   STS_CNR, 0, 10 * 1000 * 1000)) {
> +			xhci_warn(xhci, "WARN: xHC timeout for CNR clear\n");
> +			spin_unlock_irq(&xhci->lock);
> +			return -ETIMEDOUT;
> +		}

xhci_handshake() can return -ENODEV in case controller is not reachable (still in PCI D3).
Would be better to just show and return what xhci_handshake() returns.
I know there are places where the existing code doesn't do this, but it would be
better to add it for new code

ret = xhci_handshake(CNR bit clear)
if (ret) {
	xhci_warn(xhci, "Controller not ready at resume %d\n", ret);
	unlock()
	return ret
}

-Mathias

