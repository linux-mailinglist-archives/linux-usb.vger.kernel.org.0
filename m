Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9621E786A
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 10:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgE2Icu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 04:32:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgE2Icu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 04:32:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65EA82075A;
        Fri, 29 May 2020 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590741169;
        bh=ZJLL4++PLJ6X6QyAX1TeLOLZLdM7hYukZAkDTl5EesQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0GWcLyANZmq14s2b/z9gKcfy7cdoyj00nJlxAe9VIw5m719oALnXTvMrIMmeVhFgF
         HuJiz8261VnjXuVlU1Hy0Awtg1C9z7uPrKfmvUKfVmQdjv/H+BDnAc8tj2xTNtLrDW
         Iq5bZr5UEZvd6xBT5Opo3d8n/Bw3cGO3ofxxURtQ=
Date:   Fri, 29 May 2020 10:32:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.8-rc1-2
Message-ID: <20200529083239.GA935416@kroah.com>
References: <20200529073825.GA13677@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529073825.GA13677@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 29, 2020 at 09:38:25AM +0200, Johan Hovold wrote:
> Hi Greg,
> 
> Here's a second pull request for 5.8-rc1 as I wanted to avoid a back merge.
> 
> Johan
> 
> 
> 
> The following changes since commit b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce:
> 
>   Linux 5.7-rc6 (2020-05-17 16:48:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.8-rc1-2

Pulled and pushed out, thanks.

greg k-h
