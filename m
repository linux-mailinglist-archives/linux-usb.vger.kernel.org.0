Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B302A15C5
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2019 12:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfH2KVR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Aug 2019 06:21:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:58252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727139AbfH2KVR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Aug 2019 06:21:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9A1E922CF5;
        Thu, 29 Aug 2019 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567074076;
        bh=g1Vo69At6c1xR0l7nlKwcgX9mVRHSUIsRWGGsUzYoAY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DYIm9hOxhnnU9A/2IiunPz+jZr1vZXI9Ept0UHjkqAmu6KeVq1+6W2m+6DBLD3slu
         kKBtsuMIemVcKV92CVvNBmzhiRL3WAIcnC3rJ1YgrCMh5VoDR6zA5y+Y/YDMyabdn1
         WF47KVgyK3xnhjMp9V9j01KxWHuxNTNF8EKJmH7U=
Date:   Thu, 29 Aug 2019 12:21:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jochen Sprickerhof <jochen@sprickerhof.de>,
        Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH v2 1/2 RESEND] usb: core: phy: add support for PHY
 calibration
Message-ID: <20190829102113.GA20823@kroah.com>
References: <20190808094128.27213-1-m.szyprowski@samsung.com>
 <CGME20190808094146eucas1p2a5a88ce5e7a87d47c4bcececab4df9a5@eucas1p2.samsung.com>
 <20190808094128.27213-2-m.szyprowski@samsung.com>
 <a380a635-e036-1a18-bc0f-947931f8735c@samsung.com>
 <20190828204146.GA21235@kroah.com>
 <e801e7a4-f525-baae-4c02-d271db308b5f@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e801e7a4-f525-baae-4c02-d271db308b5f@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 29, 2019 at 07:26:50AM +0200, Marek Szyprowski wrote:
> Hi Greg,
> 
> On 2019-08-28 22:41, Greg Kroah-Hartman wrote:
> > On Mon, Aug 26, 2019 at 10:55:33AM +0200, Marek Szyprowski wrote:
> >> Hi Greg
> >>
> >> On 2019-08-08 11:41, Marek Szyprowski wrote:
> >>> Some PHYs (for example Exynos5 USB3.0 DRD PHY) require calibration to be
> >>> done after every USB HCD reset. Generic PHY framework has been already
> >>> extended with phy_calibrate() function in commit 36914111e682 ("drivers:
> >>> phy: add calibrate method"). This patch adds support for it to generic
> >>> PHY handling code in USB HCD core.
> >>>
> >>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>> Tested-by: Anand Moon <linux.amoon@gmail.com>
> >>> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>
> >> Greg: any chance to give it this a try in -next? If not, maybe You can
> >> point someone whose review will help?
> > Ah crap, this is me, not the PHY maintainer :(
> >
> > Can you resend this and I will be glad to review it.  But it would also
> > be good to get Felipe's review as well.
> 
> No problem, I will resend it again in a few minutes. Felipe already 
> acked it: https://lkml.org/lkml/2019/8/8/460

I don't see the resend, did I miss it?

And can you add Felipe's ack to it?

thanks,

greg k-h
