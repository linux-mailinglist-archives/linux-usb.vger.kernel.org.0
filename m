Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339711E52D9
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 03:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgE1BUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 21:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgE1BUT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 21:20:19 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C01DC05BD1E;
        Wed, 27 May 2020 18:20:19 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id q9so2316252pjm.2;
        Wed, 27 May 2020 18:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VQ7LUQQZ/eVaGd5VEJD8oJklzM/fJyrG9ba3r7/1SoE=;
        b=TwSyLC8eiHi2IO8CR/d7V5Qvb8xA2M9Nl35lijvJ4ZPWcZraZiDNuo8HfBWx7Sce0X
         Bv6T8vUl/PB5CLJp1W7qmAOzmeZ9QHyynNj+YMnvfMcKbFghWLKAG5aGzrC/u8vi5e8W
         0tMS0MLZLkC5NpVvwvIJffw9mqVRG9CtmOphbnhppofBjDvmZjURgRm07Vw7YZxOdw2w
         z7w2kEp2z29Ih7QX+RuXo9B11yKEbFZL0N/GqusxSgtfWrWhShEwv+PgcB7UMrtDYKeL
         LXxaHazBly6uVv34fK2vIy03U523QrWgP2a2wblyrA/JV5j/kh/v9+MO2rpiPOvETIYw
         0d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VQ7LUQQZ/eVaGd5VEJD8oJklzM/fJyrG9ba3r7/1SoE=;
        b=hfFlmgEZni9gWALKYewoyTJ8BWMzJG+dwpnC3rJjSUYdG1HRCKEXDqTAIa9WAWWVCq
         PgsXUac3GU81wigtK2zLt7PxtgUI4Vq1lcwZBjtRXmf8xYwBgGmuAm1ZyjZzCZykXyCO
         Hd0N8P9l9gsuZYKUEjUuS+cMl+Ub7aFtLxME6J7PxEtfqxk5wM1r1w+bOXK5HFyvmZHN
         lzBuM3T0Pgd6Ea9S8NL4zHvw5NJ0CcRXsmfIZJeKor2ojZ4Zl/1H2ETEgX57EAW1H28z
         fl5wSmwC6rH4Ef1DEGJPSnAimyhKMhLA7GIPcJIkOaW2EacFp2DIzcmtfzpWxA2aPtgs
         J/Hg==
X-Gm-Message-State: AOAM531Aer0BGkNdWVWmV/S/iQV4n7xCQn+Guo5Y1f0I7MQCLzoMPbpY
        5PuWlNM71bG1kSSsGFSHGFg=
X-Google-Smtp-Source: ABdhPJxxtSCpYuqOC2VnFEhiZ9l6NIkOXrrUOJLnOaecuTiUxgsIzz0zpHcFLL8l6Z397kEPj5y8Aw==
X-Received: by 2002:a17:90a:2ec1:: with SMTP id h1mr1161911pjs.145.1590628818740;
        Wed, 27 May 2020 18:20:18 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:400::5:ccc9])
        by smtp.gmail.com with ESMTPSA id n21sm3523989pjo.25.2020.05.27.18.20.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 18:20:18 -0700 (PDT)
Date:   Wed, 27 May 2020 18:20:11 -0700
From:   Tao Ren <rentao.bupt@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, taoren@fb.com
Subject: Re: [PATCH] usb: gadget: aspeed: fixup vhub port irq handling
Message-ID: <20200528012010.GA30405@taoren-ubuntu-R90MNF91>
References: <20200528011154.30355-1-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528011154.30355-1-rentao.bupt@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ben,

I sent out the follow-on patch per Greg's suggestion, and the purpose is
to include the latest version (v4) of the original commit. As v4 was
already Acked-by you, can I add the tag for this patch? Or are you
willing to Ack it again?


Cheers,

Tao

On Wed, May 27, 2020 at 06:11:54PM -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> This is a follow-on patch for commit a23be4ed8f48 ("usb: gadget: aspeed:
> improve vhub port irq handling"): for_each_set_bit() is replaced with
> simple for() loop because for() loop runs faster on ASPEED BMC.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 10 +++-------
>  drivers/usb/gadget/udc/aspeed-vhub/vhub.h |  3 +++
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/core.c b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> index cdf96911e4b1..be7bb64e3594 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/core.c
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/core.c
> @@ -135,13 +135,9 @@ static irqreturn_t ast_vhub_irq(int irq, void *data)
>  
>  	/* Handle device interrupts */
>  	if (istat & vhub->port_irq_mask) {
> -		unsigned long bitmap = istat;
> -		int offset = VHUB_IRQ_DEV1_BIT;
> -		int size = VHUB_IRQ_DEV1_BIT + vhub->max_ports;
> -
> -		for_each_set_bit_from(offset, &bitmap, size) {
> -			i = offset - VHUB_IRQ_DEV1_BIT;
> -			ast_vhub_dev_irq(&vhub->ports[i].dev);
> +		for (i = 0; i < vhub->max_ports; i++) {
> +			if (istat & VHUB_DEV_IRQ(i))
> +				ast_vhub_dev_irq(&vhub->ports[i].dev);
>  		}
>  	}
>  
> diff --git a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> index 2e5a1ef14a75..87a5dea12d3c 100644
> --- a/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> +++ b/drivers/usb/gadget/udc/aspeed-vhub/vhub.h
> @@ -67,6 +67,9 @@
>  #define VHUB_IRQ_HUB_EP0_SETUP			(1 << 0)
>  #define VHUB_IRQ_ACK_ALL			0x1ff
>  
> +/* Downstream device IRQ mask. */
> +#define VHUB_DEV_IRQ(n)				(VHUB_IRQ_DEVICE1 << (n))
> +
>  /* SW reset reg */
>  #define VHUB_SW_RESET_EP_POOL			(1 << 9)
>  #define VHUB_SW_RESET_DMA_CONTROLLER		(1 << 8)
> -- 
> 2.17.1
> 
