Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900342AB434
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 10:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgKIJ7J convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 9 Nov 2020 04:59:09 -0500
Received: from avasout03.plus.net ([84.93.230.244]:43640 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbgKIJ7I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 04:59:08 -0500
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 04:59:07 EST
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id c3phkQKUr99nqc3pjkiee0; Mon, 09 Nov 2020 09:51:36 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Uoz4y94B c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=FHr0T8F4GdMKzu9qLZQA:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk> <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
In-Reply-To: <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Mon, 9 Nov 2020 09:51:29 -0000
Message-ID: <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Content-Language: en-gb
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3qxVtG9A=
X-CMAE-Envelope: MS4wfHNWw/GHDNjzZoViyGJ4eskoIbGJoPlYx5ot5lCOQAjKlSrCFIgjhl3hxoRVT+2Jm2NOCwoMZ9d2gUwBBjCG2H6hiZqyc1ihU2mqHJRHTu5eeNLp132Y
 Gr/oJM5IQgFde1TWr0wFZR6Bq4nsav62jj4Tn08qARei87LQf8hW3Nw9wRGYlGp+G9dyFZTYeZhkmQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm sure you are right in your diagnosis (absent any knowledge to the contrary).

Now what's the treatment?  

Would uas black-list provide a work-araound? If so a detailed recipe will be needed by me ...

Fix to the code? Ideal, but takes lots longer, so a work-around may be needed for a while

David


-----Original Message-----
From: Oliver Neukum [mailto:oneukum@suse.com] 
Sent: 09 November 2020 09:30
To: David C. Partridge; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

Am Sonntag, den 08.11.2020, 10:56 +0000 schrieb David C. Partridge:
> LUbuntu 20.04.1
> 
> root@charon:/home/amonra# lsusb
> Bus 002 Device 006: ID 059f:105f LaCie, Ltd 2Big Quadra USB3
> 
> Trying to format the above drive using mkfs.ext4 /dev/sdc2
> 
> Initially got a 120s Kernel timeout which I resolved by setting the timeout
> to 0
> 
> However I got LOTS of message groups in the system log looking like this:
> 
> Nov 04 06:18:51 charon kernel: scsi host5: uas_eh_device_reset_handler start
> Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#0 uas_zap_pending 0
> uas-tag 1 inflight: 
> Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#0 CDB: Write Same(10)
> 41 00 e8 ea 47 fc 00 00 04 00

Write Same? What you are seeing is that the error handling is running
non-stop. I suspect that the device does not understand WRITE SAME.

	Regards
		Oliver


