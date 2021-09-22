Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A49D4148AA
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 14:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235603AbhIVMVD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 08:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233626AbhIVMVC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Sep 2021 08:21:02 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4582C061574
        for <linux-usb@vger.kernel.org>; Wed, 22 Sep 2021 05:19:32 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id t2-20020a4ae9a2000000b0028c7144f106so832454ood.6
        for <linux-usb@vger.kernel.org>; Wed, 22 Sep 2021 05:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gej29wIjovsJ/v+cC94/dOMcK7TtyL0OkufvVC/88Sk=;
        b=jxHKxstGValuk0jf9gDrJIpvq80mfd6oIg1JfDLtIks9lybL3D7Ah//YOgQyGCkqlw
         HGIafszG/0hOz16OKZQZMTN5jf2ClacOXpKzdKyOeoRFjs3Kaqk/82ZvuGNGu7Kyw4A2
         xXJsgsNNuPS4u7nEEcx9wdc1jevG+j4A7/SmRwKMZ8sB7sskvoJwGN9RMj26iLSUGPPU
         BYmPh+PhNlxgiMAsnRHztkwfSURNeodhPEGmXuMLo80KGbj7Bn7eUo2oONLhotSaUOuQ
         1ZiyTygIYmaRQGoK2Fj+U2mCST3wy1tABZ83qYxJBUHl3LAz2lwHx0RCPE52h3F0aQPN
         vKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=gej29wIjovsJ/v+cC94/dOMcK7TtyL0OkufvVC/88Sk=;
        b=Vu7n6NerscpJx0zF5yODb5AnUK9mAKQQYSnnGaAZH8bSjN3DGPJ+YYgqPXFbmpENyH
         g1sYGDAEF0n+1IQCLY2bn1c+k6qN3Fu8qhAOUBfRKwIbLp/U+0gbbv/wdW5x6Q5w11qs
         GnF8I4zpgBnMHKHGW1Y97pxOroP3lkQb2Sj37C47qpXzQ7veeMrNEg40xaN0hb88DyKY
         SGhIhBgthQaXRPIE0k6gcqFdKJNqustL2l8BcSoh4omRXxirJRGI3tG+iontftsrXc4Y
         tbBdSZeMsPT9FOn+RIkuqPbUsqsIffXMqESHXfdoyn+5pEWTF9hK4Z0nZ028uk7ZZxZe
         JIVQ==
X-Gm-Message-State: AOAM531Dt0kerL0TwdybljrtRHkyIMBFwuRRw0lfKV0lMJF1Sc30xiF/
        DNVzUvHsHrd+p/AfD8wE8Sg=
X-Google-Smtp-Source: ABdhPJxymeZrKMQf7eNu7nOVyNPQPqHAhvxYNJ/mh1LVyZb7dH5HsP/xJEdM3I+6VZ0qt95wLJr9vQ==
X-Received: by 2002:a4a:ad4f:: with SMTP id s15mr28410437oon.85.1632313172138;
        Wed, 22 Sep 2021 05:19:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i23sm173719oof.4.2021.09.22.05.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 05:19:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 22 Sep 2021 05:19:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpci: Fix spelling mistake "resolbed" ->
 "resolved"
Message-ID: <20210922121929.GA3200911@roeck-us.net>
References: <20210922060152.2892027-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922060152.2892027-1-xu.yang_2@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 22, 2021 at 02:01:52PM +0800, Xu Yang wrote:
> There is a spelling mistake in a comment. Fix it.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 9858716698df..864049631fbe 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -258,7 +258,7 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
>  	 * When port has drp toggling enabled, ROLE_CONTROL would only have the initial
>  	 * terminations for the toggling and does not indicate the final cc
>  	 * terminations when ConnectionResult is 0 i.e. drp toggling stops and
> -	 * the connection is resolbed. Infer port role from TCPC_CC_STATUS based on the
> +	 * the connection is resolved. Infer port role from TCPC_CC_STATUS based on the
>  	 * terminations seen. The port role is then used to set the cc terminations.
>  	 */
>  	if (reg & TCPC_ROLE_CTRL_DRP) {
> -- 
> 2.25.1
> 
