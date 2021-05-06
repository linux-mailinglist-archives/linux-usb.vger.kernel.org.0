Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908E83758B6
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 18:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235996AbhEFQwE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 12:52:04 -0400
Received: from mga12.intel.com ([192.55.52.136]:16902 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235700AbhEFQwD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 12:52:03 -0400
IronPort-SDR: koB1YSzZmDRWKHM+5sGJUJ/5mhG2g4QxQKVznTuB22hrszGP5nQFkCJQURBxW8p2PRR7CP+VjX
 6PD3nwzpGa+Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="178083194"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; 
   d="gz'50?scan'50,208,50";a="178083194"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2021 09:50:47 -0700
IronPort-SDR: k2mi/APZ9gXSyHhu18dBX0sx29HtFLc89r/1XWKHDpnOzJTQQ/4LD7PWA40PYsD1sQjk710XBO
 vnfVXo0yZfbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; 
   d="gz'50?scan'50,208,50";a="430635083"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 May 2021 09:50:44 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lehD1-000AmH-Me; Thu, 06 May 2021 16:50:43 +0000
Date:   Fri, 7 May 2021 00:50:02 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: Re: [PATCH 5/7] usb: isp1760: add support for isp1763
Message-ID: <202105070028.XpLAB6uC-lkp@intel.com>
References: <20210504101910.18619-6-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HlL+5n6rz5pIUxbD"
Content-Disposition: inline
In-Reply-To: <20210504101910.18619-6-rui.silva@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--HlL+5n6rz5pIUxbD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rui,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next v5.12 next-20210506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rui-Miguel-Silva/usb-isp1760-extend-support-for-isp1763/20210504-182126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: x86_64-randconfig-s022-20210506 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/0day-ci/linux/commit/e20d3193f1d1eef8bfdf1eb6a4001a916d4c463c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rui-Miguel-Silva/usb-isp1760-extend-support-for-isp1763/20210504-182126
        git checkout e20d3193f1d1eef8bfdf1eb6a4001a916d4c463c
        # save the attached .config to linux build tree
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/usb/isp1760/isp1760-hcd.c:300:32: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:321:23: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:397:38: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:397:38: sparse:     expected unsigned int val
   drivers/usb/isp1760/isp1760-hcd.c:397:38: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:418:30: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:418:30: sparse:     expected unsigned int val
   drivers/usb/isp1760/isp1760-hcd.c:418:30: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:487:20: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:487:20: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:487:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw0 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:487:18: sparse:     expected restricted __dw [usertype] dw0
   drivers/usb/isp1760/isp1760-hcd.c:487:18: sparse:     got unsigned int [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:488:20: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:488:20: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:488:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw1 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:488:18: sparse:     expected restricted __dw [usertype] dw1
   drivers/usb/isp1760/isp1760-hcd.c:488:18: sparse:     got unsigned int [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:489:20: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:489:20: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:489:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw2 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:489:18: sparse:     expected restricted __dw [usertype] dw2
   drivers/usb/isp1760/isp1760-hcd.c:489:18: sparse:     got unsigned int [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:490:20: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:490:20: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:490:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw3 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:490:18: sparse:     expected restricted __dw [usertype] dw3
   drivers/usb/isp1760/isp1760-hcd.c:490:18: sparse:     got unsigned int [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:491:20: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:491:20: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:491:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw4 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:491:18: sparse:     expected restricted __dw [usertype] dw4
   drivers/usb/isp1760/isp1760-hcd.c:491:18: sparse:     got unsigned int [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:492:20: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:492:20: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:492:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw5 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:492:18: sparse:     expected restricted __dw [usertype] dw5
   drivers/usb/isp1760/isp1760-hcd.c:492:18: sparse:     got unsigned int [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:493:20: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:493:20: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:493:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw6 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:493:18: sparse:     expected restricted __dw [usertype] dw6
   drivers/usb/isp1760/isp1760-hcd.c:493:18: sparse:     got unsigned int [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:494:20: sparse: sparse: cast to restricted __le32
   drivers/usb/isp1760/isp1760-hcd.c:494:20: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:494:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw7 @@     got unsigned int [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:494:18: sparse:     expected restricted __dw [usertype] dw7
   drivers/usb/isp1760/isp1760-hcd.c:494:18: sparse:     got unsigned int [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:514:19: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:514:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw0 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:514:17: sparse:     expected restricted __dw [usertype] dw0
   drivers/usb/isp1760/isp1760-hcd.c:514:17: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:515:19: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:515:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw1 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:515:17: sparse:     expected restricted __dw [usertype] dw1
   drivers/usb/isp1760/isp1760-hcd.c:515:17: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:516:19: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:516:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw2 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:516:17: sparse:     expected restricted __dw [usertype] dw2
   drivers/usb/isp1760/isp1760-hcd.c:516:17: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:517:19: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:517:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw3 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:517:17: sparse:     expected restricted __dw [usertype] dw3
   drivers/usb/isp1760/isp1760-hcd.c:517:17: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:518:19: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:518:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw4 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:518:17: sparse:     expected restricted __dw [usertype] dw4
   drivers/usb/isp1760/isp1760-hcd.c:518:17: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:519:19: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:519:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw5 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:519:17: sparse:     expected restricted __dw [usertype] dw5
   drivers/usb/isp1760/isp1760-hcd.c:519:17: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:520:19: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:520:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw6 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:520:17: sparse:     expected restricted __dw [usertype] dw6
   drivers/usb/isp1760/isp1760-hcd.c:520:17: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:521:19: sparse: sparse: cast from restricted __dw
>> drivers/usb/isp1760/isp1760-hcd.c:521:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw7 @@     got restricted __le32 [usertype] @@
   drivers/usb/isp1760/isp1760-hcd.c:521:17: sparse:     expected restricted __dw [usertype] dw7
   drivers/usb/isp1760/isp1760-hcd.c:521:17: sparse:     got restricted __le32 [usertype]
   drivers/usb/isp1760/isp1760-hcd.c:536:65: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int const [usertype] *[assigned] src @@     got restricted __dw * @@
   drivers/usb/isp1760/isp1760-hcd.c:536:65: sparse:     expected unsigned int const [usertype] *[assigned] src
   drivers/usb/isp1760/isp1760-hcd.c:536:65: sparse:     got restricted __dw *
   drivers/usb/isp1760/isp1760-hcd.c:539:46: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int const [usertype] *[assigned] src @@     got restricted __dw * @@
   drivers/usb/isp1760/isp1760-hcd.c:539:46: sparse:     expected unsigned int const [usertype] *[assigned] src
   drivers/usb/isp1760/isp1760-hcd.c:539:46: sparse:     got restricted __dw *
   drivers/usb/isp1760/isp1760-hcd.c:802:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw0 @@     got int @@
   drivers/usb/isp1760/isp1760-hcd.c:802:18: sparse:     expected restricted __dw [usertype] dw0
   drivers/usb/isp1760/isp1760-hcd.c:802:18: sparse:     got int
   drivers/usb/isp1760/isp1760-hcd.c:803:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:803:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:803:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:804:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:804:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:804:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:805:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:805:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:805:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:808:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw1 @@     got unsigned int @@
   drivers/usb/isp1760/isp1760-hcd.c:808:18: sparse:     expected restricted __dw [usertype] dw1
   drivers/usb/isp1760/isp1760-hcd.c:808:18: sparse:     got unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:809:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:809:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:809:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:810:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:810:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:810:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:813:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:813:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:813:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:815:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:815:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:815:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:820:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:820:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:820:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:822:34: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:822:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:822:34: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:824:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:824:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:824:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:825:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:825:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:825:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:830:34: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:830:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:830:34: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:835:26: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:835:26: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:835:26: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:838:34: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:838:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:838:34: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:842:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:842:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:842:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:843:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:843:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:843:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:846:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:846:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:846:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:847:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:847:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:847:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:850:34: sparse: sparse: invalid assignment: &=
   drivers/usb/isp1760/isp1760-hcd.c:850:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:850:34: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:852:34: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:852:34: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:852:34: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:855:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:855:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:855:18: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:857:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:857:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:857:18: sparse:    right side has type int
   drivers/usb/isp1760/isp1760-hcd.c:902:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw5 @@     got int @@
   drivers/usb/isp1760/isp1760-hcd.c:902:26: sparse:     expected restricted __dw [usertype] dw5
   drivers/usb/isp1760/isp1760-hcd.c:902:26: sparse:     got int
   drivers/usb/isp1760/isp1760-hcd.c:908:18: sparse: sparse: invalid assignment: |=
   drivers/usb/isp1760/isp1760-hcd.c:908:18: sparse:    left side has type restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:908:18: sparse:    right side has type unsigned int
   drivers/usb/isp1760/isp1760-hcd.c:909:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __dw [usertype] dw4 @@     got unsigned int [assigned] [usertype] usof @@
   drivers/usb/isp1760/isp1760-hcd.c:909:18: sparse:     expected restricted __dw [usertype] dw4
   drivers/usb/isp1760/isp1760-hcd.c:909:18: sparse:     got unsigned int [assigned] [usertype] usof
   drivers/usb/isp1760/isp1760-hcd.c:1241:13: sparse: sparse: bad assignment (>>=) to restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:1246:16: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1251:33: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1272:29: sparse: sparse: bad assignment (>>=) to restricted __dw
   drivers/usb/isp1760/isp1760-hcd.c:1285:16: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1286:24: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1288:26: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1303:17: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1303:47: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1309:14: sparse: sparse: restricted __dw degrades to integer
   drivers/usb/isp1760/isp1760-hcd.c:1309:49: sparse: sparse: restricted __dw degrades to integer

vim +487 drivers/usb/isp1760/isp1760-hcd.c

   478	
   479	static void isp1763_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
   480				     struct ptd *ptd)
   481	{
   482		u16 src_offset = ptd_offset + slot * sizeof(*ptd);
   483		struct ptd le32_ptd;
   484	
   485		isp1763_mem_read(hcd, src_offset, (u16 *)&le32_ptd, sizeof(le32_ptd));
   486		/* Normalize the data obtained */
 > 487		ptd->dw0 = le32_to_cpu(le32_ptd.dw0);
 > 488		ptd->dw1 = le32_to_cpu(le32_ptd.dw1);
 > 489		ptd->dw2 = le32_to_cpu(le32_ptd.dw2);
 > 490		ptd->dw3 = le32_to_cpu(le32_ptd.dw3);
 > 491		ptd->dw4 = le32_to_cpu(le32_ptd.dw4);
 > 492		ptd->dw5 = le32_to_cpu(le32_ptd.dw5);
 > 493		ptd->dw6 = le32_to_cpu(le32_ptd.dw6);
 > 494		ptd->dw7 = le32_to_cpu(le32_ptd.dw7);
   495	}
   496	
   497	static void ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
   498			     struct ptd *ptd)
   499	{
   500		struct isp1760_hcd *priv = hcd_to_priv(hcd);
   501	
   502		if (!priv->is_isp1763)
   503			return isp1760_ptd_read(hcd, ptd_offset, slot, ptd);
   504	
   505		isp1763_ptd_read(hcd, ptd_offset, slot, ptd);
   506	}
   507	
   508	static void isp1763_ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
   509				      struct ptd *cpu_ptd)
   510	{
   511		u16 dst_offset = ptd_offset + slot * sizeof(*cpu_ptd);
   512		struct ptd ptd;
   513	
 > 514		ptd.dw0 = cpu_to_le32(cpu_ptd->dw0);
 > 515		ptd.dw1 = cpu_to_le32(cpu_ptd->dw1);
 > 516		ptd.dw2 = cpu_to_le32(cpu_ptd->dw2);
 > 517		ptd.dw3 = cpu_to_le32(cpu_ptd->dw3);
 > 518		ptd.dw4 = cpu_to_le32(cpu_ptd->dw4);
 > 519		ptd.dw5 = cpu_to_le32(cpu_ptd->dw5);
 > 520		ptd.dw6 = cpu_to_le32(cpu_ptd->dw6);
 > 521		ptd.dw7 = cpu_to_le32(cpu_ptd->dw7);
   522	
   523		isp1763_mem_write(hcd, dst_offset,  (u16 *)&ptd.dw0,
   524				  8 * sizeof(ptd.dw0));
   525	}
   526	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--HlL+5n6rz5pIUxbD
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
Lxx/kP7SaAIA

--HlL+5n6rz5pIUxbD--
