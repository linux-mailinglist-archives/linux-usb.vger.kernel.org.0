Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F08D164B99
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 18:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgBSRPR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 12:15:17 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37054 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgBSRPR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Feb 2020 12:15:17 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so335919pjb.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2020 09:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p8mILfY4p0DfIGVNTpkUYfM9Zh4ijtnY5APfyb1vmyg=;
        b=OCl656MSbaKSiX2hD637sG/cTVkB1AMhHQkaHTFAL8XMVAtgrhMg4Kx5a3fanhg915
         JuzPYykZN/aUpkGV0QT5cl3PrKn8nsTjZjOHZJDOzDAE2lCp5bYeHWe3HAliGDu6La3w
         7WReCanESDYUxHSlatlwCilbSFtkZPYShezJf7MMw7Va8kM2KaP+e7mN42urbnVYvyyk
         9bJohoQTddPdmkIIP2ng+Mn6TiCDZdIr/Ww13JrtOEyv1xHHTBpvLr6zOaUOzM9I7W+c
         ZaYs98o3Q+BOyP7xSJ5c7jIJQE9jZY5/kCIGlpcRaUZvhv42iDk5ppuDPrxT5b2Raoh0
         mPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=p8mILfY4p0DfIGVNTpkUYfM9Zh4ijtnY5APfyb1vmyg=;
        b=mFcSteWq2czFSeMjaZ+0R5l+aWxFYnXDpoLiYJmbdUdO+zkDUT9WSr3TY+3TRl88mR
         2fakSuGQ1tMMvqHqg2MSSNYDra7RwBDjDaQZQwFFJUiBqUoF8z5kDwBCb5jEfKLlYbGq
         ePaDdFX8aCjffMnDkltVHYsla+emug+ejPowKwq5iRpg2ZDYFrwZ7ONVitY65P/WCI1k
         EFswTs5LUcP9N/LRTH2qKslu7PwoX4PLNKCt50ExjQSynnMe+Z3+lEbd6T+oaq1h/kZG
         KP+rHHZ+AAZcnAUVwIcD5znfLMUA3dJD5/cSPNSH3QOVMrkUmHsU31pPP9fJtrCBNecj
         nrpQ==
X-Gm-Message-State: APjAAAVcR0beJ8vezJUXEVd6pCUteUaelqMtKWAo6XRysSuAATSywgRj
        kFtczchgkPPvfmaKLFqxIIY=
X-Google-Smtp-Source: APXvYqxSmFvGSgR4rBEmeNj4xrkHB+N1EZ2/5B/C5fsalHKMQ6hLsUGmQrZ1lT6D8SRosFOGnaF0zw==
X-Received: by 2002:a17:90a:d995:: with SMTP id d21mr10153790pjv.118.1582132516582;
        Wed, 19 Feb 2020 09:15:16 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 199sm202126pfv.81.2020.02.19.09.15.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2020 09:15:15 -0800 (PST)
Date:   Wed, 19 Feb 2020 09:15:14 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     jun.li@nxp.com
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-imx@nxp.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: move to SNK_UNATTACHED if sink removed
 for DRP
Message-ID: <20200219171514.GA6677@roeck-us.net>
References: <1582128343-22438-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582128343-22438-1-git-send-email-jun.li@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 20, 2020 at 12:05:43AM +0800, jun.li@nxp.com wrote:
> From: Li Jun <jun.li@nxp.com>
> 
> Per typec spec:
> Figure 4-15 Connection State Diagram: DRP
> Figure 4-16 Connection State Diagram: DRP with Accessory and Try.SRC
> 	    Support
> Figure 4-17 Connection State Diagram: DRP with Accessory and Try.SNK
> 	    Support
> DRP port should move to Unattached.SNK instead of Unattached.SRC if
> sink removed.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 78077c2..3174180 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3680,8 +3680,12 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
>  	case SRC_SEND_CAPABILITIES:
>  	case SRC_READY:
>  		if (tcpm_port_is_disconnected(port) ||
> -		    !tcpm_port_is_source(port))
> -			tcpm_set_state(port, SRC_UNATTACHED, 0);
> +		    !tcpm_port_is_source(port)) {
> +			if (port->port_type == TYPEC_PORT_SRC)
> +				tcpm_set_state(port, SRC_UNATTACHED, 0);
> +			else
> +				tcpm_set_state(port, SNK_UNATTACHED, 0);
> +		}
>  		break;
>  	case SNK_UNATTACHED:
>  		if (tcpm_port_is_sink(port))
> -- 
> 2.7.4
> 
