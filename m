Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09EF691128
	for <lists+linux-usb@lfdr.de>; Sat, 17 Aug 2019 17:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726002AbfHQPMj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Aug 2019 11:12:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:42238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725784AbfHQPMj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 17 Aug 2019 11:12:39 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 481B12086C;
        Sat, 17 Aug 2019 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566054758;
        bh=MTAsi1UTbdAZAVgw8p1MJnhjXnfW10ETiodr6V7eTOA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BGqn7Uk8kSogHCzd7+7N4fQYitdhp/Q4j0EJo3kvKpZbT78uuD01VtNMvVgLTu9uk
         /ksah9DfGlZoH+NlEoJY8GLzQ9YyiMFqhJ4NgnvLZ643Gg7EMYeY2iJcl9UpfQA8Gn
         TaNjkvxjT0LfgZPatSVD/EBUfqNA8G/xdtrP/tw0=
Date:   Sat, 17 Aug 2019 17:12:36 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.3-rc5
Message-ID: <20190817151236.GA7125@kroah.com>
References: <20190817082207.GA11204@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190817082207.GA11204@localhost>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 17, 2019 at 10:22:07AM +0200, Johan Hovold wrote:
> The following changes since commit e21a712a9685488f5ce80495b37b9fdbe96c230d:
> 
>   Linux 5.3-rc3 (2019-08-04 18:40:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.3-rc5

Pulled and pushed out, thanks.

greg k-h
