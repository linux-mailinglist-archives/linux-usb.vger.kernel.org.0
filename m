Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A09537F76A
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 14:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhEMMHr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 08:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233635AbhEMMHd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 08:07:33 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E23C06174A
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 05:06:23 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id b21so14434681pft.10
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=;
        b=JSy1a6GCJq2YyfpTNSfJS8qqrILCcxtDE5ElH2K2/E24R3FWXdOQ02VULX9h2Pj+I+
         NtrEoxuFD2ShSH71n+IAsSvw74CstZseJ176nvisB5OpUB7L1E7Ary5a0jtBHXhivVKF
         kD+16nkHtwzi2iAoAEmeBpD4ePQ/xbCiBUASU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LiqqNhlGxeXjrKxJif9khEnQvHkdwIs+05Gzjqmjpcc=;
        b=HA1rQ+5vkAFUXNCIErqst5/noxiGA/PnjWrrXh8IcweKKZ3yRlfXb3n5uEChcy8Cl+
         UefZZccs5V3mNgkPaOZRfH2f9sy8W6t5WblD898Y5VlMnZNqbgvQL5npCduDiZwjhaw0
         URVasSud643mdyNqVxKjMNeMCQH4BxJFsjrvowoP7yDy2g3vypP28S22UXMiBSjrof4/
         ofnzIh6GC22722Ch6TtGriPf5LblGT21vNdBFc1upqj6d5Va23a9D2B3+XNHo6JoLnPp
         Yje6AN8WZU46iIoq55B2+D4q4PJvnafQpLd5xfj5zQcLQzBnrmSwBwBLYvgX4Tq3gXMY
         ZCdw==
X-Gm-Message-State: AOAM531gdD3B3UMSAhGJ4ZwEOV+16UyuNl+E8/31Y4vFdTdhd4ork6x1
        R0fJZmV1GdLGm0cNwIagoKGk8A==
X-Google-Smtp-Source: ABdhPJwfllyYOMfe4rEresq4fLk8nKv6sDRzFnk94yymmf2sl08gP8XdMvFcQyRYMXfrGcMKqNEoqQ==
X-Received: by 2002:a17:90a:2d8e:: with SMTP id p14mr4752238pjd.121.1620907583031;
        Thu, 13 May 2021 05:06:23 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:161f:cde2:c883:ef91])
        by smtp.gmail.com with ESMTPSA id f14sm5112636pjj.53.2021.05.13.05.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 05:06:22 -0700 (PDT)
Date:   Thu, 13 May 2021 21:06:14 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        JC Kuo <jckuo@nvidia.com>, Joe Perches <joe@perches.com>,
        Sumit Garg <sumit.garg@linaro.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-nilfs@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 1/4] lib/vsprintf: Allow to override ISO 8601 date and
 time separator
Message-ID: <YJ0WNuFr7JmSrN62@google.com>
References: <20210511153958.34527-1-andriy.shevchenko@linux.intel.com>
 <YJzymZ7m3R1ELjGD@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJzymZ7m3R1ELjGD@alley>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On (21/05/13 11:34), Petr Mladek wrote:
> On Tue 2021-05-11 18:39:55, Andy Shevchenko wrote:
> > ISO 8601 defines 'T' as a separator between date and time. Though,
> > some ABIs use time and date with ' ' (space) separator instead.
> > 
> > Add a flavour to the %pt specifier to override default separator.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> I am going to queue the entire patchset for 5.14 via the printk tree
> the following week unless anyone complains in the meantime.

Looks good to me

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
