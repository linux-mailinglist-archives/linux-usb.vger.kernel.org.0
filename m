Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275DB3C351B
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 17:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbhGJPVe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Jul 2021 11:21:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229805AbhGJPVe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 10 Jul 2021 11:21:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8FA161375;
        Sat, 10 Jul 2021 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625930328;
        bh=nJPwyVJ3lAHvbthDtywQ99rTjgG//SJIjBPQxxMyNXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V5VtizupZe0sR8c5u9Ca1BrLnhthForkyWo/a0DJr4/zxXC5OLXLboX6pTNRH+KCP
         HiA66U997XDit9sohC/9O7cgMQ5estI8NLt52GUsM3BhrGP9fmPr+/QY86LVM0L/Ls
         5sAxOFF1KwFV5rymuOy5Pva7yBgKFFmSNBrCoxxE=
Date:   Sat, 10 Jul 2021 17:18:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 1/4] usb: audio-v2: add ability to define feature unit
 descriptor
Message-ID: <YOm6VfwSap9sVO80@kroah.com>
References: <bab16136-a57c-e7ed-0261-c44e76923c82@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bab16136-a57c-e7ed-0261-c44e76923c82@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 10, 2021 at 02:53:20PM +0200, Pavel Hofman wrote:
> 
> Similar to UAC1 spec, UAC2 feature unit descriptor
> has variable size.
> 
> Current audio-v2 feature unit descriptor structure
> is used for parsing descriptors, but can't be used
> to define your own descriptor.
> 
> Add a new macro similar to what audio v1 already has.
> 
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> ---
>  include/linux/usb/audio-v2.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

Who wrote this Ruslan or you?  If Ruslan, you need to put a "From:" line
as the first line of the changelog text, and you also need to sign off
on this, as the patch is coming through you.

Same for the other 4 patches.

Also, they were not "linked" together at all, can you use 'git
send-email' to send them so that they are correctly associated with each
other so our tools will work easier on them?

thanks,

greg k-h
