Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82265270004
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 16:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgIROhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 10:37:53 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37476 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgIROhx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Sep 2020 10:37:53 -0400
Received: by mail-lj1-f194.google.com with SMTP id n25so5304184ljj.4
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 07:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+5VqptTZKcnINB/SXHa2/jUfqJYTsUiUyW39e2yh0Gw=;
        b=BSUatw7qmDtfetyulnJfGbeKXiM8qt61SdGpsMO3UAcXCzT4gOedRgPGJIX4KUPLhy
         oaiTAogcjiU7mcgSMjwV8YgHu9OX/9Kz69za200KFri3z82lBKH3EKA77ZWsmOFPIvl7
         8sE7+R6bEM2SX4dga/8K0kKO9JxnvYqQK5V8PK+trqVz7lA+uemcA5nkyLdJGfLDbIks
         2WJttz82xpt7Ei3fiB3OcgpcLkt/QF17x3b5SEoswUMNrmazN5E+8Sz4SctkwNpkOW/b
         foLfaHqFY0+48cE9oeigXXigbDNCPMCi/FXOGryZuCHxl/rT9JGjiZbKQlJCl/Yobo/g
         u38Q==
X-Gm-Message-State: AOAM531+Yel6ZaY8Xf2vYdOIhreNdmYuRIniy7lYb/4Ub8L22zrtFWPK
        YtxUltOYUC1lbvh6+qHhnqsPOa6of9c=
X-Google-Smtp-Source: ABdhPJzhbMppcJJ/CMT1mbbWaXKb4ZACh9gOSflEy8LGMsHposJGPWNVmAwFf5k3DQlHGOdT6NGgYA==
X-Received: by 2002:a2e:8ec1:: with SMTP id e1mr12943629ljl.84.1600439871198;
        Fri, 18 Sep 2020 07:37:51 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id w26sm644669ljm.30.2020.09.18.07.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 07:37:49 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kJHWE-0000yG-FL; Fri, 18 Sep 2020 16:37:46 +0200
Date:   Fri, 18 Sep 2020 16:37:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "<Daniel Caujolle-Bert>" <f1rmb.daniel@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, Oliver Neukum <oneukum@suse.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-serial-simple: Add Whistler radio scanners TRX serie
 support.
Message-ID: <20200918143746.GC21896@localhost>
References: <5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com>
 <20200918074519.GN24441@localhost>
 <5f64b2cc.1c69fb81.67f97.d907@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f64b2cc.1c69fb81.67f97.d907@mx.google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 18, 2020 at 03:14:50PM +0200, <Daniel Caujolle-Bert> wrote:
> Hi Johan,
> 
>   I just tried your patch, and it works, /dev/ttyACM0 is there and
>   usable.

Great, thanks for testing!

Can I add your Tested-by tag to the resulting patch?

I'll try to get this sorted as soon as possible.

Johan
