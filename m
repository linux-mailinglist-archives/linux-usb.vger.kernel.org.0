Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B757C213646
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 10:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgGCIUB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 04:20:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:48448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgGCIUB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 04:20:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC6DF206A1;
        Fri,  3 Jul 2020 08:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593764401;
        bh=Mw65ad0MZ1Nebs/GZlz+EM9sSrhAhcxEhEklbZPZTSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=efOiJHanqmE4bJ/pvCkohC85vbGIqylVxdES8hUySMwp+oCPJzzN06Ud69Uf6ICjN
         BjnpLfyfeyv01GWnXh/Kpoa7rnI/FkHy0WBRmFIC5n4mkwp1LA1RzFkUdVwjFCBkVP
         VzCHSbQRD9HC1OsBHIoBud6G2ytbmtV3YNV6sr24=
Date:   Fri, 3 Jul 2020 10:20:05 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "ben@simtec.co.uk" <ben@simtec.co.uk>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: patch "usb: dwc2: gadget: Remove assigned but never used
 'maxsize'" added to usb-testing
Message-ID: <20200703082005.GB2396807@kroah.com>
References: <1593761680160133@kroah.com>
 <825601ce-ba13-2160-8fe6-449c2617658f@synopsys.com>
 <b9a40f7b-cc22-72b5-74ef-a4ab239b8789@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9a40f7b-cc22-72b5-74ef-a4ab239b8789@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 08:04:45AM +0000, Minas Harutyunyan wrote:
> Added linux-usb@vger.kernel.org to recipient list.
> Minas
> 
> 
> On 7/3/2020 11:55 AM, Minas Harutyunyan wrote:
> > Hi,
> > 
> > On 7/3/2020 11:34 AM, gregkh@linuxfoundation.org wrote:
> >>
> >> This is a note to let you know that I've just added the patch titled
> >>
> >>       usb: dwc2: gadget: Remove assigned but never used 'maxsize'
> >>
> >> to my usb git tree which can be found at
> >>       git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> >> in the usb-testing branch.
> >>
> >> The patch will show up in the next release of the linux-next tree
> >> (usually sometime within the next 24 hours during the week.)
> >>
> >> The patch will be merged to the usb-next branch sometime soon,
> >> after it passes testing, and the merge window is open.
> >>
> >> If you have any questions about this process, please let me know.
> >>
> >>
> > 
> > Greg, I'll prefer if Lee Jones add "Fixes:" tag and resubmit v2.

There is no "Fixes:" needed for something like this, I'm goign to leave
it as-is, thanks.

greg k-h
