Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464D1395682
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 09:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhEaHyJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 03:54:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230070AbhEaHyC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 03:54:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9324960FE9;
        Mon, 31 May 2021 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622447543;
        bh=fH80kPj0iM2EHPhSMf0xWQBaHgWjh9dkRazVWW0JDLM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uoLEcB72haNTscTbYiIQCZNrMfBXFZORpwcGbz+KHxnkSb855Knr3QhgnZpwqK0iC
         y3uE+fO8ziQe5aah9m/Mgk/kbQHxcuoZywmF44tGfDNZGerjLL+UYI86ZcwSZusdDw
         UurPA36c1qUdtB3WC2/iDemVQt8DbUCceVs4B57eaITiJ6b/YeyXZLGGtzaYT0Uu0L
         wZeUGQU+tuOY7xNDWRstoiZqXofwi4pEPoQi4k77fKadfnh++KpTvIdGVXzdXuilwA
         n1UraJq/3+Cbwu7hOUn2LlD9WIdRTxoDlUIFlD+K1DXHB4Eg7BIa8CNRraAX9klnTN
         fpZLdLngDjOvg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lncig-0000ZQ-M8; Mon, 31 May 2021 09:52:18 +0200
Date:   Mon, 31 May 2021 09:52:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Eero Lehtinen <debiangamer2@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Antti Palosaari <crope@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
Message-ID: <YLSVsrhMZ2oOL1vM@hovoldconsulting.com>
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com>
 <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
 <YLPTJ3HIos630Btb@hovoldconsulting.com>
 <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
 <YLSGTkKNm5+o+PW1@hovoldconsulting.com>
 <CAHS3B0Ez+eKSgrCEnW2ccpBCHc_gJ_Cs3abS_DAYXRAAjNYeTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS3B0Ez+eKSgrCEnW2ccpBCHc_gJ_Cs3abS_DAYXRAAjNYeTA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Resending with linux-usb on CC...]

[ Adding back linux-usb and Alan on CC.

  Also adding Antti, Hans and Mauro.

  Eero, please make sure to keep everyone on CC. ]

Quick summary:

A recent attempt to suppress a new warning in USB core:

	https://lore.kernel.org/r/20210524110920.24599-4-johan@kernel.org
	
caused the chip type detection to fail in Eero's system, and we're
trying to determine how best to handle this.

Hans, could you hold off applying the above until this has been
resolved?

On Mon, May 31, 2021 at 09:58:09AM +0300, Eero Lehtinen wrote:
> Hi,
> 
> I found dev_info messages from /var/log/messages.
> 
> May 30 18:41:19 optipc kernel: [    3.143433] dvb_usb_rtl28xxu
> 1-1:1.0: rtl28xxu_identify_state - ret1 = 0
> May 30 18:41:19 optipc kernel: [    3.147688] dvb_usb_rtl28xxu
> 1-1:1.0: rtl28xxu_identify_state - ret2 = -32

