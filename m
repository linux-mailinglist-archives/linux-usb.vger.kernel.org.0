Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47FF897CCF
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 16:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbfHUOZZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 10:25:25 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:53328 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729022AbfHUOZZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 10:25:25 -0400
Received: (qmail 2823 invoked by uid 2102); 21 Aug 2019 10:25:24 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Aug 2019 10:25:24 -0400
Date:   Wed, 21 Aug 2019 10:25:24 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: f_mass_storage vs drivers/target
In-Reply-To: <8b5d460e023284a803d5f448655d5c20de711f12.camel@kernel.crashing.org>
Message-ID: <Pine.LNX.4.44L0.1908211024380.1816-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 21 Aug 2019, Benjamin Herrenschmidt wrote:

> Hi folks !
> 
> It seems that f_mass_storage duplicates (well maybe predates too..) a
> lot of what's in drivers/target.
> 
> Anybody working on implementing a new version of f_mass_storage that
> is layered upon drivers/target instead ? That would bring quite a lot
> of additional functionality.

That's what f_tcm does.

Alan Stern

> If not, I might look into it.
> 
> Cheers,
> Ben.

