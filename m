Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F174307308
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 10:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhA1Jmf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 04:42:35 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:55302 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbhA1JiO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 04:38:14 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9DtJp014317;
        Thu, 28 Jan 2021 09:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=atZj01cJfkidzySXjXsuRWJq8wRW5TFiP6hnSKOyVAg=;
 b=NfVs/QMZXJNwD/kdxlZgWFTR8TxvdD/8+amaCaWzkuprlPBXEVWMQayXMINY6o577Rf+
 XTeLT8b3/22zjfjsHchy90CNUhYkzUQKUC1dQiLptpq3YF4BJNCtwq+QUU5DcyiYEaoE
 9z6AjMpgYWapNB5f8PR+qPeKWS4GqXTGiAiu9WL4SDV08VX/maR7DwBy1vM17d/WtTH+
 pggeTFeUbtwYIGsOGofjKqgSRYR20Rr8vhwo4KTID/8CEhmXrZ7zGce2irFKr+TJRQ7X
 Dl05tjyIzA9XEXoD0dUQnfBhShwPSZgu6gsPcFT87eSD7DpwrVh+E42KkiUJb/7iUEvo WQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 368b7r36jj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 09:37:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10S9GEQC156326;
        Thu, 28 Jan 2021 09:35:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 368wr02pv1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 09:35:30 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10S9ZTtP029490;
        Thu, 28 Jan 2021 09:35:29 GMT
Received: from mwanda (/10.175.203.176)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 28 Jan 2021 01:35:28 -0800
Date:   Thu, 28 Jan 2021 12:35:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: serial: mos7720: Fix error code in mos7720_write()
Message-ID: <YBKFW60qMJbtjvum@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280048
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9877 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101280048
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This code should return -ENOMEM if the kmalloc() fails but instead
it returns success.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The first error path is probably wrong as well?

drivers/usb/serial/mos7720.c
  1077          /* try to find a free urb in the list */
  1078          urb = NULL;
  1079  
  1080          for (i = 0; i < NUM_URBS; ++i) {
  1081                  if (mos7720_port->write_urb_pool[i] &&
  1082                      mos7720_port->write_urb_pool[i]->status != -EINPROGRESS) {
  1083                          urb = mos7720_port->write_urb_pool[i];
  1084                          dev_dbg(&port->dev, "URB:%d\n", i);
  1085                          break;
  1086                  }
  1087          }
  1088  
  1089          if (urb == NULL) {
  1090                  dev_dbg(&port->dev, "%s - no more free urbs\n", __func__);
  1091                  goto exit;

Should return -ENODEV?

  1092          }

 drivers/usb/serial/mos7720.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index ed347a6d50ba..aa55169796a3 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -1094,8 +1094,10 @@ static int mos7720_write(struct tty_struct *tty, struct usb_serial_port *port,
 	if (urb->transfer_buffer == NULL) {
 		urb->transfer_buffer = kmalloc(URB_TRANSFER_BUFFER_SIZE,
 					       GFP_ATOMIC);
-		if (!urb->transfer_buffer)
+		if (!urb->transfer_buffer) {
+			bytes_sent = -ENOMEM;
 			goto exit;
+		}
 	}
 	transfer_size = min(count, URB_TRANSFER_BUFFER_SIZE);
 
-- 
2.29.2

