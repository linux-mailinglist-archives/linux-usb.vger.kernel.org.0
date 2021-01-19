Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCEE2FBAA7
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jan 2021 16:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbhASO6x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 09:58:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:15227 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390832AbhASMsi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Jan 2021 07:48:38 -0500
IronPort-SDR: /QpIOURqXPzRDV1NQ2XdxlR9XAhn6Jy+A/ziMz3rgVW4mrmQMbeF1LRpIHpJAUEoz69XXdpU37
 CllaBOMbY84Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="158099304"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="158099304"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 04:47:32 -0800
IronPort-SDR: 0/Avog7veZRp0XfmHXYOC5xnDKbh2OAfJijzP0zb/Nlbv6lGQOhGe22qcmlerOBDfEtdPrzIDE
 ekyynMp6JQRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="347166339"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga007.fm.intel.com with ESMTP; 19 Jan 2021 04:47:31 -0800
Subject: Re: [PATCH 0/4] add xhci hooks for USB offload
To:     Howard Yen <howardyen@google.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210119101044.1637023-1-howardyen@google.com>
From:   Mathias Nyman <mathias.nyman@intel.com>
Message-ID: <af91bbf1-6731-3e87-4086-de0dbba22c22@intel.com>
Date:   Tue, 19 Jan 2021 14:49:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210119101044.1637023-1-howardyen@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19.1.2021 12.10, Howard Yen wrote:
> To let the xhci driver support USB offload, add hooks for vendor to have
> customized behavior for the initialization, memory allocation, irq work, and 
> device context synchronization. Detail is in each patch commit message.

Is this related to the usb audio sideband capability that was added to the xHCI specification?
If yes, then we should probably implement the generic parts first, and then add
the vendor specific hooks.

-Mathias
 

