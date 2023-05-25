Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D16F710C61
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 14:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240626AbjEYMt7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 08:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjEYMt6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 08:49:58 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAC1212F
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 05:49:56 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f68fc6b479so5997695e9.2
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 05:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685018995; x=1687610995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hSi8mN8mHvzsNyzOo+FjR4wUby1EK91lUKYzzLkDAuc=;
        b=nsnvgN1OWWv2PoULBlrVSq3L+czfB0fcQvGf0QSlJekrFTLe/kVc2fzHJsLejvXn6O
         bgGBVNWqURuWcfCxLwUV0D0ZeMDzm8lbJqoHDU/TW+JuzRf4sYbjP0SAfZ+JeOxNsOkg
         g+DqPuBPoZmW6xtowwqWRdSymSSf2ps7WMmT5Kmo74ZMBENpKIVAdS4Kps8rJm/GXm6Z
         1QNdM2p9/1i2hk4GPA5Zo+UxarumVtXvP8VYheHe/NtCeJ+HYDyguhYw2GgPYF8F9OpC
         755PMkZY6QkHNL2LubH+YDtLd3Pb+I823boS0WTeVKvIKmcjDj64qoCKjInHmRAoX0I1
         EcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685018995; x=1687610995;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSi8mN8mHvzsNyzOo+FjR4wUby1EK91lUKYzzLkDAuc=;
        b=VL7ybUkQFyCaAH4bRhdnhrkcz0wbqt81UKvuGSAlSpN/FFlrKFUMlFT0M5YWRZ97pS
         cUo7oQAYkn9gt2NDBX8iCIWl4G6h6Qrz6O/5M2e9lZdPVzlX66NZS4abidJEDeFlmNib
         hQunEzftqv/j8KOuUzpZgNNEGs59O2P3Sh11vBnn2svyZZA5gxtcbRrdtcNRmQ6YSOre
         HbAJknlzQOFaJ8gz1BuFRa73T3DEjwjf2yxZ7xXhB2/eOPtnAbnRZtlRx3MHPjeqVdse
         AMHsLFWC5+6CT0IYvcmkrIN74AFm4xgBmGehEfncg2NMMu16ojZpZ4NOca/WEaC+DeC1
         ZUVQ==
X-Gm-Message-State: AC+VfDzVxAs6avN9tauxiqCpspGUpKPODrMqm7jMUP/6yrUuD7lyPsr7
        u34Fw7KX6/sKCDeE5rEiueumWQ==
X-Google-Smtp-Source: ACHHUZ7JjkZYf7dbsQ4xqe3Ay67UmVW3YY5TMS68tyJ5kwZBDrpYLnNhWK5vOgJT4sE524onHvTRMA==
X-Received: by 2002:a05:600c:3784:b0:3f4:2737:a016 with SMTP id o4-20020a05600c378400b003f42737a016mr2362990wmr.29.1685018995178;
        Thu, 25 May 2023 05:49:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c228d00b003f60455de07sm2035532wmf.15.2023.05.25.05.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 05:49:53 -0700 (PDT)
Date:   Thu, 25 May 2023 15:49:49 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Felipe Balbi <balbi@kernel.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: phy: tahvo: release resources on error in probe()
Message-ID: <86d6e59b-1d9d-47bf-87ed-ad84d19f193b@kili.mountain>
References: <80496b6d-990e-4fb3-808b-daf3143cef15@kili.mountain>
 <CAD-N9QXOXrHRg+_-ZqPtcqokQvkgVBDEucMW91+xzt8Jm1c80A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QXOXrHRg+_-ZqPtcqokQvkgVBDEucMW91+xzt8Jm1c80A@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 25, 2023 at 08:22:15PM +0800, Dongliang Mu wrote:
> On Thu, May 25, 2023 at 4:12 PM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > We need to do some clean up before returning on this error path.
> >
> > Fixes: 0d45a1373e66 ("usb: phy: tahvo: add IRQ check")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Hi Dan,
> 
> it seems this patch is already submitted with Yang Li from our mailing
> list. Please refer to:
> 
> https://www.spinics.net/lists/linux-usb/msg240531.html
> 

Ah, fine.  Patches are normally applied on a first come first serve
basis so Yang Li's patch will be applied instead of mine.

I sent my patch based on a different static checker warning that I'm
working on about use after frees.  Where we add dev_ data to a list but
don't remove it on the error path.

drivers/usb/phy/phy-tahvo.c:394 tahvo_usb_probe() warn: devm_ variable is still on list 'tu' (see line 360)

regards,
dan carpenter

