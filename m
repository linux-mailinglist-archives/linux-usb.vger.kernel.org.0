Return-Path: <linux-usb+bounces-423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E9A7A87EE
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 17:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 620282828D7
	for <lists+linux-usb@lfdr.de>; Wed, 20 Sep 2023 15:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7CF3B78C;
	Wed, 20 Sep 2023 15:11:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFEF29A1;
	Wed, 20 Sep 2023 15:11:06 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B887FAD;
	Wed, 20 Sep 2023 08:11:04 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso6252974f8f.0;
        Wed, 20 Sep 2023 08:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695222663; x=1695827463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vS/ZehT2TTq4OUBvmWF2X4je+TwLLsMe5wfLtKOCYts=;
        b=VN+PUHZl34w9xLh60lhTPIhqwSiAbW95rNu+t++URLfOv0msRHxyvWqxeVWqq6h4fh
         ZDs1MYUnSqE2NOUmaCimcKoUMY2iWZ742nEpVHA6giwDTFHhiq7g83ZWv0LdURkxoiLS
         j9qq62YS7TGviqb+vGsK+ASS2c6Z6R28yAGLQ2ex9avUUsbUsqJVABaXRHrr/B7pFfQt
         fZvdVplYoUd9z4M3UGlwScisp5BE45NPPfJgw0UPfbVhZAoPa1LJbgQlejumDr17hJaK
         +BBdmxIo46vTPTl05ZSkGemSU/aHR5qIyan+RU8T/O2PjT5WZlHH0h26N74l29tEhUl0
         QaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695222663; x=1695827463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS/ZehT2TTq4OUBvmWF2X4je+TwLLsMe5wfLtKOCYts=;
        b=iMInKcOL6igCM25y9XINrBf/LwVhHeJ4pfTmOa3o2vJkVLl4eZz5YcdKJ3t0+rmOTp
         qwpF7k4mQIovoZEE3Wpvl0NiSkC7j9q7QCeZ2hw1ra+P5wxytHpLdwusiq9/grIEGJNr
         KxJTuI70rAhbDQ3OBEiVKCn6jKC7MxWbDVSEF/87lW0H9hXUEvslo+LY2HzvMs2Aj21g
         gqTQzXarBGRUJG1wBpO7wfcYD4ZgWS05epml7C3lDQ7KfG+v8hNfteE7mOS8JReZb0ER
         m3iwDxnphJHqlB8boRenMBtNeoYo/5r/yV9vqt6a68fpH1GLys5LJKdgBDch+UMfWYlU
         5gag==
X-Gm-Message-State: AOJu0YxQywAi37QjwGn2StNBNB7GcVER/QAGT6h0RRI8MPRQZgNLe4Jb
	D7A91W0K4GE+aq0kUag0JP4=
X-Google-Smtp-Source: AGHT+IEuaTp58UUxWhtjR3bhQg43i715jPEkQvNrgysHyIpBWlXa0yzz6NK6UhU0LkhiBO3cN/anfA==
X-Received: by 2002:a5d:4292:0:b0:31f:f753:5897 with SMTP id k18-20020a5d4292000000b0031ff7535897mr2462917wrq.59.1695222662854;
        Wed, 20 Sep 2023 08:11:02 -0700 (PDT)
Received: from primary ([212.34.23.120])
        by smtp.gmail.com with ESMTPSA id l16-20020adffe90000000b0031aef72a021sm4213234wrr.86.2023.09.20.08.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:11:02 -0700 (PDT)
Date: Wed, 20 Sep 2023 11:10:58 -0400
From: Abdel Alkuor <alkuor@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: krzysztof.kozlowski+dt@linaro.org, bryan.odonoghue@linaro.org,
	gregkh@linuxfoundation.org, robh+dt@kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	abdelalkuor@geotab.com
Subject: Re: [PATCH v5 15/15] USB: typec: Do not check VID for tps25750
Message-ID: <ZQsLgnNnBP3SVDXy@primary>
References: <20230917152639.21443-1-alkuor@gmail.com>
 <20230917152639.21443-16-alkuor@gmail.com>
 <ZQhQxzJfJmjbR02B@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQhQxzJfJmjbR02B@kuha.fi.intel.com>
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Sep 18, 2023 at 04:29:43PM +0300, Heikki Krogerus wrote:
> Hi,
> 
> On Sun, Sep 17, 2023 at 11:26:39AM -0400, Abdel Alkuor wrote:
> > From: Abdel Alkuor <abdelalkuor@geotab.com>
> > 
> > tps25750 doesn't have VID register, check VID for PD controllers
> > other than tps25750
> > 
> > Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> > ---
> >  drivers/usb/typec/tipd/core.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> > index 326c23bfa8e6..c1399e12a170 100644
> > --- a/drivers/usb/typec/tipd/core.c
> > +++ b/drivers/usb/typec/tipd/core.c
> > @@ -1142,10 +1142,6 @@ static int tps6598x_probe(struct i2c_client *client)
> >  	if (IS_ERR(tps->regmap))
> >  		return PTR_ERR(tps->regmap);
> >  
> > -	ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
> > -	if (ret < 0 || !vid)
> > -		return -ENODEV;
> > -
> >  	/*
> >  	 * Checking can the adapter handle SMBus protocol. If it can not, the
> >  	 * driver needs to take care of block reads separately.
> > @@ -1176,6 +1172,12 @@ static int tps6598x_probe(struct i2c_client *client)
> >  
> >  	tps->irq_handler = irq_handler;
> >  
> > +	if (!tps->is_tps25750) {
> > +		ret = tps6598x_read32(tps, TPS_REG_VID, &vid);
> > +		if (ret < 0 || !vid)
> > +			return -ENODEV;
> > +	}
> 
> You need to do this at the same time you enable tps25750, so I'm
> guessing in patch 4.
> 
> You are also changing the execution order just because of that
> is_tps25750. Instead you need to make sure you have that flag set as
> soon as possible in the first place, so right after "tps" is
> allocated:
>
Good point. I will move the check in patch 4 and check it after allocating
tps.
>         mutex_init(&tps->lock);
>         tps->dev = &client->dev;
> +       tps->is_tps25750 = of_device_is_compatible(np, "ti,tps25750");
>  
>         tps->regmap = devm_regmap_init_i2c(client, &tps6598x_regmap_config);
>         if (IS_ERR(tps->regmap))
> 
> 
> thanks,
> 
> -- 
> heikki
Thanks,
Abdel

