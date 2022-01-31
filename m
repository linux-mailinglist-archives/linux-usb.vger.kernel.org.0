Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D31504A4F2F
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 20:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358996AbiAaTGz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 14:06:55 -0500
Received: from netrider.rowland.org ([192.131.102.5]:59261 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1358822AbiAaTGy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 14:06:54 -0500
Received: (qmail 282309 invoked by uid 1000); 31 Jan 2022 14:06:53 -0500
Date:   Mon, 31 Jan 2022 14:06:53 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     root <brice.chatelan@erems.fr>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Looking for usbip driver
Message-ID: <YfgzTZFP8MXjZHgI@rowland.harvard.edu>
References: <20220131181200.E183645E00D0@ere-mx2.erems.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131181200.E183645E00D0@ere-mx2.erems.fr>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 31, 2022 at 07:12:00PM +0100, root wrote:
> Hello,
> 
> I have an old equipment on the international space station running a linux 2.4 kernel (RedHat).
> I need to connect the USB1000IP to it to use standard devices: mass storage and cameras.
> The usbip device driver for linux seems to be the right package to handle this hardware.
> If you agree with this, where can I find the complete source code of my 2.4 kernel (otherwise 2.6)?

I don't agree, but I'll answer your question anyway.  However, if you 
want the source code for Red Hat's 2.4 Linux kernels then you really 
should ask on a Red Hat mailing list.

The generic Linux kernel source code is available at:

	https://mirrors.edge.kernel.org/pub/linux/kernel/v2.4/

but this is not the same as what Red Hat distributed (they made their 
own additions and changes).  Also, note that this web page includes 
source code for kernel versions 2.4.0 up to 2.4.37.9.

Alan Stern
