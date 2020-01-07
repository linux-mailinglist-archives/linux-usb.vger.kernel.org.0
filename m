Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE80C132383
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 11:25:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbgAGKZo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 05:25:44 -0500
Received: from mga05.intel.com ([192.55.52.43]:16723 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727084AbgAGKZn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jan 2020 05:25:43 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jan 2020 02:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,405,1571727600"; 
   d="scan'208";a="225647117"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 07 Jan 2020 02:25:41 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 07 Jan 2020 12:25:40 +0200
Date:   Tue, 7 Jan 2020 12:25:40 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [bug report] thunderbolt: Add initial support for USB4
Message-ID: <20200107102540.GQ465886@lahna.fi.intel.com>
References: <20200107052424.pidwn5f7wyayany2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107052424.pidwn5f7wyayany2@kili.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 07, 2020 at 08:24:24AM +0300, Dan Carpenter wrote:
> [ Should linux-usb be listed in MAINTAINERS? - dan]

Yes, I think so. I'll make a patch for that.

> Hello Mika Westerberg,
> 
> The patch b04079837b20: "thunderbolt: Add initial support for USB4"
> from Dec 17, 2019, leads to the following static checker warning:
> 
> 	drivers/thunderbolt/usb4.c:242 usb4_switch_setup()
> 	warn: bool mask it always valse 'xhci & ((((1))) << (18))'
> 
> drivers/thunderbolt/usb4.c
>    206          bool tbt3, xhci;
>                 ^^^^       ^^^^
> 
>    207          u32 val = 0;
>    208          int ret;
>    209  
>    210          if (!tb_route(sw))
>    211                  return 0;
>    212  
>    213          ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_6, 1);
>    214          if (ret)
>    215                  return ret;
>    216  
>    217          xhci = val & ROUTER_CS_6_HCI;
>    218          tbt3 = !(val & ROUTER_CS_6_TNS);
>    219  
>    220          tb_sw_dbg(sw, "TBT3 support: %s, xHCI: %s\n",
>    221                    tbt3 ? "yes" : "no", xhci ? "yes" : "no");
>    222  
>    223          ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
>    224          if (ret)
>    225                  return ret;
>    226  
>    227          parent = tb_switch_parent(sw);
>    228  
>    229          if (tb_switch_find_port(parent, TB_TYPE_USB3_DOWN)) {
>    230                  val |= ROUTER_CS_5_UTO;
>    231                  xhci = false;
>    232          }
>    233  
>    234          /* Only enable PCIe tunneling if the parent router supports it */
>    235          if (tb_switch_find_port(parent, TB_TYPE_PCIE_DOWN)) {
>    236                  val |= ROUTER_CS_5_PTO;
>    237                  /*
>    238                   * xHCI can be enabled if PCIe tunneling is supported
>    239                   * and the parent does not have any USB3 dowstream
>    240                   * adapters (so we cannot do USB 3.x tunneling).
>    241                   */
>    242                  if (xhci & ROUTER_CS_6_HCI)
>                             ^^^^^^^^^^^^^^^^^^^^^^
> "xhci" is bool so BIT(18) is not set.

Good finding. It should be

	if (xhci)
		val |= ROUTER_CS_5_HCO;

I think. I'll make patch fixing it as well.
