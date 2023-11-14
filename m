Return-Path: <linux-usb+bounces-2857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E97EAAD0
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 08:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A7311C208C4
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 07:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4C911734;
	Tue, 14 Nov 2023 07:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcXD9sWh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4931172C
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 07:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F83AC433C7;
	Tue, 14 Nov 2023 07:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699946254;
	bh=+4kSS2cqW5ZV1rlUePkSMz5J6w5P2YeUyYN7VwsA6kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mcXD9sWhg1oF72RJY/959llE/tvISFPr+2WfofYm3m3oKO+2p5SxNmb9gXqCaGQQz
	 Pbc87hA717014dq07liKmSVat76mbxrnGNQ/pFQ2jkt5atJ/zK3qdwCKaU8iHp4SCt
	 gYY4BbDtD/mp87pDGOuZNAsQJIrx9YmvwYlh5klAHrge8l0ZYlyZUh3wO+JfSeqjJw
	 cmCC1QWkjFuuM9/iGXglSRUe+iGw9iD1YRqllYa4hifHN0363u8nl9N3jWnOpaq9nh
	 crCOJDfZpAcOYVmPJrWYJF0iciXPF+WzLxdeZWwX3QZ3gPTHJRUhrMRPS1KWTL/RaR
	 /GSSWyaMmS1cw==
Date: Tue, 14 Nov 2023 15:17:20 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Pawel Laszczak <pawell@cadence.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: cdnsp: Fix deadlock issue during using NCM gadget
Message-ID: <20231114071720.GA64573@nchen-desktop>
References: <20231108093125.224963-1-pawell@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108093125.224963-1-pawell@cadence.com>

On 23-11-08 10:31:25, Pawel Laszczak wrote:
> The interrupt service routine registered for the gadget is a primary
> handler which mask the interrupt source and a threaded handler which
> handles the source of the interrupt. Since the threaded handler is
> voluntary threaded, the IRQ-core does not disable bottom halves before
> invoke the handler like it does for the forced-threaded handler.
> 
> Due to changes in networking it became visible that a network gadget's
> completions handler may schedule a softirq which remains unprocessed.
> The gadget's completion handler is usually invoked either in hard-IRQ or
> soft-IRQ context. In this context it is enough to just raise the softirq
> because the softirq itself will be handled once that context is left.
> In the case of the voluntary threaded handler, there is nothing that
> will process pending softirqs. Which means it remain queued until
> another random interrupt (on this CPU) fires and handles it on its exit
> path or another thread locks and unlocks a lock with the bh suffix.
> Worst case is that the CPU goes idle and the NOHZ complains about
> unhandled softirqs.
> 
> Disable bottom halves before acquiring the lock (and disabling
> interrupts) and enable them after dropping the lock. This ensures that
> any pending softirqs will handled right away.
> 
> cc: <stable@vger.kernel.org>
> Fixes: 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD Driver")
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

> ---
>  drivers/usb/cdns3/cdnsp-ring.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/cdns3/cdnsp-ring.c b/drivers/usb/cdns3/cdnsp-ring.c
> index 07f6068342d4..275a6a2fa671 100644
> --- a/drivers/usb/cdns3/cdnsp-ring.c
> +++ b/drivers/usb/cdns3/cdnsp-ring.c
> @@ -1529,6 +1529,7 @@ irqreturn_t cdnsp_thread_irq_handler(int irq, void *data)
>  	unsigned long flags;
>  	int counter = 0;
>  
> +	local_bh_disable();
>  	spin_lock_irqsave(&pdev->lock, flags);
>  
>  	if (pdev->cdnsp_state & (CDNSP_STATE_HALTED | CDNSP_STATE_DYING)) {
> @@ -1541,6 +1542,7 @@ irqreturn_t cdnsp_thread_irq_handler(int irq, void *data)
>  			cdnsp_died(pdev);
>  
>  		spin_unlock_irqrestore(&pdev->lock, flags);
> +		local_bh_enable();
>  		return IRQ_HANDLED;
>  	}
>  
> @@ -1557,6 +1559,7 @@ irqreturn_t cdnsp_thread_irq_handler(int irq, void *data)
>  	cdnsp_update_erst_dequeue(pdev, event_ring_deq, 1);
>  
>  	spin_unlock_irqrestore(&pdev->lock, flags);
> +	local_bh_enable();
>  
>  	return IRQ_HANDLED;
>  }
> -- 
> 2.37.2
> 

-- 

Thanks,
Peter Chen

