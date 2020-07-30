Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2252233561
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 17:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgG3P2U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jul 2020 11:28:20 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46207 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729833AbgG3P2T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jul 2020 11:28:19 -0400
Received: (qmail 7574 invoked by uid 1000); 30 Jul 2020 11:28:18 -0400
Date:   Thu, 30 Jul 2020 11:28:18 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Eli Billauer <eli.billauer@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        hdegoede@redhat.com, oneukum@suse.de
Subject: Re: [PATCH v4] usb: core: Solve race condition in anchor cleanup
 functions
Message-ID: <20200730152818.GA7241@rowland.harvard.edu>
References: <20200730141836.16550-1-eli.billauer@gmail.com>
 <20200730144614.GB1604718@rowland.harvard.edu>
 <5F22E3C7.1030305@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5F22E3C7.1030305@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 30, 2020 at 06:14:15PM +0300, Eli Billauer wrote:
> On 30/07/20 17:46, Alan Stern wrote:
> > This loop ought to have a cpu_relax() somewhere, probably here.  Same
> > for the other two functions.  Otherwise this looks okay to me.
> This function isn't so well documented. Does it go with an include file?
> asm/processor.h, for example? Or just add the call?

asm/processor.h is the appropriate include file, but you can just add 
the call without worrying about it.  Among other places, asm/processor.h 
is included by linux/mutex.h, for example.

Alan Stern

