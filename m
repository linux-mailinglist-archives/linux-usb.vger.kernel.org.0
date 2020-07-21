Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7202227A15
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 10:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgGUIBk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 04:01:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:59328 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728077AbgGUIBk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jul 2020 04:01:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 31A34AFCD;
        Tue, 21 Jul 2020 08:01:46 +0000 (UTC)
Message-ID: <1595318497.29149.3.camel@suse.de>
Subject: Re: System crash/lockup after plugging CDC ACM device
From:   Oliver Neukum <oneukum@suse.de>
To:     David Guillen Fandos <david@davidgf.net>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Date:   Tue, 21 Jul 2020 10:01:37 +0200
In-Reply-To: <ed743fe1e0ede6d37bc4a62ba704f51c54c2f5bf.camel@davidgf.net>
References: <9778f9b8a8604e2c13979ea6909678c23cd286cb.camel@davidgf.net>
         <20200715093029.GB2759174@kroah.com>
         <867592c41350b09a0cb67e9a3924f8a2f758d79a.camel@davidgf.net>
         <20200715105034.GB2880893@kroah.com>
         <956ec3169eec6b121339ed6c1aedd0f7ca08db43.camel@davidgf.net>
         <20200715111210.GA2892661@kroah.com>
         <ed743fe1e0ede6d37bc4a62ba704f51c54c2f5bf.camel@davidgf.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 15.07.2020, 13:20 +0200 schrieb David Guillen Fandos:
> Shouldn't the kernel be resilient to such devices? I've developed quite
> a few USB devices in the past and I've never ran into things like this
> on Linux


Yes. Unfortunately we do not know which module is crashing here.
It may be as simple as CDC-ACM retrying without a delay or giving
up. Or this is in usbcore. Could you initially try without
CDC-ACM, so we can narrow this down? And tehn we can try with
dynamic debugging or thought what can be done.

And thank you for identifying the root cause for the malfunction.
Yet you are clearly right that even such a device should not crash the
kernel.

	Regards
		Oliver

