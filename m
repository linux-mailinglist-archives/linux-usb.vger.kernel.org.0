Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9020030D58C
	for <lists+linux-usb@lfdr.de>; Wed,  3 Feb 2021 09:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbhBCItz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 03:49:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:39536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232637AbhBCItx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 3 Feb 2021 03:49:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA21D64F72;
        Wed,  3 Feb 2021 08:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612342152;
        bh=t8LEVlHH57mxwoR3STzvOjfCNws/wJKkZovrt5JU+bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=efNym+uPUYYGLDruL2XdoPHaDTpR1Bssch2Y5Vg6U+AkfWoJVzcOIOU8HwZztQrvD
         6AmCyNPNMRVLg2BuhKnDkT1i1ui9oCwinoYhVgyIEKudpVUJGGRaHuyHxjxGJQwsHn
         4H1TjAxXE73PHLpaHYa0P8kA+EgjuzSeiZNTS0cfV74IJcfMm+X3HrG0KO5VGwSAQ+
         GJF8GAzigJRuj9ehTQ+TM5ERAbbSoyFEhBABvlaARJDmY2RwhB8qJ5XBiN+iR+Q1Ym
         VU1d4+VDn/Ta0w5hDBAkDiPQERb1M3e4ENJrh1eKnAK53qQuIsEDmakbAVxg5b2pV0
         BsZfS/V0K+nrg==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l7Dqm-00006P-SA; Wed, 03 Feb 2021 09:49:25 +0100
Date:   Wed, 3 Feb 2021 09:49:24 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Tung Pham <Tung.Pham@silabs.com>
Cc:     Hung Nguyen <Hung.Nguyen@silabs.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Pho Tran <Pho.Tran@silabs.com>
Subject: Re: Bugs: usb serial crash when close second comport
Message-ID: <YBpjlHNgzFA9aEAN@hovoldconsulting.com>
References: <PU1PR06MB2117988A6B7680CA1806DBE091B69@PU1PR06MB2117.apcprd06.prod.outlook.com>
 <CO1PR11MB48828958BDC51E796D37D63F81B69@CO1PR11MB4882.namprd11.prod.outlook.com>
 <YBfVqOwEZfkvX7YA@hovoldconsulting.com>
 <CO1PR11MB48821E7544DCB4E06665849481B59@CO1PR11MB4882.namprd11.prod.outlook.com>
 <YBkOEHM8/VfK5Gc+@hovoldconsulting.com>
 <CO1PR11MB4882F6F4F085A81470A34EE481B59@CO1PR11MB4882.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO1PR11MB4882F6F4F085A81470A34EE481B59@CO1PR11MB4882.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 02, 2021 at 09:48:01AM +0000, Tung Pham wrote:
> After the bug occur, when open or close device it show on log of system:
> 
> failed set request 0x12 status: -110
> failed set request 0x00 status: -110
> failed set request 0x00 status: -110
> 
> 0x00 = enable or disable serial device USB request.
> 0x12 = flush serial device USB request.
> -110 = time out.
> 
> it means driver is not crashes but it can't open or close device any more.

Right, so the device just fails to respond. Can you communicate with
other devices connected to the same hub when this happens?

I found this note about "Interoperability between the Raspberry Pi and
USB 3.0 hubs" which appears to be related:

	https://www.raspberrypi.org/documentation/hardware/raspberrypi/usb/README.md

Does connecting the device through an intermediary USB 2.0 hub make the
problem go away?

> We may find mainline kernel of raspberry if have, and find the driver
> of USB they use in next days.

Sounds good (even if this is starting to sound like a firmware issue).

Johan
