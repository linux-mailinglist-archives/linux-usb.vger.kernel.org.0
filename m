Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D408E337609
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 15:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhCKOqX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 09:46:23 -0500
Received: from netrider.rowland.org ([192.131.102.5]:51289 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231145AbhCKOpy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 09:45:54 -0500
Received: (qmail 258692 invoked by uid 1000); 11 Mar 2021 09:45:53 -0500
Date:   Thu, 11 Mar 2021 09:45:53 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     SIMON BABY <simonkbaby@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Query on USB error
Message-ID: <20210311144553.GB257360@rowland.harvard.edu>
References: <CAEFUPH13WXt=Usq-87Jj3_0u9gC0_AyFmnAzeM1eNFbXhJNgEQ@mail.gmail.com>
 <20210310182742.GA228576@rowland.harvard.edu>
 <CAEFUPH35OY-BkkXcW3+_JJN0EvDhFYEphJtvTNiyhySLZG20xw@mail.gmail.com>
 <20210310215758.GB236329@rowland.harvard.edu>
 <CAEFUPH3TqitM1JSYzMpXMObnbVNhbgqtaqNe8y=G9bZ6n3E2Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEFUPH3TqitM1JSYzMpXMObnbVNhbgqtaqNe8y=G9bZ6n3E2Bg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 10, 2021 at 10:07:46PM -0800, SIMON BABY wrote:
> Thank you so much Alan.
> I also see some other commits below related with USB. Do you think those
> also can fix the issue? Some of them I did not see a code change.Can you
> please check and confirm.

There's no point in guessing, especially if you aren't familiar with the 
code.

> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.43&id=ae6fe57b28b609c59f6e04ecf65d1e8f6fe470bc
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.43&id=1e9c04fa407587a6aaf72b13219802565d22e5a0
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.43&id=ddaa6a0bb301607d0e2a3c0414115a596a6f7c14
> 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.42&id=4779c5e04d4e2511092d0f41e7e6ca261575b467
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.40&id=49abf47d18ef1e3c67f3a29cd9eda03f48818652
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/usb/host?h=v2.6.32.39&id=b90adfeb126662df944e7fdfcd732ab10df6454c
k

It's very unlikely that any of these commits is related to your problem.

If you want to find a definitive answer for yourself, and if you cause 
the problem to occur reliably, then you can use bisection to find the 
single commit which fixed the issue.

Alan Stern
