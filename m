Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC2D438B1AE
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 16:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbhETO1N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 10:27:13 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56615 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231791AbhETO1L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 10:27:11 -0400
Received: (qmail 1204115 invoked by uid 1000); 20 May 2021 10:25:49 -0400
Date:   Thu, 20 May 2021 10:25:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
Cc:     hminas@synopsys.com,
        "open list:MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER" 
        <linux-usb@vger.kernel.org>
Subject: Re: Odroid C4: dwc2_hsotg_start_req: ep1 is stalled
Message-ID: <20210520142549.GA1203988@rowland.harvard.edu>
References: <CAJs94EbV6+C81NggHtnJGZ8aoeW12POhv4zi0RTawuDcf+ybFA@mail.gmail.com>
 <20210520141633.GB1203032@rowland.harvard.edu>
 <CAJs94Eaq_d8ntjkH2EqSQvC6rytsPbJuTq8JTZ_8Ugp=X8+EiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJs94Eaq_d8ntjkH2EqSQvC6rytsPbJuTq8JTZ_8Ugp=X8+EiA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 20, 2021 at 05:18:37PM +0300, Matwey V. Kornilov wrote:
> чт, 20 мая 2021 г. в 17:16, Alan Stern <stern@rowland.harvard.edu>:
> >
> > On Thu, May 20, 2021 at 03:35:26PM +0300, Matwey V. Kornilov wrote:
> > > Hi,
> > >
> > > I am running upstream Linux 5.12.3 on an Odroid C4 board and see lots
> > > of the following lines in dmesg while using the gadget mass storage
> > > driver. I suppose that this can indicate some issue in the dwc2
> > > driver.
> > >
> > > [  189.752586] dwc2 ff400000.usb: bound driver g_mass_storage
> > > [  190.118994] dwc2 ff400000.usb: new device is high-speed
> > > [  190.199074] dwc2 ff400000.usb: new device is high-speed
> > > [  190.267855] dwc2 ff400000.usb: new address 4
> > > [  191.310603] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 1)
> > > [  191.310737] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
> > > [  191.311015] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 0)
> > > [  191.312257] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 1)
> > > [  191.312373] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
> > > [  191.312762] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 0)
> > > [  191.336959] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 1)
> > > [  191.447759] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 1)
> > > [  191.447823] dwc2 ff400000.usb: dwc2_hsotg_start_req: ep1 is stalled
> > > [  191.448098] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 0)
> > > [  191.448550] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 1)
> > > [  191.567748] dwc2 ff400000.usb: dwc2_hsotg_ep_sethalt(ep
> > > 00000000ce48180a ep1in, 1)
> >
> > Those look like they ought to be debugging messages.  They don't seem to
> > indicate any problem.
> >
> > Alan Stern
> 
> Well, I have not enabled any debug info, and those messages are
> flooding my dmesg. Maybe dev_warn() should be replaced with something
> other?

Indeed, maybe it should.  Feel free to go ahead and submit a patch.

Alan Stern
