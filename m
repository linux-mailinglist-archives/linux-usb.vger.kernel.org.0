Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC683BE2DD
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 07:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhGGGBm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 02:01:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230157AbhGGGBm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Jul 2021 02:01:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8D0261C6D;
        Wed,  7 Jul 2021 05:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625637542;
        bh=zd1hhHJnMY/hQCNqiVFCS8DAEhQ67Jwm+d6XDgoDt9k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zqFCBYKbB5Jt5SPA+AA6vYzteH59HehSL19Czs4JIoZlmMaQetWNGAHyMKV9/Z3V1
         uKaKlh2grJwEieSNqbMVlMni0oIiPXx2wRJZ5LLIVDO+sZESAEW8xhjJfyMIvN0nYA
         8n+nmd1etr3p3qqfum5XIbWDjihIQ45nXxyPPE10=
Date:   Wed, 7 Jul 2021 07:58:57 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     "Zhang, Qiang" <Qiang.Zhang@windriver.com>
Cc:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "dvyukov@google.com" <dvyukov@google.com>,
        "dpenkler@gmail.com" <dpenkler@gmail.com>,
        "guido.kiener@rohde-schwarz.com" <guido.kiener@rohde-schwarz.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: usbtmc: Fix RCU stall warning
Message-ID: <YOVCoWorSPbWtC9x@kroah.com>
References: <20210629033236.7107-1-qiang.zhang@windriver.com>
 <BL1PR11MB5478A82D5B2B558FAFF4B50FFF1A9@BL1PR11MB5478.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL1PR11MB5478A82D5B2B558FAFF4B50FFF1A9@BL1PR11MB5478.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 07, 2021 at 01:29:12AM +0000, Zhang, Qiang wrote:
> 
> 
> ________________________________________
> From: Zhang, Qiang <qiang.zhang@windriver.com>
> Sent: Tuesday, 29 June 2021 11:32
> To: gregkh@linuxfoundation.org; stern@rowland.harvard.edu; dvyukov@google.com
> Cc: paulmck@kernel.org; dpenkler@gmail.com; guido.kiener@rohde-schwarz.com; linux-usb@vger.kernel.org
> 
> Hello Greg KH
> 
> Have you reviewed this change? 

Nope!

You should have got a copy of my "it's the merge window, relax!"
response from my bot, for this patch.  If not, here it is below:

-----------------

Hi,

This is the friendly semi-automated patch-bot of Greg Kroah-Hartman.
You have sent him a patch that has triggered this response.

Right now, the development tree you have sent a patch for is "closed"
due to the timing of the merge window.  Don't worry, the patch(es) you
have sent are not lost, and will be looked at after the merge window is
over (after the -rc1 kernel is released by Linus).

So thank you for your patience and your patches will be reviewed at this
later time, you do not have to do anything further, this is just a short
note to let you know the patch status and so you don't worry they didn't
make it through.

thanks,

greg k-h's patch email bot
