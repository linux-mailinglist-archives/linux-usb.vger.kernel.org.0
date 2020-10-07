Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A3A285CDE
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 12:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbgJGKZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Oct 2020 06:25:12 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:36610 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbgJGKZM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 06:25:12 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 276703C04C1;
        Wed,  7 Oct 2020 12:25:10 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EiQXyEzT94v1; Wed,  7 Oct 2020 12:24:59 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id D9D023C00BF;
        Wed,  7 Oct 2020 12:24:59 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.12) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 7 Oct 2020
 12:24:59 +0200
Date:   Wed, 7 Oct 2020 12:24:55 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     Eugeniu Rosca <erosca@de.adit-jv.com>, stable <stable@kernel.org>,
        <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        Ilja Van Sprundel <ivansprundel@ioactive.com>,
        Brooke Basile <brookebasile@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] USB: gadget: f_ncm: Fix NDP16 datagram validation
Message-ID: <20201007102455.GA26337@lxhi-065.adit-jv.com>
References: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
 <20201006182943.GA12648@lxhi-065.adit-jv.com>
 <20201006201825.GA188912@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201006201825.GA188912@kroah.com>
X-Originating-IP: [10.72.94.12]
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello again,

On Tue, Oct 06, 2020 at 10:18:25PM +0200, Greg KH wrote:
> On Tue, Oct 06, 2020 at 08:29:43PM +0200, Eugeniu Rosca wrote:
> > On Sun, Sep 20, 2020 at 06:01:58PM +0100, Bryan O'Donoghue wrote:
> > > commit 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")

[..]

> > This patch appears to be pushed to 4.19, 5.4 and 5.8 stable trees via:
> > 
> > https://lore.kernel.org/lkml/20201005142108.771915994@linuxfoundation.org/
> > https://lore.kernel.org/lkml/20201005142109.966570222@linuxfoundation.org/
> > https://lore.kernel.org/lkml/20201005142114.960807335@linuxfoundation.org/
> > 
> > Will you push this patch to v4.14.y, in order to fix v4.14.196 commit
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b88ad6e714284b
> > ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()") ?
> 
> It also need to go to 4.9.y, and is already queued up in the stable
> queues for those trees for the next round of kernels that are released
> for them.

Thank you!

-- 
Best regards,
Eugeniu Rosca
