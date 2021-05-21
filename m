Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB3438C04D
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 09:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235092AbhEUHFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 03:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235102AbhEUHFG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 03:05:06 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D23BC06138A
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 00:03:43 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id f22so5882165pfn.0
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BgoU4gWy3KGlpK9GTZqZycmpGH6hSrcC1WquVcdc0/g=;
        b=Tbr0Z77DX53X74PGu6M5oDYZmQNv7oI0FM8QFbvKljaTxMC61b7wiaLDw+4S87OgFw
         K+MGfv8yN4dNE5zU6383+WBiVAShxLc+eQSqY0WOkvUlUHaZaT2SQ1vA05fGfmQAlyui
         4i3Gs0aaBOdcXScly/X30u2WQhI4Hj23HO+hEA6fE7dQzbbpJNuZ6XMdggJRrPlxu+yX
         u5n9Whq3PZwkYNc7O/jbqXb95VcrSsQIum17D/zFeCKTkzZuaBX2aODisBiZXaPFRDX1
         CAG4FUZIGjeUpfMaT7uO7juC2O6DZKlyGKDi2HNdxq0q1j9WezNg23wLVVMP5GX15aht
         Ps7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BgoU4gWy3KGlpK9GTZqZycmpGH6hSrcC1WquVcdc0/g=;
        b=ZIQsIfPuraNZDaeL1TOa/v4V0PQYSv5C/v6RBM8r4FALKeEvypcbG15pgZbZ3yy6GT
         0wX0cjoz7n5L8Lv0Doeb3ngggUOFa7/TkZsXg53vEyY1eDMPJ62kp/QW49vz3D+r5d7V
         kDdEH9iWZYNjADulofJ/mldY40/qHHbyrE6YAfFIiOTtpAPH2uXBcFH3Z8AMRD0JFvY1
         0q+XJIXFspqNyKDHaqHpblMKBMDUQCMRrsQTevjLvXJ06HveZZfXmyl06xrslI7jKwJE
         paoiiigxpqN+oAyehf/LaPB+zCgPpXAF5mUd3zbSdKoT7NPnllSaQzhV6XKWUV4sZstG
         ixWg==
X-Gm-Message-State: AOAM5305DpnF9QnsN9uH+tYE6NBur2azcXcBVXgkaCI05x2R0xnFpPRX
        2GDS1f9wybsBMd//K5g5vkk4EhGceerNY4eSKSZ5JQ==
X-Google-Smtp-Source: ABdhPJzA2Sqms2pZRgYOGL+He+nR+nYYjM4ta4ep1vXoFS/NQoTj4cfPyY2tCZFR7x4QLwNjdiyutaW0t+q0CRplQ60=
X-Received: by 2002:a63:1906:: with SMTP id z6mr8214983pgl.173.1621580622886;
 Fri, 21 May 2021 00:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210521021010.2490930-1-weiyongjun1@huawei.com>
In-Reply-To: <20210521021010.2490930-1-weiyongjun1@huawei.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 21 May 2021 09:12:04 +0200
Message-ID: <CAMZdPi_rF_iRtJMZoViAmkZTwOtVzHXux1QbeD558rOc7EpfVw@mail.gmail.com>
Subject: Re: [PATCH -next v2] usb: cdc-wdm: fix build error when
 CONFIG_WWAN_CORE is not set
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Oliver Neukum <oneukum@suse.com>,
        Lee Jones <lee.jones@linaro.org>,
        USB <linux-usb@vger.kernel.org>, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 21 May 2021 at 04:01, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Gcc report build error as following when CONFIG_WWAN_CORE is not set:
>
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_disconnect':
> cdc-wdm.c:(.text+0xb2a): undefined reference to `wwan_remove_port'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_in_callback':
> cdc-wdm.c:(.text+0xf23): undefined reference to `wwan_port_rx'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_stop':
> cdc-wdm.c:(.text+0x127d): undefined reference to `wwan_port_get_drvdata'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_tx':
> cdc-wdm.c:(.text+0x12d9): undefined reference to `wwan_port_get_drvdata'
> x86_64-linux-gnu-ld: cdc-wdm.c:(.text+0x13c1): undefined reference to `wwan_port_txoff'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_start':
> cdc-wdm.c:(.text+0x13e0): undefined reference to `wwan_port_get_drvdata'
> x86_64-linux-gnu-ld: cdc-wdm.c:(.text+0x1431): undefined reference to `wwan_port_txon'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_wwan_port_tx_complete':
> cdc-wdm.c:(.text+0x14a4): undefined reference to `wwan_port_txon'
> x86_64-linux-gnu-ld: drivers/usb/class/cdc-wdm.o: in function `wdm_create.cold':
> cdc-wdm.c:(.text.unlikely+0x209): undefined reference to `wwan_create_port'
>
> Using CONFIG_WWAN_CORE instead of CONFIG_WWAN to avoid build error.
>
> Fixes: cac6fb015f71 ("usb: class: cdc-wdm: WWAN framework integration")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Loic Poulain <loic.poulain@linaro.org>
