Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD86F25314B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 16:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbgHZO2z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 10:28:55 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33431 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726770AbgHZO2y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Aug 2020 10:28:54 -0400
Received: (qmail 401678 invoked by uid 1000); 26 Aug 2020 10:28:52 -0400
Date:   Wed, 26 Aug 2020 10:28:52 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Till =?iso-8859-1?Q?D=F6rges?= <doerges@pre-sense.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Ext. HDDs not working under Linux via USB 3.0 but under Windows
Message-ID: <20200826142852.GA400430@rowland.harvard.edu>
References: <20200523203349.GA12853@rowland.harvard.edu>
 <5bd5e8be-f8a9-9456-cced-c2bc75455556@pre-sense.de>
 <20200617163734.GC11314@rowland.harvard.edu>
 <763037ac-d8fa-8697-7f75-c0bf958b4308@pre-sense.de>
 <ce4d0606-b398-d23b-1a5f-25611eb4338f@pre-sense.de>
 <364ac09a-a877-c04e-5f2f-d5a559406590@pre-sense.de>
 <20200619150527.GA49731@rowland.harvard.edu>
 <c6fe1288-08a1-4d0a-37f5-c1ca44d46c25@pre-sense.de>
 <20200825184504.GC375466@rowland.harvard.edu>
 <0c7a4975-596e-9c5a-062f-df77e8ebe969@pre-sense.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0c7a4975-596e-9c5a-062f-df77e8ebe969@pre-sense.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 26, 2020 at 01:51:58PM +0200, Till Dörges wrote:
> Am 25.08.20 um 20:45 schrieb Alan Stern:
> > On Fri, Jun 19, 2020 at 08:01:57PM +0200, Till Dörges wrote:
> >> Am 19.06.20 um 17:05 schrieb Alan Stern:
> >>
> >>> Can you build and test a kernel with the patch below, to make sure it does 
> >>> what you want?
> >>
> >> I was afraid you might say that. ;-)
> >>
> >> I don't have a kernel dev environment handy (that was the main reason why I was happy
> >> with your offer of writing the patch).
> >>
> >> I'll try setting one up, but it may take a moment.
> > 
> > It has been a couple of months.  Did you make any progress on this?
> 
> 
> Thanks for the reminder and sorry for the delay.
> 
> 
> I just tested your patch and it works like a charm.
> 
> 
> Testing was performed on:
> 
> --- snip ---
> user@box:~> lsb-release -d
> Description:    openSUSE Leap 15.1
> 
> user@box:~> uname -a
> Linux box.none 4.12.14-lp151.28.59-default #1 SMP Wed Aug 5 10:58:34 UTC 2020
> (337e42e) x86_64 x86_64 x86_64 GNU/Linux
> --- snip ---
> 
> 
> against the Kernel distributed by openSUSE:
> 
> --- snip ---
> user@box:~> rpm -q kernel-source
> kernel-source-4.12.14-lp151.28.59.1.noarch
> --- snip ---
> 
> 
> The patch applied and after loading the new uas.ko the HDDs which didn't work before
> worked just fine.
> 
> 
> I understand the openSUSE Leap Kernel is somewhat different from Kernel HEAD but I'd
> assume that for the purpose of this test these differences are acceptable.
> 
> 
> Is there anything else I can do to help?

Nope, this is all set.  I'll go ahead and submit the patch.

Alan Stern
