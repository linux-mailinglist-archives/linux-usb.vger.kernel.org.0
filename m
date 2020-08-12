Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F147242539
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 08:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgHLGO4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 02:14:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:60302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgHLGOy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 02:14:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DF3282076B;
        Wed, 12 Aug 2020 06:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597212894;
        bh=ErFhcoAMYuhrxLnnsYCXvg41ccul4mRcTS9Bau1CWn4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R1emLfLNRL8X1K/ZKnwMIcNMefIefP2YxvjsYSDXxSk3g6qH5Bd5DBxDWeXEMG50l
         jESho6xB+C4EyNDE0skCUQ1nD4Pm9HQmS/fl/dX3q66yBFv4jMp5K9qmT231ZfPEnq
         FoYlLLKrP0PCD5v6qRCWKm57QCktWqwf/UfKETg8=
Date:   Wed, 12 Aug 2020 08:14:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Patrik Nilsson <nipatriknilsson@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
Message-ID: <20200812061451.GE1299081@kroah.com>
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
 <20200811193150.GA344152@rowland.harvard.edu>
 <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 11, 2020 at 11:14:09PM +0200, Patrik Nilsson wrote:
> 
> On 11/08/2020 21:31, Alan Stern wrote:
> > On Tue, Aug 11, 2020 at 08:34:53PM +0200, Patrik Nilsson wrote:
> > > Hi Greg,
> > > > Can you provide kernel logs?  Odds are the disk disconnects itself as it
> > > > takes too much power or something.
> > > udev-kernel logs can be found:
> > > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1886172
> > The bug report doesn't seem to contain any dmesg kernel logs showing
> > what happens when the problem occurs.
> I'm compiling the latest kernel to supply the kernel logs when done testing.
> It takes a while.

'make localmodconfig' is your friend.  Should make a kernel that builds
in 5-10 minutes at most depending on your system.

thanks,

greg k-h
