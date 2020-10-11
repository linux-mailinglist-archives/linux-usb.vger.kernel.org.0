Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB0728A9FD
	for <lists+linux-usb@lfdr.de>; Sun, 11 Oct 2020 21:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgJKTyW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Oct 2020 15:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbgJKTyV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 11 Oct 2020 15:54:21 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AC3C0613D1
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2020 12:54:21 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 10so1945051pfp.5
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2020 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ce5PmEqmv1YSWMDHRt7GbAyKG6KhkYzK8oKJ+L0ajJU=;
        b=NecgSIK6HUp8mfsj4UInLUpOx0FhmYVbOiqvrr2fvZ5TYkrQUuEXkLPTzx5tcFBsEz
         Nq5+JltEQ91NdKRQV2G4Iq1a+xepvbeY+DfJKI4gN+xMLpM7ffxRD/Vy8ael2SRXmk1R
         zyFNBrWANYpGkvC0C9FQlDI7o+XgrW96Kn/50uUMwFceO/cPDsQ5nMCNredRM1yohFiF
         WCfcxk5DLRJtocYCPu/Q2rJDAWygrt7fEniMPlOpK2C7WdbS9Qof9pGftoU6zVWTgefu
         A0B22SdP73LR4NQuzphqUkQ+dMI1GkQXsNYI0Dl/JKScaU4MYP2jBBnNoIji5e1DpelC
         TCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ce5PmEqmv1YSWMDHRt7GbAyKG6KhkYzK8oKJ+L0ajJU=;
        b=YnDQoVdVz+l2CvyzSNPs6xrVwxDcsH1eHX0pFS+BlHdHpxDlTt/z1r/fSZZ6Zw2TEy
         lHG+NnbjrSa/B4z8xuS/XJbCSPBAcSlywg1bUUtPVYpM3oED9D4w2B9PQiR8TpxIOfUc
         XK3nWR2B/NoR+063DwaF2eeaLhGo7wA7JKqTmdoPH/ATe6doRWVxPB8UHTVNhoYIFhZ/
         fC+w92GO59gRYDYH5T9ig00dfEJiFC+W31aOfRtyx1S7iZoa6RoSnKoUafNyDn7yiBpg
         FUM0C9+U2j74pyaTbris3FHuELYwKPDiVHBdE4xUhCq9llMklRvy6hn4hFuzQoJOacnh
         ISGg==
X-Gm-Message-State: AOAM533GCvbcMcjtmFdjKuIvHUi6PEtmaBaWZA7SJqXtsdq3uN2cQ54K
        vE248XfGRjqIbnhCiPaUKR3tIw==
X-Google-Smtp-Source: ABdhPJyvpHbR55UUKFuI4uBzl5Pqj28b0PIKd/Oy+gbrycGDnCsZJfFifJORg9kf7WymGLQ6QTDtfQ==
X-Received: by 2002:aa7:8216:0:b029:142:2501:3968 with SMTP id k22-20020aa782160000b029014225013968mr20639458pfi.45.1602446061008;
        Sun, 11 Oct 2020 12:54:21 -0700 (PDT)
Received: from hermes.local (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id a185sm17241288pgc.46.2020.10.11.12.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 12:54:20 -0700 (PDT)
Date:   Sun, 11 Oct 2020 12:54:12 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>,
        Oliver Neukum <oneukum@suse.com>,
        Igor Mitsyanko <imitsyanko@quantenna.com>,
        Sergey Matyukevich <geomatsi@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Roopa Prabhu <roopa@nvidia.com>,
        Nikolay Aleksandrov <nikolay@nvidia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Pravin B Shelar <pshelar@ovn.org>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-rdma@vger.kernel.org,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        bridge@lists.linux-foundation.org
Subject: Re: [PATCH net-next 01/12] net: core: add function
 dev_fetch_sw_netstats for fetching pcpu_sw_netstats
Message-ID: <20201011125412.3719926a@hermes.local>
In-Reply-To: <5bb71143-0dac-c413-7e97-50eed8a57862@gmail.com>
References: <a46f539e-a54d-7e92-0372-cd96bb280729@gmail.com>
        <5bb71143-0dac-c413-7e97-50eed8a57862@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 11 Oct 2020 21:36:43 +0200
Heiner Kallweit <hkallweit1@gmail.com> wrote:

> +void dev_fetch_sw_netstats(struct rtnl_link_stats64 *s,
> +			   struct pcpu_sw_netstats __percpu *netstats)

netstats is unmodified, should it be const?

> +{
> +	int cpu;
> +
> +	if (IS_ERR_OR_NULL(netstats))
> +		return;

Any code calling this with a null pointer is broken/buggy, please don't
ignore that.
