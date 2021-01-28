Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CC230803E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 22:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhA1VIt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 16:08:49 -0500
Received: from bmailout3.hostsharing.net ([176.9.242.62]:51401 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhA1VIs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 16:08:48 -0500
X-Greylist: delayed 643 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Jan 2021 16:08:48 EST
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 360E1100D9410;
        Thu, 28 Jan 2021 21:57:20 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id EC62F10DD54; Thu, 28 Jan 2021 21:57:19 +0100 (CET)
Date:   Thu, 28 Jan 2021 21:57:19 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/5] thunderbolt: eeprom: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210128205719.GA7956@wunner.de>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210128122934.36897-3-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 28, 2021 at 03:29:31PM +0300, Mika Westerberg wrote:
>  /**
> - * tb_drom_read - copy drom to sw->drom and parse it
> + * tb_drom_read() - Copy DROM to sw->drom and parse it
> + * @sw: Router whose DROM to read and parse
> + *
> + * This function reads router DROM and if successful parses the entries and
> + * populates the fields in @sw accordingly. Can be called for any router
> + * generation.
> + *
> + * Returns %0 in case of success and negative errno otherwise.
>   */
>  int tb_drom_read(struct tb_switch *sw)
>  {

I'm confused by the terminology change of "router" vs. "switch".
Is this change mandated by USB4?

The parameter is a tb_switch, so calling it a router looks a little odd.

Thanks,

Lukas
