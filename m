Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 104735C9C3
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 09:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfGBHHv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 03:07:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:45786 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725802AbfGBHHu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 03:07:50 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B8490AFB1;
        Tue,  2 Jul 2019 07:07:49 +0000 (UTC)
Message-ID: <1562050423.5819.1.camel@suse.com>
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
From:   Oliver Neukum <oneukum@suse.com>
To:     JC Kuo <jckuo@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>
Cc:     usb-storage@lists.one-eyed-alien.net, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Date:   Tue, 02 Jul 2019 08:53:43 +0200
In-Reply-To: <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
         <20190701085248.GA28681@kroah.com>
         <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 02.07.2019, 10:36 +0800 schrieb JC Kuo:

> An user might want to completely disable uas for some reason so he/she adds "blacklist uas" to modprobe conf file. I think in case of this, usb-storage driver has to enable this device with the legacy Bulk-only protocol instead of ignoring the device.
> 
> As an alternative to this patch, I thought I could get uas driver loaded before usb-storage driver so I tried moving the functions in drivers/usb/storage/uas-detect.h into uas.c and letting usb-storage links uas_use_uas_driver() of uas.ko. However, that didn't work because uas driver actually depends on usb-storage driver for usb_stor_adjust_quirks(). There will be a recursive dependency.
> 
> Please let me know if there is better approach to avoid the issue.

Use US_FL_IGNORE_UAS. You can trigger this with a module parameter.
We cannot just use another driver because the user block a module
load.

	Regards
		Oliver

