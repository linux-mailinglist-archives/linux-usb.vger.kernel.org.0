Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0389980E
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2019 17:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387607AbfHVPVn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Aug 2019 11:21:43 -0400
Received: from mga03.intel.com ([134.134.136.65]:40621 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725892AbfHVPVn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Aug 2019 11:21:43 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 08:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; 
   d="scan'208";a="203449462"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.164]) ([10.237.72.164])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 08:21:40 -0700
Subject: Re: [Resend] [PATCH v3] usb: xhci-pci: reorder removal to avoid
 use-after-free
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1565946200239.8897@mentor.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <fbbf1ed3-c0c0-9b34-aeec-32a6f3645d7b@linux.intel.com>
Date:   Thu, 22 Aug 2019 18:23:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565946200239.8897@mentor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 16.8.2019 12.03, Schmid, Carsten wrote:
> On driver removal, the platform_device_unregister call
> attached through devm_add_action_or_reset was executed
> after usb_hcd_pci_remove.
> This lead to a use-after-free for the iomem resource of
> the xhci-ext-caps driver in the platform removal
> because the parent of the resource was freed earlier.
> 
> Fix this by reordering of the removal sequence.
> 

Could all this be avoided if usb_hcd_pci_probe()
used managed device resources as well?
(using devm_request_mem_region(), and devm_ioremap_nocache())

This way the iomem resource would be added to the same devres list
as the platform_unregister_call, and the iomem resource should be
released after the platform_device_unregister as devres_release_all()
releases the resources in reverse order.

-Mathias
