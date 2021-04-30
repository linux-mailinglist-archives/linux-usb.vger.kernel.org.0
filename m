Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE5936F52F
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 06:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhD3Ext (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 00:53:49 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:46074 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbhD3Exs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 00:53:48 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13U4ng1s099657;
        Fri, 30 Apr 2021 04:52:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=94hKcIr2yB51FSrARZviZ9JkTqmvsjgnjeYxDIOPnfQ=;
 b=T/F0XfwX1Wv5EhII9XR94waOzjJqOXsquVSa7zbUSRG/CIzKO0exMOJ08T5N2Ja8HYMt
 CYT4wQwNwcOHrBOvtH+QxLxoO4itsZaUlSqSnV8cX5sTpASaNFi6H0UEAoaSi/+WBRw5
 DUB2E8xeqgLYrlKN+8LWqVMoCw3JE0mS/s++dItgyr1/Raajgfzj62tJniMoeCNHbaf3
 QGwUSF7WqNxsNert2bCOQVpxCrsNldSC+yg80g6SSwG5DA+UmN/2+W4RbXHVTAnYlyea
 SqSy/1xXwYbgcVgNpYkCywIVnHVcuXRTDQUpXSWBUl4t68rIhzfjavdXBEmVtVBofUvL LQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 385aft6dcg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 04:52:57 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13U4oukr082203;
        Fri, 30 Apr 2021 04:52:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 3848f21vxw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 04:52:56 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13U4qu56087169;
        Fri, 30 Apr 2021 04:52:56 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 3848f21vxd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 04:52:56 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13U4qsWx009473;
        Fri, 30 Apr 2021 04:52:54 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 29 Apr 2021 21:52:54 -0700
Date:   Fri, 30 Apr 2021 07:52:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Pawel Laszczak <pawell@cadence.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, kurahul@cadence.com
Subject: Re: [PATCH] usb: cdnsp: Useless condition has been removed
Message-ID: <20210430045248.GG21598@kadam>
References: <20210429084914.12003-1-pawell@gli-login.cadence.com>
 <20210430034349.GB3842@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430034349.GB3842@nchen>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: sUvq-9JYQs21dwYmI3PKG5_Rltvce3up
X-Proofpoint-ORIG-GUID: sUvq-9JYQs21dwYmI3PKG5_Rltvce3up
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9969 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1011 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300032
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 30, 2021 at 11:43:49AM +0800, Peter Chen wrote:
> On 21-04-29 10:49:14, Pawel Laszczak wrote:
> > From: Pawel Laszczak <pawell@cadence.com>
> > 
> > Patch removes the warning "variable dereferenced before
> > check 'pdev->dcbaa'" from cdnsp_mem_cleanup.
> 
> You may describe the real problem you fix, but not the warning
> message from some auto build system.
> 

I really feel people have become too lost in the weeds of what matters
and what does not.  For internships, people want picky feedback in case
they're forced to deal with the ultra drill sargent maintainers.  But
really the important thing in a commit message is if you can understand
the problem and the fix.  In this case everyone who is capable of
understanding the patch can understand the commit message.

Also if you're going to criticize someone's commit message then just
write it the way you want so they can copy and paste.  I had someone
yesterday say that my commit message where I deleted a NULL check and
related dead code was not clear enough that the behavior was
"intentional" and I took that to mean that they wanted me to say that
deleting the dead code did not change runtime behavior.  I'm still not
sure that's what they wanted me to add...  The point is no one can read
your mind, if you want a commit message to say something specific then
just say it instead of hinting around the bush and we have to send a v2
and v3 commit message.

regards,
dan carpenter

