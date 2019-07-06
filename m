Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA7660EFC
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 06:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfGFEqb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Jul 2019 00:46:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:56758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfGFEqb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Jul 2019 00:46:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 19FB92089C;
        Sat,  6 Jul 2019 04:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562388390;
        bh=UKJM2s2m0IkCm43Q79uIYzN9JNIBrNFCcF8A3ZxKZBQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ns11N48ylwBVAt6EIdbPGBSzxhNAuS91L+huu5o4Qqee3Hwza14TLY4G7hefrS/bz
         vSV1PkD37W7xxacAJ+Z6bmskggnScxl59CsymjNirxeObt9TzY79v4Sb5AMR5kZeWg
         SIlSmRqvBrb1p5uZ0iZ4RgFM257fek9cdtXyzVTk=
Date:   Sat, 6 Jul 2019 06:46:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yunhua li <yunhual@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Per USB device interrupt handler for xhci
Message-ID: <20190706044627.GA21685@kroah.com>
References: <CAMqbrUg3bz=i8nh4W2-NWOsnQdqcaB3nvZnMJQ1sGXuD0ogk7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMqbrUg3bz=i8nh4W2-NWOsnQdqcaB3nvZnMJQ1sGXuD0ogk7Q@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 05, 2019 at 07:50:28PM -0700, yunhua li wrote:
> Hi  all
> 
> xhci_msi_irq is the interrupt handler for xhci, the controller it self
> is a PCI device, on my system it is a Intel chip. I have multiple USB
> device connect to this USB host controller,  xhci_msi_irq is interrupt
> handler for the PCI device(USB Host controller).
> Is it possible to have multiple IRQ, and different IRQ for different
> USB device?

Nope.  That is not how USB works.  Please read the xhci spec if you are
curious as to why.

greg k-h
