Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5522E3FAC
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 15:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502185AbgL1OnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 09:43:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:46800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2502252AbgL1OnB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Dec 2020 09:43:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FB4D20715;
        Mon, 28 Dec 2020 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609166541;
        bh=c271oTiYg2uwOY8EyI856TeAGbtlRbxssE+37OQ3U5U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DYgEE5Hu7snUL/lt/JZS2EqLe+Ntjr7y7B/AWsiyfRzKOcDbCPSlxP6PBt8Cafd9N
         1+3Oewz3zPaYeAkW/Z0Lt5llbdm6Qcl57PLiV+3acFroEbMlPCz21SZHywlCudF5g4
         sIYIfM4kebakYq/ww4wIy0D9SNixacpomgz739t8=
Date:   Mon, 28 Dec 2020 15:43:42 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     peter.chen@nxp.com, linux-usb@vger.kernel.org, kurahul@cadence.com,
        dan.carpenter@oracle.com
Subject: Re: [PATCH] usb: cdnsp: fix error handling in cdnsp_mem_init()
Message-ID: <X+nvHj8gXnji8SuP@kroah.com>
References: <20201211095053.1948-1-pawell@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211095053.1948-1-pawell@cadence.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 11, 2020 at 10:50:53AM +0100, Pawel Laszczak wrote:
> This function uses "One Function Cleans up Everything" style and that's
> basically impossible to do correctly. It's cleaner to write it with
> "clean up the most recent allocation".
> 
> Patch fixes two isues:
> 1. If pdev->dcbaa = dma_alloc_coherent() fails then that leads to a NULL
>    dereference inside the cdnsp_free_priv_device() function.
> 2. if cdnsp_alloc_priv_device() fails that leads to a double free because
>    we free pdev->out_ctx.bytes in several places.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Tested-by: Pawel Laszczak <pawell@cadence.com>
> ---
>  drivers/usb/cdns3/cdnsp-mem.c | 36 +++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)

This file isn't in 5.11-rc1 :(
