Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 379D43F8367
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 09:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240449AbhHZHyN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 03:54:13 -0400
Received: from mga02.intel.com ([134.134.136.20]:26270 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232926AbhHZHyJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 03:54:09 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="204893108"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
   d="scan'208";a="204893108"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 00:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; 
   d="scan'208";a="598398861"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 26 Aug 2021 00:53:20 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 26 Aug 2021 10:53:19 +0300
Date:   Thu, 26 Aug 2021 10:53:19 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <YSdIb+f+/cbRyBs1@kuha.fi.intel.com>
References: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
 <YSTI51ilGLJLYlQz@kuha.fi.intel.com>
 <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
 <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
 <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Samuel,

On Wed, Aug 25, 2021 at 11:21:38AM +0200, Samuel Čavoj wrote:
> > You said that enabling the notifications with Set Notifications Enable
> > fails, so can you try this:
> > 
> >         UcsiControl.exe Send 0 00010005
> 
> the command finishes instantly and does not seem to produce any error.
> 
>     PS C:\Program Files (x86)\USBTest\x64> .\UcsiControl.exe Send 0 00010005
>     COMMAND:
>     AsUInt64: 10005
>     Command: 5
>     DataLength: 0
>     
>     MESSAGE IN is empty.

Thanks for testing that. So UCSI is definitely working on this
platform. I guess the ACPI notifications are simply not going through.

Can you check if there are any events coming from the EC with the
following commands:

        % modprobe -r ucsi_acpi
        % modprobe -r typec_ucsi
        % grep -i acpi /proc/interrupts
        ...
        % modprobe typec_ucsi
        % modprobe ucsi_acpi
        % grep -i acpi /proc/interrupts
        ...

See if the number of interrupts increases considerable, or at all. The
ucsi drivers need to be modules of course in order for that to work.

Maybe there is something special that the OS should do with the EC on
your board... There is a weird message in your dmesg.

        "ACPI: EC: interrupt blocked"

I don't know if it's relevant at all in this case, but I've just never
seen that. I'm not an EC or ACPI expert, but I think that you only see
that if the EC event interrupt is a GPIO. I would expect there to be
also a message:

        "ACPI: EC: interrupt unblocked"

But as said, I'm really not an EC expert. We probable need to ask the
ACPI guys about this, but let's first check the interrupts.

thanks,

-- 
heikki
