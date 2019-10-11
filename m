Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1692BD4272
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 16:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbfJKOLl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 10:11:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:51366 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbfJKOLl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Oct 2019 10:11:41 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BE8xCD015693;
        Fri, 11 Oct 2019 14:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2019-08-05; bh=ACyrOF2vwTDg4lXATY//MKrzIHwBR5ivqwPu7uM74zI=;
 b=Vo37vCSmss0L3fhPqAEPOaP3IlV+dkDU5OdNtvUH7T5/vcrGerF3XsWGHjVgwBryZPf1
 /sAcFAPwJJOqQCct2NbVGLeu2TmwFkyi0mmvi7YXIR52rJ0GhcwPpONyWbAxnN8HQ8EZ
 q53g0bM84p9pDrJK00guYuky+DsDa3EY94/xdNUwzcs03G+XRGBebCUBJTf8b11NBl+/
 UKZw/6GDdWmxYojXg3G3qIdcuEThmwGaiPk/kMuTnh0N7gDFe2FAUTOny3j24TWhXFdL
 WNyCSEy2A1EjEQARFPt7xXypw40Jh3e6Zb3lrNH1t6GAqgQHnvCUIeQ2W3pO94bqtgOS 6w== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2vekts1r79-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 14:11:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9BE9JSK060511;
        Fri, 11 Oct 2019 14:11:24 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2vjryc8a4k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Oct 2019 14:11:24 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x9BEBNQa024250;
        Fri, 11 Oct 2019 14:11:23 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Oct 2019 14:11:22 +0000
Date:   Fri, 11 Oct 2019 17:11:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Juergen Stuber <starblue@users.sourceforge.net>,
        Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org, walter harms <wharms@bfs.de>
Subject: [PATCH v2] USB: legousbtower: fix a signedness bug in tower_probe()
Message-ID: <20191011141115.GA4521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5DA088DE.5040902@bfs.de>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910110133
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9406 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910110133
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The problem is that sizeof() is unsigned long so negative error codes
are type promoted to high positive values and the condition becomes
false.

Fixes: 1d427be4a39d ("USB: legousbtower: fix slab info leak at probe")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: style improvement suggested by Walter Harms.

 drivers/usb/misc/legousbtower.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 9d4c52a7ebe0..9bd240df8f4c 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -881,7 +881,7 @@ static int tower_probe (struct usb_interface *interface, const struct usb_device
 				  get_version_reply,
 				  sizeof(*get_version_reply),
 				  1000);
-	if (result < sizeof(*get_version_reply)) {
+	if (result != sizeof(*get_version_reply)) {
 		if (result >= 0)
 			result = -EIO;
 		dev_err(idev, "get version request failed: %d\n", result);
-- 
2.20.1

