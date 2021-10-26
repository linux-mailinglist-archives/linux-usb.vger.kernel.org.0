Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8014F43ABBE
	for <lists+linux-usb@lfdr.de>; Tue, 26 Oct 2021 07:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235019AbhJZFkV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Oct 2021 01:40:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:38568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234973AbhJZFkU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 Oct 2021 01:40:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D05160C49;
        Tue, 26 Oct 2021 05:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635226677;
        bh=PD3+xH2riyqkexMvfH/Sw3qFISe8X3u47rPYnosy5EI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mWRGtmx6zSwQu5YBlk5Bf5j1Z+4KJiiE+sSaAKReV9HLWEDTdPszpiz3Xsnta7P0U
         BKtJPHqrSpoo4xcQlnaHr3pq6AaphI+3YSlsLB2uvMki9bDKnTWGq2uOKKjhYfNCMg
         cduxyxRbygQshOzXYZlyXABvHrIgK4TWDxs8LLu0=
Date:   Tue, 26 Oct 2021 07:37:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lars Gunnarsson <gunnarsson.lars@gmail.com>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/3] tools/usbip: persistently forward USB devices on
 a given bus
Message-ID: <YXeUMD4ftOhcQNpF@kroah.com>
References: <20211025200615.GA14140@dell-precision-T3610>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025200615.GA14140@dell-precision-T3610>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 25, 2021 at 10:06:15PM +0200, Lars Gunnarsson wrote:
> To forward a remote usb device over usbip the following steps is required:
> 
> 1. Execute "usbip bind" on remote end.
> 2. Execute "usbip attach" on local end.

<snip>

You sent 3 patches with identical subject lines, yet they do different
things?  Please make them unique.

thanks,

greg k-h
