Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA0079114
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 18:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387579AbfG2Qgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jul 2019 12:36:44 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45257 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387444AbfG2Qgo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jul 2019 12:36:44 -0400
Received: by mail-pf1-f194.google.com with SMTP id r1so28301038pfq.12
        for <linux-usb@vger.kernel.org>; Mon, 29 Jul 2019 09:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mdTXOfOovTlwSda3O/fFZhQvp67cV9yb0CIwUeXn1RI=;
        b=mbozBovkfIRC7KNEazYHxHu01ZoXIL0Td88QY3+N6rKBFGzZtbLhA90H8M40LuAgMM
         ZmxMzySYaivWafsimcD6zJRJyVWPpmu4AFUYLBNqyrEwAez+9j1Uh+EHuoZvRC7eaD/y
         FjXj19LO1WfiIS+5RTmoHCzxPc6FI+nkeOz6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mdTXOfOovTlwSda3O/fFZhQvp67cV9yb0CIwUeXn1RI=;
        b=Uhh9pfuUhOAzZnTl1X0/QTC5Hnr1Cy1NXurKVqRhI/+EIm+7hPDA5L7/MC22j0R7pS
         zTS00jPsAoU0Aa3CfAH2sXFTUTFGMDswMdsgEX8EtZ9+zxZca+9YkLzgURwGd7Mh5MFm
         QexDvAfkvqBCb0N4EXjCodFD78t/0hSlDG+guZsq2mKwekShbjIYcQM0xYqdgHxPQ28+
         6PSsAN8ukeijbwDg9ytkR+8qWirUTeoetWbhQnrghbR5kPRR+F3oTrXJoBy6BkUFrsfZ
         ZP0q92V/SbKUV//PLCl3lrsy6hYGDE04cMap5GDEydBV0UY0btlHSlcW6qqap/VHYRzb
         3cow==
X-Gm-Message-State: APjAAAVtio3WM4mcnAA2pKMtilyFU4ZtJM221956y3IxIq/G72gF+OWU
        pEHOSODMabH78+CtJ8uA8XYPug==
X-Google-Smtp-Source: APXvYqxtHJKAufED/RCPFm9yEysNVZtjbSiuXSyxRiv/JBXXpYS7nVlw0zidAqBr5VA2SLe1r0VaqA==
X-Received: by 2002:a63:9dcb:: with SMTP id i194mr59867132pgd.444.1564418203148;
        Mon, 29 Jul 2019 09:36:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l1sm81044255pfl.9.2019.07.29.09.36.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 09:36:41 -0700 (PDT)
Date:   Mon, 29 Jul 2019 09:36:40 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] usb: phy: ab8500-usb: Mark expected switch fall-throughs
Message-ID: <201907290936.F5F486A6F@keescook>
References: <20190729000631.GA24165@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729000631.GA24165@embeddedor>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jul 28, 2019 at 07:06:31PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warnings:
> 
> drivers/usb/phy/phy-ab8500-usb.c: In function 'ab8500_usb_link_status_update':
> drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    event = UX500_MUSB_RIDB;
>    ~~~~~~^~~~~~~~~~~~~~~~~
> drivers/usb/phy/phy-ab8500-usb.c:425:2: note: here
>   case USB_LINK_NOT_CONFIGURED_8500:
>   ^~~~
> drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    event = UX500_MUSB_RIDC;
>    ~~~~~~^~~~~~~~~~~~~~~~~
> drivers/usb/phy/phy-ab8500-usb.c:441:2: note: here
>   case USB_LINK_STD_HOST_NC_8500:
>   ^~~~
> drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    event = UX500_MUSB_RIDA;
>    ~~~~~~^~~~~~~~~~~~~~~~~
> drivers/usb/phy/phy-ab8500-usb.c:460:2: note: here
>   case USB_LINK_HM_IDGND_8500:
>   ^~~~
> drivers/usb/phy/phy-ab8500-usb.c: In function 'ab8505_usb_link_status_update':
> drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    event = UX500_MUSB_RIDB;
>    ~~~~~~^~~~~~~~~~~~~~~~~
> drivers/usb/phy/phy-ab8500-usb.c:333:2: note: here
>   case USB_LINK_NOT_CONFIGURED_8505:
>   ^~~~
> drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    event = UX500_MUSB_RIDC;
>    ~~~~~~^~~~~~~~~~~~~~~~~
> drivers/usb/phy/phy-ab8500-usb.c:353:2: note: here
>   case USB_LINK_STD_HOST_NC_8505:
>   ^~~~
> drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    event = UX500_MUSB_RIDA;
>    ~~~~~~^~~~~~~~~~~~~~~~~
> drivers/usb/phy/phy-ab8500-usb.c:371:2: note: here
>   case USB_LINK_HM_IDGND_8505:
>   ^~~~
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/usb/phy/phy-ab8500-usb.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
> index aaf363f19714..14b432982fd3 100644
> --- a/drivers/usb/phy/phy-ab8500-usb.c
> +++ b/drivers/usb/phy/phy-ab8500-usb.c
> @@ -330,6 +330,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
>  	switch (lsts) {
>  	case USB_LINK_ACA_RID_B_8505:
>  		event = UX500_MUSB_RIDB;
> +		/* Fall through */
>  	case USB_LINK_NOT_CONFIGURED_8505:
>  	case USB_LINK_RESERVED0_8505:
>  	case USB_LINK_RESERVED1_8505:
> @@ -350,6 +351,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
>  
>  	case USB_LINK_ACA_RID_C_NM_8505:
>  		event = UX500_MUSB_RIDC;
> +		/* Fall through */
>  	case USB_LINK_STD_HOST_NC_8505:
>  	case USB_LINK_STD_HOST_C_NS_8505:
>  	case USB_LINK_STD_HOST_C_S_8505:
> @@ -368,6 +370,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
>  	case USB_LINK_ACA_RID_A_8505:
>  	case USB_LINK_ACA_DOCK_CHGR_8505:
>  		event = UX500_MUSB_RIDA;
> +		/* Fall through */
>  	case USB_LINK_HM_IDGND_8505:
>  		if (ab->mode == USB_IDLE) {
>  			ab->mode = USB_HOST;
> @@ -422,6 +425,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
>  	switch (lsts) {
>  	case USB_LINK_ACA_RID_B_8500:
>  		event = UX500_MUSB_RIDB;
> +		/* Fall through */
>  	case USB_LINK_NOT_CONFIGURED_8500:
>  	case USB_LINK_NOT_VALID_LINK_8500:
>  		ab->mode = USB_IDLE;
> @@ -438,6 +442,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
>  	case USB_LINK_ACA_RID_C_HS_8500:
>  	case USB_LINK_ACA_RID_C_HS_CHIRP_8500:
>  		event = UX500_MUSB_RIDC;
> +		/* Fall through */
>  	case USB_LINK_STD_HOST_NC_8500:
>  	case USB_LINK_STD_HOST_C_NS_8500:
>  	case USB_LINK_STD_HOST_C_S_8500:
> @@ -457,6 +462,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
>  
>  	case USB_LINK_ACA_RID_A_8500:
>  		event = UX500_MUSB_RIDA;
> +		/* Fall through */
>  	case USB_LINK_HM_IDGND_8500:
>  		if (ab->mode == USB_IDLE) {
>  			ab->mode = USB_HOST;
> -- 
> 2.22.0
> 

-- 
Kees Cook
