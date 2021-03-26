Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E38934A4FC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Mar 2021 10:54:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbhCZJyB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Mar 2021 05:54:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:44394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhCZJxr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Mar 2021 05:53:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 940D561A38;
        Fri, 26 Mar 2021 09:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616752422;
        bh=IKZ5BfMHd4HiNc1iLAvvrRwBaniQr78lswNaxM5Y50E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VpZBvu1vgHK3HDqQyMnim3GZqUEDvmEsX+vNRN6HuVrXCnAJBdb+yD/vym1wPOCfm
         jGd8BP+TeBWRW9K4YH+XGnIeQCXeaC3kCUQy6q7Bx7HVJkVqBu3bZTy3YMLk3nal+W
         kHMGEmbYbqM1AKBPu6P2/ebfATdKAfoIvwMT316E=
Date:   Fri, 26 Mar 2021 10:53:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Harald Dunkel <harri@afaics.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: 5.11.10: sync gets stuck after writing ubuntu live iso to usb
 stick
Message-ID: <YF2vI8C2LT+xjjxq@kroah.com>
References: <1fd4daa4-ad11-51b2-6fc5-22d6213d551b@afaics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fd4daa4-ad11-51b2-6fc5-22d6213d551b@afaics.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 26, 2021 at 07:57:52AM +0100, Harald Dunkel wrote:
> Hi folks,
> 
> using
> 
> 	dd if=ubuntu-20.10-desktop-amd64.iso bs=64k of=/dev/sdx
> 
> on 5.11.10 to write a live iso to USB stick dd never returns.
> 
> lsof shows that the file handles for source and destination
> have been closed, but dd doesn't exit. It cannot be interrupted
> or killed, either. If I run "sync" in another terminal, then this
> gets stuck as well.
> 
> I could reproduce this problem using Debian's 5.10.13-1 and
> 5.11.{9,10} built from the sources in git, on Debian 10 and
> Unstable. I tried to copy the ubuntu live iso and the RHEL 8.3
> installer iso. 3 different USB sticks.
> 
> There is no such problem using Debian's 4.19.0-16-amd64 kernel
> on Debian 10.

Any chance you can see if you can bisect this down to an offending
commit?  The jump from 4.19 to 5.11 is quite big (2 years).

But no, this works for me, just did it yesterday and I run some builds
off of usb storage devices.

thanks,

greg k-h
