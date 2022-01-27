Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC88B49DEC0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jan 2022 11:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238941AbiA0KJG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jan 2022 05:09:06 -0500
Received: from bmailout1.hostsharing.net ([83.223.95.100]:42947 "EHLO
        bmailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238940AbiA0KJF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jan 2022 05:09:05 -0500
X-Greylist: delayed 533 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Jan 2022 05:09:05 EST
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout1.hostsharing.net (Postfix) with ESMTPS id A7CBF30006180;
        Thu, 27 Jan 2022 11:00:10 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 9D90A30A8F2; Thu, 27 Jan 2022 11:00:10 +0100 (CET)
Date:   Thu, 27 Jan 2022 11:00:10 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 2/3] thunderbolt: Add internal xHCI connect flows for
 Thunderbolt 3 devices
Message-ID: <20220127100010.GA6500@wunner.de>
References: <20220126141653.28092-1-mika.westerberg@linux.intel.com>
 <20220126141653.28092-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126141653.28092-3-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 26, 2022 at 05:16:52PM +0300, Mika Westerberg wrote:
> +/**
> + * tb_lc_xhci_connect() - Connect internal xHCI
> + * @port: Device router lane 0 adapter
> + *
> + * Tells LC to connect the internal xHCI to @port. Returns %0 in success
                                                                 ^^
								 on

> + * and negative errno in case of failure. Can be called for Thunderbolt 3
> + * routers only.
> + */
