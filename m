Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68491B38EF
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 09:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgDVH2D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Apr 2020 03:28:03 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43961 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgDVH2C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 03:28:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id l19so1139429lje.10;
        Wed, 22 Apr 2020 00:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HehvquyX/BRzMPyeN0mYBmeTubyfIaQMMH5cFq5I5DI=;
        b=bmAqYHk8ujHz5xmp3geIJW/OrOZwFI1NQy587cIaT0i29v8Ua4SSe9l2+vUJ9bkq+9
         I4vhIeLZDDH+/f14sUk3vQswcqkp4jJqqAdjs8nJrMhiZdC/x3gfLZsOzK3bqOYjg60g
         ypal/SFqXVBm8IYpWJzH8cY9VUeFMEyCkIN4bnjxAvPDPrY3zjg3HPPNayUpMsGETmTu
         yhjtUdtfnep/rdLgayzr79CprOdbO7XwYxyogMf7+gmJBQtadDjAHWeb7TBOOpMztrEq
         Yn5xMdhwqaaoIz5CLSIHvlV1PlqwsobpDjKmlE9GJ8dLltoq+t6O/8dMHwmngwwUt5/y
         VeQQ==
X-Gm-Message-State: AGi0PuanC9NH9uTODRDI8uekT4YUNGRgRuLZQHGaLr/SqvIzjZAgIZ8q
        6EU7nE/KOs8yvNOSlJcnWvuHg6I5
X-Google-Smtp-Source: APiQypJWmeXOxbThP7lWWVqPFUutfBaFXA4CkU9Kv4i4mhtLv4m4EStWy0F4xu8GROYXPUuiTIyd7Q==
X-Received: by 2002:a2e:700a:: with SMTP id l10mr3615795ljc.88.1587540480435;
        Wed, 22 Apr 2020 00:28:00 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id t24sm4310317lfk.90.2020.04.22.00.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 00:27:59 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jR9ni-0003kI-GT; Wed, 22 Apr 2020 09:28:06 +0200
Date:   Wed, 22 Apr 2020 09:28:06 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Nishad Kamdar <nishadkamdar@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Joe Perches <joe@perches.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: Use the correct style for SPDX License
 Identifier
Message-ID: <20200422072806.GH18608@localhost>
References: <20200419130603.GA5763@nishad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200419130603.GA5763@nishad>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 19, 2020 at 06:36:07PM +0530, Nishad Kamdar wrote:
> This patch corrects the SPDX License Identifier style in
> header files related to USB Serial device configuration.
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used).
> 
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

Applied for -next, thanks.

Johan
