Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0AE22C5151
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 10:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbgKZJdG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 26 Nov 2020 04:33:06 -0500
Received: from avasout07.plus.net ([84.93.230.235]:51390 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731381AbgKZJdF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Nov 2020 04:33:05 -0500
Received: from APOLLO ([212.159.61.44])
        by smtp with ESMTPA
        id iDe9kIY1hoEd7iDeBkmc7L; Thu, 26 Nov 2020 09:33:04 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Kp/WJVeN c=1 sm=1 tr=0
 a=AGp1duJPimIJhwGXxSk9fg==:117 a=AGp1duJPimIJhwGXxSk9fg==:17
 a=IkcTkHD0fZMA:10 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=Qtdqo1-JAAAA:8
 a=QdM4vIobV1rbPtMDX0kA:9 a=QEXdDO2ut3YA:10 a=vGpKUukCtIIA:10
 a=KQnVc8Q3aC4A:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=AjGcO6oz07-iQ99wixmX:22
 a=U-PZt_B313byXpOkoA_-:22
X-AUTH: perdrix52@:2500
From:   "David C. Partridge" <david.partridge@perdrix.co.uk>
To:     "'Oliver Neukum'" <oneukum@suse.com>, <linux-usb@vger.kernel.org>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>                      <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>                       <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>                 <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>               <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>                 <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>         <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>       <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk> <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>
In-Reply-To: <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>
Subject: RE: Issues with LaCie USB3 drive and UAS
Date:   Thu, 26 Nov 2020 09:33:02 -0000
Message-ID: <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: 8BIT
X-Mailer: Microsoft Outlook 14.0
Content-Language: en-gb
Thread-Index: AQEj7PcoQVookx4f1d3/LPoLd4O7AAH2dKS3AXO3T8ACPDV8AQK5Jqf9AfTPe88CoAnckwML8I43Acv3vzeqsXHNEA==
X-CMAE-Envelope: MS4wfKQgc+WZlVMFXW50m+nXvB9BJET+Of/Z9F62vi6onimynDNBag3Rqq8ZZAXDy8LNs8LMJ07LlKvi+loWm7USpvPEYkfao8y5jjMT8q3vOD7NhbQr2rMl
 t1qzBbez1B2KXnt6P4RwD/0bhfQhDOyC7ulTdD3ZzWVx4JF1+diEcUcw5U1xP92yfYpXrtN1jv91JQ==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I tried that but that wiped out the debian folder :(

-----Original Message-----
From: Oliver Neukum [mailto:oneukum@suse.com] 
Sent: 26 November 2020 08:25
To: David C. Partridge; linux-usb@vger.kernel.org
Subject: Re: Issues with LaCie USB3 drive and UAS

Am Mittwoch, den 25.11.2020, 12:25 +0000 schrieb David C. Partridge:
> Hi Oliver
> 
> I'm still trying to build a kernel with your patch applied but my Ubuntu system isn't cooperating :(
> 
> See the sorry story at 
> https://ubuntuforums.org/showthread.php?t=2453530make ARCH=x86 mrproper
Try using

make ARCH=x86 mrproper

right before

LANG=C fakeroot debian/rules binary

	HTH
		Oliver


