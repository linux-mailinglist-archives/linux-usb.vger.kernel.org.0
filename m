Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7E725BD0E
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 10:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgICIT4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 04:19:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgICITx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 04:19:53 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D76C2145D;
        Thu,  3 Sep 2020 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599121193;
        bh=9rBFQAy1oNAoqYNGerY4aPGrGoC6q22HVEldyDwv10E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y0jeZ6J++Sa7IEqXEs94/UO8cixket8jvLNl3fl626rJxsvcdb8BchIkkDQNv6TeN
         yeHYAIjphxfAS7A+jSH9F0Qdn8SplkpU7NDAR4mzsi4MQPpoSYvx5AXZOIRL6c8yid
         jiiiKZ9+2LFp3GoAen5ljf13g1xIo6C6bGJtDf7E=
Date:   Thu, 3 Sep 2020 10:20:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
        arnd@arndb.de, cyrozap@gmail.com, yoshihiro.shimoda.uh@renesas.com
Subject: Re: [PATCH v3 1/2] usb-storage: fix sdev->host->dma_dev
Message-ID: <20200903082017.GB2166291@kroah.com>
References: <CAGnHSE=4YNGTeoxQj+Hjy_EtRanhc-EEdiO_i8MRaLq1mKUCUw@mail.gmail.com>
 <20200903075639.31138-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903075639.31138-1-tom.ty89@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 03, 2020 at 03:56:38PM +0800, Tom Yan wrote:
> Use scsi_add_host_with_dma() instead of scsi_add_host() in usb.c and uas.c.
> 
> When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
> to the dma max mapping size. Therefore, the correct device that should be used
> for the clamping needs to be set.
> 
> The same clamping is still needed in the USB drivers as hw_max_sectors could be
> changed there. The original clamping would be invalidated in such cases.
> 
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> ---
>  drivers/usb/storage/scsiglue.c |  2 +-
>  drivers/usb/storage/uas.c      | 17 +++++++++++------
>  drivers/usb/storage/usb.c      |  5 +++--
>  3 files changed, 15 insertions(+), 9 deletions(-)

What changed from the previous version?  Always include that below the
--- line as is documented to do so.

Please fix up and resend.

thanks,

greg k-h
