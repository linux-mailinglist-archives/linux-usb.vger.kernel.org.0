Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B84D2B4713
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 07:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392406AbfIQFu0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 01:50:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:52324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726511AbfIQFu0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Sep 2019 01:50:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F0D421670;
        Tue, 17 Sep 2019 05:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568699425;
        bh=W2kB/lg80lgo9it4mHI/8/GQOuv/jfcSkDMn0IxfL58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z4/THe+GBb8wPfe0K6ULuWzlnotYVXpUQShQnSlPPPKiCIA+3Fk65BeFnXvaEfqOQ
         yiYv6o59tj1/NsmZbP50DOAwQNe09DifPU8g7JyBhe3lZyz2cCdnruu2QrJKNpvRde
         SYRkKtDq7VZcseQrd9vV8HVPXAT9y3Q7oigt07Es=
Date:   Tue, 17 Sep 2019 07:50:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Liu, Changcheng" <changcheng.liu@intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: patch "usbip: tools: fix GCC8 warning for strncpy" added to
 usb-next
Message-ID: <20190917055023.GC2058532@kroah.com>
References: <156412454492134@kroah.com>
 <20190917011315.GA26753@jerryopenix>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917011315.GA26753@jerryopenix>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Tue, Sep 17, 2019 at 09:13:15AM +0800, Liu, Changcheng wrote:
> Hi Greg,
>    Do we have plan to merge this patch into 5.3 Release?
>    I hit the build problem(warning turns to be error under -Werror) when
>    building 5.3 version.

This will be submitted for 5.4-rc1.  If this is needed in 5.3, please
ask stable@vger.kernel.org to backport it once it is in Linus's tree.

But we do not build the kernel with -Werror, so this should not be a
"real" problem for you.

thanks,

greg k-h
