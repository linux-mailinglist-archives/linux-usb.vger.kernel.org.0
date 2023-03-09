Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55F596B23E7
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 13:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjCIMRl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 07:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbjCIMRi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 07:17:38 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA13EA021
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 04:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678364234; x=1709900234;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L93blkbX4LwQs6CLmh2B+42f/OmudB+IWOABJeM9HcY=;
  b=V9gzxL4WTpIunNZSuWiQv4t57vAZglZU8u0H3RT9nmJdxAqrXf4gT78V
   BFzhJqR10sOGHxbn/s3fCZ3BododHVQZc2ikZ5KpnCTGM9M7a/D9n1Xhl
   RCefdd5i8VSbbcxjlOCTGRcV8aPUBY+B9W6OxZTxd5uYuhbGVth626BRj
   SXE5E3cN97fzsL9tcN6d+7I32itavEPGRdOCE6mEbuLdo+axWgZ7fszKr
   hw1kiovcXlc8xE2y5mqLXcIe+/qlaF7DNwW59aopwdUF9hML3d5tKn9TR
   VTzsU4M01+iyJnNoRYmNp6f8d0l/54bCd0E4NZ51pHxM+58fURUWC13Yg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="316825483"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="316825483"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 04:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="670701796"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; 
   d="scan'208";a="670701796"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 09 Mar 2023 04:16:24 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1paFC3-0002w9-1O;
        Thu, 09 Mar 2023 12:16:23 +0000
Date:   Thu, 9 Mar 2023 20:15:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Kangzhen Lou <kangzhen.lou@dell.com>, oliver@neukum.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Kangzhen Lou <kangzhen.lou@dell.com>
Subject: Re: [PATCH] net: cdc_ncm: support ACPI MAC address pass through
 functionality
Message-ID: <202303092024.QNv44vyX-lkp@intel.com>
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
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230309/202303092024.QNv44vyX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/97cd8ee9a774c36093af3d26255e415f6082b4a3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kangzhen-Lou/net-cdc_ncm-support-ACPI-MAC-address-pass-through-functionality/20230309-184736
        git checkout 97cd8ee9a774c36093af3d26255e415f6082b4a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303092024.QNv44vyX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/usb/cdc_ncm.c:818:5: warning: no previous prototype for 'acpi_mac_passthru_invalid' [-Wmissing-prototypes]
     818 | int acpi_mac_passthru_invalid(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/usb/cdc_ncm.c:851:5: warning: no previous prototype for 'get_acpi_mac_passthru' [-Wmissing-prototypes]
     851 | int get_acpi_mac_passthru(char *MACAddress)
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/usb/cdc_ncm.c: In function 'cdc_ncm_get_ethernet_address':
>> drivers/net/usb/cdc_ncm.c:894:49: warning: passing argument 6 of 'usbnet_read_cmd' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     894 |                               iface_no, dev->net->dev_addr, ETH_ALEN);
         |                                         ~~~~~~~~^~~~~~~~~~
   In file included from drivers/net/usb/cdc_ncm.c:53:
   include/linux/usb/usbnet.h:181:49: note: expected 'void *' but argument is of type 'const unsigned char *'
     181 |                     u16 value, u16 index, void *data, u16 size);
         |                                           ~~~~~~^~~~
   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/net/usb/cdc_ncm.c:41:
   drivers/net/usb/cdc_ncm.c: In function 'cdc_ncm_determine_ethernet_addr':
>> drivers/net/usb/cdc_ncm.c:980:48: warning: passing argument 1 of '__builtin_memcpy' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     980 |                                 memcpy(dev->net->dev_addr, sa.sa_data, ETH_ALEN);
         |                                        ~~~~~~~~^~~~~~~~~~
   arch/m68k/include/asm/string.h:52:42: note: in definition of macro 'memcpy'
      52 | #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
         |                                          ^
   drivers/net/usb/cdc_ncm.c:980:48: note: expected 'void *' but argument is of type 'const unsigned char *'
     980 |                                 memcpy(dev->net->dev_addr, sa.sa_data, ETH_ALEN);
         |                                        ~~~~~~~~^~~~~~~~~~
   arch/m68k/include/asm/string.h:52:42: note: in definition of macro 'memcpy'
      52 | #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
         |                                          ^


