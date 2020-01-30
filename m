Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8F714DFF3
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jan 2020 18:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbgA3Rd2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jan 2020 12:33:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:55782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbgA3Rd2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Jan 2020 12:33:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9518320674;
        Thu, 30 Jan 2020 17:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580405608;
        bh=N+ra1bEUhW2ptpkQnb2ytc5Hejs9/vWitPEwVDOkxGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Euu3p558F8GWcYT5Ph+SHJFr77tczdv08jx6N/XJYrRpzrzYvdIeLBMsIOLILqynM
         2xjEu5FgLmaf8S82wYAZGEuS7DuIC226fURLt/yW0zcv6XuGftD9bY6asXvUhLsQzJ
         UuGzQ8qbiwdGuCsMyRXZKj5scC0/BAVt3Tpcjz2s=
Date:   Thu, 30 Jan 2020 18:33:25 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Richard Dodd <richard.o.dodd@gmail.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Usb midi device does not work on wake
Message-ID: <20200130173325.GA1037012@kroah.com>
References: <CAAWug1d8wv3Thu0b==j6fLajU965unYKs552j+s9t13MOytmng@mail.gmail.com>
 <1578907421.2590.2.camel@suse.com>
 <CAAWug1eZiDgMGH9qDi=_Cj_=-HU2icVpNCzeaRYJLzQBChJDJA@mail.gmail.com>
 <20200130063403.GB628384@kroah.com>
 <CAAWug1erbkau-P5hdJ1F3hJBea_nmpiiOiNVJ2-HM2fZ==TS-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAWug1erbkau-P5hdJ1F3hJBea_nmpiiOiNVJ2-HM2fZ==TS-A@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 30, 2020 at 04:58:46PM +0000, Richard Dodd wrote:
> Hi Greg
> 
> Hopefully I followed the correct instructions. I have attached the patch.

Attachments do not work, just send it as-is.  Look at lots of examples
on this mailing list for how to do that.

that being said, it does look good so far...

thanks,

greg k-h
