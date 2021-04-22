Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED547367F60
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 13:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbhDVLQ2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 07:16:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236074AbhDVLQ1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Apr 2021 07:16:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99AAC6145A;
        Thu, 22 Apr 2021 11:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619090153;
        bh=UAqK6UxxZFJ5XZ3GXSc1DWfVYEAyRQz+4ooT09o1oN0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cf1lCsp8V2I/KXotHAitazs36hNXcxSIUIToEefTlPGCfcvTsMgZy09oZzSJ4Xvsh
         VPKQDHbZf3F14iGCTlq9sCDL4WsyEHNJCnmJCXsK0V8LWGF6GuOwtJnDd1BgdFbyfh
         uChSlt/rfR+B4dDGUCxYERRAEqU6P3txWgfE9Hc8=
Date:   Thu, 22 Apr 2021 13:15:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Roman Mamedov <rm@romanrm.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Not enough bandwidth for new device state -- with Etron USB3
 controller only
Message-ID: <YIFa5uwt0ucgdi0N@kroah.com>
References: <20210421223732.27080321@natsu>
 <YIEOcvePnzGlQtoy@kroah.com>
 <20210422160813.41e26426@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422160813.41e26426@natsu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 22, 2021 at 04:08:13PM +0500, Roman Mamedov wrote:
> Hello,
> 
> On Thu, 22 Apr 2021 07:49:38 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > Not a bug, this is how USB works.  Your first hub really does not have
> > enough bandwidth for that device.  Well, we think it doesn't, the
> > calculation for that is really really tricky and we error on the side of
> > "let's not take the risk and just disable the device to be safe".
> > 
> > Get a better hub :)
> 
> But why the calculation is different when the hub is plugged into the onboard
> USB 2.0 controller -- and there it works?

You have more hubs in the way, they take up bandwidth on their own just
sitting there.

> I hope you don't take this as a bug report to make it stop working there as
> well. :)
> 
> If it's because the Etron controller is USB 3.0, and the higher speeds are
> somehow accounted for in the bandwidth calculation, that doesn't seem right,
> since both of the plugged in downstream hubs are 1.1/2.0-only.

USB 2 hubs plugged into a USB 3 controller require horrible things to be
done on the wire to make everything work properly.  Part of that
horribleness is bandwidth determination that we honestly are not the best
at in Linux.  But again, we err on the side of safety, which means we
guess on the low-end compared to other operating systems.

thanks,

greg k-h
