Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0033D478986
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 12:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhLQLLQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Dec 2021 06:11:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:35544 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233227AbhLQLLQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Dec 2021 06:11:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3785DB82799
        for <linux-usb@vger.kernel.org>; Fri, 17 Dec 2021 11:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730CFC36AE8;
        Fri, 17 Dec 2021 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639739474;
        bh=ES7uoj4BDiVT2T6oTaN1XzzKHjMtXJGClU2XTDDwPlk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IOEbSYX007zR6T/+VHwGrWMDsYNNRxMziR4e+QmT1EOD1gq5Hbd+2/CGSAFWam88B
         fIYJoeOZhrlz8E+xV9FaEQK83Eepjh8zrDkgJRfRwRWJwLe9qM5RbNNb8A7cBh/lwY
         TzmQXLN0q3myjKp+GbgTGd5pSu84qhM1MzXUBpdE=
Date:   Fri, 17 Dec 2021 12:11:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] usb: gadget: udc: pxa25x: propagate errors from
 platform_get_irq()
Message-ID: <YbxwTinHZF3Kdmu+@kroah.com>
References: <20211214204247.7172-1-s.shtylyov@omp.ru>
 <20211214204247.7172-3-s.shtylyov@omp.ru>
 <32d35b68-50e9-a280-d0f7-edef8165825a@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32d35b68-50e9-a280-d0f7-edef8165825a@zonque.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 17, 2021 at 11:32:58AM +0100, Daniel Mack wrote:
> On 12/14/21 21:42, Sergey Shtylyov wrote:
> > The driver overrides the error codes returned by platform_get_irq() to
> > -ENODEV for some strange reason.  Switch to propagating the error codes
> > upstream.
> > 
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> Acked-by: Daniel Mack <daniel@zonque.org>
> 
> Greg, could you take this through your tree?

Will do, thanks!

greg k-h
