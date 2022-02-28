Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B24A4C7B30
	for <lists+linux-usb@lfdr.de>; Mon, 28 Feb 2022 22:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiB1VAg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Feb 2022 16:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbiB1VAf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Feb 2022 16:00:35 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A98624F464
        for <linux-usb@vger.kernel.org>; Mon, 28 Feb 2022 12:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646081994; x=1677617994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9xl2b40hzO4JRtT5sjr752FQcYhwowPk6zQQxSWYUDk=;
  b=Q1+A7N/QWdKM2bw2DQpDuth4r7XR68k6XDMDgKD+gGsehGqUr/Vnx6N4
   +Pg/56DM/29DcdSJZyp90SqsGQQgziwMNEocGRDYCObEkTTj/0agYE+ba
   MGYAEBkeby7u3th2aMFywLdrpZz+bm2FbpGmV9wTjDYvhmtvbdZ+YWlSk
   H9UIctsgGVwcsgZ9rjJDUFIIz4quOgHW24lXZlSF3jsl+E+OCAq/35SKZ
   uV9h6THPoLkY9HGPlga4r658F+wt/jIuY6Rr8knigUMAgsKL8N2jcO2t2
   i1YGoL9F28UmpqElyBQ3vvJf+hIyXJoBYi3KK8LatNqxdKtvO39p7+OuQ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="253178587"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="253178587"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 12:59:54 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="593358352"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 12:59:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nOn6m-009b5a-T9;
        Mon, 28 Feb 2022 22:59:04 +0200
Date:   Mon, 28 Feb 2022 22:59:04 +0200
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     micklorain <micklorain@protonmail.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Message-ID: <Yh03mFSESvwT8Wt0@smile.fi.intel.com>
References: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 28, 2022 at 08:12:47PM +0000, micklorain wrote:
> Hi,
> 
> This patch breaks USB for me. I noticed when I upgraded from debian's 4.19.0-18 (working) to 5.10.0-10 (broken). I git bisect'ed until I found that this patch is the culprit. Upstream 5.17.0-rc2 is still broken, but 5.17.0-rc2 with this patch reverted works.
> 
> lsusb when things work :
> https://paste.debian.net/hidden/2a964425/
> 
> lsusb when things are broken :
> https://paste.debian.net/hidden/0376920c/
> 
> dmesg when things are broken :
> https://paste.debian.net/hidden/780ca112/
> 
> dmesg when things work :
> https://paste.debian.net/hidden/4d1bfc0f/
> 
> Let me know if you need anything else from me.

Thanks for your report!

Last time I have got something similar it becomes that PCI bridge which is used
to connect USB controller to the PCI Root Bridge was not capable of MSI, while
advertising that capability. I.o.w. HW bug.

To understand if it's something similar, please run (under the root) each of
the following commands:

	lspci -nk -vvv
	cat /proc/interrupts

in both cases, i.e. working and non-working.

And then share the output (all 4 files).

-- 
With Best Regards,
Andy Shevchenko


