Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3379869E472
	for <lists+linux-usb@lfdr.de>; Tue, 21 Feb 2023 17:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233404AbjBUQZa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Feb 2023 11:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjBUQZ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Feb 2023 11:25:28 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D83234CA
        for <linux-usb@vger.kernel.org>; Tue, 21 Feb 2023 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676996727; x=1708532727;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=OfK8Yic/7rrDCeliaMqWojeK44Uzfdst2S0fe34f5nI=;
  b=BUk7p55xxtfUMfvEss5ZMnBJwZ5DPbqL7kJvydG3S3Ngv80l5Q2EBi6C
   uqMdJuxzxVEi0VdOPm6r3KSLzzwvnYtRVOJAdPy7k8q1VT/ssU2/QGTL6
   nQ34dAjRtZVbitF0GXJ2F+hheKwXTtfIttnmn29gCP32o1A33BN5BxfNj
   c9jMP2w+Nb7bNl0ZPZQcAAgPZjnf8ezAAEw5GgNBWpd2RLjjnXX3Y9JRB
   E6FgQ/7/mhqWToU8wfmIG8GVpGPbTWMQhho1VAIHmLt7Z+hcOKuqSxObB
   thdSxkpNR6juy1vVh370e6ZreaMlX4aXxHEgi3MGLhnNu5hx7vsnKBUee
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="334040403"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="334040403"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 08:25:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="1000662930"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="1000662930"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2023 08:25:19 -0800
Message-ID: <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com>
Date:   Tue, 21 Feb 2023 18:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To:     Seth Bollinger <seth.boll@gmail.com>, linux-usb@vger.kernel.org
Cc:     sethb@digi.com
References: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: HC died
In-Reply-To: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.2.2023 16.21, Seth Bollinger wrote:
> Hello All,
> 
> We're experiencing a problem with our devices in the field where our
> customers attach problematic USB devices that are causing the xhci
> host controller to shut down with the "HC died; cleaning up" message.

Is this seen only on some specific xHC host controller?

> 
> I've narrowed this down to a timeout of the address device TRB on the
> command ring (currently 5 seconds).  It sometimes takes our hardware
> 9.6 to complete this TRB.  When the driver is trying to stop the cmd
> ring, the controller is busy for an additional 4.6 seconds.  This
> results in the "HC died" message and shutdown of the host controller.
> 
> If I bump the command ring timeout beyond the max TRB completion time,
> the host controller continues to be responsive and doesn't need to be
> shut down.
> 
> My knowledge of how the usb protocol should handle this problem isn't
> strong enough to know if there is a better solution than simply
> increasing the command ring default timeout.

Are these problematic devices USB 2 or USB 3 devices?

You could try playing with the Address device command BSR (block set
address request) flag and see if helps.
Xhci has two ways to get a slot from the Enabled to the Addressed state.

option 1: move slot from Enabled state to Addressed in one go:
Enabled --(Addr dev cmd, BSR=0)--> Addressed

option 2: move from Enabled state via Default state to Addressed state:
Enabled --(Addr dev cmd, BSR=1)--> Default --(Addr dev cmd, BSR=0)--> Addressed

I think the usb core "old_scheme_first" module parameter will end up doing this.

-Mathias

