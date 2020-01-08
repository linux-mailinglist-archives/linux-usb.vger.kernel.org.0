Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE713134627
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 16:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgAHP1V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 10:27:21 -0500
Received: from mga03.intel.com ([134.134.136.65]:27427 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbgAHP1V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 10:27:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 07:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="303583370"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 08 Jan 2020 07:27:20 -0800
Subject: Re: USB Host drive memory leak at "xhci_add_in_port" function
To:     "Sajja, Venkateswara Rao" <VenkateswaraRao.Sajja@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     "wan.ahmad.zainie.wan.mohamad@intel.com" 
        <wan.ahmad.zainie.wan.mohamad@intel.com>
References: <DM6PR12MB3836074F014B19E4002F675BEC3F0@DM6PR12MB3836.namprd12.prod.outlook.com>
 <136db96a-1513-c946-fa76-d291dc9d8f5d@linux.intel.com>
 <DM6PR12MB3836B5D7F6862F7E1B05FD63EC3F0@DM6PR12MB3836.namprd12.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <1da7672b-d666-311d-58f8-c40a8249c09e@linux.intel.com>
Date:   Wed, 8 Jan 2020 17:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB3836B5D7F6862F7E1B05FD63EC3F0@DM6PR12MB3836.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7.1.2020 12.29, Sajja, Venkateswara Rao wrote:
> [AMD Official Use Only - Internal Distribution Only]
> 
> 
> Hi,
> 
> Thanks. Could you please let me know, if this issue is fixed, into which version of kernel it get merged?
> 

Patch for testing can be found in my tree in the fix_psi_memleak branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_psi_memleak
https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_psi_memleak

patch:

https://patchwork.kernel.org/patch/11323891/

-Mathias
