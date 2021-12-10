Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E084704FA
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 16:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbhLJP5c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 10:57:32 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:35206 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233285AbhLJP53 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 10:57:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 3740BCE2A70
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 15:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC948C00446;
        Fri, 10 Dec 2021 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1639151630;
        bh=2dtKDzUAh727IoAxC/iQCFn3F8hIpA14aZ71DLlgbp4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i1zzNizmkOLEaZIGFHMgcWdPY5v0BYz1h91UtaJogdqa/MZqv19M1doaxq0EissY1
         2qASWnxioHvILbvIrJ4IqSN9cngCYiEK8Ev2Hdm0DedjWFI51aXLO1kgpSmqydp051
         TLG2cJs4JBq1dl1hUJzlnhKKxSGXBgPmHRnFMaaM=
Date:   Fri, 10 Dec 2021 16:53:47 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: core: config: fix validation of wMaxPacketValue
 entries
Message-ID: <YbN4C7XJ8FU4yMGT@kroah.com>
References: <20211210085219.16796-1-pavel.hofman@ivitera.com>
 <YbN2xd7DJuULtOUI@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbN2xd7DJuULtOUI@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 10, 2021 at 10:48:21AM -0500, Alan Stern wrote:
> On Fri, Dec 10, 2021 at 09:52:18AM +0100, Pavel Hofman wrote:
> > The checks performed by commit aed9d65ac327 ("USB: validate
> > wMaxPacketValue entries in endpoint descriptors") require that initial
> > value of the maxp variable contains both maximum packet size bits
> > (10..0) and multiple-transactions bits (12..11). However, the existing
> > code assings only the maximum packet size bits. This patch assigns all
> > bits of wMaxPacketSize to the variable.
> > 
> > Fixes: aed9d65ac327 ("USB: validate wMaxPacketValue entries in endpoint descriptors")
> > Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> > ---
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> This should have a "CC: <stable@vger.kernel.org>" tag attached.

I can add that, thanks.

greg k-h
