Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B95254C71
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 19:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgH0RyT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 13:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgH0RyS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 13:54:18 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1460C061264
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=/y/iBXYAJ36T1NaJXIzJMrtOZrpXy9an16Ba2/yoBrI=; b=iuMj1hv3yGut430HW929xCR6zj
        /6nMdjgX9AyGxRLmtWmT3jl5oy8/abzZ3HL62wrEaZbI0k5DyB6HDIZefEkV4xmLrdqf+bm66nkyz
        7+GDImXZiOsA6qYbqY4nFrNrE5KNBP0AxkiKAkrsdbM5LTJGRi1zD9pjDOviKr52CsLq91qPvgVjo
        P41wqVGBG50i+szFULZCrnLKNLOlhhuhdCEsaBK+qbJZPhemoa/xmSloTNjGmkSh1+COdS9y0aKyt
        jN0I6ND1EkvQIwYAx7oFErVx/1aTeJwDT1QepGJfSJN8MIxScp4zoSfw2fqboU8PLcEvabOZxlU3r
        NySLbncg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kBM6J-0003tR-Hv; Thu, 27 Aug 2020 17:54:15 +0000
Subject: Re: [PATCH v3 1/2] usb/typec: fix array overruns in ucsi.c
 partner_altmode[]
To:     Zwane Mwaikambo <zwanem@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Zwane Mwaikambo <zwane@yosper.io>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <alpine.DEB.2.21.2008271035320.30454@montezuma.home>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0013fe6c-c0a2-1759-c769-cda025e5eb38@infradead.org>
Date:   Thu, 27 Aug 2020 10:54:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008271035320.30454@montezuma.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 8/27/20 10:49 AM, Zwane Mwaikambo wrote:
> This v3 addresses patch formatting and submission issues with the 
> previous versions.

That info goes after the "---" line.

> con->partner_altmode[i] ends up with the value 0x2 in the call to 
> typec_altmode_update_active because the array has been accessed out of 
> bounds causing a random memory read.
> 
> This patch fixes the first occurence and 2/2 the second.

occurrence

> 
> Signed-off-by: Zwane Mwaikambo <zwane@yosper.io>
> ---
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index d0c63afaf..79061705e 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -218,9 +218,10 @@ void ucsi_altmode_update_active(struct ucsi_connector *con)
>  	if (cur < UCSI_MAX_ALTMODES)
>  		altmode = typec_altmode_get_partner(con->port_altmode[cur]);
>  
> -	for (i = 0; con->partner_altmode[i]; i++)
> -		typec_altmode_update_active(con->partner_altmode[i],
> -					    con->partner_altmode[i] == altmode);
> +	for (i = 0; i < UCSI_MAX_ALTMODES; i++)
> +		if (con->partner_altmode[i])
> +			typec_altmode_update_active(con->partner_altmode[i],
> +										con->partner_altmode[i] == altmode);

What happened to the indentation here?  Too much.

>  }
>  
>  static u8 ucsi_altmode_next_mode(struct typec_altmode **alt, u16 svid)
>  
> 


-- 
~Randy

