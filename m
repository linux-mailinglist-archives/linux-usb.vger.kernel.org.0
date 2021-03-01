Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8366327AB2
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 10:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233883AbhCAJ06 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 04:26:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:44124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233844AbhCAJ0z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 04:26:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF75B64E40;
        Mon,  1 Mar 2021 09:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614590772;
        bh=t2rPw5p0VPwZA8X8TeF+do9ilRi6+KfeveO328khngA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PuCw7nD9IRmUQo2IBcEYyBMpAa/OvBCJR0ZDLuttMLBq+cq3BbTIYSGkN3wKgzEIw
         LXya1eJJUzJutZyTqMqYIrSqkHIIPW+0NSiRsYdnwrGr3B47xjVcQCYzDvoFF9lq+K
         Kw7qjBBDI1YiSUR9tGj/8zbSXGXFrZFeJMO7OCaDgEAqbQLM5rYl93wvzBv5YVbdEI
         pO/ThGO6YJ3xWFH8Js5aLv+8YmC+/GtaX/U2ky4Jfai3YGtQcb/xqjoIBCwRZIeaOL
         wFu63uH4twDHUoohYwhTjWgoDpbbItKH+xhujtZUuf0Mvar91890Y+eHEmmJVE0+Ym
         m+ccr//6l3wUQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lGeov-00086U-NB; Mon, 01 Mar 2021 10:26:29 +0100
Date:   Mon, 1 Mar 2021 10:26:29 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Niv Sardi <xaiki@evilgiggle.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH fixed 1/1] USB: serial: ch341: add new Product ID
Message-ID: <YDyzRaMYarsHqDjJ@hovoldconsulting.com>
References: <20210226183836.20840-1-xaiki@evilgiggle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226183836.20840-1-xaiki@evilgiggle.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 26, 2021 at 03:38:36PM -0300, Niv Sardi wrote:
> Add PID for CH340 that's found on cheap programers. They are sometimes refered to as ANU232MI like in this one:
> https://www.nordfield.com/downloads/anu232mi/ANU232MI-datasheet.pdf

That datasheet clearly states that it uses a PL2303 which is a
different chip.

Sure, the id looks like they could be for a CH341, but please clear up
this apparent confusion (i.e. explain it).

And include the output of 'lsusb -v' for reference.

> The driver works flawlessly as soon as the new PID (0x9986) is added to it.
> 
> Signed-off-by: Niv Sardi <xaiki@evilgiggle.com>
> ---

Please get into the custom of running scripts/checkpatch.pl on your
patches before submission, which would have let you know about some
spelling errors and unbroken lines.

And add a patch revision to your subject prefix (e.g. PATCH v2) when
resending and include a short changelog here so we know what changes
since previous versions.

Johan
