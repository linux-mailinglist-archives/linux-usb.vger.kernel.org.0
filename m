Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3E14E10F
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2019 09:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbfFUHQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jun 2019 03:16:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:44716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbfFUHQ7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jun 2019 03:16:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 290DF206E0;
        Fri, 21 Jun 2019 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561101418;
        bh=XSh7O6uMARCWeP2ZP3fy2u27p6zOxwD7t2ypCeLhmO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2M37qOv5j8DkAHwJ68fWb0m/ErFRiuek3MB9nmD0WMHb/fVxii/49tkChL3852Bmm
         l9aOf8Dq1ZXF+IpZ3qudmN0FFZK9xf1Rc8xZjYET9bzl/pu7/mbbm6TgKkq6ho6NV9
         Uw4qC1OzCtsgTIriMD+vhLNzVDvlnk1X0DgSV/Ik=
Date:   Fri, 21 Jun 2019 09:16:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dmg@turingmachine.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: clean up some of the computations in adu_read
Message-ID: <20190621071655.GA20682@kroah.com>
References: <20190621065921.5199-1-dmg@turingmachine.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190621065921.5199-1-dmg@turingmachine.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 20, 2019 at 11:59:21PM -0700, dmg@turingmachine.org wrote:
> From: Daniel M German <dmg@turingmachine.org>
> 
> Replace ?: with min to calculate the number of bytes in the secondary buffer,
> including changing the data type of data_in_secondary to size_t to be
> type-consistent. data_in_secondary can never be negative.
> 
> Remove some spurious calculations (copy_to_user returns zero on success),
> making one variable redundant (i)
> 
> This change does not alter the functionality of the code.
> 
> Signed-off-by: Daniel M German <dmg@turingmachine.org>
> ---
>  drivers/usb/misc/adutux.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)

When sending a new version of a patch, you need to version it.  The
documentation says how to do this, but basically you need a "v2" in the
subject line ([PATCH v2]) and then below the --- line, you need to say
what has changed from the previous version.

Can you resend a v3 of this patch that has all of that in it?

thanks,

greg k-h
