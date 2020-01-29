Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5AC814CFB0
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2020 18:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbgA2Rav (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jan 2020 12:30:51 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:50964 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgA2Rav (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jan 2020 12:30:51 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00THOBeq090532;
        Wed, 29 Jan 2020 17:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=4fZPT885TxZ35f6+rhIV3ZtDEyJ0UC5S/Wy0U+wEPS4=;
 b=sRMcaqtL6Ak8Zbxaw85wnwECGRVklof9xwk0VmfSk+2O5vPVgyMh1YI83tPG56VFw5zN
 PI0TWWswL9Ks/czkV/+ADZmAw4Z+DTrIDnuwJtz546Tel5s2nePhqCgGzQnlYUW2nJKg
 M5Q8nscyurCRFmh51BUKBwtiXhSLhEK+1l/97Dv8EnzQf2VlN0CUw+3OWKnmSSAtl6KQ
 Lele6/ew+1ui7+dMUhfAsq0Z25X9ATvDvqpTJC3NqkFlDTiqS0w2ZvOl7VwTyAKSjqwf
 UvIllTkrO/ZXovVLtOPeOg7UV3vKRAEsFeSBZe73dMidtr8oE6F4talLfj7wLa4MAKRX xw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 2xrearev32-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Jan 2020 17:30:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00THNjF7165026;
        Wed, 29 Jan 2020 17:30:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2xtmrafjxg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 29 Jan 2020 17:30:46 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00THUjoL025380;
        Wed, 29 Jan 2020 17:30:45 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 29 Jan 2020 09:30:45 -0800
Date:   Wed, 29 Jan 2020 20:30:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] USB: serial: ir-usb: Silence harmless uninitialized variable
 warning
Message-ID: <20200129173037.cvrb3lcddsml54h5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9514 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001290142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9514 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001290142
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The "actual_length" variable might be uninitialized on some failure
paths.  It's harmless but static analysis tools like Smatch complain
and at runtime the UBSan tool will likely complain as well.

Fixes: e7542bc382f8 ("USB: serial: ir-usb: make set_termios synchronous")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/serial/ir-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ir-usb.c b/drivers/usb/serial/ir-usb.c
index 79d0586e2b33..172261a908d8 100644
--- a/drivers/usb/serial/ir-usb.c
+++ b/drivers/usb/serial/ir-usb.c
@@ -448,7 +448,7 @@ static void ir_set_termios(struct tty_struct *tty,
 			usb_sndbulkpipe(udev, port->bulk_out_endpointAddress),
 			transfer_buffer, 1, &actual_length, 5000);
 	if (ret || actual_length != 1) {
-		if (actual_length != 1)
+		if (!ret)
 			ret = -EIO;
 		dev_err(&port->dev, "failed to change line speed: %d\n", ret);
 	}
-- 
2.11.0

