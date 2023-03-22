Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A976C5022
	for <lists+linux-usb@lfdr.de>; Wed, 22 Mar 2023 17:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbjCVQJm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Mar 2023 12:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230221AbjCVQJb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Mar 2023 12:09:31 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757BE497E0
        for <linux-usb@vger.kernel.org>; Wed, 22 Mar 2023 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679501356; x=1711037356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3HnDMDdDqXrQYXZ3XFqYG0w7o3zV7Z9UfEpdu3nBb1s=;
  b=GKHu9tpnoCHzIfmW9RqEAcG7X/YBxlLHAAxliNepm4tBBLHyZ5/nPJQ+
   CkwuAn9tVjiVZuQxbiVnySvgXnPg7CHUH1VaukkfbZtURB3ltDS5PiWZN
   0GrVIhfT6R51/1RN4EkTwWKM3nSkpPzzrGd3p/J8aXAR8Aj4iQ+9W33bW
   vmOtWue2mathKVCXLPaBq4xkgViZAzb25Yo/kT75x/YF/fdAjm0oBE02l
   +GnNEl3vjq9RZO4gSRrAhfVsFhj6BadScAwZgTYNELmp4MXd0YpkWZ9hY
   xF3G0MSAX2WT3/oHumzfVffyPiKyaMZLGEcex5ftS0rGzJ0nIAWz3yARR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404142610"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="404142610"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 09:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="681951123"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="681951123"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Mar 2023 09:04:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pf0x9-000DSC-1T;
        Wed, 22 Mar 2023 16:04:43 +0000
Date:   Thu, 23 Mar 2023 00:04:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH] usb: gadget: f_fs: show device name in debug message
Message-ID: <202303222334.NjjsL9jI-lkp@intel.com>
References: <1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679481369-30094-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Linyu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next next-20230322]
[cannot apply to usb/usb-linus westeri-thunderbolt/next linus/master v6.3-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-f_fs-show-device-name-in-debug-message/20230322-183806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1679481369-30094-1-git-send-email-quic_linyyuan%40quicinc.com
patch subject: [PATCH] usb: gadget: f_fs: show device name in debug message
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230322/202303222334.NjjsL9jI-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/930fd85f08c8ea356961f750367a08d40235b599
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linyu-Yuan/usb-gadget-f_fs-show-device-name-in-debug-message/20230322-183806
        git checkout 930fd85f08c8ea356961f750367a08d40235b599
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303222334.NjjsL9jI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_fs.c: In function 'ffs_sb_make_inode':
>> drivers/usb/gadget/function/f_fs.c:1412:26: warning: unused variable 'ffs' [-Wunused-variable]
    1412 |         struct ffs_data *ffs = sb->s_fs_info;
         |                          ^~~
   In file included from include/linux/string.h:254,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/usb/gadget/function/f_fs.c:17:
   In function 'fortify_memcpy_chk',
       inlined from '__ffs_func_bind_do_os_desc' at drivers/usb/gadget/function/f_fs.c:3027:3:
   include/linux/fortify-string.h:529:25: warning: call to '__read_overflow2_field' declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     529 |                         __read_overflow2_field(q_size_field, size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ffs +1412 drivers/usb/gadget/function/f_fs.c

  1400	
  1401	/*
  1402	 * Mounting the file system creates a controller file, used first for
  1403	 * function configuration then later for event monitoring.
  1404	 */
  1405	
  1406	static struct inode *__must_check
  1407	ffs_sb_make_inode(struct super_block *sb, void *data,
  1408			  const struct file_operations *fops,
  1409			  const struct inode_operations *iops,
  1410			  struct ffs_file_perms *perms)
  1411	{
> 1412		struct ffs_data	*ffs = sb->s_fs_info;
  1413		struct inode *inode;
  1414	
  1415		ENTER_FFS();
  1416	
  1417		inode = new_inode(sb);
  1418	
  1419		if (inode) {
  1420			struct timespec64 ts = current_time(inode);
  1421	
  1422			inode->i_ino	 = get_next_ino();
  1423			inode->i_mode    = perms->mode;
  1424			inode->i_uid     = perms->uid;
  1425			inode->i_gid     = perms->gid;
  1426			inode->i_atime   = ts;
  1427			inode->i_mtime   = ts;
  1428			inode->i_ctime   = ts;
  1429			inode->i_private = data;
  1430			if (fops)
  1431				inode->i_fop = fops;
  1432			if (iops)
  1433				inode->i_op  = iops;
  1434		}
  1435	
  1436		return inode;
  1437	}
  1438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
