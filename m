Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1972F29D376
	for <lists+linux-usb@lfdr.de>; Wed, 28 Oct 2020 22:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgJ1VoO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 17:44:14 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:39106 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgJ1VoO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 17:44:14 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09SDIqE1084639;
        Wed, 28 Oct 2020 13:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=VlPPRQLYb5NDBYulhA5bdtSY+CCMDc55xkHOGMUz5cQ=;
 b=mKcfnYFdOzxp9VkqfnAbROOLlFqhHPQpWhYNn5JsneOvVFSUA4K5dKLFRlL7i/Ad+mud
 wx+HJmBEPl81aEepXjcR4WDE/HZeSVSo1KBFMAnFZjCFooYkpBZohnIL2B69fawCQkSO
 t5KsMKqaE4eQZGcHUv6mLuazJv/nUHx30Th4qV1ne5XtYN8qyNKWqAwJ4qwXtjTZHAQX
 FbWyToertD5fwt66/GgApYCQKMmjCmkyMvn+A4vsUSDdkg/KgONlkmgDHyrjdvHGEKW/
 8OD1Z75fET0afjBexBt3H3LV3wxx71Aquy3N5T3FAqjOk3/5rgNgd2MCD84uYbDplJTz Vw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 34dgm44yra-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Oct 2020 13:23:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09SDM6ou045506;
        Wed, 28 Oct 2020 13:23:54 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 34cx5yat52-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Oct 2020 13:23:54 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09SDNqSZ010394;
        Wed, 28 Oct 2020 13:23:52 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 28 Oct 2020 06:23:52 -0700
Date:   Wed, 28 Oct 2020 16:23:46 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Amelie DELAUNAY <amelie.delaunay@st.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
Message-ID: <20201028132346.GP18329@kadam>
References: <20201023112412.GD282278@mwanda>
 <625bf21d-e3bb-f952-9368-d93bee05a461@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625bf21d-e3bb-f952-9368-d93bee05a461@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010280090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9787 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010280090
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 28, 2020 at 01:26:16PM +0100, Amelie DELAUNAY wrote:
> > @@ -567,9 +567,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
> >   	if (!ret) {
> >   		chip->pwr_opmode = typec_find_pwr_opmode(cap_str);
> >   		/* Power delivery not yet supported */
> > -		if (chip->pwr_opmode < 0 ||
> > +		if ((int)chip->pwr_opmode < 0 ||
> >   		    chip->pwr_opmode == TYPEC_PWR_MODE_PD) {
> > -			ret = chip->pwr_opmode < 0 ? chip->pwr_opmode : -EINVAL;
> > +			ret = (int)chip->pwr_opmode < 0 ? chip->pwr_opmode :
> > +							  -EINVAL;
> >   			dev_err(chip->dev, "bad power operation mode: %d\n",
> >   				chip->pwr_opmode);
> >   			return ret;
> > 
> 
> 	if (!ret) {
> 		ret = typec_find_pwr_opmode(cap_str);
> 		/* Power delivery not yet supported */
> 		if (ret < 0 || ret == TYPEC_PWR_MODE_PD) {
> 			dev_err(chip->dev, "bad power operation mode: %d\n", ret);
> 			return -EINVAL;
> 		}
> 		chip->pwr_opmode = ret;
> 	}
> 
> 
> So, which fix sounds better ? IMHO using ret make the code more readable.

Yeah.  Your patch is nicer, but Greg *just* merged mine so it might
be too late...

regards,
dan carpenter

