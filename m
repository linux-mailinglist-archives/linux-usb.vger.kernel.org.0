Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65C23AC589
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 09:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbhFRIAL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 04:00:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:34812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232455AbhFRIAK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 04:00:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10AB061139;
        Fri, 18 Jun 2021 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624003081;
        bh=94PInMGfpw3Q8KBERvXlNy5OzV2kKhpFMcD1IEDyd70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f8lIFE82qH/QS5n6iA5BXlQW2bM2P32jyoZNMcuDQ84oCBNczzIA+N1i2bmOkvRwK
         hFUY5jai4B0Ojz0RT/gd6zrxszKHtjl8lzmRrTS1c8itL8fH9GKY4F8Hn3UsbdefG2
         iRkXPP2yD1go7QuDJgvQ5kAZcusnrrsFAlCAhFr0=
Date:   Fri, 18 Jun 2021 09:57:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     peter.chen@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        zhipeng.wang_1@nxp.com
Subject: Re: [PATCH v2] usb: chipidea: host: fix port index underflow and
 UBSAN complains
Message-ID: <YMxSBpXrOCljlVuF@kroah.com>
References: <1623999879-2277-1-git-send-email-jun.li@nxp.com>
 <YMxPBdaTNNMf5rIg@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMxPBdaTNNMf5rIg@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 18, 2021 at 09:45:09AM +0200, Greg KH wrote:
> On Fri, Jun 18, 2021 at 03:04:39PM +0800, Li Jun wrote:
> > If wIndex is 0 (and it often is), these calculations underflow and
> > UBSAN complains, here resolve this by not decrementing the index when
> > it is equal to 0, this copies the solution from commit 85e3990bea49
> > ("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")
> > 
> > Reported-by: zhipeng.wang <zhipeng.wang_1@nxp.com>
> 
> Please use a name here that makes sense, "Zhipeng Wang"?

Specifically, the "." in the name as written originally does not make
sense, right?
