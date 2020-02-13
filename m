Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F30515B9D7
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 08:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgBMHBN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 02:01:13 -0500
Received: from mga14.intel.com ([192.55.52.115]:10547 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbgBMHBN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Feb 2020 02:01:13 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Feb 2020 23:01:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,435,1574150400"; 
   d="scan'208";a="281445051"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Feb 2020 23:01:11 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1j28Up-0003gk-5s; Thu, 13 Feb 2020 15:01:11 +0800
Date:   Thu, 13 Feb 2020 15:01:00 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 18/18]
 drivers/usb/misc/apple-mfi-fastcharge.c:173:29: sparse: sparse: restricted
 __le16 degrades to integer
Message-ID: <202002131558.UH2wlHsI%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   249fa8217b846a7c031b997bd4ea70d65d3ff774
commit: 249fa8217b846a7c031b997bd4ea70d65d3ff774 [18/18] USB: Add driver to control USB fast charge for iOS devices
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout 249fa8217b846a7c031b997bd4ea70d65d3ff774
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/usb/misc/apple-mfi-fastcharge.c:173:29: sparse: sparse: restricted __le16 degrades to integer
   drivers/usb/misc/apple-mfi-fastcharge.c:174:29: sparse: sparse: restricted __le16 degrades to integer

vim +173 drivers/usb/misc/apple-mfi-fastcharge.c

   165	
   166	static int mfi_fc_probe(struct usb_device *udev)
   167	{
   168		struct power_supply_config battery_cfg = {};
   169		struct mfi_device *mfi = NULL;
   170		int err;
   171	
   172		/* See comment above mfi_fc_id_table[] */
 > 173		if (udev->descriptor.idProduct < 0x1200 ||
   174		    udev->descriptor.idProduct > 0x12ff) {
   175			return -ENODEV;
   176		}
   177	
   178		mfi = kzalloc(sizeof(struct mfi_device), GFP_KERNEL);
   179		if (!mfi) {
   180			err = -ENOMEM;
   181			goto error;
   182		}
   183	
   184		battery_cfg.drv_data = mfi;
   185	
   186		mfi->charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
   187		mfi->battery = power_supply_register(&udev->dev,
   188							&apple_mfi_fc_desc,
   189							&battery_cfg);
   190		if (IS_ERR(mfi->battery)) {
   191			dev_err(&udev->dev, "Can't register battery\n");
   192			err = PTR_ERR(mfi->battery);
   193			goto error;
   194		}
   195	
   196		mfi->udev = usb_get_dev(udev);
   197		dev_set_drvdata(&udev->dev, mfi);
   198	
   199		return 0;
   200	
   201	error:
   202		kfree(mfi);
   203		return err;
   204	}
   205	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
