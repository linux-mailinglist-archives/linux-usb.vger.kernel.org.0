Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F8C59BAE
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 14:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfF1MjS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 08:39:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:43512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbfF1MjS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Jun 2019 08:39:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EFC2020644;
        Fri, 28 Jun 2019 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561725557;
        bh=UuPxt98eZQObmBQFNzE2EmPUfCA9DlG05HFeeCRn4Gk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vHC6IDKBkE+D7WIAAoCMrjBMKICFhokUj+SQTF8mxiZNnJAd9bTBOmZ1Y1n160JPX
         L+DXlZcum6mdoWOdvy8VLilPZs3vYZdA60ZO5HvTXjK+bvT+FEtobXlByev2GPtc3y
         UF/Jyjv0/mJIjlEG1fHDx1eiVsiJbXyoCJyPn7lc=
Date:   Fri, 28 Jun 2019 14:39:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bauke Jan Douma <bjdouma@xs4all.nl>
Cc:     linux-usb@vger.kernel.org
Subject: Re: HDD's attached via USB3 ports not automatically seen by kernel
Message-ID: <20190628123915.GA25468@kroah.com>
References: <0a7055a3-1664-0099-09cf-c4c0fdbd205d@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a7055a3-1664-0099-09cf-c4c0fdbd205d@xs4all.nl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 27, 2019 at 09:15:46PM +0200, Bauke Jan Douma wrote:
> Kernel: Linux 4.15.0-52-generic #56~16.04.1-Ubuntu SMP Thu Jun 6 12:03:31 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

That's a very old kernel release, have you tried getting support from
Canonical for this?  We have no idea what is in their kernel tree :(

If you can duplicate this on the latest kernel.org release (5.1), we
will be glad to help you out.

thanks,

greg k-h
