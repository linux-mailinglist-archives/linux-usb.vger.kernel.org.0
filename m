Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE95C3B4260
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jun 2021 13:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231304AbhFYLUr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Jun 2021 07:20:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:42024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230020AbhFYLUq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 25 Jun 2021 07:20:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C2BD61477;
        Fri, 25 Jun 2021 11:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624619905;
        bh=dWG1GvoDepjPKlIWDGyprUtVAq5HbbJ4vQlvPebWU9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cCluLzg3zdPravk3DqI5m36aoEedfsFPXNxvm/ZYCC9k0BYvIkKBHzk1fVyJmSuFb
         28QuLna03RftAuser5A1xffM/8+KL+JEbJkOiP9WkuUY3jJ4s8tr51eWf+SiCpf3+b
         +ATwnw0WNtN/Dc9lXBeJzeuICwl91RKzrWqcpaig=
Date:   Fri, 25 Jun 2021 13:18:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Question about usb3 host code
Message-ID: <YNW7f06ebgQmQOnM@kroah.com>
References: <CAPm8-H6=X+++n8O3DLXxdLEh6RX9Qmche9ZYz5wfHb6=5aSyeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPm8-H6=X+++n8O3DLXxdLEh6RX9Qmche9ZYz5wfHb6=5aSyeA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 25, 2021 at 01:46:09PM +0300, Laurentiu-Cristian Duca wrote:
> Hello linux-usb community,
> 
>   I am new to linux-usb code and I hope that my question is not silly.
> I am interested in real-time usb.
> 
>   I know that on USB3, the gadget can initiate transactions

It can?  What do you mean by this exactly?

USB works in the "host asks a gadget if it has data" method.  The gadget
can not talk to the host unless it is asked.

thanks,

greg k-h
