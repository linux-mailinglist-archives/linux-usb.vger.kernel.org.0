Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA1C15BC89
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 11:16:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbgBMKQz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 05:16:55 -0500
Received: from bmailout3.hostsharing.net ([176.9.242.62]:50239 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbgBMKQz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 05:16:55 -0500
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Feb 2020 05:16:54 EST
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 4496E101E6958;
        Thu, 13 Feb 2020 11:09:08 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id EE20210DD27; Thu, 13 Feb 2020 11:09:07 +0100 (CET)
Date:   Thu, 13 Feb 2020 11:09:07 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Add missing kernel-doc parameter
 descriptions
Message-ID: <20200213100907.xeuvsiaz4hwxnmb4@wunner.de>
References: <20200213100207.1942-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213100207.1942-1-mika.westerberg@linux.intel.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 13, 2020 at 01:02:07PM +0300, Mika Westerberg wrote:
> @@ -296,6 +297,9 @@ static int usb4_switch_drom_read_block(struct tb_switch *sw,
>  /**
>   * usb4_switch_drom_read() - Read arbitrary bytes from USB4 router DROM
>   * @sw: USB4 router
> + * @address: Byte address inside DROM to start reading
> + * @buf: Buffer where the DROM contens is stored

Either "content is" or "contents are".
