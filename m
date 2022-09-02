Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 546625AB8C6
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 21:14:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiIBTO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 15:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiIBTO1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 15:14:27 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE37DB3D;
        Fri,  2 Sep 2022 12:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662146062; x=1693682062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LGelK57um33buhYq2dvNurCSd5PhnvJUO/tfyE/kfyE=;
  b=F07sro2+c3zqlAmPcFfcQFx5NAzvyclbbvzygia7acbp0LUJ69uhU0EQ
   hjG1cmJqKgNYCVoScjfEO4RSZBp1dMxU4i8TqdXXhs/qk0ZKCBQjWfIlf
   emqhwUeP62UrNAKs2bJKoXxCOmHnWAOPm0upVdT8PzTdShvKMQvSWeSNA
   tF/MjQUgJP8l/5lsAX7GlGRpwtbWZwAaxH7rkYv3glSU25b8aP/dLHPNW
   J8LnRw5ZxsNPXzRaPNPsIIDuOB7vTBXuE0HP2TMLxSfRDpoyBuxNrysJs
   X1CYM8ZBDywEoIG2gaq8vvGvUiOTcFHLy+w3NSmqGMr1HwmZq36ufOsvU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="275806606"
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="275806606"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 12:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="681381055"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2022 12:01:17 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oUBum-0000UT-2a;
        Fri, 02 Sep 2022 19:01:16 +0000
Date:   Sat, 3 Sep 2022 03:01:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org
Subject: [usb:usb-linus 36/44] htmldocs:
 Documentation/driver-api/usb/usb:176: ./drivers/usb/core/hub.c:6040:
 WARNING: Unknown target name: "pre".
Message-ID: <202209030207.7BTPa8q0-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
head:   fe0a2ac7c627b064c479ad0c3b25e531d342e048
commit: 9c6d778800b921bde3bff3cff5003d1650f942d1 [36/44] USB: core: Prevent nested device-reset calls
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=9c6d778800b921bde3bff3cff5003d1650f942d1
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-linus
        git checkout 9c6d778800b921bde3bff3cff5003d1650f942d1
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/usb/usb:176: ./drivers/usb/core/hub.c:6040: WARNING: Unknown target name: "pre".

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
