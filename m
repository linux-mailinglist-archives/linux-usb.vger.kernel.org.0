Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1195A405C34
	for <lists+linux-usb@lfdr.de>; Thu,  9 Sep 2021 19:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237224AbhIIRlu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 13:41:50 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54290 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237190AbhIIRlt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Sep 2021 13:41:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631209240; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=A6kMpu4RVw0XKnPtj+mFRmkI7J0x93pc2SzXVw7hfms=; b=MOElBq/4u2zAH8bxplCPDLaiDdC9DUmhWI5WvNXNhlaQalbjjgIT8udUJDVIXa1MqkkVPTNk
 c+hpX/bhZZc4254X9G+kyeN7P2moFWEyXIJil6M80eUtt4JZ2CdI7TPHEpgSRDgrGE90fk2m
 t1HwhEZ2W4wKtRYsnc7dFX0GcNA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 613a470dde7dfad22ff98e75 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 17:40:29
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CCD7CC43617; Thu,  9 Sep 2021 17:40:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A2A13C4360C;
        Thu,  9 Sep 2021 17:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A2A13C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Date:   Thu, 9 Sep 2021 10:40:22 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Ferry Toth <fntoth@gmail.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Pawel Laszczak <pawell@cadence.com>
Subject: Re: [PATCH v2 2/2] usb: gadget: f_uac2: Populate SS descriptors'
 wBytesPerInterval
Message-ID: <20210909174007.GC20111@jackp-linux.qualcomm.com>
References: <20210909082651.11912-3-jackp@codeaurora.org>
 <202109100030.4qMPkRBj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202109100030.4qMPkRBj-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 10, 2021 at 01:08:02AM +0800, kernel test robot wrote:
> Hi Jack,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on usb/usb-testing]
> [also build test ERROR on peter.chen-usb/for-usb-next linus/master next-20210909]
> [cannot apply to v5.14]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Jack-Pham/usb-gadget-f_uac2-Fixes-for-SuperSpeed/20210909-162955
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> config: i386-randconfig-a016-20210908 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 261cbe98c38f8c1ee1a482fe76511110e790f58a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/f262014b234c389fc10439b7c11aa10ea84270f6
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Jack-Pham/usb-gadget-f_uac2-Fixes-for-SuperSpeed/20210909-162955
>         git checkout f262014b234c389fc10439b7c11aa10ea84270f6
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/usb/gadget/function/f_uac2.c:1181:19: error: member reference type 'struct usb_ss_ep_comp_descriptor' is not a pointer; did you mean to use '.'?
>            ss_epin_desc_comp->wBytesPerInterval = ss_epin_desc->wMaxPacketSize;
>            ~~~~~~~~~~~~~~~~~^~
>                             .
> >> drivers/usb/gadget/function/f_uac2.c:1181:53: error: member reference type 'struct usb_endpoint_descriptor' is not a pointer; did you mean to use '.'?
>            ss_epin_desc_comp->wBytesPerInterval = ss_epin_desc->wMaxPacketSize;
>                                                   ~~~~~~~~~~~~^~
>                                                               .
> >> drivers/usb/gadget/function/f_uac2.c:1181:39: error: expression is not assignable
>            ss_epin_desc_comp->wBytesPerInterval = ss_epin_desc->wMaxPacketSize;
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>    drivers/usb/gadget/function/f_uac2.c:1182:20: error: member reference type 'struct usb_ss_ep_comp_descriptor' is not a pointer; did you mean to use '.'?
>            ss_epout_desc_comp->wBytesPerInterval = ss_epout_desc->wMaxPacketSize;
>            ~~~~~~~~~~~~~~~~~~^~
>                              .
>    drivers/usb/gadget/function/f_uac2.c:1182:55: error: member reference type 'struct usb_endpoint_descriptor' is not a pointer; did you mean to use '.'?
>            ss_epout_desc_comp->wBytesPerInterval = ss_epout_desc->wMaxPacketSize;
>                                                    ~~~~~~~~~~~~~^~
>                                                                 .
>    drivers/usb/gadget/function/f_uac2.c:1182:40: error: expression is not assignable
>            ss_epout_desc_comp->wBytesPerInterval = ss_epout_desc->wMaxPacketSize;
>            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
>    6 errors generated.

DOH! Was wondering why this was working for me but failed to realize I
was still loading an older build that had previous changes.

Sorry for the noise!! V3 coming very soon.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
