Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01A4011A58C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 09:05:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbfLKIFc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 03:05:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:57926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727888AbfLKIFb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Dec 2019 03:05:31 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DCAD32173E;
        Wed, 11 Dec 2019 08:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576051530;
        bh=AMnoX13xVNW0fUzKQGq+6HkKWy3KtQ40JIAtFqo6fZA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2UljQsii1euNIfz7u+AhAK2XoRmWmahZ23UwnIKaN2eghB18ODi2RMgqd2e27lU+o
         JGOPEPdbBal3GmoYfp13RUt50LlmDYEmYWOB8xE6lpbipZpSXcTJ/cVUJBNgBhw10w
         VFSrloaKWXxTVYGfwrih0BLiLHGmHHd9IAav2uaI=
Date:   Wed, 11 Dec 2019 09:05:28 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bin Liu <b-liu@ti.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: musb: sunxi: propagate devicetree node to glue
 pdev
Message-ID: <20191211080528.GA415633@kroah.com>
References: <20191210165454.13772-1-b-liu@ti.com>
 <20191210165454.13772-2-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210165454.13772-2-b-liu@ti.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 10:54:53AM -0600, Bin Liu wrote:
> From: Mans Rullgard <mans@mansr.com>
> 
> In order for devicetree nodes to be correctly associated with attached
> devices, the controller node needs to be propagated to the glue device.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> Signed-off-by: Bin Liu <b-liu@ti.com>
> ---
>  drivers/usb/musb/sunxi.c | 2 ++
>  1 file changed, 2 insertions(+)

Does this need to go to stable kernel(s)?  If so, what commit does this
fix fix?

thanks,

greg k-h
