Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0632D498B
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 19:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387469AbgLISy5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 13:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730111AbgLISy5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 13:54:57 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C853C0613D6
        for <linux-usb@vger.kernel.org>; Wed,  9 Dec 2020 10:54:17 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id o8so2731099ioh.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Dec 2020 10:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HO/4CIlSDMRn/j2kbhlPl5ANYi1Y0p8wiY4wFHeijhs=;
        b=vkB/7AxAIHCYkMbFjdweizeYIbuozLY/FFmaQBLEF9J+rcHZr9JsA4AeS1UnEhsK3P
         y/674KKGQAB/o1b14SYriyrd4RUQgTUWiW6R3tkNrGrEFEDDdOttnvx6j1H94k4ou6ET
         jn0j5YqWWPihRBm3E5mmAX7cns+DFnIjvxM9fX3gQ9YzjcCCDHQsfqIYFhaKqgSc81uV
         /0EX5WTCdHP7nuFKUaCk/oFmzXt8vdbDbgbq9QVHYFjK2po0nsrvfGxrFP2+8VdWDdVd
         By8uoUDxBYP1r401uIA7vSDC48JcsLhgYvnKQQ2MbSX/D5Ar8ifiQiZ5Pv6XDI9gKIU8
         Vhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HO/4CIlSDMRn/j2kbhlPl5ANYi1Y0p8wiY4wFHeijhs=;
        b=ZPGoB3zP7wRUmx7h8xLXeZL6ep6OWR+X26R6oX01fpaB8npct8WXcmWSWZDQ2lpok+
         zS7nto2IYdqjh+T7YHWNT9kNP73I/XETIcNYI/+XpbHbrFHTmhvjOR5L4kD7aq2mDwMl
         St6SIzLKc74MnIwKtFU0mNSML4F+ZAQSYgxkskoBXg6rZAnQQnIALPliQQ6IcHwWVJD5
         T9+psr+l2KXK3gBK4+c6bmni1uCpNY0pnUYXRt0yC45BpJUoljGuSy3tKgtKEBaWurUu
         Ln7vPuGLwGLFI4SEytcaeshObnDL8zb4o/LpgOlU4mNnEe2tN/ACwQ4AVsst9SaRVwkd
         iewQ==
X-Gm-Message-State: AOAM533k97rvl+pPmh82xtJGAHYRRj7PEPUbLlFiqB3hr88gxFs6tIZz
        G58Y0vTssjHjrGG0z+Co3lJUlWNlavjahQ==
X-Google-Smtp-Source: ABdhPJxoaRMBV4JPyhS8i4cdDXW4RTlYNBAeQco5RoqPullsntcqPbStr7UxrGEf2+YODFro1mcOww==
X-Received: by 2002:a6b:8e92:: with SMTP id q140mr4746785iod.182.1607540056428;
        Wed, 09 Dec 2020 10:54:16 -0800 (PST)
Received: from google.com ([2601:285:8380:9270::33b4])
        by smtp.gmail.com with ESMTPSA id p18sm1667411ile.27.2020.12.09.10.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 10:54:15 -0800 (PST)
Date:   Wed, 9 Dec 2020 11:54:13 -0700
From:   Ross Zwisler <zwisler@google.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: xhci problem -> general protection fault
Message-ID: <X9EdVbO08Y8Ohih5@google.com>
References: <20201001164352.GA13249@google.com>
 <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com>
 <20201012215348.GA3324220@google.com>
 <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
 <CAGRrVHwC=3qs00CTzPkrVPzXBnpcxfjRCKjgaYK9Hjt0GRfObg@mail.gmail.com>
 <ee24e656-f898-6b0b-ea91-9875390abb72@linux.intel.com>
 <CAGRrVHwgxtPF89niHV3N58SaDb7q5jWde_g7-yVxGPcKhemsaw@mail.gmail.com>
 <b6eba37b-c78b-fc99-5aca-f9e5856e80ac@linux.intel.com>
 <X8+22DeNDn1A7X+N@google.com>
 <068b49cd-4afa-7adb-572b-634b1728744d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <068b49cd-4afa-7adb-572b-634b1728744d@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 09, 2020 at 03:11:14PM +0200, Mathias Nyman wrote:
<>
> I was testing with Andrzej's script against a g_zero gadget.
> I could  trigger many similar issues as those he reported, but not this
> dequeue issue you see.
> 
> The rewrite resolved all issues I saw. Script was running without issues
> over night. (tested against both USB2 and USB3).
> 
> I haven't tried with two devices simultaneously, I could try that.
> 
> Could you share more details about the system you have, what xhci
> controller do you have?

Sure.  I'm running with the following CPU:

Intel(R) Xeon(R) Gold 6154 CPU @ 3.00GHz

with 72 virtual cores, if that matters.

The full output of "lsusb -vvv" can be found here:

https://gist.github.com/rzwisler/8c61f10c7a9642cbc6fffe1daadfa8cc

And here is the xhci entry in "lspci -vvv":

00:14.0 USB controller: Intel Corporation C620 Series Chipset Family USB 3.0 xHCI Controller (rev 09) (prog-if 30 [XHCI])
	Subsystem: Lenovo C620 Series Chipset Family USB 3.0 xHCI Controller
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr+ Stepping- SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 38
	NUMA node: 0
	IOMMU group: 16
	Region 0: Memory at 90320000 (64-bit, non-prefetchable) [size=64K]
	Capabilities: <access denied>
	Kernel driver in use: xhci_hcd
	Kernel modules: xhci_pci

We've seen this issue on a variety of hardware from Lenovo and HP, so it's not
specific to this specific workstation model (Lenovo P920).

I repro the issue by running the bulk-cancel program against my "servo"
hardware, which is debugging hardware for Chromebooks.  As I said, though, I
can repro it easily without having a device attached, so I *think* all you
need is a device which handles BULK IN commands.  I've got 2, and if I run
against both my system repros the issue in under a minute, usually.  With 1 it
takes a little longer but still repros, so I don't think it's an interaction
between the two devices.

Please let me know if I can provide anything else of value.
