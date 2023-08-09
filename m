Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF909776374
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 17:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjHIPLk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 11:11:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjHIPLk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 11:11:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039C32111
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 08:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691593898; x=1723129898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xk74AT+e0KXT1BzYPJCo0r3TWGvJ8YuVgLqX7kelTZg=;
  b=HGQtYZL7RbuvYwaeSxnAIPgTUDVxDSDTDztPBvuWjtUNkHCblXWV08SA
   qstjS9j2aKVK9N+n6tul/e22A7gI/4+OPiXz5U7itCih6nkg/59pPrW7m
   97CwIfoj/7XoWumohTNREK6sEujwIbFEL0A08OkKFVTCC35l8mG9SNoQF
   AUs7WRUkG9TN9S3yuLMxfxDCiqog6uNhmwJVDT7U2QigR3N4fpq7UhHuL
   KLZlkScR+bnEn6dPrlK7NPw2glEDe5NjjhYuXvzfgNVgAC02hz7rsyPZO
   RVer/6ml/Dne3F9QBIgbio+hz5PvcqKCE26S7Y7W/yB0YslOHrOsMAMLQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="351452266"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="351452266"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 08:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="821896204"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="821896204"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 08:11:36 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qTkqV-0006B6-1U;
        Wed, 09 Aug 2023 15:11:35 +0000
Date:   Wed, 9 Aug 2023 23:11:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-testing 36/37] drivers/usb/core/usb.c:648:18: warning:
 variable 'root_hub' set but not used
Message-ID: <202308092350.HR4PVHUt-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   f176638af476c6d46257cc3303f5c7cf47d5967d
commit: 1e4c574225cc5a0553115e5eb5787d1474db5b0f [36/37] USB: Remove remnants of Wireless USB and UWB
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308092350.HR4PVHUt-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092350.HR4PVHUt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092350.HR4PVHUt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/core/usb.c: In function 'usb_alloc_dev':
>> drivers/usb/core/usb.c:648:18: warning: variable 'root_hub' set but not used [-Wunused-but-set-variable]
     648 |         unsigned root_hub = 0;
         |                  ^~~~~~~~


vim +/root_hub +648 drivers/usb/core/usb.c

