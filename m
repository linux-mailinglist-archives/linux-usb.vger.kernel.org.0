Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB3E1572D5
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 11:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgBJK3e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 05:29:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:48264 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727429AbgBJK3e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Feb 2020 05:29:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D493CAD2A;
        Mon, 10 Feb 2020 10:29:32 +0000 (UTC)
Message-ID: <1581330569.26936.5.camel@suse.de>
Subject: Re: USB hub driver over-current behavior
From:   Oliver Neukum <oneukum@suse.de>
To:     Sam Lewis <sam.vr.lewis@gmail.com>, linux-usb@vger.kernel.org
Date:   Mon, 10 Feb 2020 11:29:29 +0100
In-Reply-To: <CA+ZLECurtq1X-4XtMSqsdSfaw=RrNyY94cz+8CZ06HJ8Pw28Ng@mail.gmail.com>
References: <CA+ZLECurtq1X-4XtMSqsdSfaw=RrNyY94cz+8CZ06HJ8Pw28Ng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 10.02.2020, 17:03 +1100 schrieb Sam Lewis:
> Hi,
> 
> I have a LAN9514 (rebranded SMSC9514) USB hub which has per port
> over-current protection.
> 
> I'm using this hub within my embedded device, and I would like the hub
> to continue working if any single port experiences an over-current or
> short condition.
> 
> In testing this behavior by shorting out a port, I've noticed that the
> Linux USB driver continually fights against the protection in the hub
> and attempts to repower the shorted port.
> 
> Looking through the hub driver and tracing the execution flow, as far
> as I can tell, this is the list of events that seem to be occurring:
> 
> 1. I short out a single port
> 2. The hub (through a power switch) detects the short and disables the port
> 3. The hub sends an over-current event to the driver
> 4. The driver gets the event in the `port_event` function
> 5. The driver then sleeps for 100ms (for 'cool down'?) before powering
> the port back on
> 6. Repeat from top, until the short is removed

Hi,

error handling at this level has gotten little love.

The basic problem is that we have no good way to switch a portback on
after we have given up on it. Feel free to propose a patch to the
kernel and a tool to use it and we can discuss them.

	Regards
		Oliver

