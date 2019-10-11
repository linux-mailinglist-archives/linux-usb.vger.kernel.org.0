Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36EA8D41F5
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 15:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfJKN7d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 09:59:33 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:57526 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbfJKN7d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 09:59:33 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BDwTBK180874;
        Fri, 11 Oct 2019 13:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=huGCe1NFsqeVYMKiffgQPI6TnazS1IVvNrkquwMFHUI=;
 b=RHtJ2w9GSI5UE6JkI/Dz7sY/9KegVN5Cos1/k8WEmjvyetOxF32tbNCsUhNnVaUOidEg
 p8L/24vzSKN51ytLAC/tvfnpd35tp1NTjxfcqxR53KVBIpeBtHr0U9H7gsr3EnujuA0Y
 r+k5a+Bi5Vro7NLaFZ5Hxb97rzq6AdnBi0N+KMqXXOwJaEWLYcdutZzCP4E94Osoz/6b
 KFhhbi7x0PGrzI/xiWAji5pkIDJNTQSlCi0CbROb7oQhEX95AOjrTq6ELJBZGUE8ATIV
 C2+tZGwWNbvY8kbfAm7NIq0QGd0B/9xmNQdb2XINzirVaNc4TJxMmY3IpJh1Z/DMvi52 yQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 2vek4r1vx6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 13:59:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BDvig5046591;
        Fri, 11 Oct 2019 13:59:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2vje2y2dys-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 13:59:15 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9BDxDuq000425;
        Fri, 11 Oct 2019 13:59:13 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Oct 2019 13:59:12 +0000
Date:   Fri, 11 Oct 2019 16:58:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     walter harms <wharms@bfs.de>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] USB: legousbtower: fix a signedness bug in tower_probe()
Message-ID: <20191011135855.GE4774@kadam>
References: <20191011133525.GB22905@mwanda>
 <5DA088DE.5040902@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5DA088DE.5040902@bfs.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910110131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910110131
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 03:51:26PM +0200, walter harms wrote:
> 
> 
> Am 11.10.2019 15:35, schrieb Dan Carpenter:
> > The problem is that sizeof() is unsigned long so negative error codes
> > are type promoted to high positive values and the condition becomes
> > false.
> > 
> > Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/usb/misc/legousbtower.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
> > index 9d4c52a7ebe0..835908fe1e65 100644
> > --- a/drivers/usb/misc/legousbtower.c
> > +++ b/drivers/usb/misc/legousbtower.c
> > @@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
> >  				  get_version_reply,
> >  				  sizeof(*get_version_reply),
> >  				  1000);
> > -	if (result < sizeof(*get_version_reply)) {
> > +	if (result < 0 || result < sizeof(*get_version_reply)) {
> >  		if (result >= 0)
> >  			result = -EIO;
> >  		dev_err(idev, "get version request failed: %d\n", result);
> 
> i am not an USB expert but it seems that this is a complicated way
> to check for result != sizeof(*get_version_reply).

Yeah.  You're right.  That would look nicer.  I will resend.

regards,
dan carpenter

