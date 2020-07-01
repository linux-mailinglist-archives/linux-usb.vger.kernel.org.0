Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63164210AAD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 14:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730491AbgGAMAl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 08:00:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:48038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730466AbgGAMAl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 08:00:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F1702067D;
        Wed,  1 Jul 2020 12:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593604841;
        bh=NG13c3uQXSir/eAaKL7wwEMGpJHpwyZCGaQheAVZGsc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IcGEsEOF/f84Oj5l0bBQIO6XojwamMD6nM/eF4R0TqbuPJKqySNuz2n4ZSHjdM2ot
         Xl/MivwyW2kv+qBKUFxpHEuH/1Pzd7j9NkgotQXCo2QaaVLTHycsafT13C1ZfZ6tio
         sOQ0C/HcSARtVCcTDIqH1OaglRiKgNaotKRyZioc=
Date:   Wed, 1 Jul 2020 14:00:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     qiang.zhang@windriver.com
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: function: printer: Interface is disabled
 and returns error
Message-ID: <20200701120027.GB2184169@kroah.com>
References: <20200630054407.33165-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200630054407.33165-1-qiang.zhang@windriver.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 30, 2020 at 01:44:07PM +0800, qiang.zhang@windriver.com wrote:
> From: Zqiang <qiang.zhang@windriver.com>
> 
> After the device is disconnected from the host side, the interface of
> the device is reset. If the userspace operates the device again,
> an error code should be returned.
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>

When did Felipe ack this?  I missed that, do you have a pointer to that
on lore.kernel.org somewhere?

> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  drivers/usb/gadget/function/f_printer.c | 36 +++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)

What changed from v1?  That always goes below the --- line.

thanks,

greg k-h
