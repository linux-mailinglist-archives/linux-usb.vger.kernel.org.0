Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB79F20E456
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 00:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390007AbgF2VYI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jun 2020 17:24:08 -0400
Received: from mga06.intel.com ([134.134.136.31]:65036 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729270AbgF2Sua (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Jun 2020 14:50:30 -0400
IronPort-SDR: bpG/He6aPixWB4li9kCcVFOnjF7lscqgx+SMdMJTxG4U1/CV3PwebOjhcEBBL8+2Bwd09DlKhK
 6JYFqC+dN5Og==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="207498179"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="207498179"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2020 08:39:30 -0700
IronPort-SDR: zsdD4/J4nt4Z8e+VXY+Oxu6RcvwCmr979GDt1GenLaisZ41lbxSGdxdl5axa5t/xla83Uu7y1x
 LRuJnQlLQRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; 
   d="scan'208";a="386426200"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 29 Jun 2020 08:39:27 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 29 Jun 2020 18:39:27 +0300
Date:   Mon, 29 Jun 2020 18:39:27 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 00/17] thunderbolt: Tunneling improvements
Message-ID: <20200629153927.GS5180@lahna.fi.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 15, 2020 at 05:26:28PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series improves the Thunderbolt/USB4 driver to support tree topologies
> that are now possible with USB4 devices (it is possible with TBT devices
> but there are no such devices available in the market with more than two
> ports).
> 
> We also take advantage of KUnit and add unit tests for path walking and
> tunneling (in cases where hardware is not needed). In addition we add
> initial support for USB3 tunnel bandwidth management so that the driver can
> share isochronous bandwidth between USB3 and DisplayPort.
> 
> Mika Westerberg (17):
>   thunderbolt: Fix path indices used in USB3 tunnel discovery
>   thunderbolt: Make tb_next_port_on_path() work with tree topologies
>   thunderbolt: Make tb_path_alloc() work with tree topologies
>   thunderbolt: Check that both ports are reachable when allocating path
>   thunderbolt: Handle incomplete PCIe/USB3 paths correctly in discovery
>   thunderbolt: Increase path length in discovery
>   thunderbolt: Add KUnit tests for path walking
>   thunderbolt: Add DP IN resources for all routers
>   thunderbolt: Do not tunnel USB3 if link is not USB4
>   thunderbolt: Make usb4_switch_map_usb3_down() also return enabled ports
>   thunderbolt: Make usb4_switch_map_pcie_down() also return enabled ports
>   thunderbolt: Report consumed bandwidth in both directions
>   thunderbolt: Increase DP DPRX wait timeout
>   thunderbolt: Implement USB3 bandwidth negotiation routines
>   thunderbolt: Make tb_port_get_link_speed() available to other files
>   thunderbolt: Add USB3 bandwidth management
>   thunderbolt: Add KUnit tests for tunneling

Queued these for v5.9.
