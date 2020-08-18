Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FAA324813E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 11:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgHRJAO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 05:00:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgHRJAN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 05:00:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E2340206B5;
        Tue, 18 Aug 2020 09:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597741213;
        bh=w0uS8lCSXw9i3DVY2m32zE3smokZOsLfrE8KA5HTXwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M7TG/5g3xmjeebB+k1Z8VW2bidicKNj/dmZEdqGI35E/okUuHSW2XzkZxWcj1RAlU
         zcg2yXx+aU5YO272TImrdwOGVqLOdZO4BolaNuF1DA4G2GUXiTk3SjV7McYL4sBjHg
         bL0akdi8Nd9Wt59keL9XOZ1sgLbcPJdpISamZvQY=
Date:   Tue, 18 Aug 2020 11:00:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 1/3] USB: Also check for ->match
Message-ID: <20200818090037.GC28036@kroah.com>
References: <20200804113834.6409-1-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804113834.6409-1-hadess@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 04, 2020 at 01:38:32PM +0200, Bastien Nocera wrote:
> We only ever used the ID table matching before, but we should probably
> also support an open-coded match function.
> 
> Fixes: 88b7381a939de ("USB: Select better matching USB drivers when available")
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

The subject line does not make sense, what is "also"?  Who is doing
this?

Coming back to this after a week I have no idea what is going on, so
that's a sign that it needs to be reworded :(

thanks,

greg k-h
