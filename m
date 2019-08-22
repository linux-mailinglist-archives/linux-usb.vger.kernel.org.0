Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAE2C98AED
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 07:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731395AbfHVFsv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 01:48:51 -0400
Received: from gate.crashing.org ([63.228.1.57]:34919 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731379AbfHVFsu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 01:48:50 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7M5mgda024745;
        Thu, 22 Aug 2019 00:48:44 -0500
Message-ID: <1b385c4a779b0d6722e74894aec0ba0a3855c72f.camel@kernel.crashing.org>
Subject: Re: f_mass_storage vs drivers/target
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Thu, 22 Aug 2019 15:48:42 +1000
In-Reply-To: <4c8a9941fb54dffd823335c9f4bc01f3158fb1d5.camel@kernel.crashing.org>
References: <Pine.LNX.4.44L0.1908211024380.1816-100000@iolanthe.rowland.org>
         <9c7090713374e80b6c26a9dabb753c5b35b9c93d.camel@kernel.crashing.org>
         <cc5030dcc06868fe93af4899be004c5a802d783b.camel@kernel.crashing.org>
         <4c8a9941fb54dffd823335c9f4bc01f3158fb1d5.camel@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-08-22 at 15:14 +1000, Benjamin Herrenschmidt wrote:
> - No UDC driver other than dummy sets max_streams, and f_tcm requires 4,
> so f_tcm will fail with *any* superspeed UDC driver as far as I can tell.
> 
> Was it ever tested with USB 3 ?

Ok so I spoke too soon... dwc3 does, I didn't notice bcs it doesn't
live in drivers/usb/gadget...

So Sebastian, what would be the best way to "fallback" to non-stream
use rather than just fail probing ?

Do we really want the autoconf EP matching to enforce the stream
numbers ? If we allow it to not match, then f_tcm could check after
matching if enough streams were found and disable stream support if
not.

Another option would be to make this 2-pass, though that complicates
even more: a first pass where we enforce the stream count, and if
we fail, a second pass where we ignore them.

Suggestions ?

Cheers,
Ben.


