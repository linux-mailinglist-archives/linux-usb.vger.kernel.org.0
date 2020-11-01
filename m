Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE472A1C71
	for <lists+linux-usb@lfdr.de>; Sun,  1 Nov 2020 07:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgKAGgh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Nov 2020 01:36:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:52572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgKAGgh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 1 Nov 2020 01:36:37 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0883217A0;
        Sun,  1 Nov 2020 06:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604212597;
        bh=Xy3tt/sGn9zY8TuoMq9k9vnDYSzO7OCdTUOuIu1/jf0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ofg8RJ3LTnk5QhWyFOCahVj1g71NvZOxpwWSeQ4xiOVVOotTOdUljp2pDUscI8EaM
         Pfrg70G/T70cyaeHvMr1xMPuYHmWxgz50vCguECxvv9hKke6a/Hjc16YrAfONcQZxa
         mWURWCK9RdcicBX1I7xyloZHlYQaAxLmF9NS2E9w=
Date:   Sun, 1 Nov 2020 07:36:32 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     lee.jones@linaro.org, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: core: ledtrig-usbport: use octal permission
Message-ID: <20201101063632.GA432136@kroah.com>
References: <20201031171930.GA21555@fedora-project>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031171930.GA21555@fedora-project>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 31, 2020 at 01:19:30PM -0400, Nigel Christian wrote:
> Change read/write for owner permission from symbolic to octal
> to enhance readability. This patch reduces checkpatch warnings 
> for this file to nil.
> 
> see: https://lkml.org/lkml/2016/8/2/1945

Please use lore.kernel.org links for mailing list stuff.

thanks,

greg k-h
