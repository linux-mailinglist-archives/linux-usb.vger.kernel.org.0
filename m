Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E541E2F9F
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 21:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390760AbgEZT5x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 15:57:53 -0400
Received: from smtp2.math.uni-bielefeld.de ([129.70.45.13]:52902 "EHLO
        smtp2.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389442AbgEZT5x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 May 2020 15:57:53 -0400
Received: from math.uni-bielefeld.de (kvm01.math.uni-bielefeld.de [129.70.45.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by smtp2.math.uni-bielefeld.de (Postfix) with ESMTPSA id DDEC16027C;
        Tue, 26 May 2020 21:57:51 +0200 (CEST)
Date:   Tue, 26 May 2020 21:57:50 +0200
From:   Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Kernel Oops in cdc_acm
Message-ID: <20200526195750.GA10336@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
 <1590409690.2838.7.camel@suse.com>
 <20200525191624.GA28647@math.uni-bielefeld.de>
 <1590491586.2838.38.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590491586.2838.38.camel@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum wrote on Tue 26/05/20 13:13:
> Hi,
> 
> may I ask whether you did the test with removing the battery twice with
> an older kernel? Could you please go back to
> f6cc6093a729ede1ff5658b493237c42b82ba107
> and repeat the test of a second battery removal with that state?
> I just cannot find anything pointing to a change that could cause
> this issue within that time.

Hi,

testing with f6cc6093a729ede1ff5658b493237c42b82ba107 looks like this:

=========== 1 =============
# remove battery first time
[  447.818693] usb 1-2: USB disconnect, device number 2
[  447.856667] cdc_acm 1-2:1.3: failed to set dtr/rts
# loop disconnect/connect

# insert battery first time
[  481.267878] usb 1-2: new high-speed USB device number 20 using ehci-pci

# turn on phone first time
[  488.984876] cdc_acm 1-2:1.3: failed to set dtr/rts
[  490.562661] usb 1-2: USB disconnect, device number 20
[  504.341285] usb 1-2: new high-speed USB device number 21 using ehci-pci
# unplug/plug USB cable - network ok

=========== 2 =============
# remove battery second time
[  576.310900] usb 1-2: USB disconnect, device number 22
[  576.334020] cdc_acm 1-2:1.3: failed to set dtr/rts
# loop disconnect/connect

# insert battery second time
[  606.764940] usb 1-2: new high-speed USB device number 38 using ehci-pci

# turn on phone second time
[  616.398126] usb 1-2: USB disconnect, device number 38
[  616.418763] cdc_acm 1-2:1.3: acm_port_activate - usb_submit_urb(ctrl irq) failed
[  630.208351] usb 1-2: new high-speed USB device number 39 using ehci-pci
# unplug/plug USB cable - network ok

=========== 3 =============
# remove battery third time
[  711.081997] usb 1-2: USB disconnect, device number 40
[  711.099678] cdc_acm 1-2:1.3: failed to set dtr/rts
# loop disconnect/connect

# insert battery third time
[  744.458707] usb 1-2: new high-speed USB device number 58 using ehci-pci

# turn on phone third time
[  751.195202] cdc_acm 1-2:1.3: failed to set dtr/rts
[  752.213695] cdc_acm 1-2:1.3: failed to set dtr/rts
[  752.457590] usb 1-2: USB disconnect, device number 58
# unplug/plug USB cable - network ok

Interesting is, that at the second time, the usb disconnect message
conmes first, and then a message from cdc_acm acm_port_activate.

Regards,
Jean Rene
