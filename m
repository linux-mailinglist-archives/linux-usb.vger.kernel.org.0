Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0BD112778D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 09:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfLTIzL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 03:55:11 -0500
Received: from [167.172.186.51] ([167.172.186.51]:60338 "EHLO shell.v3.sk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727135AbfLTIzL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Dec 2019 03:55:11 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id F3417DFCB2;
        Fri, 20 Dec 2019 08:55:12 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id HWnrl2x5CVNX; Fri, 20 Dec 2019 08:55:12 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 77E07DFCB1;
        Fri, 20 Dec 2019 08:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id otQPdWfy4Lpk; Fri, 20 Dec 2019 08:55:12 +0000 (UTC)
Received: from nedofet.lan (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 25934DFCB0;
        Fri, 20 Dec 2019 08:55:12 +0000 (UTC)
Message-ID: <1fdbe2d493b71ed2105a8976ebbccbba28adfe26.camel@v3.sk>
Subject: Re: [PATCH] USB: EHCI: ehci-mv: drop pxa_ehci_type and unused
 device IDs
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Fri, 20 Dec 2019 09:55:07 +0100
In-Reply-To: <20191220073537.GA2193408@kroah.com>
References: <20191220070202.239870-1-lkundrak@v3.sk>
         <20191220073537.GA2193408@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-12-20 at 08:35 +0100, Greg Kroah-Hartman wrote:
> On Fri, Dec 20, 2019 at 08:02:02AM +0100, Lubomir Rintel wrote:
> > A trivial cleanup.
> 
> How is dropping device ids a "trivial cleanup"?
> 
> Please be more descriptive as to why you are making a change.

Thanks for the response. I'll post a v2 with a hopefully better
description.

> Also, you sent a number of patches here and I do not know what order
> they should be applied in.  Please resend them all as a numbered patch
> series so that I have a clue what to do.

I did that because the patches are completely independent of each other
-- they don't conflict and don't need to be applied any particular
order. Would you still prefer a numbered series?

> 
> thanks,
> 
> greg k-h

Thank you
Lubo

