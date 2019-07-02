Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961EA5CC9C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 11:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfGBJZZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 05:25:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:44866 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725851AbfGBJZY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 05:25:24 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 5513FB150;
        Tue,  2 Jul 2019 09:25:23 +0000 (UTC)
Message-ID: <1562058690.5819.9.camel@suse.com>
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
From:   Oliver Neukum <oneukum@suse.com>
To:     JC Kuo <jckuo@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>
Cc:     usb-storage@lists.one-eyed-alien.net, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Date:   Tue, 02 Jul 2019 11:11:30 +0200
In-Reply-To: <f43e7ecf-64d5-20d2-0461-85a55fa28a33@nvidia.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
         <20190701085248.GA28681@kroah.com>
         <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
         <20190702044249.GA694@kroah.com>
         <f6ed2505-5da9-c217-a052-a19d197c5c8e@nvidia.com>
         <f43e7ecf-64d5-20d2-0461-85a55fa28a33@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 02.07.2019, 14:56 +0800 schrieb JC Kuo:
> 
> Since blacklisting uas kernel module is not a good idea and could break UAS

Then don't do it. If you don't want a driver loaded for a device
blacklisting the driver must not magically assign another driver.

> capable storage functionality, do we consider forbidding making uas driver
> as module? That means to make CONFIG_USB_UAS a bool option.

No. Absolutely not. We cannot force people to build UAS into their
kernel or not use it. Building either driver not at all, modular
or statically are all valid use cases. Just not building UAS must
trigger a fallback. And we must have a flag to override the kernel's
decision

Making driver assignments depend on module loading order is a very bad
idea. We also have the necessary quirk in one way. I would accept a
patch adding a flag to force usage of UAS, but other than that, the
existing code is as it must be.

	Regards
		Oliver

