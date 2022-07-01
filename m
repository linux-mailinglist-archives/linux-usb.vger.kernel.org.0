Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50B45636FD
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jul 2022 17:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbiGAPgV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Jul 2022 11:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiGAPgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Jul 2022 11:36:20 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0FD3969B
        for <linux-usb@vger.kernel.org>; Fri,  1 Jul 2022 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656689779; x=1688225779;
  h=message-id:date:mime-version:from:to:cc:subject:
   content-transfer-encoding;
  bh=/dPGJRcQtPAc1p1xA0oFrGO5zj+gQyVd1spBe/ckc1I=;
  b=LhstW84ENPDw1n9PE9+WaCaKMBSwK1eBeYorPoXzFbz/zUUhwS1IWwx6
   6sbXHHozvrVRaCpWncOrq/utvUeCUs4HyAEs/EgQbbo4GDF4sU8yLd8MQ
   cFM35kG9E09FLLTD5IbsknDFlSFVkTThlbsgMsE1USQBV4SbRltdKKvmp
   oL6iIlNU17p13O+tixtHRE2P/LkIh0x7BwMiBUPVYXh5sD2suStSlf/vO
   VuhmA5M83513dmAHAXoaH1czsTtIPFbElimURYAJ9XOPTRbjpXW5zKFy2
   UJLbbn/pwOZKYrhV3QqdnEBHhcWoeyUg0QyqQJ9b71o6QZRa6A7jef0Hd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="308193763"
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; 
   d="scan'208";a="308193763"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 08:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,237,1650956400"; 
   d="scan'208";a="681438328"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Jul 2022 08:36:18 -0700
Message-ID: <b7f90a48-c275-fc61-cf6b-fa425d2f05ec@linux.intel.com>
Date:   Fri, 1 Jul 2022 18:37:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     USB <linux-usb@vger.kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        alan Stern <stern@rowland.harvard.edu>
Subject: xhci maintenance on vacation most of July
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

I'll be on vacation most of July. I'll check in for a couple days (18-19 July),
but otherwise xhci maintenance will for my part resume in August.

Thanks
-Mathias















