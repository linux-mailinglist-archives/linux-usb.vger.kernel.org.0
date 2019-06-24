Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFCD850DAE
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 16:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfFXOSZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jun 2019 10:18:25 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60976 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbfFXOSZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jun 2019 10:18:25 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OEDQDU009723;
        Mon, 24 Jun 2019 14:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2018-07-02;
 bh=RbDRLma835IlJeqe+MJtiKqSRRiA2qhcegaKgFHofC8=;
 b=kS1hWSBykW24+wiKxP75fYa+eVLxvDa6KXNoHrkjxjm+EXFqVOfnpuqOKRqypfQACaWI
 GJtUAYkn3uZNrUVmNl1VbbsOq49t+AliVwuqQeMzUCOnv+dqqCodY6zHhGwoQiK2Gb0d
 5nf6wRS7YPhUzxeoARiHOcv8klgWZ/Dk77wAKn19WvUMo9+zLKImAyWmakLrBOEr1Ece
 RDcZwiv+4lIsTYFAYU8W/vJnJsBVWNyAgp0lfBZ0oJD2tuUk2e4lQ/408IoAzFDFPg8k
 ZWwsTgpkMOiErILH4TJam+cIpsYUu7sg4zuNcU64Gj8WDshO5bQKWlVkBpt2iCFdyrdU og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2t9brsxqtw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Jun 2019 14:18:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OEEgVB118192;
        Mon, 24 Jun 2019 14:16:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 2t9p6tky8u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Jun 2019 14:16:12 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5OEGBWM031469;
        Mon, 24 Jun 2019 14:16:11 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 24 Jun 2019 07:16:10 -0700
Date:   Mon, 24 Jun 2019 17:16:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mirq-linux@rere.qmqm.pl
Cc:     linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: gadget: u_serial: process RX in workqueue
 instead of tasklet
Message-ID: <20190624141600.GT18776@kadam>
References: <20190624123258.GA31097@mwanda>
 <20190624134154.GA3953@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190624134154.GA3953@qmqm.qmqm.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240117
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 24, 2019 at 03:41:54PM +0200, mirq-linux@rere.qmqm.pl wrote:
> On Mon, Jun 24, 2019 at 03:32:58PM +0300, Dan Carpenter wrote:
> > Hello Michał Mirosław,
> > 
> > This is a semi-automatic email about new static checker warnings.
> > 
> > The patch 8b4c62aef6f6: "usb: gadget: u_serial: process RX in
> > workqueue instead of tasklet" from Dec 16, 2018, leads to the
> > following Smatch complaint:
> [...] 
> >    431		/* We want our data queue to become empty ASAP, keeping data
> >    432		 * in the tty and ldisc (not here).  If we couldn't push any
> >    433		 * this time around, RX may be starved, so wait until next jiffy.
> >    434		 *
> >    435		 * We may leave non-empty queue only when there is a tty, and
> >    436		 * either it is throttled or there is no more room in flip buffer.
> >    437		 */
> >    438		if (!list_empty(queue) && !tty_throttled(tty))
> >                                           ^^^^^^^^^^^^^^^^^^^
> > in the original code there was check for NULL here but the patch removed
> > it.
> > 
> >    439			schedule_delayed_work(&port->push, 1);
> >    440	
> 
> Hi Dan,
> 
> The code is correct and explained in the comment above it - while() loop
> above can be exited before emptying the queue only when tty != NULL.
> 


:(  Sorry...  Smatch isn't supposed to generate those warnings.  I don't
know exactly what happened.  I thought it was because of some recent
code changes I had made but now I think it it's because my build system
had a disk failure...  Anyway, I can't reproduce the warning any more.

Thanks for looking at this.

regards,
dan carpenter

