Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19E93F3A6E
	for <lists+linux-usb@lfdr.de>; Sat, 21 Aug 2021 13:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbhHULqE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Aug 2021 07:46:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:33498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhHULqE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Aug 2021 07:46:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1224961163;
        Sat, 21 Aug 2021 11:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629546324;
        bh=u3hadeyvCzQXv+o/5duMn+UQiBH/zfqT8lBIQQO4++Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r5eRsIUQ4U5SzaN3YsKiNk3YKRbORmiijTMNA96y/snc7B/TuoRqvXLBGuu21jlAT
         ElLUGeuC8bvQ15gNJzqPCV6aCLgO0E4gmBKOmoGsGI+BeE4xwmBNratfKY9gF3wqqS
         QgQMzsP3kwrI4VDwxlViNnip8J/P+olFbB3FpTyo=
Date:   Sat, 21 Aug 2021 13:45:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Niklas Lantau <niklaslantau@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] Usb: Storage: usb: Changed function parameter name and
 removed braces
Message-ID: <YSDnUQtntAUhJXPr@kroah.com>
References: <20210821111605.8236-1-niklaslantau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821111605.8236-1-niklaslantau@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 21, 2021 at 01:16:05PM +0200, Niklas Lantau wrote:
> Changed parameter name from __us to much more typical data
> after suggestion by Joe Perches. Fixed minor coding style issue as well.

Do not do multiple things in the same patch, this should be multiple
patches.

thanks,

greg k-h
