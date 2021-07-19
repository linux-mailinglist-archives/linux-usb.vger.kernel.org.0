Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499E33CD8BC
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jul 2021 17:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242802AbhGSOZ1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 10:25:27 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41925 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S243243AbhGSOXJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 10:23:09 -0400
Received: (qmail 567651 invoked by uid 1000); 19 Jul 2021 11:03:48 -0400
Date:   Mon, 19 Jul 2021 11:03:48 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Matt Corallo <oc2udbzfd@mattcorallo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-amlogic@lists.infradead.org" 
        <linux-amlogic@lists.infradead.org>,
        "linux.amoon@gmail.com" <linux.amoon@gmail.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: ODROID-C1/-C2 USB Detection only triggered by some devices dwc2
Message-ID: <20210719150348.GB565905@rowland.harvard.edu>
References: <CAFBinCA083iP4T2b1+MoDGZFKMO8eyy-WceRBA-QibatqboO1A@mail.gmail.com>
 <f084f45a-5be0-9542-260a-f4641e1215d0@synopsys.com>
 <CAFBinCCj5zUiv9LS2jKRxzX5pfcFTr4tVZwR7TA2CRQg68qwTw@mail.gmail.com>
 <822c3852-1d15-2976-8672-e49ae34c328f@synopsys.com>
 <CAFBinCC_0RpCMsj3AUt9fZrjHi6_qFirQtRR1g5VJcn45GpWAw@mail.gmail.com>
 <ad475275-eb2c-6309-fc59-494f94bf0605@synopsys.com>
 <CAFBinCCXioWL+ZGwvC8Ltrmx4y2XpGK03JAm8X=wDB4_dQ+pFA@mail.gmail.com>
 <20210715014451.GA397753@rowland.harvard.edu>
 <CAFBinCD0GKcc8veWAkWG=NCban4k8n5E-QdhNfccuH8OXvtA6g@mail.gmail.com>
 <20210719145322.GA565905@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719145322.GA565905@rowland.harvard.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 19, 2021 at 10:53:22AM -0400, Alan Stern wrote:
> If this doesn't work, I think the only solution will be a kernel patch.

One other thought: It may be that the reason the Corsair drive and 
others don't work when they are plugged in before boot-up is because 
they are too slow to connect to the USB bus.  That would cause the 
Genesys Logic hub to go into runtime suspend before the drive is 
detected, and then the hub never resumes because its remote wakeup 
support is faulty.

You can test this guess by plugging the Corsair drive into the Odroid 
before booting, and adding "usbcore.autosuspend=10" to the boot command 
line.  This will cause the hub to delay for ten seconds before going 
into runtime suspend, and that might be enough time for the drive to 
connect to the bus and be detected.

Alan Stern
