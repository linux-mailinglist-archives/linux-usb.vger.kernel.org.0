Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5B829DD1D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 01:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731919AbgJ1WT1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 18:19:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731705AbgJ1WRm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:42 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8D7BB24687;
        Wed, 28 Oct 2020 09:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603877831;
        bh=RL+G1e2TWLsTczGXtC6txTiEvdUX/DJE5O1+QMyOLCM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tp4nXFATigdHu/Apxfzw+Da8PhRNZulugG1SQ/fXzSLZALWjjVKH7rB7cpE8Ci6v3
         tqfgr8TeOW/Bvz58gEu4ymAbpX4y9ChXDLm6fHPCXdxCr7TJJGafOfysEmq6tkoMyc
         cxrmmdIJnwW/uMrJcSE7vPlYuGWLrNIau8LTna7g=
Date:   Wed, 28 Oct 2020 10:38:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: remove write wait queue
Message-ID: <20201028093803.GA1953863@kroah.com>
References: <20201026104421.29680-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026104421.29680-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 26, 2020 at 11:44:21AM +0100, Johan Hovold wrote:
> The digi_acceleport driver is the only driver still using the port
> write wake queue so move it to that driver's port data.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/digi_acceleport.c | 12 ++++++------
>  include/linux/usb/serial.h           |  2 --
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
