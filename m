Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3A12B4A4F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 17:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbgKPQHu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 11:07:50 -0500
Received: from static-213-198-238-194.adsl.eunet.rs ([213.198.238.194]:36748
        "EHLO fx.arvanta.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728858AbgKPQHu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 11:07:50 -0500
Received: from arya.arvanta.net (arya.arvanta.net [10.5.1.6])
        by fx.arvanta.net (Postfix) with ESMTP id 4892316044;
        Mon, 16 Nov 2020 17:07:48 +0100 (CET)
Date:   Mon, 16 Nov 2020 17:07:48 +0100
From:   Milan =?utf-8?Q?P=2E_Stani=C4=87?= <mps@arvanta.net>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org, Hayes Wang <hayeswang@realtek.com>
Subject: Re: driver/net/usb/r8152 stop working after some time with kernel
 5.10-rc series
Message-ID: <X7Kj1KMaXGRmxzHD@arya.arvanta.net>
References: <X6/TsY8hd+Z3ITtL@arya.arvanta.net>
 <da3dac18a3c17750ef12b06b09cdac92e3c79f25.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da3dac18a3c17750ef12b06b09cdac92e3c79f25.camel@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, 2020-11-16 at 15:06, Oliver Neukum wrote:
> Am Samstag, den 14.11.2020, 13:55 +0100 schrieb Milan P. Stanić:
> Hi,
> 
> > Driver loads and work some time but at unpredictable time it stops and
> > starts to flood 'dmesg' output until shutdown (eth) interface.
> > 
> > Machine where I test this is arm64 ACER R13 chromebook.
> 
> Are you sure this started in v5.10 or did you not try earlier kernels?

I never used much mainline kernels on this machine because previous
kernels had issues and quirks making them practically unusable.
Earlier I used old chromeOS kernel (3.18 series) and from July this
summer I switched to kernels from
https://gitlab.collabora.com/eballetbo/linux/-/tree/topic/chromeos/somewhat-stable-5.7
https://gitlab.collabora.com/eballetbo/linux/-/tree/topic/chromeos/somewhat-stable-5.8
https://gitlab.collabora.com/eballetbo/linux/-/tree/topic/chromeos/somewhat-stable-5.9

They had also some issues but on somewhat-stable-5.8 and
somewhat-stable-5.9 r8152 worked, or I missed to notice this problem.

First mainline kernel which works fine is 5.10-rc1 and up (well, still
some quirks and issues) and it is usable for everyday work.
And on this kernel and up to 5.10-rc3 problem exist, right now I'm
testing 5.10-rc4 to see will that problem appear again. Sometimes it
need full 24 hours or more to manifest and I can't conclude how to
'trigger' it.

-- 
Kind regards

> > 'dmesg' shows a lot of such messages:
> > 
> > [305186.211284] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11
> 
> EAGAIN is an unusual error return.
> 
> 	Regards
> 		Oliver
> 
> 
