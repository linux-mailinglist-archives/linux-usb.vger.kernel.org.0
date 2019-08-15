Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 471258E549
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 09:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730629AbfHOHOG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 03:14:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:45972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730434AbfHOHOG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 03:14:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6ABAB20656;
        Thu, 15 Aug 2019 07:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565853244;
        bh=WtivyFKRGxuuhoSsg/tkmBPj16Bi9q7VKN8kdDZDkCQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lu3qds97d3Cb4Y6h1uMZ5kdn13shzHpgSAMj2uMubJpM2OpFwznRoKX+A7txqKVw3
         Ci1HzNz8kSa+IWCQ5/Y7yL5K2BjEY75Cyu3gJvKn+Pv1l8lyGdzVgzSBm3oINXqmOa
         /jGyTuTkzIjaYE6LW043xuWhnV6sczmCfkqohx8w=
Date:   Thu, 15 Aug 2019 09:14:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     cy_huang <u0084500@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        cy_huang <cy_huang@richtek.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, gene_chen@richtek.com,
        shufan_lee@richtek.com
Subject: Re: [PATCH] From: cy_huang <cy_huang@richtek.com> Subject: usb: add
 more vendor defined ops in tcpci
Message-ID: <20190815071402.GA25906@kroah.com>
References: <1565842753-14245-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565842753-14245-1-git-send-email-u0084500@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 15, 2019 at 12:19:13PM +0800, cy_huang wrote:
> diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
> index 303ebde..a6754fb 100644
> --- a/drivers/usb/typec/tcpm/tcpci.h
> +++ b/drivers/usb/typec/tcpm/tcpci.h
> @@ -130,6 +130,11 @@ struct tcpci_data {
>  			 bool enable);
>  	int (*start_drp_toggling)(struct tcpci *tcpci, struct tcpci_data *data,
>  				  enum typec_cc_status cc);
> +	int (*set_vbus)(struct tcpci *tcpci,
> +			struct tcpci_data *data, bool source, bool sink);
> +	int (*get_current_limit)(struct tcpci *tcpci, struct tcpci_data *data);
> +	int (*set_current_limit)(struct tcpci *tcpci,
> +				 struct tcpci_data *data, u32 max_ma, u32 mv);
>  };

You are adding callbacks here with no users of them, which isn't
allowed.  Please also submit the code that uses these callbacks at the
same time so we can review it all together.

thanks,

greg k-h
