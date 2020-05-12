Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DFB1CFEBA
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 21:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbgELTwc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 15:52:32 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47541 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725987AbgELTwc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 15:52:32 -0400
Received: (qmail 26292 invoked by uid 500); 12 May 2020 15:52:31 -0400
Date:   Tue, 12 May 2020 15:52:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Claus Stovgaard <claus.stovgaard@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Options for forcing dwc3 gadget to only accept superspeed
Message-ID: <20200512195231.GA26080@rowland.harvard.edu>
References: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 12, 2020 at 09:25:38PM +0200, Claus Stovgaard wrote:
> Hi all
> 
> I have a system, using a Xilinx ZynqMP with kernel 4.19, using the
> build in dwc3 core as a USB device. (It is a custom device using
> ConfigFS / FunctionFS).
> 
> In a certain scenario I would like to force the dwc3 to only connect
> via superspeed and not fall back to USB2.
> 
> What options exist for forcing the dwc3 to keep retry?

The USB-3 spec forbids devices from operating only at SuperSpeed.  
Devices must be able to connect at high speed, although possibly with 
reduced functionality.

Alan Stern

> I know about the U2RSTECN from GCTL -
> https://www.xilinx.com/html_docs/registers/ug1087/usb3_xhci___gctl.html
> 
> So was wondering if other options existed, where I can force it to
> continue try to connect as SuperSpeed.
> 
> Or if it is possible to setup the high speed descriptors for ffs, so
> the host automatically will reset the bus / device so it newer will be
> reported as connected, unless it is with super speed.
