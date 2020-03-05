Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82D7317A21B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 10:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgCEJSU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 04:18:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:40048 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgCEJSU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 04:18:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 86994AC2C;
        Thu,  5 Mar 2020 09:18:18 +0000 (UTC)
Message-ID: <1583399882.12738.30.camel@suse.com>
Subject: Re: ASM1142 USB 3.1 Gen2 controller from startech(2 port) errors
 when USB 3.1 Gen2 disk is manipulated
From:   Oliver Neukum <oneukum@suse.com>
To:     Nikolay Kichukov <hijacker@oldum.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Thu, 05 Mar 2020 10:18:02 +0100
In-Reply-To: <ce1660b5-c9f4-f0c6-d4f4-b55dc8690437@oldum.net>
References: <ce1660b5-c9f4-f0c6-d4f4-b55dc8690437@oldum.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 05.03.2020, 00:44 +0100 schrieb Nikolay Kichukov:
> So far the list of failing disks/enclosures(all USB 3.1 Gen2 compatible):
> Samsung portable T5 2TB
> IcyBox IB-366-C31 (174c:55aa ASMedia Technology Inc. Name: ASM1051E SATA
> 6Gb/s bridge, ASM1053E SATA 6Gb/s bridge, ASM1153 SATA 3Gb/s bridge,
> ASM1153E SATA 6Gb/s bridge)
> 
> Even if uas module is blacklisted and the disk initializes through
> usb-storage, the same problem appears.

Hi,

this looks like we are triggering a race in the firmware at the highest
speed. Have you tried the m and g quirk settings for storage?

If that does not help a usbmon trace of a failure will be necessary.

	Regards
		Oliver

