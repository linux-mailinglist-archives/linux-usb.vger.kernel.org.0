Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D46E9343812
	for <lists+linux-usb@lfdr.de>; Mon, 22 Mar 2021 06:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhCVE75 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Mar 2021 00:59:57 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:59488 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbhCVE7e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Mar 2021 00:59:34 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12M4wgXw167323;
        Mon, 22 Mar 2021 04:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=e0QZbi+ogjNgTtT03Dw2WM7UkOLEmg601/DpbmBxh1A=;
 b=lwO0sRnzxrUFoVeaIna0oVDOGh+jiSKnlusCsL6NZe/RLXkTGGYWwjEu07UBbiMo3t91
 uNsUYyQiEo4lmlCZMneWICbk3HXJqyqNn3JBi+mdTS5dOAzvQ2YM7XkW4BVHqlkbTOhd
 WEDpSRGQ6kwvewKfewVPBJMN/6CO3a/YAj3iKuhnP2G36YQPUBDz/mamVvnQLmYFaXdd
 qhklqcSIYYgWlHNq46WGbBWorkK6ERoLi03u/BNVLNhOMZz4TyzC8COa1UpTC0cFX/a2
 EQfoTqJi7URLZrV5BIdrOsIvsEh9hki1AXMHtT1ohnEi5E4qpa62H8cy7CpxHetAzIoU Gg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 37d8fr2ad0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Mar 2021 04:59:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12M4uXpA003663;
        Mon, 22 Mar 2021 04:59:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 37dtyvmhbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Mar 2021 04:59:05 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 12M4wwwI006894;
        Mon, 22 Mar 2021 04:59:00 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 22 Mar 2021 04:58:58 +0000
Date:   Mon, 22 Mar 2021 07:58:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jay Fang <f.fangjian@huawei.com>, linux-usb@vger.kernel.org,
        tangzihao1@hisilicon.com, huangdaode@huawei.com
Subject: Re: [PATCH] usb: ohci: remove unreachable
 platform_driver_unregister() call
Message-ID: <20210322045850.GA1667@kadam>
References: <1616203911-4207-1-git-send-email-f.fangjian@huawei.com>
 <20210320022443.GA591964@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320022443.GA591964@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9930 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220037
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9930 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103220038
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 19, 2021 at 10:24:43PM -0400, Alan Stern wrote:
> On Sat, Mar 20, 2021 at 09:31:51AM +0800, Jay Fang wrote:
> > From: Zihao Tang <tangzihao1@hisilicon.com>
> > 
> > Fix the following smatch warnings:
> > 
> > drivers/usb/host/ohci-hcd.c:1318 ohci_hcd_mod_init() warn:
> > ignoring unreachable code.
> > 
> > platform_driver_register(&TMIO_OHCI_DRIVER) is the last
> > platform_driver_register() call in ohci_hcd_mod_init(), so if it
> > failed, there's no need to unregister it, but just goto error_tmio.
> > 
> > So remove the unreachable platform_driver_unregister(&TMIO_OHCI_DRIVER).
> > No functionality change.
> 
> Doesn't the compiler realize that the call is unreachable, and 
> therefore avoid generating any object for it?
>

This is a static checker warning.  For example, Heart Bleed bug was an
ignored unreachable code static checker warning.

> It's true that the function call is, strictly speaking, unnecessary.  
> However, it provides a pleasing symmetry and it acts as a guide in the 
> unlikely event that anyone wants to add another platform-specific 
> driver in the future.

Hopefully future programmers can figure out basic stuff like that.

This code doesn't trigger a Smatch warning on my .config because the
Smatch check doesn't warn if the previous line was an #endif.  On the
other hand, the ifdefs are also why I forwarded the email when I saw the
warning from kbuild.  Normally kbuild is better at picking the person
to blame but because this is a .config thing that confused it.  Anyway,
I glanced at the warning and thought it looked suspicious enough to
warrant a further look.

When I first wrote the Smatch unreachable code warning there were a
handful of places which used that style of code:

	return 0;

	unreachable_release();
err_release:
	release_something();

I just left those as-is because it was obvious to me that it was done
intentionally.  However, it seems that other people have removed all of
those behind my back so I can't find an example of this now except for
in ohci_hcd_mod_init().

Anyway, I would have put a special case to silence these false positives
but it wasn't common practice in 2014 and no one does it these days.

regards,
dan carpenter

