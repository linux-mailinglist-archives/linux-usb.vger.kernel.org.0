Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA618439A64
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 17:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233549AbhJYP2O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 11:28:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:54872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233940AbhJYP2N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Oct 2021 11:28:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2540060F92;
        Mon, 25 Oct 2021 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635175551;
        bh=SXIq5sCCBTC9J5LM4nG3ygKFJE3Wnrd+/dlaTmrUC1s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qqIj/qvrn73vBC1m/DrtasnHvUGo3brcnKIbgZB4L9MmBmCewI29b9ncrs8+2Myr9
         R5tbBovhDIRfjhnhUC7AnIyH/FwiqeQ3LFgWg2MdkZy2JBLdH9UUcvxwXPFxBPI1Rw
         aqcy2oN3jQUHXlZOaKZFcqPE9O12FJRxNKvMhoIg=
Date:   Mon, 25 Oct 2021 17:25:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-usb@vger.kernel.org, John Keeping <john@metanate.com>
Subject: Re: [PATCH] usb: remove res2 argument from gadget code completions
Message-ID: <YXbMfVpXdMwfsSU3@kroah.com>
References: <f026d10f-d659-b180-92fb-c5c087bcefd9@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f026d10f-d659-b180-92fb-c5c087bcefd9@kernel.dk>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 25, 2021 at 09:23:58AM -0600, Jens Axboe wrote:
> The USB gadget code is the only code that every tried to utilize the
> 2nd argument of the aio completions, but there are strong suspicions
> that it was never actually used by anything on the userspace side.
> 
> Out of the 3 cases that touch it, two of them just pass in the same
> as res, and the last one passes in error/transfer in res like any
> other normal use case.
> 
> Remove the 2nd argument, pass 0 like the rest of the in-kernel users
> of kiocb based IO.
> 
> Link: https://lore.kernel.org/linux-block/20211021174021.273c82b1.john@metanate.com/
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> ---
> 
> Greg/John - if you guys are fine with this patch, let me know. I've got
> the ->ki_complete() argument removal sitting on top of this.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
