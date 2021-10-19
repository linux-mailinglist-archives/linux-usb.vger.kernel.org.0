Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B672E432D59
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 07:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhJSFnu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 01:43:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhJSFnt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 01:43:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0065C6108E;
        Tue, 19 Oct 2021 05:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634622097;
        bh=XalDn+8gjf9zDy7jBCLgBK1qz12i+bCTlsxPbuf4wqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bUsFxtkvmXR9r6YrWZMz3sQyURz2futjS79nFFv/z+a8NPnJQ9A36pTvfP7yxcr8e
         ExZ9zK9/y8pbcfqZkYHOy2BjAvt+1pUlCkQUL22ApR99gPpvd5C5uIAjA5ZJahQZfA
         f4hf6VUYb8kFde8nqMhs2NRgztte//zeySePoS8E=
Date:   Tue, 19 Oct 2021 07:41:34 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 00/22] Explicitly deny IRQ0 in the USB host drivers
Message-ID: <YW5ajmF67RjuD7l5@kroah.com>
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018183930.8448-1-s.shtylyov@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 18, 2021 at 09:39:08PM +0300, Sergey Shtylyov wrote:
> Here are 22 patches against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> The affected drivers use platform_get_irq() which can return IRQ0 (considered
> invalid, according to Linus) that means broken HCD when passed to usb_add_hcd()
> called at the end of the probe methods. I think that the solution to this issue
> is either explicitly deny or accept IRQ0 in usb_add_hcd()... /but/ here's this
> patch set to get the things going...

Why not fix the root of the problem for your platform that is failing to
assign a valid irq for the device?

Are you going to make this change to all callers of this function in the
kernel tree?

thanks,

greg k-h
