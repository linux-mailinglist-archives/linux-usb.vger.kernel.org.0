Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609E3303A36
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 11:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391942AbhAZK2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jan 2021 05:28:10 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:43242 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403752AbhAZK1w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jan 2021 05:27:52 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QAF7dW077028;
        Tue, 26 Jan 2021 10:27:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=hMszzc7o3jaDibInoTcGDojbcdgno/VOauM3c99sfok=;
 b=0Od+6L5wbwxbbiQqX9XXzZ557jt9G1Rc6ykEVzqoNekzr773FoOGnrf/6cwae/3/YJge
 8fcil1aCB1NzTOY3PY2CcglUUn4HHeNKnHO8PNhaFeT2aRL8siupt9drEGHRkYGBwb94
 Z17MS8tmFh8SnQmNuuxq7f/WrzrEhLPD06QorkvKfhuP3PTBx3bvZ6TdS4sF9z1TGvFC
 LWPHavcXOrh9OeURb1amJiBlARJZE6J623y2elf2QbDJfYoN4c2RzcNQzqAeMb1OEpu2
 UX36WsGROQNymCHt//LSTAO1iI4KPG3LtFiqaT4dTCNP/zuVdj7hiQipciApS1s4JDUr WA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 3689aahmg5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 10:27:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10QAGTmr022948;
        Tue, 26 Jan 2021 10:27:01 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 368wpxrne3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 10:27:01 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10QAR01x001713;
        Tue, 26 Jan 2021 10:27:00 GMT
Received: from mwanda (/10.175.186.156)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 Jan 2021 02:27:00 -0800
Date:   Tue, 26 Jan 2021 13:26:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul B Schroeder <pschroeder@uplogix.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: serial: mos7840: fix error code in mos7840_write()
Message-ID: <YA/ubifCUlJXxG5g@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260053
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9875 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260053
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This should return -ENOMEM instead of 0 if the kmalloc() fails.

Fixes: 3f5429746d91 ("USB: Moschip 7840 USB-Serial Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/serial/mos7840.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
index 23f91d658cb4..30c25ef0dacd 100644
--- a/drivers/usb/serial/mos7840.c
+++ b/drivers/usb/serial/mos7840.c
@@ -883,8 +883,10 @@ static int mos7840_write(struct tty_struct *tty, struct usb_serial_port *port,
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

