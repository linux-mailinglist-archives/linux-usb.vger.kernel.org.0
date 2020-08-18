Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1222481F1
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 11:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgHRJdC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 05:33:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726336AbgHRJc5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 05:32:57 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 119322078B;
        Tue, 18 Aug 2020 09:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597743177;
        bh=YfkTw72FvIDMBUzSglnj03NXlk3w+YSZEFz1I07KPsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rDBjZK1DjK1OBBtlKhPmRpvR+av329nZ5mvfIixwDvWfASHaowerQ+MsRGYYyaZIY
         I424N/rBZcnyuQxte/neE9oWj4LOVIHv7EyvS2VtLzOOoNsVH0WfDEoZwutPOnOJH2
         hQZ1/JCxdoBxvzpQTF6Fzoeo9AM5425iBh9FXCYQ=
Date:   Tue, 18 Aug 2020 11:33:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v2 0/6] USB: UDC: Fix memory leaks by expanding the API
Message-ID: <20200818093321.GB34785@kroah.com>
References: <20200810022510.6516-1-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810022510.6516-1-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 10, 2020 at 10:25:04AM +0800, Peter Chen wrote:
> This series expands the UDC API to fix some long-standing memory leaks
> in the net2280 and net2272 drivers. And with expanding APIs, it could
> manage cdns3 and dwc3 gadget device memory better without the hacks
> at UDC core.
> 
> Alan Stern (3):
>   USB: UDC: Expand device model API interface
>   USB: UDC: net2280: Fix memory leaks
>   USB: UDC: net2272: Fix memory leaks
> 
> Peter Chen (3):
>   usb: cdns3: gadget: fix possible memory leak
>   usb: dwc3: allocate gadget structure dynamically
>   Revert "usb: udc: allow adding and removing the same gadget device"
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
