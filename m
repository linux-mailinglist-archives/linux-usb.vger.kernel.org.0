Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE4E36F99E
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 13:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhD3Lwl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 07:52:41 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:38296 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhD3Lwk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Apr 2021 07:52:40 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13UBn1gN153870;
        Fri, 30 Apr 2021 11:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=eI9I6ScSJrGMrRAaM+N/2tGOksCTfQkMwXzNY7uNQhA=;
 b=cjkhO+lQht87lZMdME/mC04TygBG5l/uVJyBTGu6q8FImEXKxMfWu1x8HE8PrBYu2vQn
 2FCgH7/epNoJyApN6D8v5qKlS/NRRsbRNmjJ7IQoFGEUbXCBcznVXdnaazlRLJoR7U2Z
 CxWNR9e+P/Z7Xlozjc2RaN9L7WfIRn7gEjgeJSUY5l9aL+kCPUDlj5pOQyc0ijjw7R/Z
 f1QtIXQOy7UOOKLSu+h36RDMcSUU/paJRwEOUo6sN6amdLW+Xhc0CRpHreRBs3P6nenm
 Jai6a5t/kCKDyvNMBUsxrmBEXqZ33ncs1ZWw0Ml+2ggQtmNUXVCWuhQxpn3MSnwouuOj tQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 385afq7gcr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 11:51:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13UBonxO034334;
        Fri, 30 Apr 2021 11:51:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3020.oracle.com with ESMTP id 384w3xpuy8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 11:51:47 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13UBpl6S037724;
        Fri, 30 Apr 2021 11:51:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 384w3xpuxy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 11:51:47 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13UBpjk9015654;
        Fri, 30 Apr 2021 11:51:46 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 30 Apr 2021 11:51:45 +0000
Date:   Fri, 30 Apr 2021 14:51:39 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Pawel Laszczak <pawell@cadence.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, kurahul@cadence.com
Subject: Re: [PATCH] usb: cdnsp: Useless condition has been removed
Message-ID: <20210430115139.GH21598@kadam>
References: <20210429084914.12003-1-pawell@gli-login.cadence.com>
 <20210430034349.GB3842@nchen>
 <20210430045248.GG21598@kadam>
 <20210430071145.GA4449@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430071145.GA4449@nchen>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 8SWhg1jrAi1-qXk7JCuei9w-n4cNtEob
X-Proofpoint-GUID: 8SWhg1jrAi1-qXk7JCuei9w-n4cNtEob
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9969 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300087
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 30, 2021 at 03:11:45PM +0800, Peter Chen wrote:
> On 21-04-30 07:52:48, Dan Carpenter wrote:
> > On Fri, Apr 30, 2021 at 11:43:49AM +0800, Peter Chen wrote:
> > > On 21-04-29 10:49:14, Pawel Laszczak wrote:
> > > > From: Pawel Laszczak <pawell@cadence.com>
> > > > 
> > > > Patch removes the warning "variable dereferenced before
> > > > check 'pdev->dcbaa'" from cdnsp_mem_cleanup.
> > > 
> > > You may describe the real problem you fix, but not the warning
> > > message from some auto build system.
> > > 
> > 
> > I really feel people have become too lost in the weeds of what matters
> > and what does not.  For internships, people want picky feedback in case
> > they're forced to deal with the ultra drill sargent maintainers.  But
> > really the important thing in a commit message is if you can understand
> > the problem and the fix.  In this case everyone who is capable of
> > understanding the patch can understand the commit message.
> > 
> > Also if you're going to criticize someone's commit message then just
> > write it the way you want so they can copy and paste.  I had someone
> > yesterday say that my commit message where I deleted a NULL check and
> > related dead code was not clear enough that the behavior was
> > "intentional" and I took that to mean that they wanted me to say that
> > deleting the dead code did not change runtime behavior.  I'm still not
> > sure that's what they wanted me to add...  The point is no one can read
> > your mind, if you want a commit message to say something specific then
> > just say it instead of hinting around the bush and we have to send a v2
> > and v3 commit message.
> > 
> > regards,
> > dan carpenter
> 
> Hi Dan,
> 
> Thanks for your comments, it's the good suggestion. But everyone may have
> slight different criteria that what's really clear.
> 
> For this patch, I don't understand the commits, the pdev->dcbaa is set as
> NULL after dma_free_coherent, why it has this warning.
> 

Hm...  I guess it's a fair point that it's not clear to the reviewer
where the unchecked dereference happens.  Here is how I would write that
commit.

    This code generates a Smatch warning:

    drivers/usb/cdns3/cdnsp-mem.c:1085 cdnsp_mem_cleanup()
    warn: variable dereferenced before check 'pdev->dcbaa' (see line 1067)

    The unchecked dereference happens inside the function when we call:

    	cdnsp_free_priv_device(pdev);

    But fortunately, the "pdev->dcbaa" pointer can never be NULL so it
    does not lead to a runtime issue.  We can just remove the NULL check
    which silences the warning and makes the code consistent.

regards,
dan carpenter

