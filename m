Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8D2E498F5
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2019 08:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfFRGmY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 02:42:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:50074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbfFRGmX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Jun 2019 02:42:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A99E21670;
        Tue, 18 Jun 2019 06:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560839605;
        bh=GgNcKbnSLCccU1geC35XoqDt7wL+YCBCvyfv55y06/A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vd9O7jo3rK9qA0y6gdYcVmwla7Sq3RVqDihKrTUkK6y4Mio3yCtOymF/tW3rRTN0a
         QAiFcRLKpUiDDgzODpqBKlImtrXiLGRxk3FUdZMY7TuzTIXGST2ZGThZF12m/bUtZ3
         BikfHUAWYtTeVaAKJrdnmMtT+193fHUNSHUJBAAE=
Date:   Tue, 18 Jun 2019 08:33:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        pdeschrijver@nvidia.com, afrid@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com,
        skomatineni@nvidia.com
Subject: Re: [PATCH 8/8] xhci: tegra: enable ELPG for runtime/system PM
Message-ID: <20190618063322.GA10079@kroah.com>
References: <20190614074824.22023-1-jckuo@nvidia.com>
 <20190614074824.22023-4-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614074824.22023-4-jckuo@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 14, 2019 at 03:48:24PM +0800, JC Kuo wrote:
> This commit enables XUSB host controller ELPG for runtime and system
> power management.
> 
> NEED CLEANUP.

Odd kernel changelog comment...

Please cleanup when you resend. :)

thanks,

greg k-h
