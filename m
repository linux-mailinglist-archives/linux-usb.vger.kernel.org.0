Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2E919F795
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 16:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgDFOHi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 10:07:38 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:55238 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgDFOHi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 10:07:38 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036E40CM119222;
        Mon, 6 Apr 2020 14:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=oTZDxXWjWP250XQkePYQK4cixIRkiqHu4lL7I+5tevk=;
 b=kSNAE9abcJFAsnOfqYW3gBEpxg+MvsJ6xoD3yMqFbf9Hab59dVyAuXC2WXhHRQms+/nW
 8cKWvTNXVLyAUDQ+zy+gu8v0fViHyWG+x6Nu7Ck+hEsp6XzQp2LqWD/KzjJNw59/ztHY
 joRJQyoWgZ16G9FugwllAP4YjNFuRWdxTOPiIvDywzVJqBsSJa3706Oi9DvK2K0hVJ1y
 iSkZ5HAerAs+iS0YSeMlOnbAyAVRSAxhSn2rdH6O0ENbgldJz8y/Epq50kx4F8/DvNFH
 oET4K/gNZOxRZRg3IPyVya2hcNQTl0xDI/dHGvTB9/s3G5XgdYEwtf1XqTpx+M6pLvTl Hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 306hnqy2hj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 14:07:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036E7Vrs105605;
        Mon, 6 Apr 2020 14:07:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 30741angxq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 14:07:35 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 036E7XEX006749;
        Mon, 6 Apr 2020 14:07:33 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 Apr 2020 07:07:33 -0700
Date:   Mon, 6 Apr 2020 17:07:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: [bug report] usb: gadget: add raw-gadget interface
Message-ID: <20200406140726.GK2066@kadam>
References: <20200406105545.GA35744@mwanda>
 <CAAeHK+xRnfxJwbPapPJv6LhE5xKiELEKc6ThTgSchkE+6y+wJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+xRnfxJwbPapPJv6LhE5xKiELEKc6ThTgSchkE+6y+wJw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=853
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 mlxlogscore=907
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060118
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 06, 2020 at 03:06:12PM +0200, Andrey Konovalov wrote:
> On Mon, Apr 6, 2020 at 12:55 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Hello Andrey Konovalov,
> >
> > The patch f2c2e717642c: "usb: gadget: add raw-gadget interface" from
> > Feb 24, 2020, leads to the following static checker warning:
> >
> >     drivers/usb/gadget/legacy/raw_gadget.c:102 raw_event_queue_fetch() warn: inconsistent returns 'queue->sema'.
> >       Locked on  : 96,102
> >       Unlocked on: 93
> >
> > drivers/usb/gadget/legacy/raw_gadget.c
> >     81  static struct usb_raw_event *raw_event_queue_fetch(
> >     82                                  struct raw_event_queue *queue)
> >     83  {
> >     84          unsigned long flags;
> >     85          struct usb_raw_event *event;
> >     86
> >     87          /*
> >     88           * This function can be called concurrently. We first check that
> >     89           * there's at least one event queued by decrementing the semaphore,
> >     90           * and then take the lock to protect queue struct fields.
> >     91           */
> >     92          if (down_interruptible(&queue->sema))
> >     93                  return NULL;
> >     94          spin_lock_irqsave(&queue->lock, flags);
> >     95          if (WARN_ON(!queue->size))
> >     96                  return NULL;
> >
> > I'm going to have investigate to see why Smatch doesn't complain that
> > we have disabled IRQs on this path...  Anyway, this doesn't seem like it
> > can be correct.  I get that this is a WARN_ON() path, but we're leaving
> > the computer in a very screwed up state we don't at least enable IRQs.
> 
> Hi Dan,
> 
> Oh, right, I'll send a patch to add spin_lock_irqsave() there.
> 
> I don't really get the warning about queue->sema though, is there
> something wrong with it, or is it actually a warning about
> queue->lock?

The rule here is that we return NULL here and on line 93, so how does
the caller know if we took that "queue->sema" lock?

regards,
dan carpenter

