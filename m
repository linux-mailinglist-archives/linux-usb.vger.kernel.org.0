Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA5D183169
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 14:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCLNas (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 09:30:48 -0400
Received: from laas.laas.fr ([140.93.0.15]:41546 "EHLO laas.laas.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgCLNas (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 09:30:48 -0400
Received: from beetle.laas.fr (beetle.laas.fr [IPv6:2001:660:6602:4:4a4d:7eff:fee1:650a])
        by laas.laas.fr (8.16.0.21/8.16.0.29) with SMTP id 02CDUcI8007239;
        Thu, 12 Mar 2020 14:30:38 +0100 (CET)
Received: by beetle.laas.fr (sSMTP sendmail emulation); Thu, 12 Mar 2020 14:30:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24170.14718.588622.540741@beetle.laas.fr>
Date:   Thu, 12 Mar 2020 14:30:38 +0100
From:   Anthony Mallet <anthony.mallet@laas.fr>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/2] USB: cdc-acm: fix rounding error in TIOCSSERIAL
In-Reply-To: <20200312093548.GA216768@kroah.com>
References: <20200310101027.32152-1-anthony.mallet@laas.fr>
        <20200310101027.32152-2-anthony.mallet@laas.fr>
        <20200312083827.GA102663@kroah.com>
        <24169.64955.621393.134996@gargle.gargle.HOWL>
        <20200312093548.GA216768@kroah.com>
X-Mailer: VM 8.2.0b under 25.2.2 (x86_64-pc-linux-gnu)
Organization: LAAS/CNRS - Toulouse - France
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thursday 12 Mar 2020, at 10:35, Greg KH wrote:
> On Thu, Mar 12, 2020 at 10:15:39AM +0100, Anthony Mallet wrote:
> > On Thursday 12 Mar 2020, at 09:38, Greg KH wrote:
> > > This patch doesn't apply to my usb-linus branch at all.  What
> > > tree/branch did you make it against?
> >
> > This is against master of https://github.com/torvalds/linux.git
>
> Odd.  Can you rebase and resend?

I did that: the only difference is in the "@@ -914,19 +915,24 @@" of
the second chunk of the second patch. The "19" is wrong, it should
be 18. However, I've no idea how this could happen, since I used "git
format-patch" to generate the diff, and I did not edit the diff part
at all manually.

It might be an emacs and diff-mode glitch (or me mistyping something)
when I added the comments in the patch, although this never happend to
me before.

Anyway, resending v4.

Thanks for your time,
Cheers.
