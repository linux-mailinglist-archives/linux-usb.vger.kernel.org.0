Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F13DE8D438
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 15:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbfHNNIA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 09:08:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:38716 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726365AbfHNNH6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Aug 2019 09:07:58 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CA611AFE1;
        Wed, 14 Aug 2019 13:07:57 +0000 (UTC)
Message-ID: <1565788073.25764.8.camel@suse.com>
Subject: Re: AW: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
From:   Oliver Neukum <oneukum@suse.com>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 14 Aug 2019 15:07:53 +0200
In-Reply-To: <f5e22fea4e1c4baeb2fc98d324ad9060@SVR-IES-MBX-03.mgc.mentorg.com>
References: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
         <1565771508.25764.3.camel@suse.com>
         <f5e22fea4e1c4baeb2fc98d324ad9060@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 14.08.2019, 08:56 +0000 schrieb  Schmid, Carsten :

> > This is on a lower layer than ax88179. This comes from xhci_hcd.
> > Is this a regression?
> > 
> 
> I don't think its a regression.

It would be better to know than to assume.

> Is there something i can do to force an error message to be seen
> when the ETH2USB adapter stalls?

You can activate dynamic debugging for the xhci_hcd module
Remember that no data to transfer is not an error as such.

> My current assumption is that the signal quality of the USB port is at a
> corner case, and therefore some "better" Adapters work, some "bad ones"
> don't. But as there is no error message seen in the dmesg, i am somehow lost.

Two things you can do:

1. Generate a usbmon trace (it will be gigantic though)
2. Activate dynamic debugging for the xhci_hcd module


	Regards
		Oliver

