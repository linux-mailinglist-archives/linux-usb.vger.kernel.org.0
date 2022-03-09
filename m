Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8C64D3842
	for <lists+linux-usb@lfdr.de>; Wed,  9 Mar 2022 19:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbiCIRtO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Mar 2022 12:49:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiCIRtO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Mar 2022 12:49:14 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DD8E5434
        for <linux-usb@vger.kernel.org>; Wed,  9 Mar 2022 09:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646848094; x=1678384094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7GUzwlPqFK5gW7BKJm7Mgnk4CfXsaz+GGLymB7h97I4=;
  b=c1Ju8X6WjwukP4TDGVmPJCufgBsjxwVXNDR3KYJ9gD1TKe8w3XlJC9d8
   5wQjklfVrdQMcBbdLeFLey4cJnA2//fgBES+XGwm+UWFubEfKqn11Ptui
   uFw/dgCZ7UPHIUSTcP9EECM8sNKTuF6gJKxYNDztHkF8IfW6Zff91aqDw
   HldYGY3ogciZUzIhGwUfjV0QOlRdWp1u5uNVpVlSwHrhL4OLPdPQrUut3
   JlOhcB7eooTgITsMg/t1Zd5oudEDqtuUVSKunBXKgsow72Iw319AV2n2F
   wH9NOnRw1dWyhAh4v0HjQYfxDQLPx0CquaVRO3bYuJ/zJX8VWRIuzsjgq
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="237211356"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="237211356"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 09:48:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; 
   d="scan'208";a="644123383"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 09:48:12 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nS0PI-00E7yb-S6;
        Wed, 09 Mar 2022 19:47:28 +0200
Date:   Wed, 9 Mar 2022 19:47:28 +0200
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     micklorain <micklorain@protonmail.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [PATCH v1] usb: hcd: Try MSI interrupts on PCI devices
Message-ID: <YijoMAZJ1elUfZnh@smile.fi.intel.com>
References: <PxIByDyBRcsbpcmVhGSNDFAoUcMmb78ctXCkw6fbpx25TGlCHvA6SJjjFkNr1FfQZMntYPTNyvEnblxzAZ8a6jP9ddLpKeCN6Chi_2FuexU=@protonmail.com>
 <Yh03mFSESvwT8Wt0@smile.fi.intel.com>
 <GCkSeDmZAyagb-3ogwNAwxsKYpxXSQRM6HeO_O9WxSYO1-8WL8ook5WQ9JchpyBqo4SIJ2XuW2DWFJeJrCzqzcedaBjNvfjNLZo1j3hU5tc=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GCkSeDmZAyagb-3ogwNAwxsKYpxXSQRM6HeO_O9WxSYO1-8WL8ook5WQ9JchpyBqo4SIJ2XuW2DWFJeJrCzqzcedaBjNvfjNLZo1j3hU5tc=@protonmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 06, 2022 at 04:09:49PM +0000, micklorain wrote:
> On Monday, February 28th, 2022 at 21:59, andriy.shevchenko@linux.intel.com <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Feb 28, 2022 at 08:12:47PM +0000, micklorain wrote:

...

> > Last time I have got something similar it becomes that PCI bridge which is used
> >
> > to connect USB controller to the PCI Root Bridge was not capable of MSI, while
> >
> > advertising that capability. I.o.w. HW bug.
> >
> > To understand if it's something similar, please run (under the root) each of
> >
> > the following commands:
> >
> > lspci -nk -vvv
> >
> > cat /proc/interrupts
> >
> > in both cases, i.e. working and non-working.
> >
> > And then share the output (all 4 files).

> Thanks for your reply.
> This is the results of the commands you requested :
> 
> * When things work (commit dcb85f85fa6f142aae1fe86f399d4503d49f2b60 with commit 306c54d0edb6ba94d39877524dddebaad7770cf2 reverted)
> - lspci -nk -vvv :
> https://paste.debian.net/hidden/77d92dc9/
> 
> - cat /proc/interrupts
> https://paste.debian.net/hidden/67208c8e/
> 
> * When things are broken (commit dcb85f85fa6f142aae1fe86f399d4503d49f2b60)
> - lspci -nk -vvv :
> https://paste.debian.net/hidden/121362b3/
> 
> - cat /proc/interrupts :
> https://paste.debian.net/hidden/dbe8d1bb/
> 
> Hope this can help.

Thank you for sharing. Are you able to compile a kernel and boot it? If so,
can you try the following patch?

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 65f7f6b0576c..149742aa5f4d 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3041,6 +3041,13 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_BROADCOM,
 			PCI_DEVICE_ID_TIGON3_5715S,
 			quirk_msi_intx_disable_bug);
 
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4386, quirk_msi_intx_disable_ati_bug);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4387, quirk_msi_intx_disable_ati_bug);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4388, quirk_msi_intx_disable_ati_bug);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4389, quirk_msi_intx_disable_ati_bug);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x438a, quirk_msi_intx_disable_ati_bug);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x438b, quirk_msi_intx_disable_ati_bug);
+
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4390,
 			quirk_msi_intx_disable_ati_bug);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x4391,


In case it doesn't help, remove 'ati_' part from the function name and try again.

-- 
With Best Regards,
Andy Shevchenko


