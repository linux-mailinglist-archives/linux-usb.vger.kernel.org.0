Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DBA2EAFC6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 17:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbhAEQLP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 11:11:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:38412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727895AbhAEQLP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Jan 2021 11:11:15 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0DF122C9D;
        Tue,  5 Jan 2021 16:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609863035;
        bh=AMTjswIJmXV6O9a9csEv5PYnznwmzZspR+Nacf2YXD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qXNZ+HFOL6xXukXk1XWJQwqC8ECn/FOTkO4fp7yM9/VZQbUatLLYQ+NOUn+Yq6Fk7
         FTA9iDeMbPJ07OHiFHi96pUnGow4v+KscTVMzgxJ69MLnE5ehM2PXXLOxZg24BjzzW
         ThviVhVrmG3aqN+rR8l4kgQVAK2mCS62XjlpNjdU=
Date:   Tue, 5 Jan 2021 17:11:59 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Augusto Ciuffoletti <augusto.ciuffoletti@unipi.it>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Problem with the CH341 driver in Ubuntu 20.04
Message-ID: <X/SPz9Xw7QTM7pVx@kroah.com>
References: <CAOefePC_PEkra4adLq4Risea3VCtN41jU42_C=5UJ=mYuGfFog@mail.gmail.com>
 <X/SFeQM48WUyVR9V@kroah.com>
 <CAOefePCJzObfprvXHsruzO7sRn4ZkPO2PD_LJae+BhwgyDOytw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOefePCJzObfprvXHsruzO7sRn4ZkPO2PD_LJae+BhwgyDOytw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 05, 2021 at 04:55:41PM +0100, Augusto Ciuffoletti wrote:
> Hi Greg,
> 
> thank you for your reply.
> 
> The kernel version I am using is the one currently shipped with the
> latest release of Ubuntu 20.04 (LTS). They will certainly upgrade the
> kernel in the future: if you tell me that the problem does not exist
> in a successive kernel release, I will post the info and close the
> issue.

You will have to work with them, we have no clue what they put in their
kernels.

> You ask me "Where is your usb-to-serial device here?". The point is
> that nothing appears in the lsusb related to the device, although it
> is plugged in (the device receives power). Plugin/unplugging the
> device does not result in any output in syslog/dmesg. I tried to
> manually insert the driver, with no result. The device is not
> discovered at all, but it was (and worked perfectly) in the previous
> Ubuntu release (19.10), and I just guess the kernel was
> 5.3.0-64-generic. So I have no clue..., and it would be helpful to
> have a way to obtain any sort of.

That seems like the root problem here.  Work with the Ubuntu developers
to solve that please, once the device is seen then the driver can be
properly bound to the device.  Good luck!

greg k-h
