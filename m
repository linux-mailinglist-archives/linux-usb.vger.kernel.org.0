Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B35A38C5EC
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 13:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhEULqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 07:46:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231504AbhEULqb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 07:46:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9502613DE;
        Fri, 21 May 2021 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621597508;
        bh=Vquz8nX6WAKpCduf7aK+OIrxyMRDaMKBl0Yx6b5Z/BA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XkHmmzrYPa3SAIFnFgnutMTZDjI78Vyz/tZEQoqBlfWyZBGUPD7H0VFA9G/Al4mwb
         /jhMhVNkUJVRnAqUPJlJt617FjA0o4xpuazduhDlbFOxh2sePNBZIPb3PcZjcGcZIk
         5HrZ1Ij0EbbWiLC/YuatyoMpw/LUHP3x6JPDErIk=
Date:   Fri, 21 May 2021 13:45:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vladimir Zapolskiy <vz@mleia.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] USB: gadget: lpc32xx_udc: remove debugfs dentry variable
Message-ID: <YKedQtgkBB+Bm0xT@kroah.com>
References: <20210518162035.3697860-1-gregkh@linuxfoundation.org>
 <4353dd50-1b41-65f8-815a-ae3fbafb387b@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4353dd50-1b41-65f8-815a-ae3fbafb387b@mleia.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 19, 2021 at 02:09:17PM +0300, Vladimir Zapolskiy wrote:
> On 5/18/21 7:20 PM, Greg Kroah-Hartman wrote:
> > There is no need to store the dentry for a fixed filename that we have
> > the string for.  So just have debugfs look it up when we need it to
> > remove the file, no need to store it anywhere locally.
> > 
> > Note, this driver is broken in that debugfs will not work for more than
> > one instance of the device it supports.  But given that this patch does
> > not change that, and no one has ever seemed to notice, it must not be an
> > issue...
> 
> Yep, there is only one SoC with this device, and it has only one instance
> of this UDC. Bad excuse, I know it.

Not a big deal :)

> > Cc: Felipe Balbi <balbi@kernel.org>
> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: linux-usb@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>

Thanks for the review!

greg k-h
