Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3D4681B26
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 21:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjA3UOf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 15:14:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjA3UOd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 15:14:33 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7D7302B5
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 12:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675109672; x=1706645672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Ms+hu3CYdYzlkJaLug3KmwicPx4jhzjOekkjRORy2A=;
  b=kMJxLOze69Ld/IXPAqgdpV3sO3djzPyK4NoUrG8gkq2NVmDNlyhNReP9
   Y5E0SKYVZBoqHx5Xq8LIZxWSx2/n8QCfPmD8i54hs/J3YkP8/D0v8jotn
   wctBSusY7qngM2vE/3Cp74IvRS/0FsCjfgbPtr8ykyjeirxkCNJiWSsqg
   AHoGoCcc9DmmtLSirH+GCvQQrMpbuPJQSJQxEpL9XpvJVzBaD4SP5Udt/
   Aq8LezrS79og9ngKxDOXMdc7qFY7HUlc3sP9dziB707lro6qBqUtzilkj
   9ZC90wewlg8GIiLEV3xkRqB2Nf4OSShirHn+tkfbTFO896xdK6eKsp5Ky
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="413881894"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="413881894"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 12:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="838089883"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="838089883"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2023 12:14:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pMaXi-0003sg-1o;
        Mon, 30 Jan 2023 20:14:18 +0000
Date:   Tue, 31 Jan 2023 04:13:52 +0800
From:   kernel test robot <lkp@intel.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com
Cc:     oe-kbuild-all@lists.linux.dev, mgr@pengutronix.de,
        balbi@kernel.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, stern@rowland.harvard.edu,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 03/11] usb: gadget: uvc: Allow definition of XUs in
 configfs
Message-ID: <202301310439.qAxkvKBD-lkp@intel.com>
References: <20230130093443.25644-4-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130093443.25644-4-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-linus]
[also build test WARNING on westeri-thunderbolt/next linus/master v6.2-rc6 next-20230130]
[cannot apply to usb/usb-testing usb/usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/usb-gadget-uvc-Make-bSourceID-read-write/20230130-174215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
patch link:    https://lore.kernel.org/r/20230130093443.25644-4-dan.scally%40ideasonboard.com
patch subject: [PATCH v3 03/11] usb: gadget: uvc: Allow definition of XUs in configfs
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/c1a147d5dfd26ea76a1d054efc3a184dec36061b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Scally/usb-gadget-uvc-Make-bSourceID-read-write/20230130-174215
        git checkout c1a147d5dfd26ea76a1d054efc3a184dec36061b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/ABI/testing/configfs-usb-gadget-uvc:120: WARNING: Malformed table.

vim +120 Documentation/ABI/testing/configfs-usb-gadget-uvc

   118	
   119	What:		/config/usb-gadget/gadget/functions/uvc.name/control/extensions/name
 > 120	Date:		Nov 2022
   121	KernelVersion:	6.1
   122	Description:	Extension Unit (XU) Descriptor
   123	
   124			bLength, bUnitID and iExtension are read-only. All others are
   125			read-write.
   126	
   127			===============		========================================
   128			bLength			size of the descriptor in bytes
   129			bUnitID			non-zero ID of this unit
   130			guidExtensionCode	Vendor-specific code identifying the XU
   131			bNumControls		number of controls in this XU
   132			bNrInPins		number of input pins for this unit
   133			baSourceID		list of the IDs of the units or terminals
   134						to which this XU is connected
   135			bControlSize		size of the bmControls field in bytes
   136			bmControls		list of bitmaps detailing which vendor
   137						specific controls are supported
   138			iExtension		index of a string descriptor that describes
   139						this extension unit
   140			===============		========================================
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
