Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2932AD2772
	for <lists+linux-usb@lfdr.de>; Thu, 10 Oct 2019 12:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732893AbfJJKpv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Oct 2019 06:45:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:46340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726230AbfJJKpu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Oct 2019 06:45:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E00D8208C3;
        Thu, 10 Oct 2019 10:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570704350;
        bh=V0vzZx1+h5Q4noRlV+vYUjs+nhGS6+mHOA4vjDJFlM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mSdknab5VAgcj5aRKy9YYOX9apAcB0q18wZ0jA4t/pZzl++1esjZAMH8MA05z/qsr
         2T5iN+N+vKVLTtJJrzXyHAjOSD27ShskriTiMFdtkajQiajPC35txUG9l2EwyKnWcj
         OeWuOeKqk9qyQ5+iAP4vVjWWB2TMEL4eVz02w2xM=
Date:   Thu, 10 Oct 2019 12:45:48 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Valentin Vidic <vvidic@valentin-vidic.from.hr>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] USB: iowarrior: disconnect fixes and locking cleanups
Message-ID: <20191010104548.GA639765@kroah.com>
References: <20191009104846.5925-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009104846.5925-1-johan@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 09, 2019 at 12:48:40PM +0200, Johan Hovold wrote:
> This series fixes a use-after-free bug introduced by a recent
> disconnect-deadlock fix that was reported by syzbot. Turns out there was
> already a related bug in the driver, and the first patch addresses both
> issues.
> 
> While looking at the code I found two more use-after-free bugs, which
> the next two patches fix.
> 
> The next two clean up the driver by dropping two redundant locks.
> 
> Tested using a mockup device.

Thanks for these patches, now queued up.  I have one of these devices
(their new one) and need to fix the driver up to work with it, but I'll
start on that on top of these fixes :)

thanks,

greg k-h
