Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0883844EAA5
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 16:40:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235325AbhKLPno (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 10:43:44 -0500
Received: from netrider.rowland.org ([192.131.102.5]:48975 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235342AbhKLPnn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 10:43:43 -0500
Received: (qmail 33605 invoked by uid 1000); 12 Nov 2021 10:40:52 -0500
Date:   Fri, 12 Nov 2021 10:40:52 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     DocMAX <mail@vacharakis.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <20211112154052.GB32928@rowland.harvard.edu>
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 12, 2021 at 10:37:59AM +0100, DocMAX wrote:
> Hi there,
> 
> i would like to send a bug to you.
> 
> Issue in dmesg (lots of them):
> sd 5:0:0:0: [sde] tag#4 FAILED Result: hostbyte=DID_OK driverbyte=DRIVER_OK
> cmd_age=19s
> sd 5:0:0:0: [sde] tag#4 Sense Key : Illegal Request [current]
> sd 5:0:0:0: [sde] tag#4 Add. Sense: Invalid command operation code
> sd 5:0:0:0: [sde] tag#4 CDB: Write(16) 8a 00 00 00 00 00 85 33 72 e0 00 00
> 00 20 00 00
> 
> My workaround: kernel cmdline: usb-storage.quirks=2109:0715:u
> 
> My kernel: Linux zeus 5.14.16-arch1-1 #1 SMP PREEMPT Tue, 02 Nov 2021
> 22:22:59 +0000 x86_64 GNU/Linux
> 
> Would be cool if you can fix this.
> Thanks,

Does this device have its own power source, or does it run off power 
from the USB bus?  This kind of error is fairly common when a drive 
adapter doesn't have enough power.

Alan Stern
