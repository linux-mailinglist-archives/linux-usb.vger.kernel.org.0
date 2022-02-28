Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397AD4C7A4D
	for <lists+linux-usb@lfdr.de>; Mon, 28 Feb 2022 21:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiB1U16 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 15:27:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiB1U15 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 15:27:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AE3593A8
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 12:27:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DD7B60C5A
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 20:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A68C340F1;
        Mon, 28 Feb 2022 20:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1646080037;
        bh=Q3mP8w8OsQQ2Y9KXzq2XzdNJyMg4kfyw2J48lUhGpbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P/30AzS8wPTd3A6QzcYrf1ofX3Xe7eoUbl6lVAXbKGuOAC//akJc6eNF4TXKkO4jI
         rJpLPAkha4Lvoiu8lOFT/otOxAveUrXDcolhokHmxZToipkjty8NcK7cDEUsfiZv31
         z1DJ9ZTSFSouhFwB/xRBZ8V9vKFlTU3QoMhtYaJk=
Date:   Mon, 28 Feb 2022 21:27:12 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     micklorain <micklorain@protonmail.com>
Cc:     "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Message-ID: <Yh0wIGmoCjzKPTej@kroah.com>
References: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 28, 2022 at 08:12:47PM +0000, micklorain wrote:
> Hi,
> 
> This patch breaks USB for me. I noticed when I upgraded from debian's 4.19.0-18 (working) to 5.10.0-10 (broken). I git bisect'ed until I found that this patch is the culprit. Upstream 5.17.0-rc2 is still broken, but 5.17.0-rc2 with this patch reverted works.
> 
> lsusb when things work :
> https://paste.debian.net/hidden/2a964425/
> 
> lsusb when things are broken :
> https://paste.debian.net/hidden/0376920c/
> 
> dmesg when things are broken :
> https://paste.debian.net/hidden/780ca112/

This dmesg says:
	[    1.049161] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
have you tried that?

> 
> dmesg when things work :
> https://paste.debian.net/hidden/4d1bfc0f/

The messages here look different for PCI, can you diff them?

I see:
[    0.342113] PCI: PCI BIOS area is rw and x. Use pci=nobios if you want it NX.
[    0.342178] PCI: PCI BIOS revision 3.00 entry at 0xf0031, last bus=3
[    0.342180] PCI: Using configuration type 1 for base access

That's not in the "failing" system, are you sure that's the only change
here?

thanks,

greg k-h
