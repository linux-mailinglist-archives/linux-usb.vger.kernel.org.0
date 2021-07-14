Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3806B3C8665
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 16:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239529AbhGNO5Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 10:57:16 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47081 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S239518AbhGNO5P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jul 2021 10:57:15 -0400
Received: (qmail 382232 invoked by uid 1000); 14 Jul 2021 10:54:23 -0400
Date:   Wed, 14 Jul 2021 10:54:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hylke Hellinga <hylke.hellinga@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ASMedia Technology Inc. ASM1143 USB 3.1 Host Controller causing
 random full speed USB resets
Message-ID: <20210714145423.GB380727@rowland.harvard.edu>
References: <CABUoX8tR+DpknjXCwtVkBh6O-rUisZ2V5RepzxRO-k5XBX7J=g@mail.gmail.com>
 <20210713184251.GC355405@rowland.harvard.edu>
 <CABUoX8sNbLuG0FB2_VtH14KhuBoRFB19a2V3cpgzdNDqiVUULA@mail.gmail.com>
 <CABUoX8sT_=8aUdzhphwJXnRN2m_cKuJrDi1MtOrkaCTThT0wmA@mail.gmail.com>
 <CABUoX8tX6+JpPRz7oyJV2fsiEbWxE+aZEYoBdjqWvLKL-4Odow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABUoX8tX6+JpPRz7oyJV2fsiEbWxE+aZEYoBdjqWvLKL-4Odow@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 13, 2021 at 10:30:48PM +0200, Hylke Hellinga wrote:
> Dear Alan,
> 
> Thank you.
> 
> I've just created the usbmon trace. It's fairly large due to it taking
> quite some time before the bug appears.
> I'm guessing it also has a lot of output due to the mouse moving x and
> y and me typing?
> 
> It can be viewed here:
> https://gist.github.com/Simbaclaws/70014d584d96dc0ac4920dffb1996583
> 
> Sorry for the somewhat late reply. Was helping someone on irc.
> 
> Please let me know if this can help debug the issue.

The usbmon trace contains a lot of -71 errors.  In general, errors of 
this type arise because the device's firmware has crashed (apparently 
not the case here, since the mouse continued to work okay), or because 
of interference caused by a bad cable or something similar.  Perhaps 
caused by the KVM switch itself.

The fact that the log says the mouse connected at full speed rather than 
high speed also indicates some sort of signal-related problem.

Have you tried doing an experiment where you plug the mouse directly 
into the computer rather than going through the switch?

Alan Stern
