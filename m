Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114FD73A36C
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 16:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjFVOo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 10:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbjFVOoP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 10:44:15 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152222704
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 07:43:46 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-311394406d0so4812281f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687445020; x=1690037020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=od/xtJOmkVNZD4Emxi52MEHI4/IuSoCynJgTaPaI908=;
        b=uoo7Suk0yL3A6EhQk7KjrD85XfGLA7s8Cz2CjVg8Tz5bxp7t/Z79aD+doebqJsjQS9
         wKUxXS63cC26Rw7YvaJq38snDl8IKSgTYL2i0u/aml7fauDvzzq70wRCvhvA3YDGeY4r
         3XM20xGrA1ANkVJF4NJ6UU6RjJjBLKJ7+zbRmFzsQNKDD3aqcUGI4xPwGBNCqXDAI2Ah
         Jkk4gNP2iUBsV+PZRPdCfOdK2NQgI0eSgSOUGb6NHdyLot2fAXuUyZdoB3iHRo4+WorW
         sK6ReRm2I/ktMdFurhCqQjlZQbp/In92HUS70QWsbfhBz8kEKCKObCWjpiEELHI8A0sv
         ewqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687445020; x=1690037020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=od/xtJOmkVNZD4Emxi52MEHI4/IuSoCynJgTaPaI908=;
        b=LvZnSDQ+ZcO2OUKOtbtoCpgVI0I28lWpWJ+aqy6vb39MHmrINfBNAi5p1e3BB2/9Q0
         Oz6T1g5AU4Ok7qSRWfqTNT7fxj+KRgAQ3BTDsQYjp23NiRHGuX/1k4AUOSSF4p3IMjy6
         Ojf0IC08TPEJ6564vV29+O+MABGcVxUTna23l7qn+yt8pt/V9R8ASmD4WvqV/SlybA1u
         DVD1quztLYZAmOaKK2M/7uzZEd8nxbzEDUY9H80Jo0l4dbWQCcuT6uGRF3ShNvlUXBUp
         otef1MquQHx0HkbsFaoI87jQ3qa4Jh9gJCs23+ogZzXSvmAb0CrqzCYD/Egd1SSz6T4q
         x4TQ==
X-Gm-Message-State: AC+VfDwYcYSZo0CFujpDQ9kjfuoDsK3Y/8m3LTCylow14xbAvEXh39de
        2g0R+eZN8fo2/Wgq20xt7UvUWJfOzydqTFpxaCU=
X-Google-Smtp-Source: ACHHUZ63mh9BZsQQ6IvTLnC9jWlx2wvtyzVVdcd+MaPU1tsWrzs7FL7761XzjGOto3k3ncpdd51S0w==
X-Received: by 2002:adf:f7cb:0:b0:305:ed26:8576 with SMTP id a11-20020adff7cb000000b00305ed268576mr12953282wrq.9.1687445020153;
        Thu, 22 Jun 2023 07:43:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x7-20020a5d54c7000000b0031270cf1904sm7256321wrv.59.2023.06.22.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:43:37 -0700 (PDT)
Date:   Thu, 22 Jun 2023 17:43:34 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [bug report] usb: gadget: tegra-xudc: Fix error check in
 tegra_xudc_powerdomain_init()
Message-ID: <313cf91e-708e-4409-9a5b-92061c45f616@kadam.mountain>
References: <8cbe7273-edd2-40c7-8339-1c05d8d74555@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cbe7273-edd2-40c7-8339-1c05d8d74555@moroto.mountain>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Ok, Tang Bin's email address is dead.  I'll take care of these.  There
was one other one I reported earlier as well.

0f6e8d8c94a8 (venus: pm_helpers: Fix error check in vcodec_domains_get())

regards,
dan carpenter


