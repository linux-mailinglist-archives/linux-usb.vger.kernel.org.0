Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1823F719C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 11:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239598AbhHYJW0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 05:22:26 -0400
Received: from lithium.sammserver.com ([168.119.122.30]:38380 "EHLO
        lithium.sammserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239596AbhHYJW0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 05:22:26 -0400
Received: from mail.sammserver.com (sammserver.wg [10.32.40.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by lithium.sammserver.com (Postfix) with ESMTPS id B323731181D6;
        Wed, 25 Aug 2021 11:21:39 +0200 (CEST)
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id CCC6D34EEA;
        Wed, 25 Aug 2021 11:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1629883299; bh=wjSWzNxyQUsNSFtvrg3nGbAZ8KHDxOz78yXpTLiaQjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D+pj9DMAOYXYZ8R1WxDdS80ZflWTzTyCsJZCOht8E0IyE0Jw8blhZCty14FFkDEMZ
         EnEMe5yfSYf4x3kc/4N/V/jBUs09gfdvuX3ayoDl1Kp6naKYdOeLfIqkxVeNsKhquw
         60v+YXDiitTlKpQMPldYzYMoKaPlMOsEIdfa2VJc=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id AC6691421DD3; Wed, 25 Aug 2021 11:21:38 +0200 (CEST)
Date:   Wed, 25 Aug 2021 11:21:38 +0200
From:   Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
References: <20210823180626.tb6m7h5tp6adhvt2@fastboi.localdomain>
 <YSTI51ilGLJLYlQz@kuha.fi.intel.com>
 <20210824164942.6pakfzf2crnxes7w@fastboi.localdomain>
 <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on sammserver.tu
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25.08.2021 11:02, Heikki Krogerus wrote:
> On Tue, Aug 24, 2021 at 06:49:42PM +0200, Samuel Čavoj wrote:
> > On 24.08.2021 13:24, Heikki Krogerus wrote:
> > > On Mon, Aug 23, 2021 at 08:06:26PM +0200, Samuel Čavoj wrote:
> > > > Hello,
> > > > 
> > > > The driver times out talking to the PPM (the message pops up 60 seconds
> > > > after loading the module, the timeout in ucsi_acpi_sync_write).
> > > > The command which times out is the first one after resetting the PPM in
> > > > ucsi_init, enabling basic notifications.
> > > > 
> > > > The laptop in question is an ASUS UM325U, with the AMD Ryzen 5700U SoC.
> > > > 
> > > > The ACPI description of the USBC000 device looks reasonable to my eyes,
> > > > but I am not an expert. The _DSM Method copies the UCSI OpRegion to (or
> > > > from) EC memory. I can provide a dump if needed.
> > > > 
> > > > I am looking for guidance on how to proceed, I am not too familiar with
> > > > the UCSI other than peeking at the spec for a short while.
> > > > 
> > > > Looking the error up online leads to various discussions usually ending
> > > > with installing an nvidia driver, however mine does not have any
> > > > dedicated GPU.
> > > 
> > > Can you send full dmesg output, and acpidump:
> > > 
> > >         % dmesg > dmesg.dump
> > >         % acpidump -o acpi.dump
> > > 
> > > If enabling the notifications fails, then I'm not sure the EC firmware
> > > on this board actually supports UCSI. That would not be unheard-of
> > > situation.
> > > 
> > > thanks,
> > > 
> > > -- 
> > > heikki
> > 
> > Hello,
> > 
> > I've attached the respective dumps, I hope they arrive in one piece.
> > 
> > I've tried poking at the firmware in Windows, using UcsiControl.exe.
> > 
> > Running
> > 
> >     UcsiControl.exe Send 0 1
> > 
> > times out after a couple seconds, I assume this is related. The command
> > is supposed to reset the controller, but maybe it then runs some commands
> > as well. Running
> > 
> >     UcsiControl.exe Send 0 6
> > 
> > responds with a result instantly, supposedly this is the GetCapability
> > command. I don't know how to interpret the results, but I can attach
> > them if needed. The program is documented at [1].
> > 
> > This leads me to think that the firmware does actually support it, but
> > has some kind of problem.
> 
> The reset command does not generate command completion event in UCSI
> (that's why we poll the responce separately in the driver, just like
> the spec tells us to do). So that command timing out may be expected.

That makes sense.

> You said that enabling the notifications with Set Notifications Enable
> fails, so can you try this:
> 
>         UcsiControl.exe Send 0 00010005

the command finishes instantly and does not seem to produce any error.

    PS C:\Program Files (x86)\USBTest\x64> .\UcsiControl.exe Send 0 00010005
    COMMAND:
    AsUInt64: 10005
    Command: 5
    DataLength: 0
    
    MESSAGE IN is empty.

Thank you,
Samuel
