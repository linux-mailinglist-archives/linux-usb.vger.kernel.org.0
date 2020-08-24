Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D428F24F3D5
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 10:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgHXIVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 04:21:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:56594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgHXIVE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 04:21:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BFFE820738;
        Mon, 24 Aug 2020 08:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598257264;
        bh=uegVTyPdmDOaXg3hu8ylF/f6W1qvT/HHlR+Ri/ENx44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=spkzDgNbN7eQUmoJoD15yQwlHSxwIAgdk7pVjkjUVhgIa3jWRu0Z22jWzJn6LH7aR
         cjEmlTHaEHVvhjyvKS/MbgrDRsNtFqZL5H2k/CT3NjrSjZhalBuvgyz7xs4lXc4MHG
         2PgYlKoktmzhl+NsVzzMhPnqKrwYHlKlHKSpmGdY=
Date:   Mon, 24 Aug 2020 10:21:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ye Bin <yebin10@huawei.com>
Cc:     leoyang.li@nxp.com, linux-usb@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
Message-ID: <20200824082122.GA336539@kroah.com>
References: <20200824080437.229826-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824080437.229826-1-yebin10@huawei.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020 at 04:04:37PM +0800, Ye Bin wrote:
> Signed-off-by: Ye Bin <yebin10@huawei.com>

I can't take patches without any changelog text, sorry.

greg k-h
