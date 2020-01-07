Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEC5D1321F8
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 10:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgAGJMR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 04:12:17 -0500
Received: from mga05.intel.com ([192.55.52.43]:11532 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbgAGJMQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jan 2020 04:12:16 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 01:12:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,405,1571727600"; 
   d="scan'208";a="303135717"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 07 Jan 2020 01:12:15 -0800
Subject: Re: USB Host drive memory leak at "xhci_add_in_port" function
To:     "Sajja, Venkateswara Rao" <VenkateswaraRao.Sajja@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "wan.ahmad.zainie.wan.mohamad@intel.com" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>
References: <DM6PR12MB3836074F014B19E4002F675BEC3F0@DM6PR12MB3836.namprd12.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <136db96a-1513-c946-fa76-d291dc9d8f5d@linux.intel.com>
Date:   Tue, 7 Jan 2020 11:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB3836074F014B19E4002F675BEC3F0@DM6PR12MB3836.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7.1.2020 9.24, Sajja, Venkateswara Rao wrote:
> Hi,
> 
> This is SVR from AMD, I'm facing memory leak issue with in USB Host driver with the following patches,
> patch1: "https://www.yoctoproject.org/pipermail/linux-yocto/2016-June/005558.html", this patch is doing the "parse xhci protocol speed ID list for usb 3.1 usage" but memory leak is happening at,
> 
> */rhub->psi = kcalloc(rhub->psi_count, sizeof(*rhub->psi), GFP_KERNEL);/*
> 
> This is because of "xhci_add_in_port" is getting called from a loop, i.e,
> 
> 
>   patch2: "rework xhci extended capability list parsing functions": https://www.yoctoproject.org/pipermail/linux-yocto/2016-June/005559.html"
> 
> /*while (offset) { xhci_add_in_port(xhci, num_ports, base + offset, cap_count); if (xhci->num_usb2_ports + xhci->num_usb3_ports == num_ports) break; offset = xhci_find_next_ext_cap(base, offset, XHCI_EXT_CAPS_PROTOCOL); }*/
> 
>  From the above loop "*xhci_add_in_port*"function is called more than once for USB 3.1. So the memory allocation for  *psi (**/rhub->psi/**)*
> 
> is happening more than once and /rhub->psi /is overridden without freeing the previously allocated memory. This is causing the memory leak.
> 
> The following "[PATCH 1/6] xhci: Fix memory leak in xhci_add_in_port()  <https://lore.kernel.org/linux-usb/20191211142007.8847-2-mathias.nyman@linux.intel.com/#r>"patch is not solving the memory leak issue,
> 
> https://lore.kernel.org/linux-usb/20191211142007.8847-2-mathias.nyman@linux.intel.com/#r
> 
> Could somebody suggest me the alternative patch to fix this memory leak issue.
> 

Thanks, true, the original code falsely assumes there are only two
xHCI supported Protocol Capabilities with psic entries in the list of extended capabilities,
one for usb 2 ports and one for usb 3.x ports

I'll look into this

-Mathias


