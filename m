Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3FAD8ECB3
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 15:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732225AbfHONX7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 09:23:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:56970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730497AbfHONX6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 09:23:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3AAF2084D;
        Thu, 15 Aug 2019 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565875438;
        bh=PfwTzVCSXr21dQ1ordez0gev34AC45wWlAybBgaGBsE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EHJND28g6rME3qs2Q21unyp3Xy6nkSOiAXJR4Iw2eTD+eAyW4Jv6/PJioVx7vE0zu
         q+0yVVe/4S1C59OV2tvND93whR91u8cK5Tc3/3B6JsokvofQ/6+bHBHALZscMLyUgi
         fxfi2hZngnAiEkhUDwn/UAeJ2jFcVicKbgGU+KQw=
Date:   Thu, 15 Aug 2019 15:23:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Suwan Kim <suwan.kim027@gmail.com>, shuah@kernel.org,
        valentina.manea.m@gmail.com, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] usbip: Implement SG support
Message-ID: <20190815132356.GB27208@kroah.com>
References: <20190808155435.10050-1-suwan.kim027@gmail.com>
 <20190814131951.GA1437@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190814131951.GA1437@infradead.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 14, 2019 at 06:19:51AM -0700, Christoph Hellwig wrote:
> FYI, I think my
> 
>    "usb: add a HCD_DMA flag instead of guestimating DMA capabilities"
> 
> is the proper core fix for what your patch 1 works around, as the USB
> core should not assume DMA capabilities based on the presence of a DMA
> mask.

I agree.  Let's wait for Christoph's series to be applied before taking
this one.

thanks,

greg k-h