Ok, thanks. So this explains how things go wrong.

	ret = rtl28xxu_ctrl_msg(d, &req_demod_i2c);
	if (ret == -EPIPE) {
		dev->chip_id = CHIP_ID_RTL2831U;
	} else if (ret == 0) {
		dev->chip_id = CHIP_ID_RTL2832U;

The chip used to be identified as RTL2832U but after my change it is
now detected as RTL2831U and the driver uses a separate implementation
with different hardcoded defaults.

Commit d0f232e823af ("[media] rtl28xxu: add heuristic to detect chip
type") added this code and claimed that the i2c register in question
would only be found on newer RTL2832U models. Yet, actually reading the
register returns an error in your setup.

So, something is fishy here. Has anyone verified that the chip-type
detection works as expected for older RTL2831U?

> Gmail allows only top posting.

Even with the web interface you can expand the quoted text and reply
inline.

> Hi,
> 
> Yes, a working kernel uses the CXD2837ER driver. It is recognized as
> follows at boot. You must switch to CXD2837ER at boot time so that
> applications pick it:
> #!/bin/bash
> if [ ! -e /dev/dvb/adapter0/frontend99 ] then
> mv /dev/dvb/adapter0/frontend0 /dev/dvb/adapter0/frontend99
> mv /dev/dvb/adapter0/frontend1 /dev/dvb/adapter0/frontend0
> fi
> 
> [    3.426235] dvbdev: DVB: registering new adapter (Astrometa DVB-T2)
> [    3.431121] i2c i2c-10: Added multiplexed i2c bus 11
> [    3.431125] rtl2832 10-0010: Realtek RTL2832 successfully attached
> [    3.432648] i2c i2c-10: cxd2841er_attach(): I2C adapter
> 000000000397a340 SLVX addr 6e SLVT addr 6c
> [    3.441178] i2c i2c-10: cxd2841er_attach(): attaching CXD2837ER
> DVB-C/T/T2 frontend
> [    3.441180] i2c i2c-10: cxd2841er_attach(): chip ID 0xb1 OK.
> [    3.441182] usb 1-1: DVB: registering adapter 0 frontend 0 (Realtek
> RTL2832 (DVB-T))...
> [    3.441218] usb 1-1: DVB: registering adapter 0 frontend 1 (Sony
> CXD2837ER DVB-T/T2/C demodulator)...
> [    3.443994] r820t 11-003a: creating new instance
> [    3.457197] r820t 11-003a: Rafael Micro r820t successfully identified
> [    3.457210] r820t 11-003a: attaching existing instance
> [    3.512185] r820t 11-003a: Rafael Micro r820t successfully identified
> [    3.526915] rtl2832_sdr rtl2832_sdr.1.auto: Registered as swradio0
> [    3.526917] rtl2832_sdr rtl2832_sdr.1.auto: Realtek RTL2832 SDR attached
> [    3.526918] rtl2832_sdr rtl2832_sdr.1.auto: SDR API is still
> slightly experimental and functionality changes may follow
> [    3.542192] Registered IR keymap rc-astrometa-t2hybrid
> [    3.542205] rc rc0: Astrometa DVB-T2 as
> /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-1/rc/rc0
> [    3.542226] input: Astrometa DVB-T2 as
> /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-1/rc/rc0/input21
> [    3.542271] usb 1-1: dvb_usb_v2: schedule remote query interval to 200 msecs
> [    3.562187] usb 1-1: dvb_usb_v2: 'Astrometa DVB-T2' successfully
> initialized and connected
> [    3.562230] usbcore: registered new interface driver dvb_usb_rtl28xxu


> On Mon, May 31, 2021 at 9:46 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > [ Again, please don't top post. See
> > http://en.wikipedia.org/wiki/Top_post ]
> >
> > On Sun, May 30, 2021 at 09:58:26PM +0300, Eero Lehtinen wrote:
> > > Hi,
> > >
> > > I used dev_dbg instead of dev_info and got:
> > > drivers/media/usb/dvb-usb-v2/rtl28xxu.c:648
> > > [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "failed=%d\012"
> > > drivers/media/usb/dvb-usb-v2/rtl28xxu.c:640
> > > [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "chip_id=%u\012"
> > > drivers/media/usb/dvb-usb-v2/rtl28xxu.c:630
> > > [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "%s - ret2 = %d\012"
> > > drivers/media/usb/dvb-usb-v2/rtl28xxu.c:627
> > > [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "%s - ret1 = %d\012"
> > > drivers/media/usb/dvb-usb-v2/rtl28xxu.c:620
> > > [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "\012"
> > >
> > > dev_info does not show up with dmesg or dynamic debug.
> >
> > Odd. Just use dev_err() since that shows up in your logs.
> >
> > > Should the kernel use the CXD2837ER driver and not the mxl5005s driver
> > > like it does with this patch.
> >
> > Yes, something like that could be the problem here. Did it use CXD2837ER
> > before the patch?
> >
> > I still need to see the return values for those transfer to determine
> > how best to address this so could you try again with dev_err()?

Johan
