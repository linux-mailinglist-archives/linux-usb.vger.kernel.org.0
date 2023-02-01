Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13982686322
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 10:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231936AbjBAJur (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 04:50:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbjBAJuq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 04:50:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3C3A269F
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 01:50:44 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0722505;
        Wed,  1 Feb 2023 10:50:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675245041;
        bh=/A2MjtZqFhnOy/r6l0wgf2i8iPrH8vgfGbLAT8s5AsI=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=t5Y6EOY1rv8X1Lsb3a8d0jaPVoiyRooB1eOfRhfSloZiFSCuvJ9aCiSmGrKFyn3JQ
         wjufrwhbmr50RwpSCstWAm/rZNK33FgmXpIYoUNDLanZUjFnY1gbPyXr6tkF8p7O8M
         IlyMV0HwWgD17P8PCeAgo+UeSjSH9RgE+l2mc7XI=
Message-ID: <be531861-c7aa-8ad2-bbbb-58f30de6f50d@ideasonboard.com>
Date:   Wed, 1 Feb 2023 09:50:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev, mgr@pengutronix.de,
        balbi@kernel.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, stern@rowland.harvard.edu
References: <202301311446.AqdvqXkI-lkp@intel.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 07/11] usb: gadget: configfs: Attach arbitrary strings
 to cdev
In-Reply-To: <202301311446.AqdvqXkI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Morning Dan

On 31/01/2023 07:35, Dan Carpenter wrote:
> Hi Daniel,
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/usb-gadget-uvc-Make-bSourceID-read-write/20230130-174215
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> patch link:    https://lore.kernel.org/r/20230130093443.25644-8-dan.scally%40ideasonboard.com
> patch subject: [PATCH v3 07/11] usb: gadget: configfs: Attach arbitrary strings to cdev
> config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230131/202301311446.AqdvqXkI-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
>
> New smatch warnings:
> drivers/usb/gadget/configfs.c:1563 configfs_composite_bind() warn: passing zero to 'PTR_ERR'
>
> Old smatch warnings:
> drivers/usb/gadget/configfs.c:985 os_desc_b_vendor_code_show() warn: argument 3 to %02x specifier has type 'char'


Really must make time to look at Smatch...

