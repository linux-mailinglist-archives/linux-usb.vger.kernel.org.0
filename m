Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B144CE079
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 13:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbfJGLaB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 07:30:01 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:57780 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfJGLaB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 07:30:01 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x97BNuhX134953;
        Mon, 7 Oct 2019 11:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=noDay8+L5VrxZgJrJU6IxuI6+qQ7tqj21dKeQ+T9CLU=;
 b=o6Xd2+Ney4vwfAJeaT234kuvzxnYwHTjsZOpiDdUDVc1Dn/Ne31qROPqFcwmLzeunXsx
 pnYV+e9q6QLlLf1ahrysDLONyMFBtD4DwQUc8yyzgCkG2H9ZjxMn/8PXfxL6xqxUb/pu
 TdgG9WQM9MmolLO67wNn2di79demBU7SVgftuBcCp2lRH3J/RFNrwa3g4truMe4VZgkg
 zBE2mLyya49WYVtMFiK5Zm6zfuJ4JfuPb9GwmEKUmzgm0I8pWDLMI24fdtZnvgaoX7ZC
 VdyHkRV8VvmZjV9dPFGaCzA0m+uHn4AWvjGD5QibW/PvVH5cc2X3kylXsmeOhJ6IP6LR uw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2vektr5whb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 11:29:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x97BN0dB160438;
        Mon, 7 Oct 2019 11:29:48 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2vg203hs65-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Oct 2019 11:29:48 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x97BTkOx015011;
        Mon, 7 Oct 2019 11:29:46 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Oct 2019 04:29:45 -0700
Date:   Mon, 7 Oct 2019 14:29:40 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>, kbuild@01.org,
        Biju Das <biju.das@bp.renesas.com>
