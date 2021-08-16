Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E44DB3ECE00
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 07:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229884AbhHPFXQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 01:23:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233115AbhHPFXG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Aug 2021 01:23:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8678E619E9;
        Mon, 16 Aug 2021 05:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629091356;
        bh=6FzS5PHj/dDsy3SCtKy/nw+J3SwbX4LkNhJ/y8QTifc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SWGgIxgu4+YZsNMZ61yiu7G8yh1hykNhXe0Jm4jxjXgifLnoQRIxLhIHQAfzRJicJ
         wsAr8cfd6KbLHVx2suEfipTODkv/1QFYouVfO1eHV7nTE/KrDKzzbHrbhveYVn5fLa
         gmz6r2uzRNtaPybNws65EuI/uL0xuxnT4Fzj6svk=
Date:   Mon, 16 Aug 2021 07:22:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Jeaho Hwang <jhhwang@rtst.co.kr>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: fix RT issue for udc
Message-ID: <YRn2GPsT8vB/NF/p@kroah.com>
References: <20210810060228.GA3326442@ubuntu>
 <20210816005205.GA3907@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816005205.GA3907@nchen>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 16, 2021 at 08:52:06AM +0800, Peter Chen wrote:
> On 21-08-10 15:02:28, Jeaho Hwang wrote:
> > hw_ep_prime sometimes fails if irq occurs while it rus on RT kernel.
> > to prevent local_irq_save should keep the function from irqs.
> > 
> > I am not sure where is the best to submit this patch, between RT and USB
> > community so sending to both. thanks.
> 
> Greg, do you have any suggestions about it, the RT kernel schedules the interrupt
> handler (top-half) out which causes the USB hardware atomic sequences are broken,
> these hardware operations needs to be executed within limited time.

Try working with the RT developers on this.