vim +/acpi_mac_passthru_invalid +818 drivers/net/usb/cdc_ncm.c

   817	
 > 818	int acpi_mac_passthru_invalid(void)
   819	{
   820		acpi_status status;
   821		struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
   822		union acpi_object *obj;
   823		int ret = -EINVAL;
   824	
   825		/* returns _AUXMAC_#AABBCCDDEEFF# */
   826		status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
   827		obj = (union acpi_object *)buffer.pointer;
   828	
   829		if (!ACPI_SUCCESS(status))
   830			return -ENODEV;
   831		if (obj->type != ACPI_TYPE_BUFFER || obj->string.length != 0x17) {
   832			acpi_info("Invalid buffer for pass-thru MAC addr: (%d, %d)\n",
   833				  obj->type, obj->string.length);
   834			goto amacout;
   835		}
   836		if (strncmp(obj->string.pointer, "_AUXMAC_#", 9) != 0 ||
   837		    strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
   838			acpi_info("Invalid header when reading pass-thru MAC addr\n");
   839			goto amacout;
   840		}
   841		/* return success, otherwise return non-zero if invalid buffer read or
   842		 * MAC pass through is disabled in BIOS
   843		 */
   844		ret = 0;
   845	
   846	amacout:
   847		kfree(obj);
   848		return ret;
   849	}
   850	
 > 851	int get_acpi_mac_passthru(char *MACAddress)
   852	{
   853		acpi_status status;
   854		struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
   855		union acpi_object *obj;
   856		int ret = -EINVAL;
   857		unsigned char buf[6];
   858	
   859		/* returns _AUXMAC_#AABBCCDDEEFF# */
   860		status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
   861		obj = (union acpi_object *)buffer.pointer;
   862	
   863		if (!ACPI_SUCCESS(status))
   864			return -ENODEV;
   865	
   866		ret = hex2bin(buf, obj->string.pointer + 9, 6);
   867		if (!(ret == 0 && is_valid_ether_addr(buf))) {
   868			acpi_info("Invalid MAC for pass-thru MAC addr: %d, %pM\n",
   869				  ret, buf);
   870			ret = -EINVAL;
   871			goto amacout;
   872		}
   873		memcpy(MACAddress, buf, 6);
   874		acpi_info("Pass-thru MAC addr %pM\n", MACAddress);
   875	
   876	amacout:
   877		kfree(obj);
   878		return ret;
   879	}
   880	
   881	/* Provide method to get MAC address from the USB device's ethernet controller.
   882	 * If the device supports CDC_GET_ADDRESS, we should receive just six bytes.
   883	 * Otherwise, use the prior method by asking for the descriptor.
   884	 */
   885	static int cdc_ncm_get_ethernet_address(struct usbnet *dev,
   886						struct cdc_ncm_ctx *ctx)
   887	{
   888		int ret;
   889		u8 iface_no = ctx->control->cur_altsetting->desc.bInterfaceNumber;
   890	
   891		ret = usbnet_read_cmd(dev, USB_CDC_GET_NET_ADDRESS,
   892				      USB_DIR_IN | USB_TYPE_CLASS
   893				      | USB_RECIP_INTERFACE, 0,
 > 894				      iface_no, dev->net->dev_addr, ETH_ALEN);
   895	
   896		if (ret == ETH_ALEN) {
   897			ret = 0;	/* success */
   898		} else {
   899			ret = usbnet_get_ethernet_addr(dev,
   900					ctx->ether_desc->iMACAddress);
   901		}
   902	
   903		return ret;
   904	}
   905	
   906	/* Provide method to push MAC address to the USB device's ethernet controller.
   907	 * If the device does not support CDC_SET_ADDRESS, there is no harm and we
   908	 * proceed as before.
   909	 */
   910	static int cdc_ncm_set_ethernet_address(struct usbnet *dev,
   911						struct sockaddr *addr)
   912	{
   913		int ret;
   914		struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
   915		u8 iface_no_data = ctx->data->cur_altsetting->desc.bInterfaceNumber;
   916		u8 iface_no_control = ctx->control->cur_altsetting->desc.bInterfaceNumber;
   917		int temp;
   918	
   919		/* The host shall only send SET_NET_ADDRESS command while
   920		 * the NCM Data Interface is in alternate setting 0.
   921		 */
   922		temp = usb_set_interface(dev->udev, iface_no_data, 0);
   923		if (temp) {
   924			dev_dbg(&dev->udev->dev, "set interface failed\n");
   925			return -ENODEV;
   926			}
   927	
   928		ret = usbnet_write_cmd(dev, USB_CDC_SET_NET_ADDRESS,
   929				       USB_DIR_OUT | USB_TYPE_CLASS
   930				       | USB_RECIP_INTERFACE, 0,
   931				       iface_no_control, addr->sa_data, ETH_ALEN);
   932	
   933		if (ret == ETH_ALEN)
   934			ret = 0;	// success
   935		else if (ret < 0)
   936			dev_dbg(&dev->udev->dev, "bad MAC address put, %d\n", ret);
   937	
   938		/* restore alternate setting.
   939		 * The NCM data altsetting is fixed, so we hard-coded it.
   940		 */
   941		temp = usb_set_interface(dev->udev, iface_no_data,
   942				CDC_NCM_DATA_ALTSETTING_NCM);
   943		if (temp) {
   944			dev_dbg(&dev->udev->dev, "set interface failed\n");
   945			return -ENODEV;
   946			}
   947	
   948		return ret;
   949	}
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
