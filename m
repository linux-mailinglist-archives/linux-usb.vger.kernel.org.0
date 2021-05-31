Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE10395594
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 08:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhEaGsZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 02:48:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:55900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230070AbhEaGsX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 02:48:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5986260FF0;
        Mon, 31 May 2021 06:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622443604;
        bh=loPdRuMPb4jEmq39dkhk/alO94c8RUmoUVYEjBV2Okk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XXkTti7H312L62Dbrcpam9gr2xz838bEADvweAKG5qCcwn0+JyUF+1m86Lk09CnCn
         KbEa/SEmAwM7tN3r6BrYrlnCs4L2gA+tXvJnpUT+HXrvSgc5NzoSbQin/8ZFm0fzp7
         gja8S0FCIFW2N2MMj5sukUOpIcTCQhAOjedNOn/b+d1UhGhEV+Z7b/OmEaYduwcyk2
         5qRrP/Wk0mlmYBilYvTEVtrOvP7kIUdGvEJQ1xa+ZUPBZTWoKWbBMHKlKMCq8pJ3t8
         W2upWWfMQjYtZ8EVa+f9LDpuv2MknREYiv8hIz+NUpJlUjxN8sgeVetlw0QhJXFlro
         nenYOJSAqGqzQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lnbh8-0000Gg-Eb; Mon, 31 May 2021 08:46:39 +0200
Date:   Mon, 31 May 2021 08:46:38 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Eero Lehtinen <debiangamer2@gmail.com>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
Message-ID: <YLSGTkKNm5+o+PW1@hovoldconsulting.com>
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com>
 <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
 <YLPTJ3HIos630Btb@hovoldconsulting.com>
 <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Again, please don't top post. See
http://en.wikipedia.org/wiki/Top_post ]

On Sun, May 30, 2021 at 09:58:26PM +0300, Eero Lehtinen wrote:
> Hi,
> 
> I used dev_dbg instead of dev_info and got:
> drivers/media/usb/dvb-usb-v2/rtl28xxu.c:648
> [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "failed=%d\012"
> drivers/media/usb/dvb-usb-v2/rtl28xxu.c:640
> [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "chip_id=%u\012"
> drivers/media/usb/dvb-usb-v2/rtl28xxu.c:630
> [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "%s - ret2 = %d\012"
> drivers/media/usb/dvb-usb-v2/rtl28xxu.c:627
> [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "%s - ret1 = %d\012"
> drivers/media/usb/dvb-usb-v2/rtl28xxu.c:620
> [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "\012"
> 
> dev_info does not show up with dmesg or dynamic debug.

Odd. Just use dev_err() since that shows up in your logs.

> Should the kernel use the CXD2837ER driver and not the mxl5005s driver
> like it does with this patch.

Yes, something like that could be the problem here. Did it use CXD2837ER
before the patch?

I still need to see the return values for those transfer to determine
how best to address this so could you try again with dev_err()?

Johan
