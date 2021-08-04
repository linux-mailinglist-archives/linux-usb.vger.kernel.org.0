Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE143DF945
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 03:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233589AbhHDBdJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 21:33:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:39434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233477AbhHDBdI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Aug 2021 21:33:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C337E60F70;
        Wed,  4 Aug 2021 01:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628040776;
        bh=cnOpy9U43tv4+w7zgHe/Je2/2FEyNFnmCD/LmWAD6o8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fMZvu229lwYKzWqcasX6nXduG6ULgztsbA5abW0kSLmWejq0vbnLB2XOeYGl3LaGr
         jht6Gm8XPvpgarfzYsoB44WQRJ4nas6yPU5XsahxwIPGb76ZlATSuqJLY5PdOMfNTx
         eQtq6b4bTbBHYTXWugi3UYOqZmDWuCf9PuHBUfdVEI+FchZcmARSXagslxedrgjJER
         uyvvcbHjRaT2PUh4MWKX2SGWrQ0/BUP295yYAzrUuJ/NayBVg5Fob3TxCnLbPYK8OW
         3da3qeCJl3KIQLYYzS5msQehkIarNg1CfDdbmkMMZV7ir5daVVjmRR5vjSEUz6S4Ew
         JRmKhP2roV8pw==
Date:   Wed, 4 Aug 2021 09:32:52 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Jeaho Hwang <jhhwang@rtst.co.kr>
Cc:     linux-usb@vger.kernel.org,
        =?utf-8?B?67OA66y06rSRKEJ5ZW9uIE1vbyBLd2FuZykv7J6Q64+Z7ZmU7JewKUF1dG9t?=
         =?utf-8?B?YXRpb24gUGxhdGZvcm3sl7DqtaztjIA=?= 
        <mkbyeon@lselectric.co.kr>, Linux team <team-linux@rtst.co.kr>
Subject: Re: Chipidea USB device goes infinite loop due to interrupt while
 hw_ep_prime
Message-ID: <20210804013252.GA16420@nchen>
References: <CAJk_X9hBB_edByfEvueSyWgKjpYGZbS2rPLPCSpRrPr+icFz_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJk_X9hBB_edByfEvueSyWgKjpYGZbS2rPLPCSpRrPr+icFz_Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-08-02 17:35:01, Jeaho Hwang wrote:
> Hi.
> 
> We found an infinite loop inside the function hw_ep_set_halt
> (drivers/usb/chipidea/udc.c) if a cablle is repeatedly
> connnected/disconnected while ping through RNDIS with chipidea USB device.
> 
> Using ftrace tracing, we found that hw_ep_set_halt is called due to error
> return of hw_ep_prime(drivers/usb/chipidea/udc.c:202) which is called from
> isr_tr_complete_handler -> isr_setup_status_phase -> _ep_queue.
> 
> The comment of function hw_ep_prime says (execute without interruption) but
> timer interrupt is occurred while hw_ep_prime is executing. We believe that
> the interrupt causes an error return of hw_ep_prime. We tried to protect
> hw_ep_prime from irqs and then no case of the infinite loop is occurred.
> 
> I want ask if it is appropriate way that turning off irq inside (threaded)
> irq handlers. And should we explicitly turn off irqs before calling
> hw_ep_prime?
> 

Jeaho, do you use RT-Linux or standard Linux? The function hw_ep_prime is
only called at udc_irq which is registered as top-half irq handlers.
Why the timer interrupt is occurred when hw_ep_prime is executing?

-- 

Thanks,
Peter Chen

