Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F78E345CC1
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 12:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbhCWLZ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 07:25:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:48872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230484AbhCWLZD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 07:25:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3303F61585;
        Tue, 23 Mar 2021 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616498703;
        bh=qdFx/3pOHLc0uYlrmCN6UBhxQ85pZEZ9czasBRo5CjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=olfO58cvLJ7Me7t9frQu/yR2b1cp5P7zYlLZcjA7pKgcqg8bBgFC89S/jes96m27w
         ZpdXL2oJRFppE6LhN6oyToSNoz7sS7HcCDyaedB8r8otbCPaxXKMQHI1ABm6FRjka2
         Y6V4C9THDqzhyzitZ4lS+xb51yZRoz1Us5Fseh/o=
Date:   Tue, 23 Mar 2021 12:25:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        linux-usb@vger.kernel.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/3] usb: dwc2: Fix HPRT0.PrtSusp bit setting for HiKey
 960 board.
Message-ID: <YFnQDRI00JN9RUYU@kroah.com>
References: <20210318061310.D56F9A022E@mailhost.synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318061310.D56F9A022E@mailhost.synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 18, 2021 at 10:13:09AM +0400, Artur Petrosyan wrote:
> Increased the waiting timeout for HPRT0.PrtSusp register field
> to be set, because on HiKey 960 board HPRT0.PrtSusp wasn't
> generated with the existing timeout.
> 
> Signed-off-by: Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
> Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

Should this be backported to older kernels?  if so, how far back?  Can
you add a cc: stable@ to the signed-off-by area if so?

thanks,

greg k-h
