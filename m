Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D34FD81FF0
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 17:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbfHEPRQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 11:17:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:39238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728468AbfHEPRQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 5 Aug 2019 11:17:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6256F216F4;
        Mon,  5 Aug 2019 15:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565018235;
        bh=x10plgI7L0b67A1k2vgybhQdDfioCS+r/a9+H4Zcftk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uVtd7O8Yh7gmgrzaZiZTH1TZ/7VIb9NMu71+EnqCeO8Znhq4zHb+pwNplgT1u39uR
         B+asBF8sXj5keDWeEUuChAjzXbhd5nlfLaQY3UqP4vGokJJ5rR89JSeX02o+vQRmKP
         bS6PTFyE8Va1ubvPY509Nvo+B+6nfQ2N+rDrRwqo=
Date:   Mon, 5 Aug 2019 17:17:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Gavin Li <gavinli@thegavinli.com>
Cc:     linux-usb@vger.kernel.org, Gavin Li <git@thegavinli.com>
Subject: Re: [PATCH] usb: devio: fix mmap() on non-coherent DMA architectures
Message-ID: <20190805151713.GA7067@kroah.com>
References: <20190801220436.3871-1-gavinli@thegavinli.com>
 <20190802121416.GA20689@kroah.com>
 <CA+GxvY7LswVFZvk0mLRLgUqdo=Gb0pQ1KMsgmWbiFEPvMvquXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+GxvY7LswVFZvk0mLRLgUqdo=Gb0pQ1KMsgmWbiFEPvMvquXQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 02, 2019 at 10:57:00AM -0700, Gavin Li wrote:
> usbfs mmap() looks like it was introduced for 4.6 in commit
> f7d34b445abc, so it should probably be backported to 4.9 and onwards.
> This issue has been present since the introduction of the feature.
> 
> One sidenote: this patch will cause the following warning on x86 due
> to dmap_mmap_coherent() trying to map normal memory in as uncached:
> 
> x86/PAT: ... map pfn RAM range req uncached-minus for [mem
> 0x77b000000-0x77b210fff], got write-back
> 
> This warning is harmless, as x86 is DMA coherent and the memory gets
> correctly mapped in as write-back. I will submit a patch to the DMA
> mapping team to eliminate this warning.

Let me know what the git commit id of that patch is, I will wait for it
to hit the tree before adding this one.

thanks,

greg k-h
