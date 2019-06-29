Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0A55A9C9
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2019 11:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbfF2JNd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jun 2019 05:13:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:38938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726818AbfF2JNd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 29 Jun 2019 05:13:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D89EB214DA;
        Sat, 29 Jun 2019 09:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561799612;
        bh=XOMpgE+blhfInx6/hwPJkv/+STLv2bw75k9vygWd6+g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AnDgmyRnhvy7/8CM1EnhUvDg55zddU8kF981dXjADTkY1DqMskBBL7gbeOJ59h1d0
         yejJWg6slbsOsXLU0JXQNC27hD2a7FIdgLVQTNg6IFyTloMY7ZmVwYEm9mo94oPy+d
         75NpL9P7Akc/SIWtbMN81TeF93IKLdN9dJOwTxIQ=
Date:   Sat, 29 Jun 2019 11:13:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yuan linyu <cugyly@163.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: message: remove memset in
 usb_get_descriptor()
Message-ID: <20190629091329.GC4198@kroah.com>
References: <20190629084011.8101-1-cugyly@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190629084011.8101-1-cugyly@163.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 29, 2019 at 04:40:11PM +0800, yuan linyu wrote:
> when below condition occur, the buf will be dirty again.
> if (result > 1 && ((u8 *)buf)[1] != type) {
> 	result = -ENODATA;
> 	continue;
> }
> so caller should check return length which indicate buffer valid or not.

I still fail to see what this means at all.

A changelog comment should explain what the problem is and why it is
being fixed in this way.

> 
> Signed-off-by: yuan linyu <cugyly@163.com>
> ---
>  drivers/usb/core/message.c | 2 --
>  1 file changed, 2 deletions(-)

Also you need to put what changed from a previous patch below the ---
line like the documentation states to do.

thanks,

greg k-h
