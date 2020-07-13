Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127FE21AFCF
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 08:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgGJG7f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 02:59:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725851AbgGJG7e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jul 2020 02:59:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B0822078B;
        Fri, 10 Jul 2020 06:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594364374;
        bh=emkY3ROKdfENfyZHphdFDS9ktgI3x4d1IytpcJS27Jo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tjoSoWv7U/ontMgDkfurfm7BmvAZtfjJv9KpSbY57bJSy5vlGYniipYsF1Y/p8R0D
         txJMrkyreY/dr6yDWjBo+vdHb9cSEdzEleoBwIYnGoQpeauOkmTwhTM+CZoYIDC0l5
         WSKeXi+izJMnSJK1g7WMTCfVKjMSBaS0gKd73JL0=
Date:   Fri, 10 Jul 2020 08:59:39 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     balbi@kernel.org, alexandre.belloni@bootlin.com,
        clabbe@baylibre.com, arnd@arndb.de, yanaijie@huawei.com,
        yuehaibing@huawei.com, chunfeng.yun@mediatek.com,
        baijiaju1990@gmail.com, swboyd@chromium.org,
        christophe.jaillet@wanadoo.fr, jaswinder.singh@linaro.org,
        linux-geode@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB GADGET/PERIPHERAL SUBSYSTEM: Replace HTTP links with
 HTTPS ones
Message-ID: <20200710065939.GA1153760@kroah.com>
References: <20200709200903.27124-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709200903.27124-1-grandmaster@al2klimov.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 09, 2020 at 10:09:03PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>  (Actually letting a shell for loop submit all this stuff for me.)
> 
>  If there are any URLs to be removed completely or at least not HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also: https://lkml.org/lkml/2020/6/27/64
> 
>  If there are any valid, but yet not changed URLs:
>  See: https://lkml.org/lkml/2020/6/26/837
> 
>  If you apply the patch, please let me know.

Again, the subject line is not ok, I thought I mentioned this before?

thanks,

greg k-h
