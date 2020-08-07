Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1575223EAF7
	for <lists+linux-usb@lfdr.de>; Fri,  7 Aug 2020 11:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728267AbgHGJwI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Aug 2020 05:52:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:59268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727037AbgHGJwH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Aug 2020 05:52:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23FAF2177B;
        Fri,  7 Aug 2020 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596793927;
        bh=VhzTBP/3KK8k+Dt1hTZAS23bPwBB61jVabfszwgkvbE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qp3ZdToCcNP9gL6QcNY0a/oVDVMSI7DUa93uRvKWVnfUhYh9h5DPgKCu5W8BWVZoD
         nqp41lPXBbYvfi7fNSNn6NAShIxhajpEKtQ2utDmcn7xVU3QYjfBh5lhcjiUqtbvJ8
         glRaPMApG4m6+eLn/DJthRR/grqYzDfTXbx7/AvA=
Date:   Fri, 7 Aug 2020 11:52:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        stern@rowland.harvard.edu, Anton Vasilyev <vasilyev@ispras.ru>,
        Evgeny Novikov <novikov@ispras.ru>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 1/6] USB: UDC: Expand device model API interface
Message-ID: <20200807095221.GA3071081@kroah.com>
References: <20200807094151.13526-1-peter.chen@nxp.com>
 <20200807094151.13526-2-peter.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807094151.13526-2-peter.chen@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 07, 2020 at 05:41:46PM +0800, Peter Chen wrote:
> From: Alan Stern <stern@rowland.harvard.edu>
> 
> The routines used by the UDC core to interface with the kernel's
> device model, namely usb_add_gadget_udc(),
> usb_add_gadget_udc_release(), and usb_del_gadget_udc(), provide access
> to only a subset of the device model's full API.  They include
> functionality equivalent to device_register() and device_unregister()
> for gadgets, but they omit device_initialize(), device_add(),
> device_del(), get_device(), and put_device().
> 
> This patch expands the UDC API by adding usb_initialize_gadget(),
> usb_add_gadget(), usb_del_gadget(), usb_get_gadget(), and
> usb_put_gadget() to fill in the gap.  It rewrites the existing
> routines to call the new ones.
> 
> CC: Anton Vasilyev <vasilyev@ispras.ru>
> CC: Evgeny Novikov <novikov@ispras.ru>
> CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

You can not forward on patches from someone else without also signing
off on them.

Please fix this series up to do so.

thanks,

greg k-h
