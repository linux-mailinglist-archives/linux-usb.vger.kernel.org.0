Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E421A347AF9
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236251AbhCXOnF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236115AbhCXOmq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:42:46 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 537B7C061763;
        Wed, 24 Mar 2021 07:42:45 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso23205219ott.13;
        Wed, 24 Mar 2021 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wn3HpUWzPyv1Ui1ekyYWiurgraBbjaCW7hb/S6r7tVM=;
        b=bn2kB1kUDxFJdkDR1XUxFGDxYuj33LopXQee8iRGvS4cg+xU7BsYq7Vu1jXbIjg/zd
         7b3hc/zo1J6frWp+8pJcHLL6Axe0EOaHjEW50dQsa9qD3ED6hYnyCGXBgFD9GGR0RkCS
         WsEs818Mw3IjdgHcW5sDAugLtOr8pM8HaRJawR2M3hSpST6zt0eSIQdwvxyDnaJm3hUD
         C9u4XNVdFOkcbmgux0OigKL8g++33BsyAzq5r13o1mVG+WUDwb5bIllRDPcviQEhVvXO
         lz+AswXTgPTilSZSPmLMzZga/JlI7cZChwoZI4vE94+ClFpdJmook9R+xyPHfcKb0ves
         Nvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=wn3HpUWzPyv1Ui1ekyYWiurgraBbjaCW7hb/S6r7tVM=;
        b=pUBF6yinZ+Qq4hvOXQB1IQMMivp+ET/oYonuWqxiv4cLR7jgP2db2024ebvGwy/DH5
         Wh1UpfXv8cNYJARVedpxYDfedfW3/IrGCpkP8cCavjnllDdLC5wAhJpM0jiS/lZSbhJj
         OJyd6trRlsM1RQ2KvIyJ8SKkdYCiQuD2Z40fplRGwyeprJ119JZApGU//Tx++LjWED1E
         v1BHGLD8FdhPh3+j/20O8awv06oAfm6gDhD18fhT9sLnOYqn1DOOrrqFysyGuiECyQDN
         wnfBhf1GLxgiR3BOBc1RR9bnnb5LxFgeeqnLs136UDmGPd1m9TfYo6snAJ9jolePXcKj
         HhnQ==
X-Gm-Message-State: AOAM5311Tj8I4+24t00zkBjcujVdjo0Xb0MWuifi8l0d7EME716OKJAV
        3pLiKvezgEL+Kv/RiZoe0d8=
X-Google-Smtp-Source: ABdhPJxDhJJRf/fvpqHD2v9BISuYJB2TUlgfklD3XlvN4D6cz1jqB3qegvwljT9chDIfyOY+lQHnNA==
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr3470947otj.183.1616596964823;
        Wed, 24 Mar 2021 07:42:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i25sm585708otf.37.2021.03.24.07.42.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 07:42:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 24 Mar 2021 07:42:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] usb: typec: tcpci_maxim: Make symbol
 'max_tcpci_tcpci_write_table' static
Message-ID: <20210324144243.GB224108@roeck-us.net>
References: <20210324144253.1011234-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210324144253.1011234-1-weiyongjun1@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 24, 2021 at 02:42:53PM +0000, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/usb/typec/tcpm/tcpci_maxim.c:55:34: warning:
>  symbol 'max_tcpci_tcpci_write_table' was not declared. Should it be static?
> 
> This symbol is not used outside of tcpci_maxim.c, so this
> commit marks it static.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> index 041a1c393594..df2505570f07 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -52,7 +52,7 @@ static const struct regmap_range max_tcpci_tcpci_range[] = {
>  	regmap_reg_range(0x00, 0x95)
>  };
>  
> -const struct regmap_access_table max_tcpci_tcpci_write_table = {
> +static const struct regmap_access_table max_tcpci_tcpci_write_table = {
>  	.yes_ranges = max_tcpci_tcpci_range,
>  	.n_yes_ranges = ARRAY_SIZE(max_tcpci_tcpci_range),
>  };
> 
