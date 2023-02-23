Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D456A0D4C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Feb 2023 16:48:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbjBWPsV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Feb 2023 10:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233862AbjBWPsU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Feb 2023 10:48:20 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 2385D21A3D
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 07:48:19 -0800 (PST)
Received: (qmail 1245614 invoked by uid 1000); 23 Feb 2023 10:48:18 -0500
Date:   Thu, 23 Feb 2023 10:48:18 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Seth Bollinger <seth.boll@gmail.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org, sethb@digi.com
Subject: Re: HC died
Message-ID: <Y/eKwvQAihZYKUos@rowland.harvard.edu>
References: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
 <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com>
 <CA+JN8xOOyU8yLJrxnKPwAMhQFKE70rTi=aLa3Adt7Og4dfPRVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+JN8xOOyU8yLJrxnKPwAMhQFKE70rTi=aLa3Adt7Og4dfPRVg@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 23, 2023 at 09:31:05AM -0600, Seth Bollinger wrote:
> > > We're experiencing a problem with our devices in the field where our
> > > customers attach problematic USB devices that are causing the xhci
> > > host controller to shut down with the "HC died; cleaning up" message.
> >
> > Is this seen only on some specific xHC host controller?
> 
> I don't think so.  We've seen this on pcie attached asmedia 3142 and
> NXP ls1012a/ls1046a SOC controllers (which I think are dwc3 IP).
> Strangely the timing seems to be much easier to reproduce on the pcie
> attached asm3142.
> 
> > > I've narrowed this down to a timeout of the address device TRB on the
> > > command ring (currently 5 seconds).  It sometimes takes our hardware
> > > 9.6 to complete this TRB.  When the driver is trying to stop the cmd

Note that the USB-2.0 spec says (section 9.2.6.3, Set Address 
Processing):

	After the reset/resume recovery interval, if a device receives a 
	SetAddress() request, the device must be able to complete 
	processing of the request and be able to successfully complete 
	the Status stage of the request within 50 ms.

These devices' 9.6 seconds to process a Set-Address request is a _lot_ 
longer than 50 ms.  No wonder they don't work properly.  Why on earth do 
they take so long?

Of course, xHCI controller drivers should be able to cancel an 
Address-Device TRB without waiting for it to complete.

Alan Stern