d7d07255d3f560 Inaky Perez-Gonzalez 2007-07-31  626  
^1da177e4c3f41 Linus Torvalds       2005-04-16  627  /**
^1da177e4c3f41 Linus Torvalds       2005-04-16  628   * usb_alloc_dev - usb device constructor (usbcore-internal)
^1da177e4c3f41 Linus Torvalds       2005-04-16  629   * @parent: hub to which device is connected; null to allocate a root hub
^1da177e4c3f41 Linus Torvalds       2005-04-16  630   * @bus: bus used to access the device
^1da177e4c3f41 Linus Torvalds       2005-04-16  631   * @port1: one-based index of port; ignored for root hubs
41631d3616c363 Ahmed S. Darwish     2020-10-19  632   *
41631d3616c363 Ahmed S. Darwish     2020-10-19  633   * Context: task context, might sleep.
^1da177e4c3f41 Linus Torvalds       2005-04-16  634   *
^1da177e4c3f41 Linus Torvalds       2005-04-16  635   * Only hub drivers (including virtual root hub drivers for host
^1da177e4c3f41 Linus Torvalds       2005-04-16  636   * controllers) should ever call this.
^1da177e4c3f41 Linus Torvalds       2005-04-16  637   *
^1da177e4c3f41 Linus Torvalds       2005-04-16  638   * This call may not be used in a non-sleeping context.
626f090c5cbbe5 Yacine Belkadi       2013-08-02  639   *
626f090c5cbbe5 Yacine Belkadi       2013-08-02  640   * Return: On success, a pointer to the allocated usb device. %NULL on
626f090c5cbbe5 Yacine Belkadi       2013-08-02  641   * failure.
^1da177e4c3f41 Linus Torvalds       2005-04-16  642   */
2c044a48038047 Greg Kroah-Hartman   2008-01-30  643  struct usb_device *usb_alloc_dev(struct usb_device *parent,
2c044a48038047 Greg Kroah-Hartman   2008-01-30  644  				 struct usb_bus *bus, unsigned port1)
^1da177e4c3f41 Linus Torvalds       2005-04-16  645  {
^1da177e4c3f41 Linus Torvalds       2005-04-16  646  	struct usb_device *dev;
30b1e495b81321 Yuanhan Liu          2012-10-06  647  	struct usb_hcd *usb_hcd = bus_to_hcd(bus);
d7d07255d3f560 Inaky Perez-Gonzalez 2007-07-31 @648  	unsigned root_hub = 0;
7222c832254a75 Nicolai Stange       2016-03-17  649  	unsigned raw_port = port1;
^1da177e4c3f41 Linus Torvalds       2005-04-16  650  
0a1ef3b5a765a6 Alan Stern           2005-10-24  651  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds       2005-04-16  652  	if (!dev)
^1da177e4c3f41 Linus Torvalds       2005-04-16  653  		return NULL;
^1da177e4c3f41 Linus Torvalds       2005-04-16  654  
30b1e495b81321 Yuanhan Liu          2012-10-06  655  	if (!usb_get_hcd(usb_hcd)) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  656  		kfree(dev);
^1da177e4c3f41 Linus Torvalds       2005-04-16  657  		return NULL;
^1da177e4c3f41 Linus Torvalds       2005-04-16  658  	}
c6515272b85874 Sarah Sharp          2009-04-27  659  	/* Root hubs aren't true devices, so don't allocate HCD resources */
c6515272b85874 Sarah Sharp          2009-04-27  660  	if (usb_hcd->driver->alloc_dev && parent &&
c6515272b85874 Sarah Sharp          2009-04-27  661  		!usb_hcd->driver->alloc_dev(usb_hcd, dev)) {
c6515272b85874 Sarah Sharp          2009-04-27  662  		usb_put_hcd(bus_to_hcd(bus));
c6515272b85874 Sarah Sharp          2009-04-27  663  		kfree(dev);
c6515272b85874 Sarah Sharp          2009-04-27  664  		return NULL;
c6515272b85874 Sarah Sharp          2009-04-27  665  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  666  
^1da177e4c3f41 Linus Torvalds       2005-04-16  667  	device_initialize(&dev->dev);
^1da177e4c3f41 Linus Torvalds       2005-04-16  668  	dev->dev.bus = &usb_bus_type;
9f8b17e643fe6a Kay Sievers          2007-03-13  669  	dev->dev.type = &usb_device_type;
2e5f10e4f0a964 Alan Stern           2008-04-30  670  	dev->dev.groups = usb_device_groups;
a8c06e407ef969 Arnd Bergmann        2017-03-13  671  	set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
^1da177e4c3f41 Linus Torvalds       2005-04-16  672  	dev->state = USB_STATE_ATTACHED;
9cf65991dd93ac Sarah Sharp          2012-07-03  673  	dev->lpm_disable_count = 1;
4d59d8a11383eb Sarah Sharp          2007-10-03  674  	atomic_set(&dev->urbnum, 0);
^1da177e4c3f41 Linus Torvalds       2005-04-16  675  
^1da177e4c3f41 Linus Torvalds       2005-04-16  676  	INIT_LIST_HEAD(&dev->ep0.urb_list);
^1da177e4c3f41 Linus Torvalds       2005-04-16  677  	dev->ep0.desc.bLength = USB_DT_ENDPOINT_SIZE;
^1da177e4c3f41 Linus Torvalds       2005-04-16  678  	dev->ep0.desc.bDescriptorType = USB_DT_ENDPOINT;
^1da177e4c3f41 Linus Torvalds       2005-04-16  679  	/* ep0 maxpacket comes later, from device descriptor */
3444b26afa1451 David Vrabel         2009-04-08  680  	usb_enable_endpoint(dev, &dev->ep0, false);
6840d2555afd66 Alan Stern           2007-09-10  681  	dev->can_submit = 1;
^1da177e4c3f41 Linus Torvalds       2005-04-16  682  
^1da177e4c3f41 Linus Torvalds       2005-04-16  683  	/* Save readable and stable topology id, distinguishing devices
^1da177e4c3f41 Linus Torvalds       2005-04-16  684  	 * by location for diagnostics, tools, driver model, etc.  The
^1da177e4c3f41 Linus Torvalds       2005-04-16  685  	 * string is a path along hub ports, from the root.  Each device's
^1da177e4c3f41 Linus Torvalds       2005-04-16  686  	 * dev->devpath will be stable until USB is re-cabled, and hubs
7071a3ce0ca058 Kay Sievers          2008-05-02  687  	 * are often labeled with these port numbers.  The name isn't
^1da177e4c3f41 Linus Torvalds       2005-04-16  688  	 * as stable:  bus->busnum changes easily from modprobe order,
^1da177e4c3f41 Linus Torvalds       2005-04-16  689  	 * cardbus or pci hotplugging, and so on.
^1da177e4c3f41 Linus Torvalds       2005-04-16  690  	 */
^1da177e4c3f41 Linus Torvalds       2005-04-16  691  	if (unlikely(!parent)) {
^1da177e4c3f41 Linus Torvalds       2005-04-16  692  		dev->devpath[0] = '0';
7206b00164a1c3 Sarah Sharp          2009-04-27  693  		dev->route = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  694  
^1da177e4c3f41 Linus Torvalds       2005-04-16  695  		dev->dev.parent = bus->controller;
2bf698671205bb Johan Hovold         2017-06-06  696  		device_set_of_node_from_dev(&dev->dev, bus->sysdev);
0031a06e2f07ab Kay Sievers          2008-05-02  697  		dev_set_name(&dev->dev, "usb%d", bus->busnum);
d7d07255d3f560 Inaky Perez-Gonzalez 2007-07-31  698  		root_hub = 1;
^1da177e4c3f41 Linus Torvalds       2005-04-16  699  	} else {
^1da177e4c3f41 Linus Torvalds       2005-04-16  700  		/* match any labeling on the hubs; it's one-based */
7206b00164a1c3 Sarah Sharp          2009-04-27  701  		if (parent->devpath[0] == '0') {
^1da177e4c3f41 Linus Torvalds       2005-04-16  702  			snprintf(dev->devpath, sizeof dev->devpath,
^1da177e4c3f41 Linus Torvalds       2005-04-16  703  				"%d", port1);
7206b00164a1c3 Sarah Sharp          2009-04-27  704  			/* Root ports are not counted in route string */
7206b00164a1c3 Sarah Sharp          2009-04-27  705  			dev->route = 0;
7206b00164a1c3 Sarah Sharp          2009-04-27  706  		} else {
^1da177e4c3f41 Linus Torvalds       2005-04-16  707  			snprintf(dev->devpath, sizeof dev->devpath,
^1da177e4c3f41 Linus Torvalds       2005-04-16  708  				"%s.%d", parent->devpath, port1);
4a0cd9670f22c3 Sarah Sharp          2009-09-04  709  			/* Route string assumes hubs have less than 16 ports */
4a0cd9670f22c3 Sarah Sharp          2009-09-04  710  			if (port1 < 15)
7206b00164a1c3 Sarah Sharp          2009-04-27  711  				dev->route = parent->route +
7206b00164a1c3 Sarah Sharp          2009-04-27  712  					(port1 << ((parent->level - 1)*4));
4a0cd9670f22c3 Sarah Sharp          2009-09-04  713  			else
4a0cd9670f22c3 Sarah Sharp          2009-09-04  714  				dev->route = parent->route +
4a0cd9670f22c3 Sarah Sharp          2009-09-04  715  					(15 << ((parent->level - 1)*4));
7206b00164a1c3 Sarah Sharp          2009-04-27  716  		}
^1da177e4c3f41 Linus Torvalds       2005-04-16  717  
^1da177e4c3f41 Linus Torvalds       2005-04-16  718  		dev->dev.parent = &parent->dev;
0031a06e2f07ab Kay Sievers          2008-05-02  719  		dev_set_name(&dev->dev, "%d-%s", bus->busnum, dev->devpath);
^1da177e4c3f41 Linus Torvalds       2005-04-16  720  
69bec725985324 Peter Chen           2016-02-19  721  		if (!parent->parent) {
69bec725985324 Peter Chen           2016-02-19  722  			/* device under root hub's port */
7222c832254a75 Nicolai Stange       2016-03-17  723  			raw_port = usb_hcd_find_raw_port_number(usb_hcd,
69bec725985324 Peter Chen           2016-02-19  724  				port1);
69bec725985324 Peter Chen           2016-02-19  725  		}
7739376eb1ed68 Johan Hovold         2017-11-09  726  		dev->dev.of_node = usb_of_get_device_node(parent, raw_port);
69bec725985324 Peter Chen           2016-02-19  727  
^1da177e4c3f41 Linus Torvalds       2005-04-16  728  		/* hub driver sets up TT records */
^1da177e4c3f41 Linus Torvalds       2005-04-16  729  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  730  
12c3da346eb81b Alan Stern           2005-11-23  731  	dev->portnum = port1;
^1da177e4c3f41 Linus Torvalds       2005-04-16  732  	dev->bus = bus;
^1da177e4c3f41 Linus Torvalds       2005-04-16  733  	dev->parent = parent;
^1da177e4c3f41 Linus Torvalds       2005-04-16  734  	INIT_LIST_HEAD(&dev->filelist);
^1da177e4c3f41 Linus Torvalds       2005-04-16  735  

:::::: The code at line 648 was first introduced by commit
:::::: d7d07255d3f5607802b0af29e11448d18e9ed558 usb: initialize authorization and wusb bits in USB devices

:::::: TO: Inaky Perez-Gonzalez <inaky@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
