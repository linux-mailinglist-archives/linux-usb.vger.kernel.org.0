Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7E2B20E535
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 00:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391266AbgF2VeO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jun 2020 17:34:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:60640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728621AbgF2Sk5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jun 2020 14:40:57 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 090A120748;
        Mon, 29 Jun 2020 04:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593405108;
        bh=f9QrZ7It4fGYsjb9a6cvY079w56pWeVWl5KwH6SnOMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BuGNezybI69MDBw2alkHDhrLGmQsSyNyoIMvO7kONZsLXD/de+jYUnAJ927znkubP
         p2m+MaZ7sc3P1dFFYmmp6gO3ZXVusIzO6em1VLpkVvOojILqsMQjyDELBMJRYUFy7y
         1VaN7URBO60W8yZrqE3qlCe/emyrj0osBf8wvbF0=
Date:   Mon, 29 Jun 2020 06:31:46 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
        "ben.dooks@codethink.co.uk" <ben.dooks@codethink.co.uk>,
        "colin.king@canonical.com" <colin.king@canonical.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>,
        Jayshri Dajiram Pawar <jpawar@cadence.com>,
        Rahul Kumar <kurahul@cadence.com>,
        Sanket Parmar <sparmar@cadence.com>
Subject: Re: [PATCH RFC 0/5] Introduced new Cadence USBSSP DRD Driver.
Message-ID: <20200629043146.GA323164@kroah.com>
References: <20200626045450.10205-1-pawell@cadence.com>
 <878sga5nfr.fsf@kernel.org>
 <BL0PR07MB5522A8796EE7BFB5062A8E76DD930@BL0PR07MB5522.namprd07.prod.outlook.com>
 <20200629034213.GB30684@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629034213.GB30684@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 29, 2020 at 03:41:49AM +0000, Peter Chen wrote:
> On 20-06-26 07:19:56, Pawel Laszczak wrote:
> > Hi Felipe,
> > 
> > >
> > >Hi,
> > >
> > >Pawel Laszczak <pawell@cadence.com> writes:
> > >> This patch introduce new Cadence USBSS DRD driver to linux kernel.
> > >>
> > >> The Cadence USBSS DRD Controller is a highly configurable IP Core which
> > >> can be instantiated as Dual-Role Device (DRD), Peripheral Only and
> > >> Host Only (XHCI)configurations.
> > >>
> > >> The current driver has been validated with FPGA burned. We have support
> > >> for PCIe bus, which is used on FPGA prototyping.
> > >>
> > >> The host side of USBSS-DRD controller is compliance with XHCI
> > >> specification, so it works with standard XHCI Linux driver.
> > >>
> > >> The host side of USBSS DRD controller is compliant with XHCI.
> > >> The architecture for device side is almost the same as for host side,
> > >> and most of the XHCI specification can be used to understand how
> > >> this controller operates.
> > >>
> > >> This controller and driver support Full Speed, Hight Speed, Supper Speed
> > >> and Supper Speed Plus USB protocol.
> > >>
> > >> The prefix cdnsp used in driver has chosen by analogy to cdn3 driver.
> > >> The last letter of this acronym means PLUS. The formal name of controller
> > >> is USBSSP but it's to generic so I've decided to use CDNSP.
> > >>
> > >> The patch 1: adds DT binding.
> > >> The patch 2: adds PCI to platform wrapper used on Cadnece testing
> > >>              platform. It is FPGA based on platform.
> > >> The patches 3-5: add the main part of driver and has been intentionally
> > >>              split into 3 part. In my opinion such division should not
> > >>              affect understanding and reviewing the driver, and cause that
> > >>              main patch (4/5) is little smaller. Patch 3 introduces main
> > >>              header file for driver, 4 is the main part that implements all
> > >>              functionality of driver and 5 introduces tracepoints.
> > >
> > >I'm more interested in how is this different from CDNS3. Aren't they SW compatible?
> > 
> > In general, the controller can be split into 2 part- DRD part and the rest UDC. 
> > 
> > The second part UDC which consist gadget.c, ring.c and mem.c file is completely different. 
> > 
> > The DRD part contains drd.c and core.c. 
> > cdnsp drd.c is similar to cdns3 drd.c but it's little different. CDNSP has similar, but has different register space.
> > Some register was moved, some was removed and some was added.  
> > 
> > core.c is very similar and eventually could be common for both drivers.  I thought about this but
> > I wanted to avoid interfering with cdns3 driver at this point CDNSP is still under testing and 
> > CDNS3 is used by some products on the market. 
> 
> Pawel, I suggest adding CDNSP at driver/staging first since it is still
> under testing. When you are thinking the driver (as well as hardware) are
> mature, you could try to add gadget part (eg, gadget-v2) and make
> necessary changes for core.c.

I only take code for drivers/staging/ that for some reason is not
meeting the normal coding style/rules/whatever.  For stuff that is an
obvious duplicate of existing code like this, and needs to be
rearchitected.  It is much more work to try to convert code once it is
in the tree than to just do it out of the tree on your own and resubmit
it, as you don't have to follow the in-kernel rules of "one patch does
one thing" that you would if it was in staging.

So don't think that staging is the right place for this, just spend a
few weeks to get it right and then resubmit it.

thanks,

greg k-h
