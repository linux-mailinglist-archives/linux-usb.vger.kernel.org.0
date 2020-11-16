Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D015B2B4C22
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 18:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732487AbgKPRG1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 12:06:27 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44461 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732195AbgKPRG0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 12:06:26 -0500
Received: (qmail 442206 invoked by uid 1000); 16 Nov 2020 12:06:25 -0500
Date:   Mon, 16 Nov 2020 12:06:25 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Alberto Sentieri <22t@tripolho.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: kernel locks due to USB I/O
Message-ID: <20201116170625.GC436089@rowland.harvard.edu>
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
 <20201111155130.GB237113@rowland.harvard.edu>
 <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 16, 2020 at 11:53:38AM -0500, Alberto Sentieri wrote:
> The objective of this email is to report the current status of my findings.
> 
> I loaded netconsole on both machines I was having problems with. I tried 3
> times on the machine with kernel 5.0.0-37 and twice with on the machine with
> kernel 5.3.0-62. Each attempt consisted of running the program which lock
> the kernel until it locked (about 3 minutes after stating the program). The
> referred program had the "semphore code" commented out. Nothing was sent to
> netconsole on all the 5 attempts I made when the kernel locked.
> 
> Just to be clear about my use of netconsole, before loading the netconsole
> kernel module, I ran "dmesg -n 8". When netconsole module was loaded I could
> clearly see about 9 message lines on the computer receiving the netconsole
> messages telling me that netconsole was loaded (and how it was configured),
> so no doubts about the correct netconsole setup. The "netconsole server" was
> a machine on the same local network.
> 
> My next attempt will be to compile kernel 5.9, as you suggest, and try it.

While this may not generate any useful information, one way to create a 
bunch of log output while running your test is to set the usbfs_snoop 
module parameter for usbcore to true.

You can also enable dynamic debugging for usbcore, although in a stable 
environment like yours it probably won't produce much output.

Alan Stern
