Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCBDFCE554
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 16:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbfJGOdb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 10:33:31 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:60842 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbfJGOda (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 10:33:30 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x97ET5rh110247;
        Mon, 7 Oct 2019 14:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=TtNSpQfsWxqUpJxmWRrZwcD8K1ooK+dEQ5PX52SwawM=;
 b=ATmPDGo7fvgzlkQAJnAyWVVfgkXg29uDkaKyFXffS92oqx+bd0XNxICk8Prgi64puJbQ
 j6gs7b/5WfW9YFni/EplM8qx07b5fg8slz2+/11SGuf+/Pgm2yNSCQg7uWaIl+TKgqUq
 8VY8xBoxZAUa+fsGM/SDWiT/XKGQ63AV3uLg7Q+qOGc5z42VKJH7kPNoAcjt839JlvGG
 sI4zfESHYJ29n+99DYjIZyWA8+wdEqAbOt2jn+3M/QWqaMOKsXVHk+dtOMnxpKOzgVWc
 utGOyKoE2H/S+mUPfSabip6SrE8+FJ+CN48rKhlP6u23aIF1QnIy6BYaT74DudE2Gzpp hA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2vejku75f4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 14:33:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x97EX8Le039362;
        Mon, 7 Oct 2019 14:33:22 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2vf4phn20f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 14:33:22 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x97EXK7p016645;
        Mon, 7 Oct 2019 14:33:20 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Oct 2019 07:33:19 -0700
Date:   Mon, 7 Oct 2019 17:33:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "kbuild@01.org" <kbuild@01.org>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [kbuild] [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182
 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <20191007143310.GK21515@kadam>
References: <20191007112939.GG21515@kadam>
 <OSBPR01MB2103ECC1BA7A7A0D9ABA15CBB89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20191007131717.GJ21515@kadam>
 <OSBPR01MB2103FEAFF4E52D3E881179C7B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2103FEAFF4E52D3E881179C7B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=978
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070144
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 07, 2019 at 02:19:05PM +0000, Biju Das wrote:
> OK.  Are you ok with the below changes?
> 

It will generate a compile warning so no...  :P

> @@ -178,7 +178,7 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  
>         hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
>         fwnode_handle_put(connector);
> -       if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
> +       if (IS_ERR(hd3ss3220->role_sw))
>                 return PTR_ERR(hd3ss3220->role_sw);
>  
>         hd3ss3220->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> @@ -188,20 +188,22 @@ static int hd3ss3220_probe(struct i2c_client *client,
>  
>         hd3ss3220->port = typec_register_port(&client->dev,
>                                               &hd3ss3220->typec_cap);
> -       if (IS_ERR(hd3ss3220->port))
> +       if (IS_ERR(hd3ss3220->port)) {
> +               usb_role_switch_put(hd3ss3220->role_sw);
>                 return PTR_ERR(hd3ss3220->port);

		ret = PTR_ERR(hd3ss3220->port);
		goto err_put_role

> +       }

Otherwise I think it's the right thing.  Thanks!

regards,
dan carpenter

