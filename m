Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7792C200281
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 09:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729861AbgFSHG6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 03:06:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:50964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729009AbgFSHG6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Jun 2020 03:06:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B5D12078D;
        Fri, 19 Jun 2020 07:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592550417;
        bh=pVty2jeHZoPEZeh8MZKsDs96fn8MpGOxePVxvUrxRCg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R8XAEWK7k/ppVs132gwiDBz1MR31Be4QwtfQSSIVvFB561rz1kdapDn3jOQyXzyrp
         EtFjmjErQGlgPc7MuXDmsMD0QJUW+nW/r8Z0VwLcue4r2o/A7XZWssKzzwR9vBKVmT
         OxH4e7iMbGr4lYTqg3vn79yS+krvp5MAfM+D4sWg=
Date:   Fri, 19 Jun 2020 09:00:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Changming Liu <charley.ashbringer@gmail.com>
Cc:     linux-usb@vger.kernel.org, thomas@winischhofer.net,
        Changming Liu <liu.changm@northeastern.edu>
Subject: Re: [PATCH 0/4] USB: sisusbvga: series of changes char to u8
Message-ID: <20200619070053.GA543232@kroah.com>
References: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 18, 2020 at 08:28:50PM -0400, Changming Liu wrote:
> This patch series changes all appropriate instances
> of signed char arrays or buffer to unsigned char.
> 
> For each patch, if changing one variable to u8
> involves its callers/callees, then those changes
> are included in that patch as well.
> 
> This doesn't apply to ioctl functions, since 
> the types for buffer of ioctl-like functions
> needs to be char* instead of u8* to keep
> the compiler happy.

Why is that?  What is forcing those types to be that way?  These are all
self-contained in the driver itself, so they should be able to be
changed, right?

Do you have an example of a function that you want to change but somehow
can not?

thanks,

greg k-h
