Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C86B19F3E6
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 12:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgDFKz5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 06:55:57 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53828 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgDFKz5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Apr 2020 06:55:57 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036ArY7p143326;
        Mon, 6 Apr 2020 10:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=JwYn2yunv96QXSp1F9XTuPw1UGimn+c4Xb86LD10VIs=;
 b=y1ozHf2wGxnSE35g3upIAIpXTaMISZm3I3ibsp5y3uTxH9KEbeGjREd08cH/8nVufFzQ
 CfwyBYT+HwrEjdQat5MKjzzGkacDjirG53qnIHy8D55EAXjmyw1MR5uhxs8EXV0Wox9n
 551Y66djrKT781k6HIUX3f6RXpWuu8V7QoF1BWbXugzOeVqpAcMoT4gnGN2sUfSGscIN
 UVj/i8AeLkUkhS5P+SnX54DsNYzB3FMoBPWikXPv5ngtIrPpWpGUUtlY2lLvp/P9cS2f
 YB1CNnszMigV34pb/71Ym1k13XecSwcOsWLsaxDzdRkPQ9ElWvX8PNuCjyMi+IDTUXyO NQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 306jvmx19x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 10:55:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 036AqZnQ114890;
        Mon, 6 Apr 2020 10:55:53 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 3073sppy4n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 Apr 2020 10:55:53 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 036Atq1U015004;
        Mon, 6 Apr 2020 10:55:52 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 Apr 2020 03:55:51 -0700
Date:   Mon, 6 Apr 2020 13:55:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     andreyknvl@google.com
Cc:     Andrey Konovalov <andreyknvl@google.com>, linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: add raw-gadget interface
Message-ID: <20200406105545.GA35744@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=3 adultscore=0 bulkscore=0 mlxlogscore=551
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004060095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9582 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=3
 mlxlogscore=599 mlxscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004060095
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Andrey Konovalov,

The patch f2c2e717642c: "usb: gadget: add raw-gadget interface" from
Feb 24, 2020, leads to the following static checker warning:

    drivers/usb/gadget/legacy/raw_gadget.c:102 raw_event_queue_fetch() warn: inconsistent returns 'queue->sema'.
      Locked on  : 96,102
      Unlocked on: 93

drivers/usb/gadget/legacy/raw_gadget.c
    81  static struct usb_raw_event *raw_event_queue_fetch(
    82                                  struct raw_event_queue *queue)
    83  {
    84          unsigned long flags;
    85          struct usb_raw_event *event;
    86  
    87          /*
    88           * This function can be called concurrently. We first check that
    89           * there's at least one event queued by decrementing the semaphore,
    90           * and then take the lock to protect queue struct fields.
    91           */
    92          if (down_interruptible(&queue->sema))
    93                  return NULL;
    94          spin_lock_irqsave(&queue->lock, flags);
    95          if (WARN_ON(!queue->size))
    96                  return NULL;

I'm going to have investigate to see why Smatch doesn't complain that
we have disabled IRQs on this path...  Anyway, this doesn't seem like it
can be correct.  I get that this is a WARN_ON() path, but we're leaving
the computer in a very screwed up state we don't at least enable IRQs.

    97          event = queue->events[0];
    98          queue->size--;
    99          memmove(&queue->events[0], &queue->events[1],
   100                          queue->size * sizeof(queue->events[0]));
   101          spin_unlock_irqrestore(&queue->lock, flags);
   102          return event;
   103  }

regards,
dan carpenter
