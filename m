Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E26432FBB2
	for <lists+linux-usb@lfdr.de>; Sat,  6 Mar 2021 17:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhCFQHy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Mar 2021 11:07:54 -0500
Received: from netrider.rowland.org ([192.131.102.5]:40957 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S230329AbhCFQH1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Mar 2021 11:07:27 -0500
Received: (qmail 74647 invoked by uid 1000); 6 Mar 2021 11:07:26 -0500
Date:   Sat, 6 Mar 2021 11:07:26 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Matthias Schwarzott <zzam@gentoo.org>,
        USB list <linux-usb@vger.kernel.org>,
        usb-storage@lists.one-eyed-alien.net, hirofumi@mail.parknet.co.jp
Subject: Re: Amazon Kindle disconnect after Synchronize Cache
Message-ID: <20210306160726.GB74411@rowland.harvard.edu>
References: <9f57532f-1fb7-0fdd-b91c-2dfecef5aff3@gentoo.org>
 <20210305191437.GC48113@rowland.harvard.edu>
 <CAL411-qf+c_CB4cL=2349QqCCYimOBCYxXbsOfLbvVYOg0294g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL411-qf+c_CB4cL=2349QqCCYimOBCYxXbsOfLbvVYOg0294g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 06, 2021 at 10:19:54AM +0800, Peter Chen wrote:
> On Sat, Mar 6, 2021 at 3:17 AM Alan Stern <stern@rowland.harvard.edu> wrote:

> > Is runtime power management enabled?  Maybe the Kindle disconnects
> > whenever the computer tries to suspend it.  This typically happens 2
> > seconds after the last command was issued, which matches your
> > observations.  If runtime PM is enabled, you can try disabling it.
> >
> >
> Alan, I think you may be right. It might want to support the feature like
> kindle goes to suspend after the Windows PC
> enters suspend (but VBUS is there), the Windows PC may never suspend the
> bus if a mass storage device is connected.

That's possible.  I have never tried to measure the bus activity when a 
Windows host is suspended.

Alan Stern
