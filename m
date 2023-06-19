Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8C5735A03
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jun 2023 16:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbjFSOq4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jun 2023 10:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjFSOqy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jun 2023 10:46:54 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2EFF130
        for <linux-usb@vger.kernel.org>; Mon, 19 Jun 2023 07:46:35 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f9189228bcso11895305e9.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Jun 2023 07:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687185994; x=1689777994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq3ijGGevKpfNr/5SD0w36pchztjWgIz0cOroK2sblA=;
        b=Cpuvy21GWkdpaF7vZYLoXkopw9/vKm/M9clcr+Ac9769fFWzLT1KJSPnCpEce99TAQ
         32xgGaPQUXhIrkmuudV2Z7a8/Jhn/bzntgWp9dWzwfwbEUz3jkAbdz6SW5zw5PJBJ7H7
         oeE9pMFgkxPJNMnW6LEE2f4MoqzsM7DQQK5NUXyEt0oPMrU3Qiqh4xPkD1kqqbzYLCrB
         xWsrKohTaOpjoJeXCpm1xXEdP4xjOYyW/dpwT78J9+7UE/lbqMakdNuThadiLdsCbzGM
         rLXcE9++3QtQSgMFzbF5BxUcrEpOjqtbLxfWzSJIso6C/MlaXulYCptxX1rpXQiMmbYa
         v6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687185994; x=1689777994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pq3ijGGevKpfNr/5SD0w36pchztjWgIz0cOroK2sblA=;
        b=Uvx7t1Z346TiJO70WdeqMxvop7yaKm6Ju7WVUK0SBD6rAQQzsJ8y+ina5ctZmLN86S
         36W4WgsipWtjnnirTlVgY+Rm5WQz1mJFD+96tu14+VtSnpVWxpLcXWXu2QvVVjtR0WSe
         +apr8v8H/zFij9q1dJ635LkE0ULEU939pnMeajQvWfIObtS9q8tW4LiCFpPDr99mIlF5
         AhMQAXr1Buf6dh7NCRbGPgjfTMo6fKlQPmFRyYlq9YBCL6kJGb+1m8wEDhNwvdMJt8GR
         jvMJL/pYlrqnXdrq+GPh8iKsgA4cxOw9+S0GZQ5dM/5vAnci+4Y8rN8aJMxPXz/5lwPA
         vzdA==
X-Gm-Message-State: AC+VfDxU93EdcM5+DdZz90TD6n+fUyWXVjF6mnUPrN/OTeiNOQbhnoTQ
        zMi0tqtpaIfxpP6u7qGKoLUgsQ==
X-Google-Smtp-Source: ACHHUZ7+7tAskdGyrcV0m/FSTeYwQRmUj3rxMONbJo6MKeazOAKB6sTNRRY8pEf7zh+BKMRiHsD8oQ==
X-Received: by 2002:a7b:cd14:0:b0:3f9:b445:903b with SMTP id f20-20020a7bcd14000000b003f9b445903bmr758673wmj.9.1687185994086;
        Mon, 19 Jun 2023 07:46:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c25-20020a05600c0ad900b003f604793989sm10981893wmr.18.2023.06.19.07.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:46:31 -0700 (PDT)
Date:   Mon, 19 Jun 2023 17:46:28 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Badhri Jagan Sridharan <badhri@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Elson Roy Serrao <quic_eserrao@quicinc.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: core: Fix double unlock in
 usb_gadget_activate()
Message-ID: <031bd76e-7955-4a71-94fa-276d08d5ada5@kadam.mountain>
References: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
 <2023061959-volley-badland-81a2@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023061959-volley-badland-81a2@gregkh>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 19, 2023 at 03:39:05PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 15, 2023 at 06:43:03PM +0300, Dan Carpenter wrote:
> > Do not call mutex_unlock(&gadget->udc->connect_lock) twice in a row.
> > 
> > Fixes: 286d9975a838 ("usb: gadget: udc: core: Prevent soft_connect_store() race")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/usb/gadget/udc/core.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> > index 83fd1de14784..d58640a9d0ca 100644
> > --- a/drivers/usb/gadget/udc/core.c
> > +++ b/drivers/usb/gadget/udc/core.c
> > @@ -878,8 +878,6 @@ int usb_gadget_activate(struct usb_gadget *gadget)
> >  	 */
> >  	if (gadget->connected)
> >  		ret = usb_gadget_connect_locked(gadget);
> > -	mutex_unlock(&gadget->udc->connect_lock);
> > -
> >  unlock:
> >  	mutex_unlock(&gadget->udc->connect_lock);
> >  	trace_usb_gadget_activate(gadget, ret);
> > -- 
> > 2.39.2
> > 
> 
> Does not apply to my tree :(

No longer required.  The patch was reverted.

regards,
dan carpenter
