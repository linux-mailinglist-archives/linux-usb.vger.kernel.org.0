Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0702534086D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 16:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhCRPHn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 11:07:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48701 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S229508AbhCRPHY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 11:07:24 -0400
Received: (qmail 529151 invoked by uid 1000); 18 Mar 2021 11:07:23 -0400
Date:   Thu, 18 Mar 2021 11:07:23 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tomasz Torcz <tomek@pipebreaker.pl>
Cc:     Greg KH <greg@kroah.com>, systemd-devel@lists.freedesktop.org,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        Matthias Schwarzott <zzam@gentoo.org>,
        hirofumi@mail.parknet.co.jp, Mike Tsai <miketsai@amazon.com>
Subject: Re: [systemd-devel] [PATCH] usb-storage: Add quirk to defeat
 Kindle's automatic unload
Message-ID: <20210318150723.GC527768@rowland.harvard.edu>
References: <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
 <20210317151746.GB488655@rowland.harvard.edu>
 <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>
 <20210317190654.GA497856@rowland.harvard.edu>
 <YFNalS7Sl/l+zywM@mother.pipebreaker.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFNalS7Sl/l+zywM@mother.pipebreaker.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 18, 2021 at 02:50:13PM +0100, Tomasz Torcz wrote:
> Dnia Wed, Mar 17, 2021 at 03:06:54PM -0400, Alan Stern napisał(a):
> > Matthias reports that the Amazon Kindle automatically removes its
> > emulated media if it doesn't receive another SCSI command within about
> > one second after a SYNCHRONIZE CACHE.  It does so even when the host
> > has sent a PREVENT MEDIUM REMOVAL command.  The reason for this
> > behavior isn't clear, although it's not hard to make some guesses.
> 
>   Could Kindle be fixed not to required such workaround? Is there a way
> to open a bug with Amazon?

You really should be asking people who work for Amazon.  I suspect that 
nobody who regularly reads this mailing list knows the answer.

(If you look through the MAINTAINERS file, you'll find there are a few 
kernel developers who do work for Amazon, or at least, have @amazon.com 
email addresses.  Try asking some of them.)

But even if the Kindle firmware gets changed (which I doubt will 
happen), we would still want to support all the old devices that aren't 
running the updated firmware.

Alan Stern
