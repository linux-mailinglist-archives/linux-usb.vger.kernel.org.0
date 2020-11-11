Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852F42AFA12
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 21:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgKKUy7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 11 Nov 2020 15:54:59 -0500
Received: from avasout03.plus.net ([84.93.230.244]:50366 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgKKUy7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 15:54:59 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id cx8pkTab299nqcx8qkk3O6; Wed, 11 Nov 2020 20:54:57 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Uoz4y94B c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=MOS07L66SwNxSSy3wqEA:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>                   <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>                <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>           <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>             <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>           <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>         <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>       <00e801d6b842$583be180$08b3a480$@perdrix.co.uk> <041a2141dd5c2fa15f47930b2be0a8c7e2c3c262.camel@suse.com>
In-Reply-To: <041a2141dd5c2fa15f47930b2be0a8c7e2c3c262.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Wed, 11 Nov 2020 20:54:55 -0000
Message-ID: <004a01d6b86c$e9d816c0$bd884440$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Content-Language: en-gb
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnckwGXgCQAAlQ669aqof7hMA==
X-CMAE-Envelope: MS4wfK0WQogsVZQQ5Alae4Nm0OQGdNQZoM/yLODF83mVng8kSEMKWCnQS8YUW2Hbp2/waUvAn2dgY5TgNJWisKmoa/RR4fAri3c/VUVNYPc1k49ziKntDpQg
 gG8g/Jtg9yIVSijSKgMC3keJ3SaDv6Y08KVOEpzyQNWl4e0s4JKVgyUD6unT47pJj8SXPr4qPzPX5w==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I think I need the remedial course ...  I've never done that!

D

-----Original Message-----
From: Oliver Neukum [mailto:oneukum@suse.com] 
Sent: 11 November 2020 19:18
To: David C. Partridge; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

Am Mittwoch, den 11.11.2020, 15:50 +0000 schrieb David C. Partridge:
> Oliver I'd love to test your patch - theres only one catch - I haven't a clue how to begin to do that.
> 
> I managed to install LUbuntu 20.04.1 but applying source patches to the kernel is a bit beyond my skill level.

Hi,

do you need general help building a kernel or is there a specific
issue?

> PS out of curiosity why 'k' for doesn't support Write Same?

We are running out of letters for quirks.

	Regards
		Oliver


