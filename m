Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 750E946594B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 23:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353702AbhLAWfU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 17:35:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353642AbhLAWfO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 17:35:14 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECC70C06174A
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 14:31:52 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id 133so6923159pgc.12
        for <linux-usb@vger.kernel.org>; Wed, 01 Dec 2021 14:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=umzTzWZcfP0yiExHMah/W0arzACFOIq7DI/DXIKQLOc=;
        b=D9PL+HXvJS7bjkOniCqpNV9drNtiGClJAgGX4FT/dqmyJgslns0Do3DDQH2OE/Ffuz
         /DI/8ixpT2m9MEpqIzGvjFWWK+cIZjSKv/KI45gMc+YcDJkccqLzMceLMKjFBxgEo7oV
         W3Zuohl1F9secLmaHcTPyNAzFZ7gWOxvTzunE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=umzTzWZcfP0yiExHMah/W0arzACFOIq7DI/DXIKQLOc=;
        b=RshynNv6E68SXnD3Kus0EO8d3GcepVsfQn9Zg5P8TRY05uQIHgmPgd4D4AbqXLf9UA
         vpulYLHZC6THUKPILI77tHpLsTklMC1nVdXMyz5bihrEBFfLmg116U7nFyXDIdlnlAnN
         wbzSN24uas3gPBQH98P/QgnEecI5d5B6Ii9OvK6S8Kg5v9tSrQW/fO3o4jkAvoq5CA0M
         OyaZf83BPhtjONv4jsoDImHGY3kRbR13UHmIGVFPXsNvo91Hfp32+C1iexwYqco66O5d
         B68V6E4+brbRega2bUYDvSZhSGA5XpkLo1zjm7WQyVvYcIjB/TLWk4ePK2wNWTYL0tAu
         yvhw==
X-Gm-Message-State: AOAM531tTeuLB1buTrWL6KDA9BkSTtdN1cr+taAQUWkux/h3RmCZX17+
        6Qj+XKVzNg3LEaqGRRLdt5W4MQ==
X-Google-Smtp-Source: ABdhPJxtxvfFfZW1bkf55O/MgtlKEV+J1nodvrXMKmcbIq9+C4VdZJe2ZuIaW0GnPRVP53bfzxRVsw==
X-Received: by 2002:a05:6a00:1482:b0:49f:d9af:27dc with SMTP id v2-20020a056a00148200b0049fd9af27dcmr9310139pfu.9.1638397912453;
        Wed, 01 Dec 2021 14:31:52 -0800 (PST)
Received: from localhost ([2620:15c:202:201:b371:4539:c97c:c751])
        by smtp.gmail.com with UTF8SMTPSA id d12sm558927pgf.19.2021.12.01.14.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 14:31:52 -0800 (PST)
Date:   Wed, 1 Dec 2021 14:31:51 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v17 2/7] of/platform: Add stubs for
 of_platform_device_create/destroy()
Message-ID: <Yaf318q5CcqLMCK6@google.com>
References: <20211116200739.924401-1-mka@chromium.org>
 <20211116120642.v17.2.I08fd2e1c775af04f663730e9fb4d00e6bbb38541@changeid>
 <YZvW3UEkXy8dPmpz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YZvW3UEkXy8dPmpz@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 22, 2021 at 09:43:57AM -0800, Matthias Kaehlcke wrote:
> On Tue, Nov 16, 2021 at 12:07:34PM -0800, Matthias Kaehlcke wrote:
> > Code for platform_device_create() and of_platform_device_destroy() is
> > only generated if CONFIG_OF_ADDRESS=y. Add stubs to avoid unresolved
> > symbols when CONFIG_OF_ADDRESS is not set.
> > 
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > Acked-by: Rob Herring <robh@kernel.org>
> 
> Is anything preventing this patch from landing? It has Rob's ack and is
> an improvement regardless of the fate of the rest of the series it is
> part of. The patch was carried around unchanged in the last 10 versions
> of the series, it would be nice if it could just get landed instead of
> keep carrying it around :)

ping

Rob/Frank: is there any reason why this patch can't be landed?

Thanks

Matthias
