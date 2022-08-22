Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDC9C59C35E
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 17:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236719AbiHVPsh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 11:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236729AbiHVPs2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 11:48:28 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4A5D103;
        Mon, 22 Aug 2022 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661183307; x=1692719307;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9v+TRlWSb3Q8gtaQcUjLPA2zaE552ON81kuY+M4qOAI=;
  b=HtbSYmv8CHXpRWcA5JpoV9bD1NawMUffu9nbe5hsoV2FziYE/UZhsbN9
   c+prm87Bl63xANst0f1FzBJ1Oo2jLxGilLaNydaaxTOLNQA9kWdvBfFBj
   IqUbB63nwjVC/KZN+6Hhd7Sd5vYCXV0D+bDVrZC6vy4CSxbn0TbbOZ7bL
   hhUn9iXSjvofXLxrLfDFThMkRs6i17GICwO9Ks8AYvn0vPNBP7r7/dD4+
   uXNBAcCV+a6mf5oS+U6IB9Jj5cceg9PWOAx8dHWcIb8vi6LKwAgVBwIs6
   YGlKzer8EHk0xyvAgnEJYxyNw93SOGoy2NayAP89p5APBI1WVBAJRZ9gs
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294237712"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="294237712"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2022 08:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="559795643"
Received: from lkp-server01.sh.intel.com (HELO dd9b29378baa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Aug 2022 08:47:50 -0700
Received: from kbuild by dd9b29378baa with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oQ9eX-0000Pe-2c;
        Mon, 22 Aug 2022 15:47:49 +0000
Date:   Mon, 22 Aug 2022 23:46:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com,
        robh+dt@kernel.org, peda@axentia.se, shawnguo@kernel.org
Cc:     kbuild-all@lists.01.org, gregkh@linuxfoundation.org,
        linux@roeck-us.net, jun.li@nxp.com, xu.yang_2@nxp.com,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] usb: typec: mux: add typec orientation switch
 support via mux controller
Message-ID: <202208222312.IFf74Ze6-lkp@intel.com>
References: <20220822153517.3747679-4-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822153517.3747679-4-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Xu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on shawnguo/for-next linus/master v6.0-rc2 next-20220822]
[cannot apply to robh/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/typec-orientation-switch-support-via-mux-controller/20220822-153600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: i386-randconfig-a013-20220822 (https://download.01.org/0day-ci/archive/20220822/202208222312.IFf74Ze6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/703ba3cfec5b6f9422ac9a859bc6121f7c4a12fd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Xu-Yang/typec-orientation-switch-support-via-mux-controller/20220822-153600
        git checkout 703ba3cfec5b6f9422ac9a859bc6121f7c4a12fd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: drivers/usb/typec/mux.o: in function `typec_switch_put':
>> mux.c:(.text+0x21d): undefined reference to `mux_control_put'
   ld: drivers/usb/typec/mux.o: in function `typec_switch_set':
>> mux.c:(.text+0x29a): undefined reference to `mux_control_deselect'
>> ld: mux.c:(.text+0x2ab): undefined reference to `mux_control_select_delay'
   ld: drivers/usb/typec/mux.o: in function `typec_switch_get':
>> mux.c:(.text+0x767): undefined reference to `mux_control_get'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
