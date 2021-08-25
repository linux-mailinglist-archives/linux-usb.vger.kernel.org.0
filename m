Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F543F70D7
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 10:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhHYIDt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 04:03:49 -0400
Received: from mga07.intel.com ([134.134.136.100]:10447 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229503AbhHYIDi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Aug 2021 04:03:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="281191185"
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="281191185"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2021 01:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,349,1620716400"; 
   d="scan'208";a="597970906"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 25 Aug 2021 01:02:34 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 25 Aug 2021 11:02:33 +0300
Date:   Wed, 25 Aug 2021 11:02:33 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
References: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
 <YSTI51ilGLJLYlQz@kuha.fi.intel.com>
 <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 24, 2021 at 06:49:42PM +0200, Samuel Čavoj wrote:
> On 24.08.2021 13:24, Heikki Krogerus wrote:
> > On Mon, Aug 23, 2021 at 08:06:26PM +0200, Samuel Čavoj wrote:
> > > Hello,
> > > 
> > > The driver times out talking to the PPM (the message pops up 60 seconds
> > > after loading the module, the timeout in ucsi_acpi_sync_write).
> > > The command which times out is the first one after resetting the PPM in
> > > ucsi_init, enabling basic notifications.
> > > 
> > > The laptop in question is an ASUS UM325U, with the AMD Ryzen 5700U SoC.
> > > 
> > > The ACPI description of the USBC000 device looks reasonable to my eyes,
> > > but I am not an expert. The _DSM Method copies the UCSI OpRegion to (or
> > > from) EC memory. I can provide a dump if needed.
> > > 
> > > I am looking for guidance on how to proceed, I am not too familiar with
> > > the UCSI other than peeking at the spec for a short while.
> > > 
> > > Looking the error up online leads to various discussions usually ending
> > > with installing an nvidia driver, however mine does not have any
> > > dedicated GPU.
> > 
> > Can you send full dmesg output, and acpidump:
> > 
> >         % dmesg > dmesg.dump
> >         % acpidump -o acpi.dump
> > 
> > If enabling the notifications fails, then I'm not sure the EC firmware
> > on this board actually supports UCSI. That would not be unheard-of
> > situation.
> > 
> > thanks,
> > 
> > -- 
> > heikki
> 
> Hello,
> 
> I've attached the respective dumps, I hope they arrive in one piece.
> 
> I've tried poking at the firmware in Windows, using UcsiControl.exe.
> 
> Running
> 
>     UcsiControl.exe Send 0 1
> 
> times out after a couple seconds, I assume this is related. The command
> is supposed to reset the controller, but maybe it then runs some commands
> as well. Running
> 
>     UcsiControl.exe Send 0 6
> 
> responds with a result instantly, supposedly this is the GetCapability
> command. I don't know how to interpret the results, but I can attach
> them if needed. The program is documented at [1].
> 
> This leads me to think that the firmware does actually support it, but
> has some kind of problem.

The reset command does not generate command completion event in UCSI
(that's why we poll the responce separately in the driver, just like
the spec tells us to do). So that command timing out may be expected.

You said that enabling the notifications with Set Notifications Enable
fails, so can you try this:

        UcsiControl.exe Send 0 00010005

thanks,

-- 
heikki
