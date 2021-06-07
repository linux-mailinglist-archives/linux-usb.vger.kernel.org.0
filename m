Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE40539E44C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 18:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhFGQro (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 12:47:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:36806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230197AbhFGQro (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 12:47:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D872C60FDA;
        Mon,  7 Jun 2021 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623084352;
        bh=y7n15FAEb/+6+nW/J1mPpFtkRRNv5X0ZXigzoiiGRQ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IQeBg5inTPtieRrQGtnVZkpwT0SkaA8ANl4y2wACo9Ul5C18cL+fuCJ6HnVUdJ4H6
         nxlfQ4Fcj1kjZCS0DkzwQbqUcb+x1mJ5QCc82HnC2s3ty06MtJR/8JrbtgXsyQs5DW
         bLXmlmCJbAnekDlmuW52KThJtvli3cc0JPqJyueQmlmV0a8UaSnGrYxCpSedmoXONq
         8Wt7au6fcSrMV8k0seLf54bgSJQZtMWROZLRC5rN588imHOwrIqC19yvImTHnHhhR8
         se4CVkAEOy40gBU2/YRi1tbw3XjA5GrOmsqfRnNGvqVDMv6RfgJnn3CJnTNk68O2LT
         0lvbZCF4fUKpQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lqINm-00039p-71; Mon, 07 Jun 2021 18:45:46 +0200
Date:   Mon, 7 Jun 2021 18:45:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>
Cc:     David Frey <dpfrey@gmail.com>, linux-usb@vger.kernel.org,
        Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YL5NOq2N8dNWDVbc@hovoldconsulting.com>
References: <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
 <CAAvkfd-vmi_VJrCQg-ktF+sZZUfb5J+DJfjHv=TdVafyj1m1Ew@mail.gmail.com>
 <YLtOL5aZUnntfqWB@hovoldconsulting.com>
 <7b8c5109-3654-7e65-0b94-f6b861ff78f5@palosanto.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b8c5109-3654-7e65-0b94-f6b861ff78f5@palosanto.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 07, 2021 at 10:16:30AM -0500, Alex Villacís Lasso wrote:
> El 5/6/21 a las 05:13, Johan Hovold escribió:
> > On Fri, Jun 04, 2021 at 04:16:26PM -0700, David Frey wrote:
> >> I'm not sure if this matters, but I have been told that the failing
> >> boards have CP2102N chips with"A01" firmware.  I tried to install
> >> SIlicon Labs Simplicity Studio on Windows because I read that it would
> >> be able to identify the firmware version of the device, but I couldn't
> >> actually figure out how to find the information. If someone can tell
> >> me a way to get the firmware version, I can check to see if it's
> >> different between the device that does exhibit this failure and the
> >> one that doesn't.
> > That is definitely worth pursuing. The A01 is apparently EOLed and
> > there's a later A02 and possibly even A03:
> >
> > 	https://www.silabs.com/community/interface/knowledge-base.entry.html/2020/03/31/how_to_determinecp2102nrevisiona01vsa02-DCJI
> >
> > That page refers to that vendor tool "Simplicity Studio" as well as a
> > Windows library described by
> >
> > 	https://www.silabs.com/documents/public/application-notes/AN978-cp210x-usb-to-uart-api-specification.pdf
> >
> > that can be used to read out the firmware version on CP2102N and CP2108
> > (three bytes). We just need to figure out which vendor request the
> > library (and tool) uses and we could key off of this in the driver if
> > this turns out to be related to the firmware revision.
> 
> I modified the patch that added cp210x_dump_props() function, to dump 
> the raw buffer received using the print_hex_dump() kernel function. For 
> my device, I get this output:
> 
> jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000000: 42 00 
> 00 01 01 00 00 00 00 00 00 00 80 02 00 00  B...............
> jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000010: 80 02 
> 00 00 c0 c6 2d 10 01 00 00 00 3f 01 00 00  ......-.....?...
> jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000020: 7f 00 
> 00 00 ff ff 07 10 0f 00 07 1f 80 02 00 00  ................
> jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000030: 80 02 
> 00 00 00 00 00 00 00 00 00 00 33 00 2e 00  ............3...
> jun 07 10:00:51 karlalex-asus kernel: cp210x propdata: 00000040: 30 
> 00                                            0.
> jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: wLength = 66
> jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulMaxTxQueue = 640
> jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulMaxRxQueue = 640
> jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulProvSubType = 1
> jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulProvCapabilities 
> = 0x13f
> jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulSettableParams = 
> 0x7f
> jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentTx-Queue 
> = 640
> jun 07 10:00:51 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentRx-Queue 
> = 640
> 
> According to the datasheet at 
> https://www.silabs.com/documents/public/application-notes/AN571.pdf , 
> the data at offset 60 should be an Unicode string containing the device 
> vendor, with the last 3 characters denoting the version. The datasheet 
> gives an example of "SILABS USB Vx.y". However, my actual output decodes 
> to just "3.0". Is this enough for a blacklisting decision?

I'm afraid not; I have the same string encoded at offset 60 as you do:

	uniProvName = 33 00 2e 00 30 00 00 00 00 00 00 00 00 00 00

It seems we need help from Silabs here unless someone can reverse
engineer the Windows tool or library to determine the firmware version
request.

Johan
