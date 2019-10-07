Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25519CE30A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 15:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfJGNR4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 09:17:56 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33314 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbfJGNR4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 09:17:56 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x97DE4MW030050;
        Mon, 7 Oct 2019 13:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=IAMIwmdcmfTFOSTznBKdShW9ggz+7OHshc+ioL+m7HU=;
 b=p794we2FEJnC93zgqMI7xqHwxGY5TLQ3awiY7RGGa3jtznIkVrsGztjKpRWGcECLHa9X
 ++ICS+rh+ZxlBj4EryGJ1LQEY0ffvOgAGJUc+Ji6pqf1TXeQAzZ4xS+Bjm3la6ONO311
 5sGE8CKMlt1J+wRqBlFuJw06q4VFZiWDkZeIGdkXNVM4JlQ3sa6ULzLVEUM8JmCt0dRn
 +z0Ic80l+ymJA3o0YhDlZmS0JMbTNFZNgiqNG6HSz6gZbNIL42ntD5smp4HA+r1PENHX
 LxvXHkh4mC6gSoM+84uh/ptE2tj23qz6K97Z6Jc/530FbM6c3Xzqm+v+wqTcm9MEq1AJ fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2vektr6efa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 13:17:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x97DHiDp004178;
        Mon, 7 Oct 2019 13:17:48 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2vg1ytvhgd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 13:17:47 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x97DHOMb023933;
        Mon, 7 Oct 2019 13:17:24 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Oct 2019 06:17:23 -0700
Date:   Mon, 7 Oct 2019 16:17:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "kbuild@01.org" <kbuild@01.org>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [kbuild] [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182
 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <20191007131717.GJ21515@kadam>
References: <20191007112939.GG21515@kadam>
 <OSBPR01MB2103ECC1BA7A7A0D9ABA15CBB89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103ECC1BA7A7A0D9ABA15CBB89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=744
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=819 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070133
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 07, 2019 at 12:36:10PM +0000, Biju Das wrote:
> > err_unreg_port:
> > 	typec_unregister_port(hd3ss3220->port);
> > err_put_role:
> > 	usb_role_switch_put(hd3ss3220->role_sw);
> > err_put_handle:
> > 	fwnode_handle_put(foo bar);
> >
> > 	return ret;
> > The rule behind this style of error handling is that you just have to keep track
> > of the most recently allocated resource and at the bottom you free them in
> > the reverse order from how you allocated them.  Here we had allocated -
> > >role_sw but the typec_register_port() so we do goto free_role_sw;  Now
> > people can guess what the goto does because the name is descriptive and
> > since it matches the most recently allocated resource that means it's okay.
> 
> Yes I agree. But In this case, only one error label is sufficient.

Yes.  You could fix the leak by passing an invalid pointer to
typec_unregister_port() but that way is asking for trouble in the
future...  These are the kinds of bugs I fix all the time because I'm
working with static analysis.  Clearly defined error labels are more
readable and less bug prone.

regards,
dan carpenter
