Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC2C6B2425
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 13:27:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbjCIM1A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 07:27:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbjCIM0g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 07:26:36 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCAD8EBFAD
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 04:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678364786; x=1709900786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EL1Izt0VLi3TKr0DcBmPss7A6zpKmZUWCYIix1TjWeA=;
  b=KufLdo3LVwY8pbIMIC8SFX+qu9tqY6/d8i1JkW8zpmE/BJrcVGOFrLqr
   W/D98JBYeuh3PGEaDATHR5GQr2/iLbtJ9v0LN+lDr/51XmEa9ma6B5Dqu
   iOpouThLyJsc/cSTkZtTtNiUBJjv/PqiuWpIaMauBGdJWnkDiLQs6p7J2
   C5aOtPmfAIugw9oJJKk/Sq2CJjs3qZwC/cmF7eKoMloiibU4f9du71RAe
   b63uqrqc0fsKSHN5ukqTHHu0VHrI7d/Kt5onnpenvUBeXaAKpnXqbi/vY
   EJJYRyxzYaZtvSRp+pWNOuHeuStjl5LlrAmyFpowt9vHActPlZatANu0l
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="422702548"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="422702548"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:26:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709829044"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="709829044"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Mar 2023 04:26:24 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1paFLj-0002wf-2P;
        Thu, 09 Mar 2023 12:26:23 +0000
Date:   Thu, 9 Mar 2023 20:25:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kangzhen Lou <kangzhen.lou@dell.com>, oliver@neukum.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Kangzhen Lou <kangzhen.lou@dell.com>
Subject: Re: [PATCH] net: cdc_ncm: support ACPI MAC address pass through
 functionality
Message-ID: <202303092027.01TO9rlB-lkp@intel.com>
References: <20230309083436.6729-1-kangzhen.lou@dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309083436.6729-1-kangzhen.lou@dell.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Kangzhen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.3-rc1 next-20230309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kangzhen-Lou/net-cdc_ncm-support-ACPI-MAC-address-pass-through-functionality/20230309-184736
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20230309083436.6729-1-kangzhen.lou%40dell.com
patch subject: [PATCH] net: cdc_ncm: support ACPI MAC address pass through functionality
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303092027.01TO9rlB-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/97cd8ee9a774c36093af3d26255e415f6082b4a3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kangzhen-Lou/net-cdc_ncm-support-ACPI-MAC-address-pass-through-functionality/20230309-184736
        git checkout 97cd8ee9a774c36093af3d26255e415f6082b4a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092027.01TO9rlB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/usb/cdc_ncm.c:818:5: warning: no previous prototype for 'acpi_mac_passthru_invalid' [-Wmissing-prototypes]
     818 | int acpi_mac_passthru_invalid(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/cdc_ncm.c:851:5: warning: no previous prototype for 'get_acpi_mac_passthru' [-Wmissing-prototypes]
     851 | int get_acpi_mac_passthru(char *MACAddress)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/cdc_ncm.c: In function 'cdc_ncm_get_ethernet_address':
   drivers/net/usb/cdc_ncm.c:894:49: warning: passing argument 6 of 'usbnet_read_cmd' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     894 |                               iface_no, dev->net->dev_addr, ETH_ALEN);
         |                                         ~~~~~~~~^~~~~~~~~~
   In file included from drivers/net/usb/cdc_ncm.c:53:
   include/linux/usb/usbnet.h:181:49: note: expected 'void *' but argument is of type 'const unsigned char *'
     181 |                     u16 value, u16 index, void *data, u16 size);
         |                                           ~~~~~~^~~~
   drivers/net/usb/cdc_ncm.c: In function 'cdc_ncm_determine_ethernet_addr':
>> drivers/net/usb/cdc_ncm.c:980:48: warning: passing argument 1 of 'memcpy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     980 |                                 memcpy(dev->net->dev_addr, sa.sa_data, ETH_ALEN);
         |                                        ~~~~~~~~^~~~~~~~~~
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/net/usb/cdc_ncm.c:41:
   arch/ia64/include/asm/string.h:19:22: note: expected 'void *' but argument is of type 'const unsigned char *'
      19 | extern void *memcpy (void *, const void *, __kernel_size_t);
         |                      ^~~~~~


vim +980 drivers/net/usb/cdc_ncm.c

   950	
   951	static int cdc_ncm_determine_ethernet_addr(struct usb_interface *intf)
   952	{
   953		struct sockaddr sa;
   954		struct usbnet *dev = usb_get_intfdata(intf);
   955		struct cdc_ncm_ctx *ctx;
   956		int ret = 0;
   957	
   958		if (!dev)
   959			return 0;
   960	
   961		/* MAC pass through function only apply to Realtek RTL8153-DD chip */
   962		if (!(dev->udev->descriptor.idVendor == 0x0bda
   963			&& dev->udev->descriptor.idProduct == 0x8153
   964			&& (dev->udev->descriptor.bcdDevice & 0xff00) == 0x3300))
   965			return 0;
   966	
   967		ctx = (struct cdc_ncm_ctx *)dev->data[0];
   968		if (!ctx->ether_desc)
   969			return 0;
   970	
   971		ret = cdc_ncm_get_ethernet_address(dev, ctx);
   972		if (ret) {
   973			dev_dbg(&intf->dev, "failed to get mac address\n");
   974			return ret;
   975		}
   976	
   977		if (!get_acpi_mac_passthru(sa.sa_data)) {
   978			if (memcmp(dev->net->dev_addr, sa.sa_data, ETH_ALEN) != 0) {
   979				if (!cdc_ncm_set_ethernet_address(dev, &sa))
 > 980					memcpy(dev->net->dev_addr, sa.sa_data, ETH_ALEN);
   981			}
   982		}
   983	
   984		dev_info(&intf->dev, "MAC-Address: %pM\n", dev->net->dev_addr);
   985	
   986		return 0;
   987	}
   988	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