Cc:     kbuild-all@01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [kbuild] [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182
 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <20191007112939.GG21515@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: L6LPCOUG7HIZNECQC36X2YBCFUWXR5RH
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910070115
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9402 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910070115
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Resending with Fixed email headers - dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   dd3fd317e2beb899cbffcf364de049b9f9a02db5
commit: 1c48c759ef4bb9031b3347277f04484e07e27d97 [32/38] usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/typec/hd3ss3220.c:182 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'

# https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=1c48c759ef4bb9031b3347277f04484e07e27d97
git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
git remote update usb
git checkout 1c48c759ef4bb9031b3347277f04484e07e27d97
vim +/PTR_ERR +182 drivers/usb/typec/hd3ss3220.c

1c48c759ef4bb9 Biju Das 2019-09-04  152  
1c48c759ef4bb9 Biju Das 2019-09-04  153  static int hd3ss3220_probe(struct i2c_client *client,
1c48c759ef4bb9 Biju Das 2019-09-04  154  		const struct i2c_device_id *id)
1c48c759ef4bb9 Biju Das 2019-09-04  155  {
1c48c759ef4bb9 Biju Das 2019-09-04  156  	struct hd3ss3220 *hd3ss3220;
1c48c759ef4bb9 Biju Das 2019-09-04  157  	struct fwnode_handle *connector;
1c48c759ef4bb9 Biju Das 2019-09-04  158  	int ret;
1c48c759ef4bb9 Biju Das 2019-09-04  159  	unsigned int data;
1c48c759ef4bb9 Biju Das 2019-09-04  160  
1c48c759ef4bb9 Biju Das 2019-09-04  161  	hd3ss3220 = devm_kzalloc(&client->dev, sizeof(struct hd3ss3220),
1c48c759ef4bb9 Biju Das 2019-09-04  162  				 GFP_KERNEL);
1c48c759ef4bb9 Biju Das 2019-09-04  163  	if (!hd3ss3220)
1c48c759ef4bb9 Biju Das 2019-09-04  164  		return -ENOMEM;
1c48c759ef4bb9 Biju Das 2019-09-04  165  
1c48c759ef4bb9 Biju Das 2019-09-04  166  	i2c_set_clientdata(client, hd3ss3220);
1c48c759ef4bb9 Biju Das 2019-09-04  167  
1c48c759ef4bb9 Biju Das 2019-09-04  168  	hd3ss3220->dev = &client->dev;
1c48c759ef4bb9 Biju Das 2019-09-04  169  	hd3ss3220->regmap = devm_regmap_init_i2c(client, &config);
1c48c759ef4bb9 Biju Das 2019-09-04  170  	if (IS_ERR(hd3ss3220->regmap))
1c48c759ef4bb9 Biju Das 2019-09-04  171  		return PTR_ERR(hd3ss3220->regmap);
1c48c759ef4bb9 Biju Das 2019-09-04  172  
1c48c759ef4bb9 Biju Das 2019-09-04  173  	hd3ss3220_set_source_pref(hd3ss3220,
1c48c759ef4bb9 Biju Das 2019-09-04  174  				  HD3SS3220_REG_GEN_CTRL_SRC_PREF_DRP_DEFAULT);
1c48c759ef4bb9 Biju Das 2019-09-04  175  	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
1c48c759ef4bb9 Biju Das 2019-09-04  176  	if (IS_ERR(connector))
1c48c759ef4bb9 Biju Das 2019-09-04  177  		return PTR_ERR(connector);
1c48c759ef4bb9 Biju Das 2019-09-04  178  
1c48c759ef4bb9 Biju Das 2019-09-04  179  	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
1c48c759ef4bb9 Biju Das 2019-09-04  180  	fwnode_handle_put(connector);
1c48c759ef4bb9 Biju Das 2019-09-04  181  	if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
1c48c759ef4bb9 Biju Das 2019-09-04 @182  		return PTR_ERR(hd3ss3220->role_sw);

When fwnode_usb_role_switch_get() returns NULL then we return success
here.  It seems like a bug.

When function returns a mix of NULL and error pointers then NULL is a
special case of success.  For example, a module tries to request a
feature but that feature is deliberately turned off.  It's not an error
so we can't return an error pointer, but at same time we can't return
a valid pointer because the feature is disabled.

For fwnode_usb_role_switch_get() it is a bit unclear to me what NULL
means in that context, and there are no comments to explain it...  The
fwnode_connection_find_match() is the same way where it mixes NULL and
error pointers, doesn't have a comment, and it really seems like NULL is
an error, not a special case of success like it's supposed to be.  I
have added Heikki Krogerus to the CC list.

1c48c759ef4bb9 Biju Das 2019-09-04  183  
1c48c759ef4bb9 Biju Das 2019-09-04  184  	hd3ss3220->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
1c48c759ef4bb9 Biju Das 2019-09-04  185  	hd3ss3220->typec_cap.dr_set = hd3ss3220_dr_set;
1c48c759ef4bb9 Biju Das 2019-09-04  186  	hd3ss3220->typec_cap.type = TYPEC_PORT_DRP;
1c48c759ef4bb9 Biju Das 2019-09-04  187  	hd3ss3220->typec_cap.data = TYPEC_PORT_DRD;
1c48c759ef4bb9 Biju Das 2019-09-04  188  
1c48c759ef4bb9 Biju Das 2019-09-04  189  	hd3ss3220->port = typec_register_port(&client->dev,
1c48c759ef4bb9 Biju Das 2019-09-04  190  					      &hd3ss3220->typec_cap);
1c48c759ef4bb9 Biju Das 2019-09-04  191  	if (IS_ERR(hd3ss3220->port))
1c48c759ef4bb9 Biju Das 2019-09-04  192  		return PTR_ERR(hd3ss3220->port);

This error path should call usb_role_switch_put(hd3ss3220->role_sw) and
probably a fwnode_handle_put() as well?

I noticed this because I scrolled to the bottom of the fucntion and
noticed that there was only one error label.  When you see a single
error label like that, it's normally a red flag that the error handling
is buggy.  Error labels should have descriptive names which say what
they do.  I suggest something like:

err_unreg_port:
	typec_unregister_port(hd3ss3220->port);
err_put_role:
	usb_role_switch_put(hd3ss3220->role_sw);
err_put_handle:
	fwnode_handle_put(foo bar);

	return ret;

The rule behind this style of error handling is that you just have to
keep track of the most recently allocated resource and at the bottom
you free them in the reverse order from how you allocated them.  Here we
had allocated ->role_sw but the typec_register_port() so we do goto
free_role_sw;  Now people can guess what the goto does because the
name is descriptive and since it matches the most recently allocated
resource that means it's okay.

1c48c759ef4bb9 Biju Das 2019-09-04  193  
1c48c759ef4bb9 Biju Das 2019-09-04  194  	hd3ss3220_set_role(hd3ss3220);
1c48c759ef4bb9 Biju Das 2019-09-04  195  	ret = regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, &data);
1c48c759ef4bb9 Biju Das 2019-09-04  196  	if (ret < 0)
1c48c759ef4bb9 Biju Das 2019-09-04  197  		goto error;
1c48c759ef4bb9 Biju Das 2019-09-04  198  
1c48c759ef4bb9 Biju Das 2019-09-04  199  	if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
1c48c759ef4bb9 Biju Das 2019-09-04  200  		ret = regmap_write(hd3ss3220->regmap,
1c48c759ef4bb9 Biju Das 2019-09-04  201  				HD3SS3220_REG_CN_STAT_CTRL,
1c48c759ef4bb9 Biju Das 2019-09-04  202  				data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS);
1c48c759ef4bb9 Biju Das 2019-09-04  203  		if (ret < 0)
1c48c759ef4bb9 Biju Das 2019-09-04  204  			goto error;
1c48c759ef4bb9 Biju Das 2019-09-04  205  	}
1c48c759ef4bb9 Biju Das 2019-09-04  206  
1c48c759ef4bb9 Biju Das 2019-09-04  207  	if (client->irq > 0) {
1c48c759ef4bb9 Biju Das 2019-09-04  208  		ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
1c48c759ef4bb9 Biju Das 2019-09-04  209  					hd3ss3220_irq_handler,
1c48c759ef4bb9 Biju Das 2019-09-04  210  					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
1c48c759ef4bb9 Biju Das 2019-09-04  211  					"hd3ss3220", &client->dev);
1c48c759ef4bb9 Biju Das 2019-09-04  212  		if (ret)
1c48c759ef4bb9 Biju Das 2019-09-04  213  			goto error;
1c48c759ef4bb9 Biju Das 2019-09-04  214  	}
1c48c759ef4bb9 Biju Das 2019-09-04  215  
1c48c759ef4bb9 Biju Das 2019-09-04  216  	ret = i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
1c48c759ef4bb9 Biju Das 2019-09-04  217  	if (ret < 0)
1c48c759ef4bb9 Biju Das 2019-09-04  218  		goto error;
1c48c759ef4bb9 Biju Das 2019-09-04  219  
1c48c759ef4bb9 Biju Das 2019-09-04  220  	dev_info(&client->dev, "probed revision=0x%x\n", ret);
1c48c759ef4bb9 Biju Das 2019-09-04  221  
1c48c759ef4bb9 Biju Das 2019-09-04  222  	return 0;
1c48c759ef4bb9 Biju Das 2019-09-04  223  error:
1c48c759ef4bb9 Biju Das 2019-09-04  224  	typec_unregister_port(hd3ss3220->port);
1c48c759ef4bb9 Biju Das 2019-09-04  225  	usb_role_switch_put(hd3ss3220->role_sw);
1c48c759ef4bb9 Biju Das 2019-09-04  226  
1c48c759ef4bb9 Biju Das 2019-09-04  227  	return ret;
1c48c759ef4bb9 Biju Das 2019-09-04  228  }

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
_______________________________________________
kbuild mailing list -- kbuild@lists.01.org
To unsubscribe send an email to kbuild-leave@lists.01.org
