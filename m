Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385D0326B15
	for <lists+linux-usb@lfdr.de>; Sat, 27 Feb 2021 02:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhB0Bz2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 26 Feb 2021 20:55:28 -0500
Received: from mail.msweet.org ([173.255.209.91]:53292 "EHLO mail.msweet.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229864AbhB0Bz1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Feb 2021 20:55:27 -0500
Received: from [172.20.10.13] (unknown [67.69.69.155])
        by mail.msweet.org (Postfix) with ESMTPSA id 11F3880858;
        Sat, 27 Feb 2021 01:54:47 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (1.0)
Subject: Re: proposal: move Linux userspace USB gadget projects to linux-usb GitHub organisation?
From:   Michael Sweet <msweet@msweet.org>
In-Reply-To: <f89e3e5b5e25b89a603e2d97542d60461b429910.camel@bonedaddy.net>
Date:   Fri, 26 Feb 2021 20:54:45 -0500
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matt Porter <mporter@kernel.crashing.org>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Karol Lewandowski <k.lewandowsk@samsung.com>,
        linux-usb@vger.kernel.org
Message-Id: <07846969-5243-4272-B27A-F821E8810856@msweet.org>
References: <f89e3e5b5e25b89a603e2d97542d60461b429910.camel@bonedaddy.net>
To:     Paul Wise <pabs3@bonedaddy.net>
X-Mailer: iPad Mail (18D52)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Paul,

> On Feb 26, 2021, at 8:08 PM, Paul Wise <pabs3@bonedaddy.net> wrote:
> 
> ﻿On Fri, 2021-02-26 at 14:24 -0500, Mike Sweet wrote:
> 
>> Paul, please add me (GitHub user michaelrsweet)
> 
> Invited, you should get an email about it.

Yes, thank you!

>> I’m gearing up to work on the USB gadget documentation
> 
> I guess you mean the documentation in the Linux kernel repository,
> I assume that the libusbgx/gt/gadgetd docs could use some work too.

Primarily the first, but I’ll likely create libusbgx examples.

>> Implementing IPP-USB has been an interesting challenge
> 
> Are talking about a IPP-USB device implementation?
> I can't find your implementation on your GitHub account,
> could you provide a link, or is the code proprietary?

It will soon show up in the PAPPL project alongside the other USB gadget bits. I’ve been prototyping in a private repo in preparation for adding it to PAPPL...

____________________
Michael Sweet
