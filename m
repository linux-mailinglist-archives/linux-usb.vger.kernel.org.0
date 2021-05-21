Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAEE38BB7E
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 03:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236722AbhEUBZn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 21:25:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33255 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236106AbhEUBZn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 May 2021 21:25:43 -0400
Received: (qmail 1225097 invoked by uid 1000); 20 May 2021 21:24:20 -0400
Date:   Thu, 20 May 2021 21:24:20 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Guido Kiener <Guido.Kiener@rohde-schwarz.com>
Cc:     "dpenkler@gmail.com" <dpenkler@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Guido Kiener <guido@kiener-muenchen.de>,
        "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [syzbot] INFO: rcu detected stall in tx
Message-ID: <20210521012420.GC1224757@rowland.harvard.edu>
References: <35b615b7c7344767b6fd37f7d420787e@rohde-schwarz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35b615b7c7344767b6fd37f7d420787e@rohde-schwarz.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 20, 2021 at 09:25:53PM +0000, Guido Kiener wrote:
> I've tested to pull the cable and I can easy produce the -EPROTO (-71) error in the usbtmc.c driver.
> The error also happens when I have no traffic and just switch off the USBTMC device (which I can do from home office).
> When there is traffic, the IN/OUT pipe will also show some -EPROTO errors from the flying urbs.
> 
> On my test PC the amount of error messages vary from 1 to ca. 10 error message issued by the INT pipe (see below).
> Nevertheless I do not see the endless loop, since the USB disconnect stops the loop.
> (Tested with USB 2.0, older kernel 4.15, but latest modified usbtmc.c driver using ehci-pci)
> So I can test fixes (of course with latest kernel) and also setup a machine with USB 3.0.
> 
> 1. Example
> [1616527.017863] usbtmc 1-1.4:1.0: usbtmc_write_bulk_cb - nonzero write bulk status received: -71
> [1616527.032489] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.053998] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.076145] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.098143] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.120244] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.142244] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.164440] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.186517] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.208175] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.230272] usbtmc 1-1.4:1.0: unknown status received: -71
> [1616527.241982] usb 1-1.4: USB disconnect, device number 3
> 
> 2. Example
> [1622454.299131] usbtmc 1-1.4:1.0: unknown status received: -71
> [1622454.305815] usbtmc 1-1.4:1.0: usbtmc_write_bulk_cb - nonzero write bulk status received: -71
> [1622454.309921] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -71
> [1622454.319121] usbtmc 1-1.4:1.0: unknown status received: -71
> [1622454.341199] usbtmc 1-1.4:1.0: unknown status received: -71
> [1622454.363336] usbtmc 1-1.4:1.0: unknown status received: -71
> [1622454.385466] usbtmc 1-1.4:1.0: unknown status received: -71
> [1622454.407576] usbtmc 1-1.4:1.0: unknown status received: -71
> [1622454.422870] usb 1-1.4: USB disconnect, device number 7
> 
> 3. Example
> [1623429.713784] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -71
> [1623429.714037] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.714279] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.714528] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.714778] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.715029] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.715278] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.715528] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.715777] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.716028] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.716277] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.718916] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.719168] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.722404] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.725666] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.725918] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero read bulk status received: -2
> [1623429.727837] usbtmc 1-1.4:1.0: unknown status received: -71
> [1623429.749949] usbtmc 1-1.4:1.0: unknown status received: -71
> [1623429.772094] usbtmc 1-1.4:1.0: unknown status received: -71
> [1623429.794184] usbtmc 1-1.4:1.0: unknown status received: -71
> [1623429.816297] usbtmc 1-1.4:1.0: unknown status received: -71
> [1623429.838479] usbtmc 1-1.4:1.0: unknown status received: -71
> [1623429.838795] usb 1-1.4: USB disconnect, device number 8

Try running this test on a system with only one CPU (and no 
hyperthreading).  I think that's the environment syzbot emulates.

Alan Stern
