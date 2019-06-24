Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E65150ABB
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 14:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730267AbfFXMdS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jun 2019 08:33:18 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45672 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730260AbfFXMdS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jun 2019 08:33:18 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCTeEN114758;
        Mon, 24 Jun 2019 12:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2018-07-02;
 bh=EqkBz1Q5PatuDmKX1wtpRo2bzgHsNd5UPcLRTDWpBKE=;
 b=MJuAX/QzX4TTm9guxZ21MDDxGpivf6d5Z8Q2/umRcIM44FmLLO6ryd4pnoM24bz43iUF
 ozlDG6KNpKwqzTpCqwLshiFtTmBZuckwNANyIjdRGag1GFO7gMIIUvmpfWJhEGVQJAMg
 vD2Yi1BQGiFFhGaGnBsU8ti2DOh9h7af8fCNKznNEytQBvikw6iMRCHbCeCke/KHF1nI
 IofeLp6m/idrBpGiaUT39iGr8CiY7lYXVme2cK1FxGqxVjGduGBnTnCP5/QkQW9EQwyp
 jrhdqnHILXxUHVGjpXojVDUNufiC+7uTRhY8ZirNSegz3oDMaVNPAuQ2huLD4ZNAxQpK mA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2t9brsx5d4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Jun 2019 12:33:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCVTZW120502;
        Mon, 24 Jun 2019 12:33:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2tat7bm36q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Jun 2019 12:33:06 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5OCX47j008949;
        Mon, 24 Jun 2019 12:33:05 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 24 Jun 2019 05:33:03 -0700
Date:   Mon, 24 Jun 2019 15:32:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     mirq-linux@rere.qmqm.pl
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: u_serial: process RX in workqueue instead
 of tasklet
Message-ID: <20190624123258.GA31097@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=802
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240103
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=842 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240103
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Michał Mirosław,

This is a semi-automatic email about new static checker warnings.

The patch 8b4c62aef6f6: "usb: gadget: u_serial: process RX in
workqueue instead of tasklet" from Dec 16, 2018, leads to the
following Smatch complaint:

    drivers/usb/gadget/function/u_serial.c:438 gs_rx_push()
    error: we previously assumed 'tty' could be null (see line 373)

drivers/usb/gadget/function/u_serial.c
   372			/* leave data queued if tty was rx throttled */
   373			if (tty && tty_throttled(tty))
                            ^^^^^^^^^^^^^^^^^^^^^^^^
Other checks for NULL

   374				break;
   375	
   376			switch (req->status) {
   377			case -ESHUTDOWN:
   378				disconnect = true;
   379				pr_vdebug("ttyGS%d: shutdown\n", port->port_num);
   380				break;
   381	
   382			default:
   383				/* presumably a transient fault */
   384				pr_warn("ttyGS%d: unexpected RX status %d\n",
   385					port->port_num, req->status);
   386				/* FALLTHROUGH */
   387			case 0:
   388				/* normal completion */
   389				break;
   390			}
   391	
   392			/* push data to (open) tty */
   393			if (req->actual && tty) {
   394				char		*packet = req->buf;
   395				unsigned	size = req->actual;
   396				unsigned	n;
   397				int		count;
   398	
   399				/* we may have pushed part of this packet already... */
   400				n = port->n_read;
   401				if (n) {
   402					packet += n;
   403					size -= n;
   404				}
   405	
   406				count = tty_insert_flip_string(&port->port, packet,
   407						size);
   408				if (count)
   409					do_push = true;
   410				if (count != size) {
   411					/* stop pushing; TTY layer can't handle more */
   412					port->n_read += count;
   413					pr_vdebug("ttyGS%d: rx block %d/%d\n",
   414						  port->port_num, count, req->actual);
   415					break;
   416				}
   417				port->n_read = 0;
   418			}
   419	
   420			list_move(&req->list, &port->read_pool);
   421			port->read_started--;
   422		}
   423	
   424		/* Push from tty to ldisc; this is handled by a workqueue,
   425		 * so we won't get callbacks and can hold port_lock
   426		 */
   427		if (do_push)
   428			tty_flip_buffer_push(&port->port);
   429	
   430	
   431		/* We want our data queue to become empty ASAP, keeping data
   432		 * in the tty and ldisc (not here).  If we couldn't push any
   433		 * this time around, RX may be starved, so wait until next jiffy.
   434		 *
   435		 * We may leave non-empty queue only when there is a tty, and
   436		 * either it is throttled or there is no more room in flip buffer.
   437		 */
   438		if (!list_empty(queue) && !tty_throttled(tty))
                                          ^^^^^^^^^^^^^^^^^^^
in the original code there was check for NULL here but the patch removed
it.

   439			schedule_delayed_work(&port->push, 1);
   440	

regards,
dan carpenter
