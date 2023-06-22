Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59B5C73A33E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 16:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbjFVOkU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 10:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbjFVOkT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 10:40:19 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C0441FC2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 07:40:06 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3110a5f2832so753731f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687444805; x=1690036805;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DzolcBwkzvJ8OwE0m5G/rCVQtKZAq/kri7zdBX1Tdus=;
        b=XGUOAuykX6XisPfQGoDc9YTXY6qRCtxczPedcuTRycSEtIv7AsTvYjQEUXAquFRkDt
         QncCpdO5cUKh1lrm0HFKNelLuN5MUkSEU9Kj5KkwqHYtCvRoOBw37tKa28JnbjVcoNJo
         nCKCFfT9ferg3CQhqJcaI5lyyoOEWtXZ33OgzBdWp7LJyyB/i/te7AUTZSvmflytblO8
         HTQW7JXVJPTtMHpPQ5JTU33JIOhhnOJ12do+/tQfuIsXvV6jYuA/FTM5hikYoORuBOvR
         KWS1VIrRkM9dg7nPD2ne7rJWBXIBQZdfFBVWAjr+JjPJ/j5hkJAFVUKwT7fWH6tOaB9o
         3BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444805; x=1690036805;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DzolcBwkzvJ8OwE0m5G/rCVQtKZAq/kri7zdBX1Tdus=;
        b=ZfgKBS4DW8eADMVlof809wVJQ52IV47MtmYc8sdACv34mwOUI4yWBuRK1+YJ6CijvK
         V/OYIqCOTYxitUgB1UvAbIfeC+RClm5M2WAjx7y/Mx2ivqISxKQSnWei2Ml3baiTz5Z+
         W5UMDzYAGd2vGtqk4xfn4e9Igsmz0IFz9X/jXjbhAiSRM+QEYVH8e4whr/3Vup0Ztd64
         s7+FOXJdXBGRQTWNLxPDm3iywjId+x76QcZRmMjvz/89La3VewQDJ8GtfOpEYSS/CAg/
         oQ1M/LHUjPdQvkX0jkFLHK8sCf4YA5SloEk2GUo9VJwFpR/SUTAz2QEGIAIDKTHyVIv+
         MFXA==
X-Gm-Message-State: AC+VfDwB5s9LFoLUODl8jzwZq80CDzZaeVvT0n7W6/kQLSvBsMVOCG3q
        9i2wxDVELpKQbgYGTD6bulUMUw==
X-Google-Smtp-Source: ACHHUZ4e8R6xxoNqCgkHcA4no7OhOzSPkmHQVBUZRPP2UdM0ce1sEgKHu3aAVeyjzm+2oOyoI6N71g==
X-Received: by 2002:a5d:4450:0:b0:311:f11:4c65 with SMTP id x16-20020a5d4450000000b003110f114c65mr22839365wrr.4.1687444804749;
        Thu, 22 Jun 2023 07:40:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c214800b003f42314832fsm7901032wml.18.2023.06.22.07.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:40:03 -0700 (PDT)
Date:   Thu, 22 Jun 2023 17:39:58 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     tangbin@cmss.chinamobile.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [bug report] usb: gadget: tegra-xudc: Fix error check in
 tegra_xudc_powerdomain_init()
Message-ID: <8cbe7273-edd2-40c7-8339-1c05d8d74555@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Tang Bin,

The patch f08aa7c80dac: "usb: gadget: tegra-xudc: Fix error check in
tegra_xudc_powerdomain_init()" from May 25, 2022, leads to the
following Smatch static checker warning:

drivers/usb/gadget/udc/tegra-xudc.c:3722 tegra_xudc_powerdomain_init() warn: passing zero to 'PTR_ERR'
drivers/usb/gadget/udc/tegra-xudc.c:3729 tegra_xudc_powerdomain_init() warn: passing zero to 'PTR_ERR'

drivers/usb/gadget/udc/tegra-xudc.c
    3715 static int tegra_xudc_powerdomain_init(struct tegra_xudc *xudc)
    3716 {
    3717         struct device *dev = xudc->dev;
    3718         int err;
    3719 
    3720         xudc->genpd_dev_device = dev_pm_domain_attach_by_name(dev, "dev");
    3721         if (IS_ERR_OR_NULL(xudc->genpd_dev_device)) {
--> 3722                 err = PTR_ERR(xudc->genpd_dev_device) ? : -ENODATA;

This commit was done to make static checkers happy, but it's wrong and
will likely break the driver if CONFIG_PM is disabled.  The following
commits have similar issues:

f08aa7c80dac (usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init())
4ea9496cbc95 (opp: Fix error check in dev_pm_opp_attach_genpd())

    3723                 dev_err(dev, "failed to get device power domain: %d\n", err);
    3724                 return err;
    3725         }
    3726 
    3727         xudc->genpd_dev_ss = dev_pm_domain_attach_by_name(dev, "ss");
    3728         if (IS_ERR_OR_NULL(xudc->genpd_dev_ss)) {
    3729                 err = PTR_ERR(xudc->genpd_dev_ss) ? : -ENODATA;
    3730                 dev_err(dev, "failed to get SuperSpeed power domain: %d\n", err);
    3731                 return err;
    3732         }
    3733 

regards,
dan carpenter
