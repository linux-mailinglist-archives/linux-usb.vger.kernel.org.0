Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7610542EAAF
	for <lists+linux-usb@lfdr.de>; Fri, 15 Oct 2021 09:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236361AbhJOH4y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Oct 2021 03:56:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:57288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230049AbhJOH4y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Oct 2021 03:56:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FAD16115C;
        Fri, 15 Oct 2021 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634284488;
        bh=KqWk1XspLUF0AkW/WhCFKLrHbQkPk/fBP/58gbnZajE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TA+X3vECaP2GJq2y3Ebh+CP3NEOyy7eoxbsk6aXZCAfr2c5eW9EKCvWEA0ljSlgJY
         BfN8B+eyzbJCb1PLl3WMe/u5RqYYwAWxxNarFU9rPIb/KZwQpuXmuuiSKlnuRDTluq
         hVTSa3SF15T6n07XH4Y/Fmo/Ul8MKYeAr58QhWFs=
Date:   Fri, 15 Oct 2021 09:54:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     braewoods@braewoods.net
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-storage: Add compatibility quirk flags for iODD
 2531/2541
Message-ID: <YWkzxWyIhW08ZCcX@kroah.com>
References: <20211014015504.2695089-1-braewoods+lkml@braewoods.net>
 <20211014022049.GB910341@rowland.harvard.edu>
 <8466fa531529630936ee0f0e290b54b2@braewoods.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8466fa531529630936ee0f0e290b54b2@braewoods.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 15, 2021 at 01:29:20AM -0500, braewoods@braewoods.net wrote:
> On 2021-10-13 21:20, Alan Stern wrote:
> > In the future, you should always include a version number in the email
> > Subject: line (for example, "[PATCH v2]") so that readers will know
> > which patch is which.  And you should include, here just below the "---"
> > line, a description of how this version differs from the previous
> > version.  See the email archives for examples of multi-version patches.
> > 
> > Nevertheless, this looks okay.
> > 
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Noted. I'll do that for future patches. On a side note, any idea how long it
> normally takes to get a simple patch like this committed? I've had mixed
> experiences with getting feedback on patches. Sometimes my patches just get
> totally ignored.

Depends on the subsystem and the patch submitted.

Also always use scripts/get_maintainer.pl to properly copy the needed
maintainers and mailing lists.  Sometimes patches get lost in the noise
if the right people are not copied.

thanks,

greg k-h
