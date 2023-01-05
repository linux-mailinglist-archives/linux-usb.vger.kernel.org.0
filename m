Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7995A65E9E0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jan 2023 12:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbjAEL2g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Jan 2023 06:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbjAEL2F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Jan 2023 06:28:05 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26AE513F6F
        for <linux-usb@vger.kernel.org>; Thu,  5 Jan 2023 03:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672918032; x=1704454032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0kHMT1FD2AsXt19Ml77SgDFNl8GJztM8yE1PAMkxuto=;
  b=aGgdZlIXAu+NlJAXGc31ie5M8kdzhKeMLJmi6knpSC/jpnNO1i0odYTI
   zIqHpkAht7ZCykzuiMPh6vQvZ9RIXt+ctKBYINv+jiIZ6xgvng7Q06lC9
   ZfCymMmHgDMgWR+cMubfD/EiAYvl9PWfKmGbE5qM/3KyRhp0SzA90YgHX
   JoysrUZH7F1EKRPXzj0XmiT/UrkhNZqzwZRV4FPrxyx0RXOU8PjENBvR7
   PRjngHbwH1hRHtECDB7ia4NIVUOr6w3A2gAG2r5Js+90YMDwkeo+LKIh1
   mA0y08Vaw8lnPcv0WnOy+PIPasfaYuLnIqOWAt5c/eohuClNC/CGdol5J
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="322250320"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="322250320"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2023 03:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="797893739"
X-IronPort-AV: E=Sophos;i="5.96,302,1665471600"; 
   d="scan'208";a="797893739"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 05 Jan 2023 03:27:08 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 05 Jan 2023 13:27:07 +0200
Date:   Thu, 5 Jan 2023 13:27:07 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Subject: Re: [PATCH v2] usb: ucsi: fix connector partner ucsi work issue
Message-ID: <Y7a0C+DkI5Q6hq6O@kuha.fi.intel.com>
References: <1672897360-24257-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1672897360-24257-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jan 05, 2023 at 01:42:40PM +0800, Linyu Yuan wrote:
> When a PPM client unregisters with UCSI framework, connector specific work
> queue is destroyed. However, a pending delayed work queued before may
> still exist. Once the delay timer expires and the work is scheduled,
> this can cause a system crash as the workqueue is destroyed already.

When the workqueue is destroyed it's also flushed, no? So how could
there be still something pending, delayed or not? Did you actually see
this happening?

> Fix this by moving all partner related delayed work to connector instance
> and cancel all of them when ucsi_unregister() is called by PPM client.

I would love to be able to cancel these works, though not because of
driver removal - I'm more concerned about disconnections. The reason
why each task is a unique work is because it allows the driver to add
the same task to the queue as many times as needed, and that was
needed inorder to recover from some firmware issues. If there's only a
dedicated work per task like in your proposal, we can only schedule
the task once at a time, and that may lead into other issues.

But first things first. Is the problem that you are describing here a
real problem that can actually happen?

thanks,

-- 
heikki
