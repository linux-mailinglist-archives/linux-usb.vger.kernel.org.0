Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C18856CD56
	for <lists+linux-usb@lfdr.de>; Sun, 10 Jul 2022 08:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbiGJG2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Jul 2022 02:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJG2E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Jul 2022 02:28:04 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E5611C28
        for <linux-usb@vger.kernel.org>; Sat,  9 Jul 2022 23:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657434482; x=1688970482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6plBLcDxnLtDVk7hDVbxawZU44FcILgxXdRxC/f+T4=;
  b=IOOHpBIkncI/j3L1XcIo/j+qwW5+R8cCxLmSlhHIR7js3CLx973z30ZZ
   tf3ZDSKFFKGLFeGgx9llJeuQNW8aEBdEjMusm2xQs83E7GbbjHvhLjCyd
   t0p5fjFDbJvc1BMbdZmauxhPrUYQLzQrU3ms+mbVziyA3miQgxkNj1uID
   aV81EFGdl0JdVuM5fUn0Jk3RDlj2xV/4Kewecxi56gMGnKCftqOZ/cB1O
   cWA9LzmTLCusW8rqJ/JrquGXp8//X4yIa48OH6fzntnCqKlStZbDtu5Ct
   zx7qVcP3l3zFiCN0kqKA258WCahkSDNMKBk6ptoYNomJHaTlozKpaYWfp
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="370796492"
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="370796492"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2022 23:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,260,1650956400"; 
   d="scan'208";a="697287928"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2022 23:28:00 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1oAQQC-000PXY-8U;
        Sun, 10 Jul 2022 06:28:00 +0000
Date:   Sun, 10 Jul 2022 14:27:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>
Subject: [usb:usb-next 27/33]
 drivers/usb/core/../misc/onboard_usb_hub_pdevs.c:65:6: warning: no previous
 prototype for 'onboard_hub_create_pdevs'
Message-ID: <202207101421.kHbwWznT-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   8affe37c525d800a2628c4ecfaed13b77dc5634a
commit: 8bc063641cebf9d555e41d135db2b5035b521768 [27/33] usb: misc: Add onboard_usb_hub driver
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20220710/202207101421.kHbwWznT-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=8bc063641cebf9d555e41d135db2b5035b521768
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-next
        git checkout 8bc063641cebf9d555e41d135db2b5035b521768
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/usb/ sound/soc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/core/../misc/onboard_usb_hub_pdevs.c:65:6: warning: no previous prototype for 'onboard_hub_create_pdevs' [-Wmissing-prototypes]
      65 | void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/core/../misc/onboard_usb_hub_pdevs.c:132:6: warning: no previous prototype for 'onboard_hub_destroy_pdevs' [-Wmissing-prototypes]
     132 | void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/onboard_hub_create_pdevs +65 drivers/usb/core/../misc/onboard_usb_hub_pdevs.c

    30	
    31	/**
    32	 * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
    33	 * @parent_hub	: parent hub to scan for connected onboard hubs
    34	 * @pdev_list	: list of onboard hub platform devices owned by the parent hub
    35	 *
    36	 * Creates a platform device for each supported onboard hub that is connected to
    37	 * the given parent hub. The platform device is in charge of initializing the
    38	 * hub (enable regulators, take the hub out of reset, ...) and can optionally
    39	 * control whether the hub remains powered during system suspend or not.
    40	 *
    41	 * To keep track of the platform devices they are added to a list that is owned
    42	 * by the parent hub.
    43	 *
    44	 * Some background about the logic in this function, which can be a bit hard
    45	 * to follow:
    46	 *
    47	 * Root hubs don't have dedicated device tree nodes, but use the node of their
    48	 * HCD. The primary and secondary HCD are usually represented by a single DT
    49	 * node. That means the root hubs of the primary and secondary HCD share the
    50	 * same device tree node (the HCD node). As a result this function can be called
    51	 * twice with the same DT node for root hubs. We only want to create a single
    52	 * platform device for each physical onboard hub, hence for root hubs the loop
    53	 * is only executed for the root hub of the primary HCD. Since the function
    54	 * scans through all child nodes it still creates pdevs for onboard hubs
    55	 * connected to the root hub of the secondary HCD if needed.
    56	 *
    57	 * Further there must be only one platform device for onboard hubs with a peer
    58	 * hub (the hub is a single physical device). To achieve this two measures are
    59	 * taken: pdevs for onboard hubs with a peer are only created when the function
    60	 * is called on behalf of the parent hub that is connected to the primary HCD
    61	 * (directly or through other hubs). For onboard hubs connected to root hubs
    62	 * the function processes the nodes of both peers. A platform device is only
    63	 * created if the peer hub doesn't have one already.
    64	 */
  > 65	void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
    66	{
    67		int i;
    68		struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
    69		struct device_node *np, *npc;
    70		struct platform_device *pdev;
    71		struct pdev_list_entry *pdle;
    72	
    73		if (!parent_hub->dev.of_node)
    74			return;
    75	
    76		if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
    77			return;
    78	
    79		for (i = 1; i <= parent_hub->maxchild; i++) {
    80			np = usb_of_get_device_node(parent_hub, i);
    81			if (!np)
    82				continue;
    83	
    84			if (!of_is_onboard_usb_hub(np))
    85				goto node_put;
    86	
    87			npc = of_parse_phandle(np, "peer-hub", 0);
    88			if (npc) {
    89				if (!usb_hcd_is_primary_hcd(hcd)) {
    90					of_node_put(npc);
    91					goto node_put;
    92				}
    93	
    94				pdev = of_find_device_by_node(npc);
    95				of_node_put(npc);
    96	
    97				if (pdev) {
    98					put_device(&pdev->dev);
    99					goto node_put;
   100				}
   101			}
   102	
   103			pdev = of_platform_device_create(np, NULL, &parent_hub->dev);
   104			if (!pdev) {
   105				dev_err(&parent_hub->dev,
   106					"failed to create platform device for onboard hub '%pOF'\n", np);
   107				goto node_put;
   108			}
   109	
   110			pdle = kzalloc(sizeof(*pdle), GFP_KERNEL);
   111			if (!pdle) {
   112				of_platform_device_destroy(&pdev->dev, NULL);
   113				goto node_put;
   114			}
   115	
   116			pdle->pdev = pdev;
   117			list_add(&pdle->node, pdev_list);
   118	
   119	node_put:
   120			of_node_put(np);
   121		}
   122	}
   123	EXPORT_SYMBOL_GPL(onboard_hub_create_pdevs);
   124	
   125	/**
   126	 * onboard_hub_destroy_pdevs -- free resources of onboard hub platform devices
   127	 * @pdev_list	: list of onboard hub platform devices
   128	 *
   129	 * Destroys the platform devices in the given list and frees the memory associated
   130	 * with the list entry.
   131	 */
 > 132	void onboard_hub_destroy_pdevs(struct list_head *pdev_list)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
