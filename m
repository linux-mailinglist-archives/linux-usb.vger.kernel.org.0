Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075842F05D9
	for <lists+linux-usb@lfdr.de>; Sun, 10 Jan 2021 08:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbhAJHib (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jan 2021 02:38:31 -0500
Received: from mail.astralinux.ru ([217.74.38.120]:34895 "EHLO
        mail.astralinux.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbhAJHib (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Jan 2021 02:38:31 -0500
Received: from [95.24.186.126] (account ekorenevsky@astralinux.ru HELO himera.home)
  by astralinux.ru (CommuniGate Pro SMTP 6.3.4)
  with ESMTPSA id 2776865; Sun, 10 Jan 2021 10:36:20 +0300
Date:   Sun, 10 Jan 2021 10:37:37 +0300
From:   Eugene Korenevsky <ekorenevsky@astralinux.ru>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] ehci: fix EHCI host controller initialization sequence
Message-ID: <20210110073737.GA10541@himera.home>
References: <20210109181828.GA7585@himera.home>
 <20210109210452.GA1136657@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210109210452.GA1136657@rowland.harvard.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > -	ehci_readl(ehci, &ehci->regs->command);	/* unblock posted writes */

> You should not remove the ehci_readl call above.  With that line gone, 
> the PCI bus might not send the new value of configured_flag to the 
> controller until after the 5-ms sleep has ended, which makes the msleep 
> useless.

Could not find reads from USBCMD in similar drivers (for
example here: https://github.com/NetBSD/src/blob/trunk/sys/dev/usb/ehci.c#L625).
Is this feature (reading from USBCMD for unblocking posted writes)
documented anywhere or it is found empirically?

--
Eugene
