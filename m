Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1149E3DA0C8
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jul 2021 12:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235134AbhG2KDD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jul 2021 06:03:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:53616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232355AbhG2KDC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Jul 2021 06:03:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9746661054;
        Thu, 29 Jul 2021 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627552979;
        bh=WSLn4DLIB7t8P7FSKAcVrax3K+zKFa+2qJs++CY6SIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JTQJ2IDmZoTv053u/NGlp4XUeZqUpuUL5xC3X/O371OmhwQ1Fo4RT1n2L0oAwMHMT
         QdmzxRhd2TFJr2qYGdWwZQRRjGrRjFxhvFC++dYIBe11C6U2dFHa9x8wvXmqutH43f
         auQSs9QDcF/SalGfS6wIRs9rC2NbfddtW01nQS3k4d+17amkDFFSXQJoYPhenSMbhD
         RteoE897ZnoVmO+pEJToPf4VXG1PGM0zBCmqdfUIW8MN/Z4ODEbKPywIvE45yGiTIt
         agwFvNEWaDt8iabtuZKJgod8czcxKtLCJX7htTZcCiIpw1yqCnEiMR+93ADdh/BHQd
         Olp2k3r2ll9MQ==
Received: from johan by xi with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m92rs-0002M3-Ge; Thu, 29 Jul 2021 12:02:21 +0200
Date:   Thu, 29 Jul 2021 12:02:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Vasily Khoruzhick <anarsoul@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Commit 8a7bf7510d1f ("USB: serial: pl2303: amend and tighten
 type detection") broke pl2303 driver for my adapter
Message-ID: <YQJ8rNbYhSwmZvbb@hovoldconsulting.com>
References: <CA+E=qVfWm=3iJ6UR3UzeM-Se5sBjT+xx8CAM2G4bP2NxqW6itg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+E=qVfWm=3iJ6UR3UzeM-Se5sBjT+xx8CAM2G4bP2NxqW6itg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 05:00:20PM -0700, Vasily Khoruzhick wrote:
> Hey,
> 
> My PL2303 adapter isn't working after I upgraded to 5.13.
> 
> Looks like the culprit is commit 8a7bf7510d1f ("USB: serial: pl2303:
> amend and tighten type detection").
> 
> It used to work fine in 5.12.x.
> 
> Now it fails like this:
> 
> [246872.298632] usb 1-1: new full-speed USB device number 14 using xhci_hcd
> [246872.440065] usb 1-1: New USB device found, idVendor=067b,
> idProduct=23c3, bcdDevice= 3.05
> [246872.440079] usb 1-1: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [246872.440085] usb 1-1: Product: USB-Serial Controller
> [246872.440089] usb 1-1: Manufacturer: Prolific Technology Inc.
> [246872.440093] usb 1-1: SerialNumber: CMA>b103Y23
> [246872.445098] pl2303 1-1:1.0: pl2303 converter detected
> [246872.445114] pl2303 1-1:1.0: unknown device type, please report to
> linux-usb@vger.kernel.org

Thanks for the report. Can you please post the output of lsusb -v for
this device?

> Any ideas on how to fix it properly? Should I send a patch that
> handles bcdDevice == 0x305 and returns TYPE_HX for it from
> pl2303_detect_type()?

The device id indicates that this is in fact a PL2303GT so we may need
to amend the HXN type detection.

Johan
