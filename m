Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAD9162C9
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 13:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfEGL1A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 07:27:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39993 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfEGL1A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 07:27:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id d15so13972901ljc.7
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2019 04:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xV8FmRO0mWj0sIWzs8w528CN5pgK4MkoZyjFAB8G938=;
        b=VBZH/ntr8Lrq0CS1e8dKbZ1fl/tEiwIzVzUI5J4bVKg/Dsa39Mv9BAGsEEzap6xfHK
         Qb6INYm7uQ9IbwR4f5K6D7WreCssqyadlmnFYBQXM3xoioUcQirSlYe7h4Ov1t69tB7f
         PUd2qJ3n7Im+/0fPzs1oSWnAVNiXGwBejxugiJ7Q0YiuQ5YuoH3S2TONda2rXryJXNH8
         chhUpcIP1SBWX6jWrHIXOthiwx0xSg7D8zGftWoi874SOvEGq+WHk1Ni6exqrk8zsWKC
         bfYguGs5N4CgKxV4hQPiOiUEVTk8N8Z2pj3XnnejNFOaorPSr4Nq3hbhNlI8Yphs1cVZ
         IGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=xV8FmRO0mWj0sIWzs8w528CN5pgK4MkoZyjFAB8G938=;
        b=ckaG+gDEtYZYqKDWHYHCpv4aAAXNcPOKcF+X6mU/206Fmnhmc+JDzfu+0D1DZVYbID
         SAP0mnmG02A2qwfva4I4TAclyVuPW2VLDHx/AAb6LKH1N1+cvgtO8GvE2tgmUsm6vss7
         UUZmWEIrL1XOEWTrpCwznpZayKzfy5T+HRWitVCikDThH6W+qrYnDp+0P/DcWf9BhfO/
         O6FuLZ/oyVOxr+5z7dJ/6UZwXlm8vUP4Cxilu3cUp1UhEyyLjZkpWQoxa2FsRvXCXqnd
         qWP7m+rRr3xyvLS0rKM6u/lUKNPBYqOS7xz4Eq4oyIGQEMqk6Po/XB43vyKi1ARUiLgV
         614w==
X-Gm-Message-State: APjAAAXMcIOm2JiW0XdxZwRRdilvznq/3R8QK9U2NAPM3KciIUMT7YsK
        3Zhtr0dvcuQ/Fld1GWdLaihi5Q==
X-Google-Smtp-Source: APXvYqz7/q0HrA+enq57C03Bh8QEwF/xYs+9MirAZyg5MZwpUjo0uGaletHd+B7eTbtcq4vvCIhYLw==
X-Received: by 2002:a2e:834d:: with SMTP id l13mr17754067ljh.97.1557228418531;
        Tue, 07 May 2019 04:26:58 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.88])
        by smtp.gmail.com with ESMTPSA id r5sm3402837ljh.27.2019.05.07.04.26.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 04:26:57 -0700 (PDT)
Subject: Re: [PATCH 03/10] phy: renesas: rcar-gen3-usb2: Check dr_mode when
 not using OTG
To:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-4-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <17bcc673-5fed-ce4f-3d61-af34bfa5d769@cogentembedded.com>
Date:   Tue, 7 May 2019 14:26:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190506234631.113226-4-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/07/2019 02:46 AM, Chris Brandt wrote:

> When not using OTG, the PHY will need to know if it should function as
> host or peripheral by checking dr_mode in the PHY node (not the parent
> controller node).
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 218b32e458cb..4eaa228ebd30 100644
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@ -408,7 +408,12 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
>  		if (rcar_gen3_needs_init_otg(channel))
>  			rcar_gen3_init_otg(channel);
>  		rphy->otg_initialized = true;
> -	}
> +	} else

   Wait, don't we neeed {} here?

> +		/* Not OTG, so dr_mode should be set in PHY node */
> +		if (usb_get_dr_mode(channel->dev) == USB_DR_MODE_PERIPHERAL)
> +			writel(0x80000000, usb2_base + USB2_COMMCTRL);
> +		else
> +			writel(0x00000000, usb2_base + USB2_COMMCTRL);
>  
>  	rphy->initialized = true;
>  

MBR, Sergei
