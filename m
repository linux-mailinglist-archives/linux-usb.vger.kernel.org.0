Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7A9E3BEA09
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 16:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbhGGOsM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 10:48:12 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55135 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232154AbhGGOsG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jul 2021 10:48:06 -0400
Received: (qmail 178114 invoked by uid 1000); 7 Jul 2021 10:45:25 -0400
Date:   Wed, 7 Jul 2021 10:45:25 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jeffrey Walton <noloader@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CH341 driver and the 5.4 kernel
Message-ID: <20210707144525.GA177599@rowland.harvard.edu>
References: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 07, 2021 at 03:33:52AM -0400, Jeffrey Walton wrote:
> Hi Everyone,
> 
> I'm trying to track down the cause of some garbage in a response when
> using an ELM327 (https://www.elmelectronics.com/ic/elm327/) with a
> CH341 serial controller.
> 
> I see there's been a fair amount of activity with the CH341
> (https://github.com/torvalds/linux/commits/master/drivers/usb/serial/ch341.c),
> but I can't tell if its been backported to the 5.4 kernel.
> Specifically, the 5.4.0-77 kernel supplied with Ubuntu 18.04 and Mint
> 20.1.
> 
> Does anyone know if the fixes and improvements for the CH341 have made
> their way into the 5.4 kernel?

If you're talking about the 5.4.y kernels from kernel.org (as opposed 
to the kernels supplied by Ubuntu, which might have goodness knows 
what in them), you can see for yourself easily enough:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/drivers/usb/serial/ch341.c?h=linux-5.4.y

Alan Stern
