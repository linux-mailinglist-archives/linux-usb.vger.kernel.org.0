Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C16B1130AD
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 18:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728171AbfLDRUp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 12:20:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:57528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726934AbfLDRUp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Dec 2019 12:20:45 -0500
Received: from localhost (unknown [217.68.49.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 151AE2073B;
        Wed,  4 Dec 2019 17:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575480044;
        bh=iyZ31RokaK9HqqTas5TQ6lejfCHAxfMdVNWvMvM3gBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I5ixV79zgSpbVPSPudnWPUjOCx+UOm+86UA9236pLcnn6/ZY7DC0xB7rOEbMuarQc
         PekbEPUsX0kQR1Ch49FnH7uc8T9a5+q8v4p36C59Zj2sH6tJICPJWV3N6+tCaOHqa+
         NeiDE/gAoi8TziYReOit3m/hnd+68q7PA0UJvMgw=
Date:   Wed, 4 Dec 2019 18:20:42 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: make usb_interrupt_msg() a static inline
Message-ID: <20191204172042.GE3627415@kroah.com>
References: <20191204143035.31751-1-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204143035.31751-1-info@metux.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 04, 2019 at 03:30:35PM +0100, Enrico Weigelt, metux IT consult wrote:
> usb_interrupt_msg() effectively is just an alias for usb_bulk_msg(),
> no need for being an real function, thus converting it to an
> inline function.

Why?  What did you just save/help with here?

This actually made the code worse:

>  /**
> - * usb_interrupt_msg - Builds an interrupt urb, sends it off and waits for completion
> - * @usb_dev: pointer to the usb device to send the message to
> - * @pipe: endpoint "pipe" to send the message to
> - * @data: pointer to the data to send
> - * @len: length in bytes of the data to send
> - * @actual_length: pointer to a location to put the actual length transferred
> - *	in bytes
> - * @timeout: time in msecs to wait for the message to complete before
> - *	timing out (if 0 the wait is forever)
> - *
> - * Context: !in_interrupt ()
> - *
> - * This function sends a simple interrupt message to a specified endpoint and
> - * waits for the message to complete, or timeout.
> - *
> - * Don't use this function from within an interrupt context. If you need
> - * an asynchronous message, or need to send a message from within interrupt
> - * context, use usb_submit_urb() If a thread in your driver uses this call,
> - * make sure your disconnect() method can wait for it to complete. Since you
> - * don't have a handle on the URB used, you can't cancel the request.
> - *
> - * Return:
> - * If successful, 0. Otherwise a negative error number. The number of actual
> - * bytes transferred will be stored in the @actual_length parameter.
> - */
> -int usb_interrupt_msg(struct usb_device *usb_dev, unsigned int pipe,
> -		      void *data, int len, int *actual_length, int timeout)
> -{
> -	return usb_bulk_msg(usb_dev, pipe, data, len, actual_length, timeout);
> -}
> -EXPORT_SYMBOL_GPL(usb_interrupt_msg);

You now lost all of that wonderful documentation on how to use this
function, makeing the kernel harder to use instead of easier.

So this is a net-loss overall, ick, why???

greg k-h
