Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266D22851AA
	for <lists+linux-usb@lfdr.de>; Tue,  6 Oct 2020 20:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgJFSgX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Oct 2020 14:36:23 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56554 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgJFSgW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Oct 2020 14:36:22 -0400
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Oct 2020 14:36:21 EDT
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id D51AD3C04C1;
        Tue,  6 Oct 2020 20:29:57 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jvHZelRpiyXl; Tue,  6 Oct 2020 20:29:51 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id BE56B3C00BF;
        Tue,  6 Oct 2020 20:29:51 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.4) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 6 Oct 2020
 20:29:51 +0200
Date:   Tue, 6 Oct 2020 20:29:43 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     stable <stable@kernel.org>, <gregkh@linuxfoundation.org>
CC:     <balbi@kernel.org>, <linux-usb@vger.kernel.org>,
        Ilja Van Sprundel <ivansprundel@ioactive.com>,
        Brooke Basile <brookebasile@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] USB: gadget: f_ncm: Fix NDP16 datagram validation
Message-ID: <20201006182943.GA12648@lxhi-065.adit-jv.com>
References: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
X-Originating-IP: [10.72.94.4]
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Greg,
Hello stable maintainers,

On Sun, Sep 20, 2020 at 06:01:58PM +0100, Bryan O'Donoghue wrote:
> commit 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
> adds important bounds checking however it unfortunately also introduces  a
> bug with respect to section 3.3.1 of the NCM specification.
> 
> wDatagramIndex[1] : "Byte index, in little endian, of the second datagram
> described by this NDP16. If zero, then this marks the end of the sequence
> of datagrams in this NDP16."
> 
> wDatagramLength[1]: "Byte length, in little endian, of the second datagram
> described by this NDP16. If zero, then this marks the end of the sequence
> of datagrams in this NDP16."
> 
> wDatagramIndex[1] and wDatagramLength[1] respectively then may be zero but
> that does not mean we should throw away the data referenced by
> wDatagramIndex[0] and wDatagramLength[0] as is currently the case.
> 
> Breaking the loop on (index2 == 0 || dg_len2 == 0) should come at the end
> as was previously the case and checks for index2 and dg_len2 should be
> removed since zero is valid.
> 
> I'm not sure how much testing the above patch received but for me right now
> after enumeration ping doesn't work. Reverting the commit restores ping,
> scp, etc.
> 
> The extra validation associated with wDatagramIndex[0] and
> wDatagramLength[0] appears to be valid so, this change removes the incorrect
> restriction on wDatagramIndex[1] and wDatagramLength[1] restoring data
> processing between host and device.
> 
> Fixes: 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
> Cc: Ilja Van Sprundel <ivansprundel@ioactive.com>
> Cc: Brooke Basile <brookebasile@gmail.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 30 ++---------------------------
>  1 file changed, 2 insertions(+), 28 deletions(-)

This patch appears to be pushed to 4.19, 5.4 and 5.8 stable trees via:

https://lore.kernel.org/lkml/20201005142108.771915994@linuxfoundation.org/
https://lore.kernel.org/lkml/20201005142109.966570222@linuxfoundation.org/
https://lore.kernel.org/lkml/20201005142114.960807335@linuxfoundation.org/

Will you push this patch to v4.14.y, in order to fix v4.14.196 commit
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=b88ad6e714284b
("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()") ?

-- 
Best regards,
Eugeniu Rosca
