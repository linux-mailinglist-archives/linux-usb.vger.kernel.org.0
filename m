Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A792336F5A
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 10:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhCKJyd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 04:54:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbhCKJy3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 04:54:29 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A08DC061760
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 01:54:29 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id q5so696540pgk.5
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WEr1z9TXHKDpHaWl7p8IM2JmOkgWmJSPfC6MYuXysQk=;
        b=Fj6U/++g1RAISV6DwXWpxHaHxTJPQYvciSvMPIzV5pUt5IjQtwEOHmskU9KJ02KV/T
         CZjDDGupljwEb0eM707gQxnt/8D/enGVmaLyQsWeRCbICgQqJoB5iUgq676NQAN2VuAt
         NX8WUIikEOnPiK5Lz7t/8ziXxuDN1d362C4yo2+HABOugPabXtCMvjUf7Og17BQ57/N7
         wuO1OpH2UwGSiBss85DdJjiKRzHEJ19ftjbC2uuo0F85yddxbuyv7JFb8GmTJEB3AByE
         CclEnnfv9XtCr1VixQ0hYx1BaVpuHnzng62iUkBd5xGS+q0xuucR9z0+OsK06Jot8v+N
         NENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WEr1z9TXHKDpHaWl7p8IM2JmOkgWmJSPfC6MYuXysQk=;
        b=ftav5RXYsjaO48gRN0u5Clb+k44AfePqLVOAAHYWuG8n4RrkhsaGf3YUMEL1DkhzTL
         qlX9MY0fpPRKtyTDutldK6FLZ8BxB2KOk+akPCS1h9wmuxGLUuQOjWBPNq8DXIkLRVN+
         ZGUpYm7OzCGKv99anYqB1VL/YvNpVmp87dVXO9l9KbshRS+2SDgdi5BIjmv3sXN/QyU1
         4LWdW1PKRzB6t8DPCRhxll4sxRUVsG1VlCo+ZkiC0I2X+seneH01QpS5DM++KDajzpjx
         mxK7JXEl4Uy1g2chRGBou6QIu/YzMQ9TqqPZS4gVA8NlL9HBbPQij/zXhFoZ9YVnB4LT
         g5WA==
X-Gm-Message-State: AOAM532JY6kpOIFZeAdSCTP4vhK/KU7SKvceCT55Fzom4AVqGtLsP/cp
        w7Pzdc4aBTG84fIQeCmgfENJ2p4NdCLVJw==
X-Google-Smtp-Source: ABdhPJxl+IwSc/J2mLN0SD9lXuWJK4iMpEApevg4CsIzin73s4QAkdSTQHk4jcCNVjD3jBdTEkvenw==
X-Received: by 2002:a63:2009:: with SMTP id g9mr6572975pgg.219.1615456469056;
        Thu, 11 Mar 2021 01:54:29 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id s4sm1788735pji.2.2021.03.11.01.54.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 01:54:28 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:54:23 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Revert "usb: dwc3: qcom: Constify the software node"
Message-ID: <20210311095422.GW17424@dragon>
References: <20210311090049.7354-1-shawn.guo@linaro.org>
 <YEnez7CuR4YW8AVA@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEnez7CuR4YW8AVA@kuha.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 11:11:43AM +0200, Heikki Krogerus wrote:
> On Thu, Mar 11, 2021 at 05:00:49PM +0800, Shawn Guo wrote:
> > This reverts commit 8dc6e6dd1bee39cd65a232a17d51240fc65a0f4a.
> > 
> > The commit causes an regression for ACPI probe on Lenovo Yoga C630
> > laptop.  platform_device_add_properties() will fail with -EEXIST for the
> > second USB instance, because of the software_node_to_swnode() check in
> > function software_node_register().
> 
> I think you mean device_add_software_node() fails with -EEXIST, no?

Yeah, I was looking at the wrong line.

> 
> There should be already a fix for that:
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=2a92c90f2ecca4475d6050f2f93
> +8a1755a8954cc

Cool!  It fixes my problem.  Hope it will land 5.12-rc soon.

Shawn
