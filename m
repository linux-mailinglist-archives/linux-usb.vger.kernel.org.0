Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC339C735
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2019 04:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfHZCUG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Aug 2019 22:20:06 -0400
Received: from gate.crashing.org ([63.228.1.57]:48021 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726215AbfHZCUG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 25 Aug 2019 22:20:06 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7Q2JsxC008958;
        Sun, 25 Aug 2019 21:19:55 -0500
Message-ID: <507ef2a33079c35ad9cf3fa4f0acc585b401893e.camel@kernel.crashing.org>
Subject: Re: f_mass_storage vs drivers/target
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Mon, 26 Aug 2019 12:19:53 +1000
In-Reply-To: <Pine.LNX.4.44L0.1908231117260.1628-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1908231117260.1628-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-08-23 at 11:21 -0400, Alan Stern wrote:
> > I wonder since f_tcm is also the only user, whether we could change
> > the
> > matching logic to either:
> > 
> >    - Don't try to match, return streams is available. This could be
> > problematic if the UDC supports streams on some EPs and not others
> > however.
> > 
> >    - Do two passes: one pass trying to match the streams, and one
> > patch
> > without matching them if the first one fails.
> > 
> > Then f_tcm could check whether it got EPs with streams and enable
> > stream usage accordingly.
> > 
> > Opinions ? Other option ?
> 
> I like the two-pass option better.  Maybe Felipe will weigh in when
> he's back from vacation.

Yup, I prefer it too. I'll cook up something in the meantime so I have
a patch to show.

Cheers,
Ben.


