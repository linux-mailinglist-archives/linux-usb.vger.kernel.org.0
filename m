Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C622E1C46
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 15:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405563AbfJWNV1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 09:21:27 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41018 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbfJWNV0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 09:21:26 -0400
Received: by mail-lj1-f193.google.com with SMTP id f5so21109983ljg.8
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tmx5gEhg/rV15X62Y7TZ1CogrmbBsOoHsWDyD7ZEELM=;
        b=EYQtMpA57tbRW2i4nVgg8fEUUiSniwZ4tVsaPAjqV3Cq1fcyb92kXhh+xAYwJsowf0
         QBVHcFpoiyAblEAT+06FrDcnHhyHx7XzYYmuASb68k3puobXIn/6YhJQl1PdnsnmXuwX
         VfghGmoxyB2tWhyTrb8v9iyBfb72ZPN7v5keo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tmx5gEhg/rV15X62Y7TZ1CogrmbBsOoHsWDyD7ZEELM=;
        b=qWO/gO53cV0aSmicYImI/SAPFOGTWYlLdP6JwpjZ8UG8R75N3cBRPaw9esWwR9Lf6a
         VlNfHf3pDS0B/8pC0yNAxzkT/KaJpRK0DeFzGlWu9yDhBSsKCKV5zcSRvE0v2wyATjx7
         E6yLVmQW/Kgq3MdezhkhhrMgp0NjDBM+os9ByY/xeladBlEC8C4rJc3slb/NX5EwRsQN
         hk6x92w8AVC0ENeTLRQY/UTuHXf1FehNYrlssLHnWdKqv1LlA2OhDB+hP/6LMi0IzTsN
         eLcXIETUrJanxX6oLaBXrrHjEzt8MEGmUZSvBUji3h6rdKlbz5IfGyH/2bXRoVOdv23/
         Lc1w==
X-Gm-Message-State: APjAAAWshkPutl53dGzRbA1ScoLDdTry2QL8oLgDr1KUfN//lH4/zjvv
        Zw+fCL+9+84CYfkGcZ3txpCYVg==
X-Google-Smtp-Source: APXvYqxovozIKcFB/iwVUR0Jq4TIkN06naNvK43Tktje8kUYfpkVfLxHu1Iax9zW7MeG3W34+OAn7A==
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr22257044ljk.17.1571836884568;
        Wed, 23 Oct 2019 06:21:24 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id t8sm9289994lfc.80.2019.10.23.06.21.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Oct 2019 06:21:24 -0700 (PDT)
Subject: Re: [PATCH v4] string-choice: add yesno(), onoff(),
 enableddisabled(), plural() helpers
To:     Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gfx@lists.freedesktop.org,
        Vishal Kulkarni <vishal@chelsio.com>, netdev@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Julia Lawall <julia.lawall@lip6.fr>
References: <20191023131308.9420-1-jani.nikula@intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <ab199f9a-844b-47e5-b643-2bf35316d5ef@rasmusvillemoes.dk>
Date:   Wed, 23 Oct 2019 15:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023131308.9420-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23/10/2019 15.13, Jani Nikula wrote:
> The kernel has plenty of ternary operators to choose between constant
> strings, such as condition ? "yes" : "no", as well as value == 1 ? "" :
> "s":
> 
> 
> v4: Massaged commit message about space savings to make it less fluffy
> based on Rasmus' feedback.

Thanks, it looks good to me. FWIW,

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

