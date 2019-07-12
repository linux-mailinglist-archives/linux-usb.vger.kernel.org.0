Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4391C664C4
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2019 04:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729071AbfGLC7U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Jul 2019 22:59:20 -0400
Received: from gate.crashing.org ([63.228.1.57]:56919 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728485AbfGLC7U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Jul 2019 22:59:20 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6C2xEJP010569;
        Thu, 11 Jul 2019 21:59:15 -0500
Message-ID: <aaf0453ce720ff7cc29de9897bdff8aae793679a.camel@kernel.crashing.org>
Subject: Re: [PATCH 00/10] usb: gadget: aspeed: Bug fixes
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Joel Stanley <joel@jms.id.au>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Fri, 12 Jul 2019 12:59:14 +1000
In-Reply-To: <20190712025348.21019-1-benh@kernel.crashing.org>
References: <20190712025348.21019-1-benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-07-12 at 12:53 +1000, Benjamin Herrenschmidt wrote:
> So I finally got back an Aspeed eval board, and thus resumed maintaining
> and handling bug reports for this driver.
> 
> This is a series that fixes a number of enumeration related issues with
> a variety of hosts, OSes, and circumstances (ie, plugging/unplugging at
> funny times, etc...).
> 
> I also added dummy support for the TT requests, it doesn't hurt as some
> host seem to send them even when TT support isn't advertized.
> 
> Most of this is bug fixes and probably shouldn't wait for another
> merge window, except possibly the last 2 patches.
> 
> v2: - Fix a space vs. tab issue in patch 2 reported by Sergei Shtylyov
>     - Put the TT patches at the end of the list as they aren't
>      as clear cut "bug fixes".

and

      - Add the f_mass_storage fix that I posted separately and
accidentaly included in this resend... the patches are completely
identical to the previously posted "v2" of those.

Cheers,
Ben.


