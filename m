Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297AF2ABFBA
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 16:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730637AbgKIPVH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 9 Nov 2020 10:21:07 -0500
Received: from avasout04.plus.net ([212.159.14.19]:37535 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIPVG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 10:21:06 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id c8ydkR92zrXCcc8yekQeH3; Mon, 09 Nov 2020 15:21:05 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Q+xJH7+a c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=P1kZ4gAsAAAA:8 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8
 a=Lkthg0g8UsnYpIhIs2EA:9 a=QEXdDO2ut3YA:10 a=fn9vMg-Z9CMH7MoVPInU:22
 a=AjGcO6oz07-iQ99wixmX:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>         <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>         <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk> <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com> <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
In-Reply-To: <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Mon, 9 Nov 2020 15:21:03 -0000
Message-ID: <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9quJ3XdA=
Content-Language: en-gb
X-CMAE-Envelope: MS4wfAsyNjhQ3UYRGmriDaX5fDovlTY+ziC2OR26pa9ludB/MS4+Y8lQE/cQPl6ozLM8gz6hCI4c5u1FmCMuKNZd9rL5lJUmS1wnLFm/geQDDSsgZAV5L0yi
 OZmsR4JsPQIK5LQVGDHb6i49fwJmYHKtV380q1KKhFskFu+U6JZMTMWZWeMuvxo969YVzuMBJwkSEw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Update: I found out how to do it! 

Created /etc/modprobe.d/blacklist_uas.conf containing text:

options usb-storage quirks=059f:105f:u

followed by: update-initramfs -u
and rebooted.

Now the device works fine and mkfs.ext4 finishes in seconds rather than hours.

David
-----Original Message-----
From: David C. Partridge [mailto:david.partridge@perdrix.co.uk] 
Sent: 09 November 2020 11:21
To: 'Oliver Neukum'; linux-usb@vger.kernel.org
Subject: RE: Issues with LaCie USB3 drive and UAS

Please could I ask you to provide detailed instructions on how to blacklist UAS for just this device?

Thanks
Daivd

-----Original Message-----
From: Oliver Neukum [mailto:oneukum@suse.com] 
Sent: 09 November 2020 10:14
To: David C. Partridge; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

Am Montag, den 09.11.2020, 09:51 +0000 schrieb David C. Partridge:
> I'm sure you are right in your diagnosis (absent any knowledge to the contrary).

It is a guess, merely. Based on long woefull experience with the
quality of some hardware.

> Now what's the treatment?

Use WRITE, not WRITE SAME. That is a task of the SCSI layer, not UAS.

> Would uas black-list provide a work-araound? If so a detailed recipe will be needed by me ...

Indirectly. The storage driver sets no_write_same. UAS does not. It
looks like UAS will need a kernel patch for that.

> Fix to the code? Ideal, but takes lots longer, so a work-around may be needed for a while

Very well. For experimentation, please try blacklisting UAS. If that
fails I have guessed wrong. If it works, I will make a test patch.

	Regards
		Oliver


