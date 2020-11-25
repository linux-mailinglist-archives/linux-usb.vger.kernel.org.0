Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 866052C4014
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 13:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729298AbgKYMZ5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 25 Nov 2020 07:25:57 -0500
Received: from avasout06.plus.net ([212.159.14.18]:46248 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729009AbgKYMZ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Nov 2020 07:25:57 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id htrtkTJUehO4Hhtruksqe6; Wed, 25 Nov 2020 12:25:54 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=SPPZqNnH c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=Qtdqo1-JAAAA:8 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8
 a=76T4Lu97vV_dSrG8QmIA:9 a=QEXdDO2ut3YA:10 a=vGpKUukCtIIA:10
 a=KQnVc8Q3aC4A:10 a=U-PZt_B313byXpOkoA_-:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>                 <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>                 <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>         <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>         <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>         <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk> <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
In-Reply-To: <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Wed, 25 Nov 2020 12:25:53 -0000
Message-ID: <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnck6rWzrZA
Content-Language: en-gb
X-CMAE-Envelope: MS4wfEg7dI2wLSCrZN3q0wYr5JiMHUbNAaCdHJ5W2Hi1rKWwdX2okaYnw+S/0ZRTg/tLJcXJ5r6WbgELvex2o0Y98wQfUdFrnZOCz0iqFBDOoMei8QOaKIm7
 mxbQqsfeCz9cr1eN01wu15SBQ4OtYRoKqur1dliCPHelPqVEXzVTJGqpvjesHuOEC/1UoCtqbz7Upg==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver

I'm still trying to build a kernel with your patch applied but my Ubuntu system isn't cooperating :(

See the sorry story at https://ubuntuforums.org/showthread.php?t=2453530

Regards and thank you again.
David

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


