Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD0C472E9B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 15:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbhLMOLz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 09:11:55 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60346 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbhLMOLy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 09:11:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D046AB81017
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 14:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1991BC34601;
        Mon, 13 Dec 2021 14:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639404712;
        bh=+nvzKjVc18ORzalRBwK3q8W9y9JCkkbSF95t8mBfPYI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ecQZ9Ou6iS/bfH8Zg9VsZI2mS0B51XizDaXal+gZDePqVI64k9uk/A5+OQxMd1Ywf
         SBPO5Qi4IdHB4yagl+SSLbWinQx1JJSv+WuTmHT4AgHkikUo5fv/Ooe6SkJeW3Nz7y
         TRklihHCq+kNSfRy2puZ99thGoMYtE4GdGeHp5Co=
Date:   Mon, 13 Dec 2021 15:11:50 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v3 1/6] usb: gadget: udc: gr: fix deferred probing
Message-ID: <YbdUpnlk4sjP9nGU@kroah.com>
References: <20211210204634.8182-1-s.shtylyov@omp.ru>
 <20211210204634.8182-2-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210204634.8182-2-s.shtylyov@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 10, 2021 at 11:46:29PM +0300, Sergey Shtylyov wrote:
> The driver overrides the error codes and IRQ0 returned by platform_get_irq()
> to -ENODEV, so if it returns -EPROBE_DEFER, the driver will fail the probe
> permanently instead of the deferred probing. Switch to propagating the error
> codes upstream. IRQ0 is no longer returned by platform_get_irq(), so we now
> can safely ignore it...

What commit keeps IRQ0 from being returned by platform_get_irq()?
