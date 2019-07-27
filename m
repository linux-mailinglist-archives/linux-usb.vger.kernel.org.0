Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA1777855
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2019 13:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfG0K77 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jul 2019 06:59:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfG0K77 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Jul 2019 06:59:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2EF22075C;
        Sat, 27 Jul 2019 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564225198;
        bh=IczMnOlI22Brp9IXY+6/8xUU6PD5dLW0jmVcXdF9HWo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BJtmLZogP2fzDxNQaNDZqiKmBmPrAsiYnAzgJ14VOICThJQMexLqh7psOb3jnHU/9
         zQFReXmYXhqJACazvLKqWLq8MVmSwMsqRHnhE2Guc7++U+DMG5xwPu3Tc4oAvvXhFI
         qa4Iyt4orBxkXIKoe3kXcVumB30z67Wk8NxApFIA=
Date:   Sat, 27 Jul 2019 12:59:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bob Gleitsmann <rjgleits@bellsouth.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Oops in xhci_endpoint_reset
Message-ID: <20190727105955.GE458@kroah.com>
References: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a24f7305-abcc-c2ff-bba0-a02b23e34434@bellsouth.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 26, 2019 at 11:15:46PM -0400, Bob Gleitsmann wrote:
> Hello,
> 
> 
> I have seen kernel oopses on waking from suspend to memory. I got this
> twice, one dmesg with backtrace attached. The other one had the failure
> in the same place in the code.
> 
> 
> This is kernel 5.3.0-rc1, patched for another problem in ethernet PHY
> driver. Have not had the problem with earlier kernels. Using Gentoo
> linux, amd64, but git kernel.

Any chance you can run 'git bisect' to track down the offending commit?

thanks,

greg k-h
