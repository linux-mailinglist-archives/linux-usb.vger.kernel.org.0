Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21851326592
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 17:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhBZQas (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 11:30:48 -0500
Received: from netrider.rowland.org ([192.131.102.5]:35495 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230041AbhBZQar (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Feb 2021 11:30:47 -0500
Received: (qmail 1393779 invoked by uid 1000); 26 Feb 2021 11:30:04 -0500
Date:   Fri, 26 Feb 2021 11:30:04 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Longfang Liu <liulongfang@huawei.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org, yisen.zhuang@huawei.com,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] USB:XHCI:Modify XHCI driver for USB2.0 controller
Message-ID: <20210226163004.GB1392547@rowland.harvard.edu>
References: <1614327697-1021-1-git-send-email-liulongfang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614327697-1021-1-git-send-email-liulongfang@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 26, 2021 at 04:21:37PM +0800, Longfang Liu wrote:
> Our current XHCI hardware controller has been customized to only
> support USB 2.0 ports. When using the current xhci driver, an xhci
> controller device and an ehci controller device will be created
> automatically.

That sentence makes no sense at all.  An EHCI controller device is a 
piece of hardware.  How can an xHCI driver, which is a piece of 
software, create a piece of hardware?

Alan Stern
