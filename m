Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A139B6B0F21
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 17:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjCHQpc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 11:45:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjCHQpW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 11:45:22 -0500
Received: from mx.fenrir.org.uk (host-92-27-96-141.static.as13285.net [92.27.96.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECA13B678
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 08:45:18 -0800 (PST)
Received: from [10.0.0.3] (helo=deangelis.fenrir.org.uk)
        (TLS1.3:TLS_AES_256_GCM_SHA384:256)
        by mx.fenrir.org.uk with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pZwui-0002ke-2D
        for <linux-usb@vger.kernel.org>;
        Wed, 08 Mar 2023 16:45:16 +0000
Date:   Wed, 8 Mar 2023 16:45:16 +0000
From:   Brian Morrison <bdm@fenrir.org.uk>
To:     linux-usb@vger.kernel.org
Subject: Re: USB regression in kernel 6.2.2
Message-ID: <20230308164516.4a1dac3c@deangelis.fenrir.org.uk>
In-Reply-To: <db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
References: <20230307132120.5897c5af@deangelis.fenrir.org.uk>
 <db2e0984-6eb5-5987-44e1-a7143141469b@linux.intel.com>
Organization: The Fool and Bladder Face-Jumping Team
X-Mailer: Claws Mail 4.1.1git47 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Clacks-Overhead: GNU Terry Pratchett
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 8 Mar 2023 17:16:01 +0200
Mathias Nyman <mathias.nyman@linux.intel.com> wrote:

> Looks like that those devices initially enumerated fine, but suddenly
> disconnect about 19 seconds after boot.
> 
> [   19.155556] usb 2-1.1: USB disconnect, device number 4
> [   19.155685] cp210x ttyUSB0: cp210x converter now disconnected from
> ttyUSB0 [   19.159290] usb 2-1.4: USB disconnect, device number 6
> [   19.242344] usb 2-1.4: 3:0: failed to get current value for ch 0
> (-22) [   20.100761] usb 2-4.1: USB disconnect, device number 8
> [   20.100894] cp210x ttyUSB1: cp210x converter now disconnected from
> ttyUSB1 [   20.100999] cp210x 2-4.1:1.0: device disconnected
> [   20.107188] usb 2-4.2: USB disconnect, device number 9
> [   20.107253] cp210x ttyUSB2: cp210x converter now disconnected from
> ttyUSB2 [   20.107284] cp210x 2-4.2:1.0: device disconnected
> [   20.111938] usb 2-4.4: USB disconnect, device number 10
> [   20.181363] usb 2-4.4: 3:0: failed to get current value for ch 0
> (-22)
> 
> Interestingly those are all the devices behind external hubs.

These are in amateur radio gear, providing sound card modems and radio
CAT control on USB2 ports, but they have given no trouble since the
Renesas USB3 PCI card ROM load bug was sorted out a couple of years ago
I think.

> 
> Bisecting this to find the offending commit would be best, but a dmesg
> with xhci and usb core dynamic debug enabled could also show why
> those devices disconnect.
> 
> Adding "usbcore.dyndbg=+p xhci_hcd.dyndbg=+p" to your kernel cmdline
> should do this.

OK, I have done this and attached the dmesg output (which has expanded
by a factor of 3 with the extra debug).

A quick grep reveals these which are not expected:

[bdm@deangelis ~]$ grep usb_disable_device dmesg_6.2.2_debug.txt
[   18.349015] usb 2-1.1: usb_disable_device nuking all URBs
[   18.587034] usb 2-1.4: usb_disable_device nuking all URBs
[   18.589675] usb 2-1: usb_disable_device nuking non-ep0 URBs
[   19.280599] usb 2-2: usb_disable_device nuking non-ep0 URBs
[   19.288312] usb 2-4.1: usb_disable_device nuking all URBs
[   19.298113] usb 2-4.2: usb_disable_device nuking all URBs
[   19.386494] usb 2-4.4: usb_disable_device nuking all URBs
[   19.390100] usb 2-4: usb_disable_device nuking non-ep0 URBs

which are then followed by:

xhci_drop_endpoint from the xhci_hcd driver which seems expected given
the usb_disable_device being commanded.

That's about as far as I know how to go, I have not copied this to the
linux-usb list because of the size of the attachment, I have added that
to the redhat bug at:

https://bugzilla.redhat.com/show_bug.cgi?id=2175534

I suppose this should get to the list without the attachment.

-- 

Brian Morrison

