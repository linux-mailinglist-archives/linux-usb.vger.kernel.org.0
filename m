Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01168E22CB
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 20:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390560AbfJWSzp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 14:55:45 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42314 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389547AbfJWSzo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 14:55:44 -0400
Received: by mail-lf1-f67.google.com with SMTP id z12so16953312lfj.9
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=siFQiuzIjrmxUWWr+3F2Xxv7kAaf2tX6TRSs0T4RCwc=;
        b=UYzrIeVTtIf1BJjJfLLhqwsRZMgn5vMmjhQA8UDNkOK272ppmCgLZXF4Am3TyqIp3l
         XnhO2K7EO4RQYklnDB0VLmFyRoo+eaXLsdPVsk5mFGzuGFmE0b+upNFdyanOPlQqYNOw
         snGY85gcdtWLrbbJ3o+bizmGfgw3ucS0brj5IAW6coBAOBq6+lq1FAKcpOVY1924eKGM
         tvRJ0S1jQAQSg2PQdBxlTwhuSHYrAjkG9GmOkTxYPxZaU7DwfiaFQdc5UQjmOgBYKZPA
         t6xQ37w4qA6SnJFVzo6CbgNZFGShTMHiGE8622aE2Wr4lGqwJcN+JXb3pHGhYR5sJomA
         uRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=siFQiuzIjrmxUWWr+3F2Xxv7kAaf2tX6TRSs0T4RCwc=;
        b=HtZ+/3OLPXCAVbAQ6gGtU1vWOb8ltPXglEei5DXpxYdXGvACPn+spNZ3dVevwOow+C
         ga7i2gLB63Vm81YXbsaH5Msp2zEeyj23YNtcLAVE/1Egxv4DugC+/zy4SohLSjH9y7KG
         /eS1BNMuHiVkRqt6pdQnHrar+5oILkvJgwsd3ToY+ERy7gVxhad0uwvTe+yVfErr4y2D
         1gtbnq+WveQW11ncGTqyZb9E3exWCKxbnBoGcKL5Po5f7nHIxgpbnDfI6ZkL8gb89CUP
         pQqZrCbvuN7X0ABE1cDpqW6+hTIxzALAJKSxiN8ZkLdux0HC4RRb51L2emfyuGlckD8U
         lf3A==
X-Gm-Message-State: APjAAAUdG2F58RaAJRatE648gcTqkN60VM2D8nLqm9C9Kla/wW3QpkcL
        DQa4RRbAAgZFsa9zEPiy+QQx2g==
X-Google-Smtp-Source: APXvYqxDjviSod7jwUJYUuawdEHDdl/NXPVH+ubWyrRrncUtwvl48hJyYqE9JcUCV9380lASFQ0wWQ==
X-Received: by 2002:a19:6a08:: with SMTP id u8mr25275437lfu.74.1571856942801;
        Wed, 23 Oct 2019 11:55:42 -0700 (PDT)
Received: from wasted.cogentembedded.com ([2a00:1fa0:4201:cc87:e4a0:50f7:ca47:8e61])
        by smtp.gmail.com with ESMTPSA id b141sm10973957lfg.67.2019.10.23.11.55.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 11:55:42 -0700 (PDT)
Subject: Re: [PATCH] dmaengine: cppi41: Fix cppi41_dma_prep_slave_sg() when
 idle
To:     Tony Lindgren <tony@atomide.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Vinod Koul <vinod.koul@intel.com>
Cc:     Alexandre Bailon <abailon@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bin Liu <b-liu@ti.com>, Daniel Mack <zonque@gmail.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        George Cherian <george.cherian@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Johan Hovold <johan@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        dmaengine@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, giulio.benetti@benettiengineering.com,
        Sebastian Reichel <sre@kernel.org>,
        Skvortsov <andrej.skvortzov@gmail.com>,
        Yegor Yefremov <yegorslists@googlemail.com>
References: <20191023153138.23442-1-tony@atomide.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <6996a5de-215b-f9a2-1aeb-5eeed1b7cf8d@cogentembedded.com>
Date:   Wed, 23 Oct 2019 21:55:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20191023153138.23442-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 10/23/2019 06:31 PM, Tony Lindgren wrote:

> Yegor Yefremov <yegorslists@googlemail.com> reported that musb and ftdi
> uart can fail for the first open of the uart unless connected using
> a hub.
> 
> This is because the first dma call done by musb_ep_program() must wait
> if cppi41 is PM runtime suspended. Otherwise musb_ep_program() continues
> with other non-dma packets before the DMA transfer is started causing at
> least ftdi uarts to fail to receive data.
> 
> Let's fix the issue by waking up cppi41 with PM runtime calls added to
> cppi41_dma_prep_slave_sg() and return NULL if still idled. This way we
> have musb_ep_program() continue with PIO until cppi41 is awake.
> 
> Fixes: fdea2d09b997 ("dmaengine: cppi41: Add basic PM runtime support")
> Cc: Bin Liu <b-liu@ti.com>
> Cc: giulio.benetti@benettiengineering.com
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Skvortsov <andrej.skvortzov@gmail.com>
> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Please consider adding Cc stable v4.9+ tag when committing
> 
> ---
>  drivers/dma/ti/cppi41.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
> --- a/drivers/dma/ti/cppi41.c
> +++ b/drivers/dma/ti/cppi41.c
> @@ -586,9 +586,22 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
>  	enum dma_transfer_direction dir, unsigned long tx_flags, void *context)
>  {
>  	struct cppi41_channel *c = to_cpp41_chan(chan);
> +	struct dma_async_tx_descriptor *txd = NULL;
> +	struct cppi41_dd *cdd = c->cdd;
>  	struct cppi41_desc *d;
>  	struct scatterlist *sg;
>  	unsigned int i;
> +	int error;
> +
> +	error = pm_runtime_get(cdd->ddev.dev);
> +	if (error < 0) {

   I'd call that variable 'status', comparison (error < 0) just doesn't look right.
If it was *if* (error), it would have been more correct. 

> +		pm_runtime_put_noidle(cdd->ddev.dev);
> +
> +		return NULL;
> +	}
> +
> +	if (cdd->is_suspended)
> +		goto err_out_not_ready;
>  
>  	d = c->desc;
>  	for_each_sg(sgl, sg, sg_len, i) {
[...]

MBR, Sergei
