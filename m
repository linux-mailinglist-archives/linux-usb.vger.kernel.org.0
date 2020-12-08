Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D262B2D26AF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 09:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgLHI5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 03:57:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:55838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbgLHI5N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Dec 2020 03:57:13 -0500
Date:   Tue, 8 Dec 2020 09:57:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607417792;
        bh=GtVSpNrW0jS5K+T0dTAOgXRiZTYTawy1wSdbSIIXjig=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=PwGhTt38nHvdHBRHpIgf1GMdCeGmsHK/KqFS98x85RZe0e3uhMm1k3dHJCxaV220A
         bri4tRGWrj9wpTLz3vAJkiLlNmU4yxcS2d6sS2TvMak7iaWqkDjKwn56vg32ZzAVBZ
         WKQYt1lxM8QiLiz+kP/pde/MWONGPh4DRS0BSNMo=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: usb usb1-port10: disabled by hub (EMI?), re-enabling...
Message-ID: <X89ABDFgyjpQPeRq@kroah.com>
References: <c8408e58-8bc3-dbe7-2a99-1b1f0d3eae21@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8408e58-8bc3-dbe7-2a99-1b1f0d3eae21@molgen.mpg.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 08, 2020 at 09:18:08AM +0100, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On a Dell Precision 3540/0M14W7, BIOS 1.9.1 07/06/2020
> 
>     $ lspci -nn | grep -i usb
>     00:14.0 USB controller [0c03]: Intel Corporation Cannon Point-LP USB 3.1
> xHCI Controller [8086:9ded] (rev 30)
>     3a:00.0 USB controller [0c03]: Intel Corporation JHL6340 Thunderbolt 3
> USB 3.1 Controller (C step) [Alpine Ridge 2C 2016] [8086:15db] (rev 02)
> 
> at each boot Linux 5.6 to 5.9 logs the error below.
> 
>     [   95.528190] usb usb1-port10: disabled by hub (EMI?), re-enabling...
> 
> Everything seems to be fine, so I wonder, why this is level error. Is it a
> hardware error?

Yes, it is a hardware issue.

thanks,

greg k-h
