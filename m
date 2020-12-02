Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D942CBE8B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 14:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbgLBNjv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 2 Dec 2020 08:39:51 -0500
Received: from avasout01.plus.net ([84.93.230.227]:36082 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgLBNju (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Dec 2020 08:39:50 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id kSLXkpliRn8O7kSLYkZJy6; Wed, 02 Dec 2020 13:39:04 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Ld6nFgXi c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=mKDHlbYVa075hN77HYoA:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>                                      <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>                                       <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>                                 <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>                               <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>                                 <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>                         <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>                       <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>                 <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>                 <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>         <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>         <000001d6c89c$086812e0$193838a0$@perdrix.co.uk> <612be9a9cd6ffdb9492781e174859c7b4e694a86.camel@suse.com>
In-Reply-To: <612be9a9cd6ffdb9492781e174859c7b4e694a86.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Wed, 2 Dec 2020 13:39:03 -0000
Message-ID: <002201d6c8b0$802b02b0$80810810$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnckwML8I43Acv3vzcCAy63SAJfP5HDAb+vYkUBebTJRKp+Rgog
Content-Language: en-gb
X-CMAE-Envelope: MS4wfD6eOlPpHhdl+bbJV7R0vLtRhpXa9ovXWL3dHi9wyD5TmabyTZKXoZHRFh10A10tgYd70fAnQ2lJz1WWS8wxS+8PCKEMh+qTDQg6OrggAU/7Xwk7TvYJ
 BVBLiJU4Nd6wNRvkYfWoG2fRS3ARKkIHl0xPdzdLfED69AQ5Ca5EaKSUmDDqYCu0RlL61v3Mlt5y5Q==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes I did unplug the USB cable.

I'll ask for the correct file...

Thanks
David

-----Original Message-----
From: Oliver Neukum [mailto:oneukum@suse.com] 
Sent: 02 December 2020 11:38
To: David C. Partridge; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

Am Mittwoch, den 02.12.2020, 11:12 +0000 schrieb David C. Partridge:

Hi,


> A helpful person on the Ubuntu forums sent me a patched usb-storage.ko that was built using your patch file.

that is nice to hear, sorry but I am no good with Ubuntu stuff.
However, the problem is that you need uas.ko.

The log is showing a curious failure. Did you disconnect the device?

	Regards
		Oliver