>
> vim +/PTR_ERR +1563 drivers/usb/gadget/configfs.c
>
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1518  static int configfs_composite_bind(struct usb_gadget *gadget,
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1519  		struct usb_gadget_driver *gdriver)
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1520  {
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1521  	struct usb_composite_driver     *composite = to_cdriver(gdriver);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1522  	struct gadget_info		*gi = container_of(composite,
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1523  						struct gadget_info, composite);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1524  	struct usb_composite_dev	*cdev = &gi->cdev;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1525  	struct usb_configuration	*c;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1526  	struct usb_string		*s;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1527  	unsigned			i;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1528  	int				ret;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1529
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1530  	/* the gi->lock is hold by the caller */
> 1a1c851bbd706e Peter Chen                2019-08-26  1531  	gi->unbind = 0;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1532  	cdev->gadget = gadget;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1533  	set_gadget_data(gadget, cdev);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1534  	ret = composite_dev_prepare(composite, cdev);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1535  	if (ret)
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1536  		return ret;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1537  	/* and now the gadget bind */
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1538  	ret = -EINVAL;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1539
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1540  	if (list_empty(&gi->cdev.configs)) {
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1541  		pr_err("Need at least one configuration in %s.\n",
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1542  				gi->composite.name);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1543  		goto err_comp_cleanup;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1544  	}
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1545
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1546
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1547  	list_for_each_entry(c, &gi->cdev.configs, list) {
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1548  		struct config_usb_cfg *cfg;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1549
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1550  		cfg = container_of(c, struct config_usb_cfg, c);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1551  		if (list_empty(&cfg->func_list)) {
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1552  			pr_err("Config %s/%d of %s needs at least one function.\n",
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1553  			      c->label, c->bConfigurationValue,
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1554  			      gi->composite.name);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1555  			goto err_comp_cleanup;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1556  		}
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1557  	}
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1558
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1559  	/* init all strings */
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1560  	if (!list_empty(&gi->string_list)) {
> 0c252735443756 Daniel Scally             2023-01-30  1561  		s = configfs_attach_gadget_strings(gi);
> 0c252735443756 Daniel Scally             2023-01-30  1562  		if (IS_ERR_OR_NULL(s)) {
>
>
> Passing NULL to PTR_ERR(s) is not a bug, but this check has a probably
> under 10% false positive rate because 90% of the time when people do
> that it is wrong.
>
> In this case configfs_attach_gadget_strings() cannot actually return
> NULL so this could just be changed to if (IS_ERR(s)) {.


Yes good spot, thank you

>
> I would say that probably if it *did* return NULL then we should return
> -EPROBE_DEFER.  It's an interesting philosophical debate how to handle
> impossible things...


Well in this case it returns null when there's no languages defined, 
which isn't possible here since it's behind the if(!list_empty(...)) 
check but in principle I think is allowed - usb devices don't have to 
support any string descriptors as far as I know.

> fea77077d1623c Wei Yongjun               2013-05-07 @1563  			ret = PTR_ERR(s);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1564  			goto err_comp_cleanup;
> fea77077d1623c Wei Yongjun               2013-05-07  1565  		}
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1566
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1567  		gi->cdev.desc.iManufacturer = s[USB_GADGET_MANUFACTURER_IDX].id;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1568  		gi->cdev.desc.iProduct = s[USB_GADGET_PRODUCT_IDX].id;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1569  		gi->cdev.desc.iSerialNumber = s[USB_GADGET_SERIAL_IDX].id;
> 0c252735443756 Daniel Scally             2023-01-30  1570
> 0c252735443756 Daniel Scally             2023-01-30  1571  		gi->cdev.usb_strings = s;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1572  	}
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1573
> 87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1574  	if (gi->use_os_desc) {
> 87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1575  		cdev->use_os_string = true;
> 87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1576  		cdev->b_vendor_code = gi->b_vendor_code;
> 87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1577  		memcpy(cdev->qw_sign, gi->qw_sign, OS_STRING_QW_SIGN_LEN);
> 87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1578  	}
> 87213d388e927a Andrzej Pietrasiewicz     2014-05-08  1579
> 41ce84c86d0a04 Li Jun                    2015-07-09  1580  	if (gadget_is_otg(gadget) && !otg_desc[0]) {
> 41ce84c86d0a04 Li Jun                    2015-07-09  1581  		struct usb_descriptor_header *usb_desc;
> 41ce84c86d0a04 Li Jun                    2015-07-09  1582
> 41ce84c86d0a04 Li Jun                    2015-07-09  1583  		usb_desc = usb_otg_descriptor_alloc(gadget);
> 41ce84c86d0a04 Li Jun                    2015-07-09  1584  		if (!usb_desc) {
> 41ce84c86d0a04 Li Jun                    2015-07-09  1585  			ret = -ENOMEM;
> 41ce84c86d0a04 Li Jun                    2015-07-09  1586  			goto err_comp_cleanup;
> 41ce84c86d0a04 Li Jun                    2015-07-09  1587  		}
> 41ce84c86d0a04 Li Jun                    2015-07-09  1588  		usb_otg_descriptor_init(gadget, usb_desc);
> 41ce84c86d0a04 Li Jun                    2015-07-09  1589  		otg_desc[0] = usb_desc;
> 41ce84c86d0a04 Li Jun                    2015-07-09  1590  		otg_desc[1] = NULL;
> 41ce84c86d0a04 Li Jun                    2015-07-09  1591  	}
> 41ce84c86d0a04 Li Jun                    2015-07-09  1592
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1593  	/* Go through all configs, attach all functions */
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1594  	list_for_each_entry(c, &gi->cdev.configs, list) {
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1595  		struct config_usb_cfg *cfg;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1596  		struct usb_function *f;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1597  		struct usb_function *tmp;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1598  		struct gadget_config_name *cn;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1599
> 41ce84c86d0a04 Li Jun                    2015-07-09  1600  		if (gadget_is_otg(gadget))
> 41ce84c86d0a04 Li Jun                    2015-07-09  1601  			c->descriptors = otg_desc;
> 41ce84c86d0a04 Li Jun                    2015-07-09  1602
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1603  		cfg = container_of(c, struct config_usb_cfg, c);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1604  		if (!list_empty(&cfg->string_list)) {
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1605  			i = 0;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1606  			list_for_each_entry(cn, &cfg->string_list, list) {
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1607  				cfg->gstrings[i] = &cn->stringtab_dev;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1608  				cn->stringtab_dev.strings = &cn->strings;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1609  				cn->strings.s = cn->configuration;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1610  				i++;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1611  			}
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1612  			cfg->gstrings[i] = NULL;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1613  			s = usb_gstrings_attach(&gi->cdev, cfg->gstrings, 1);
> fea77077d1623c Wei Yongjun               2013-05-07  1614  			if (IS_ERR(s)) {
> fea77077d1623c Wei Yongjun               2013-05-07  1615  				ret = PTR_ERR(s);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1616  				goto err_comp_cleanup;
> fea77077d1623c Wei Yongjun               2013-05-07  1617  			}
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1618  			c->iConfiguration = s[0].id;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1619  		}
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1620
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1621  		list_for_each_entry_safe(f, tmp, &cfg->func_list, list) {
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1622  			list_del(&f->list);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1623  			ret = usb_add_function(c, f);
> 5a68e9b57b1c19 Andrzej Pietrasiewicz     2013-08-08  1624  			if (ret) {
> 5a68e9b57b1c19 Andrzej Pietrasiewicz     2013-08-08  1625  				list_add(&f->list, &cfg->func_list);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1626  				goto err_purge_funcs;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1627  			}
> 5a68e9b57b1c19 Andrzej Pietrasiewicz     2013-08-08  1628  		}
> 7adf9e3adc398e Wesley Cheng              2021-07-10  1629  		ret = usb_gadget_check_config(cdev->gadget);
> 7adf9e3adc398e Wesley Cheng              2021-07-10  1630  		if (ret)
> 7adf9e3adc398e Wesley Cheng              2021-07-10  1631  			goto err_purge_funcs;
> 7adf9e3adc398e Wesley Cheng              2021-07-10  1632
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1633  		usb_ep_autoconfig_reset(cdev->gadget);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1634  	}
> da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1635  	if (cdev->use_os_string) {
> da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1636  		ret = composite_os_desc_req_prepare(cdev, gadget->ep0);
> da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1637  		if (ret)
> da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1638  			goto err_purge_funcs;
> da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1639  	}
> da4243145fb197 Andrzej Pietrasiewicz     2014-05-08  1640
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1641  	usb_ep_autoconfig_reset(cdev->gadget);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1642  	return 0;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1643
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1644  err_purge_funcs:
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1645  	purge_configs_funcs(gi);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1646  err_comp_cleanup:
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1647  	composite_dev_cleanup(cdev);
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1648  	return ret;
> 88af8bbe4ef781 Sebastian Andrzej Siewior 2012-12-23  1649  }
>
