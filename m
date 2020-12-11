Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B002D746B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 12:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394370AbgLKK7o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Dec 2020 05:59:44 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:51320 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394352AbgLKK7e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Dec 2020 05:59:34 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBAnfPf039698;
        Fri, 11 Dec 2020 10:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=b1OY5PqTr/emO7HQsLQeX8/MoLpIXvEnOGnJQUZOMW8=;
 b=S+0yv9x23wPkCdifZ6lZJf0jNZWGm7ieBIjvmpk1w3rv+DBY4gsdvsC2Kh3agYIzdcVS
 4SWgjWpej8p/PEfd6JgU/2OW7/Suh8+uuz+T1hUxkqUltMgZ/G66qpY1c5e7y+IGa2kp
 G22PfFlq9YnA/swxKtADSgQQA68ICFeM7R1UrKYiGyKm8KooX3tGUooY5FYFrmfjZttz
 vNsUMfcNIvmgkRPab1HGugPD46OsipaoQn4soh0smrzg/yyequBjwHtJVIW7dVVa2WID
 jUYRXR84TsEjr4B5d1i2ZzEqVvOnNekKlpHn/eiTU9ABOzdxnH6ZfqTnCfQeO0bIRGIp LQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 357yqca5uk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Dec 2020 10:58:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BBAufIi174579;
        Fri, 11 Dec 2020 10:58:46 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 358m43adxd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 11 Dec 2020 10:58:46 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BBAwio7015536;
        Fri, 11 Dec 2020 10:58:45 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 11 Dec 2020 02:58:44 -0800
Date:   Fri, 11 Dec 2020 13:58:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     peter.chen@nxp.com, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, kurahul@cadence.com
Subject: Re: [PATCH] usb: cdnsp: fix error handling in cdnsp_mem_init()
Message-ID: <20201211105837.GT2789@kadam>
References: <20201211095053.1948-1-pawell@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211095053.1948-1-pawell@cadence.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=2 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012110069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9831 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012110068
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 11, 2020 at 10:50:53AM +0100, Pawel Laszczak wrote:
> This function uses "One Function Cleans up Everything" style and that's
> basically impossible to do correctly. It's cleaner to write it with
> "clean up the most recent allocation".
> 
> Patch fixes two isues:
> 1. If pdev->dcbaa = dma_alloc_coherent() fails then that leads to a NULL
>    dereference inside the cdnsp_free_priv_device() function.
> 2. if cdnsp_alloc_priv_device() fails that leads to a double free because
>    we free pdev->out_ctx.bytes in several places.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Tested-by: Pawel Laszczak <pawell@cadence.com>

Thanks so much!

regards,
dan carpenter

