Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5C6348B073
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jan 2022 16:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240982AbiAKPJG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jan 2022 10:09:06 -0500
Received: from netrider.rowland.org ([192.131.102.5]:41957 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231876AbiAKPJG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Jan 2022 10:09:06 -0500
Received: (qmail 204822 invoked by uid 1000); 11 Jan 2022 10:09:05 -0500
Date:   Tue, 11 Jan 2022 10:09:05 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     cruise k <cruise4k@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Geoffrey D. Bennett" <g@b4.vu>, linux-usb@vger.kernel.org
Subject: Re: INFO: task hung in usbdev_release
Message-ID: <Yd2dkYpzrsTVtGVf@rowland.harvard.edu>
References: <CAKcFiNBvtwdXH-hNRy34xVU55E6vjd2n212sPvrJdB+VW2GKzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKcFiNBvtwdXH-hNRy34xVU55E6vjd2n212sPvrJdB+VW2GKzA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 11, 2022 at 03:21:50PM +0800, cruise k wrote:
> Hi,
> 
> Syzkaller found the following issue:
> 
> HEAD commit: 75acfdb Linux 5.16-rc8
> git tree: upstream
> console output: https://pastebin.com/raw/YNZPt1rA
> kernel config: https://pastebin.com/raw/XsnKfdRt
> 
> And hope the report log can help you.

Much more helpful than any of these things would be a description of 
what the test _does_.  Seeing a stack trace after the problem has 
occurred isn't much help for tracking down what events caused the 
problem; to do that we need to know what was happening before the 
problem occurred.

There are two relatively easy things you could do that might also help 
a little: 

	Decode the addresses in the stack dump into source line numbers 
	(probably requires that the kernel be built with debugging
	information).

	Make the console output document in pastebin.com include the 
	_complete_ console output, not just the part starting from when 
	the problem was detected.

Alan Stern
