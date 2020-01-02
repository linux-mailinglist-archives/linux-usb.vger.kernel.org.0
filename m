Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB9312E5C8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 12:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgABLiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 06:38:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:47944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbgABLiZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jan 2020 06:38:25 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B14F1215A4;
        Thu,  2 Jan 2020 11:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577965105;
        bh=sIWWI745orX75bL8kLe9fH5d0HtnW8Egqf+nIYQcvrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KODXyMfVnver0UI4BplmDLOUv83FQZgHtD8xeLM/msJGoWTLrUPWsGRiykF8f6gmN
         ifblavtqPK6ufBf25omjxlzD85Ne84cGmqnnyTf6z7JMEkT+Wpeju0YM3JQ2jj3ENJ
         TRfJ8asSaoJYMuVNa9UggFIUgJjyLnTjod4e4YFk=
Date:   Thu, 2 Jan 2020 12:38:14 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.5-rc5
Message-ID: <20200102113814.GB3987146@kroah.com>
References: <20200102110149.GA17571@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200102110149.GA17571@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 02, 2020 at 12:01:49PM +0100, Johan Hovold wrote:
> The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:
> 
>   Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.5-rc5

Pulled and pushed out, thanks.

greg k-h
