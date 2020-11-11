Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D832AF572
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 16:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgKKPuQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 11 Nov 2020 10:50:16 -0500
Received: from avasout03.plus.net ([84.93.230.244]:59818 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgKKPuQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Nov 2020 10:50:16 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id csNvkTFFc99nqcsNwkjtVh; Wed, 11 Nov 2020 15:50:14 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Uoz4y94B c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=wZrnlSxUMAKPaijmg88A:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>              <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>               <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>         <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>       <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>         <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk> <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
In-Reply-To: <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Wed, 11 Nov 2020 15:50:11 -0000
Message-ID: <00e801d6b842$583be180$08b3a480$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnck6rBBqvQ
Content-Language: en-gb
X-CMAE-Envelope: MS4wfAemYF2yB2LkEPpa6o7LL3ULe559Be7ABTOSuVIrfcPXnPit2Nq1XWfjn6KuxpyyelIiXV45oAviWdDf9J6ED2f8ORIGIkXS57IRxpvkBcH2guPycKXf
 vDvOWXfp57CaxWoQGaVaO8QTnPXk6dX2EO4FWWDRoDctESVLLxfQk+1cC6qaxRhPqWb+wKLfWzFrvg==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver I'd love to test your patch - theres only one catch - I haven't a clue how to begin to do that.

I managed to install LUbuntu 20.04.1 but applying source patches to the kernel is a bit beyond my skill level.

PS out of curiosity why 'k' for doesn't support Write Same?

D.

-----Original Message-----
From: Oliver Neukum [mailto:oneukum@suse.com] 
Sent: 11 November 2020 11:44
To: David C. Partridge; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

Am Montag, den 09.11.2020, 15:21 +0000 schrieb David C. Partridge:
> Update: I found out how to do it! 
> 
> Created /etc/modprobe.d/blacklist_uas.conf containing text:
> 
> options usb-storage quirks=059f:105f:u
> 
> followed by: update-initramfs -u
> and rebooted.
> 
> Now the device works fine and mkfs.ext4 finishes in seconds rather than hours.

Hi,

this is good for now. Could you test the attached patch and replace the "u" in your module options for usb-storage with a "k" (for the new quirk)?

	Regards
		Oliver


