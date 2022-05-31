Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCD0538DDB
	for <lists+linux-usb@lfdr.de>; Tue, 31 May 2022 11:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239268AbiEaJiU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 May 2022 05:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbiEaJiT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 May 2022 05:38:19 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731F850068
        for <linux-usb@vger.kernel.org>; Tue, 31 May 2022 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653989898; x=1685525898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F6tP4ggV3uAmxVkPqZ/A1saK2AVY39HWDnYTr2zG54U=;
  b=jnbSZPYWnUKF3HJ1+KMa6O689QMsQZ1nFjmCyCg6GyuLqE2Ez3zkLJ9c
   NNAo8mqQ0UuRi9GhUlHr6NmCTeEHCJ4LYOCgryfEwXXerTlGBmRyU5MW2
   TRcNgeDn1HLWGpT0Wk4oWKuYt/qwFHE1LTIXgwaC06/W3hMomdYnWS5rw
   K5e4FgUb5TxCu0e0QjELdUGjrqWzOVRZ0rLAszFbEVjAgXIXgSLg7aajb
   08TjgsOuj9nE/LC6T7KlLl6X0FL+6cSwtGwUTv1aGwHg4fisxfCpZHwce
   LmR95+3krQCkSAaxVqWUk/7inRBUsIcgUQI9LhYyYZJsSMvZDoQFGhZeO
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="361577188"
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="361577188"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:38:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,264,1647327600"; 
   d="scan'208";a="644944817"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 02:38:15 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 31 May 2022 12:36:03 +0300
Date:   Tue, 31 May 2022 12:36:03 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Stefan Hoffmeister <stefan.hoffmeister@gmail.com>
Cc:     Tomasz =?utf-8?Q?Mo=C5=84?= <desowin@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: Thunderbolt: One missing DisplayPort?
Message-ID: <YpXhg6wPtotRk6c2@lahna>
References: <CALhB_QNhzHkf4Yw6TqZAbCisMK6TBy8ecw0M_Sq=EQXPN728fg@mail.gmail.com>
 <Yoy5m3Aa6QwVcFhf@kuha.fi.intel.com>
 <Yoy7oXpMugFFmfBP@lahna>
 <CALhB_QM9SHJt+15pEVHEH_kourb-1Xbd68O1p_XLxOmWB4HAfw@mail.gmail.com>
 <YpCVc6eYkpmjP9AF@lahna>
 <CALhB_QP8SPqubq-eBNa1BTMuy3kCA65OuajOeJGt5DB9jDRKKg@mail.gmail.com>
 <ce969e3b4a6ed04584fdecd3234578bd87d52594.camel@gmail.com>
 <YpSUSk9u5z3ueufa@lahna>
 <CALhB_QNh3vMn2+6H41MC_O0sKPfjiVrPeqmvpnLk=tuHUPQGdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALhB_QNh3vMn2+6H41MC_O0sKPfjiVrPeqmvpnLk=tuHUPQGdg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, May 30, 2022 at 08:57:34PM +0200, Stefan Hoffmeister wrote:
> ********** $ cat /sys/kernel/debug/thunderbolt/0-0/port5/regs
> ********************
> # offset relative_offset cap_id vs_cap_id value
> 0x0000    0 0x00 0x00 0x9a1f8086
> 0x0001    1 0x00 0x00 0x05080239
> 0x0002    2 0x00 0x00 0x010e0101
> 0x0003    3 0x00 0x00 0x80500010
> 0x0004    4 0x00 0x00 0x4100000d
> 0x0005    5 0x00 0x00 0x00004809
> 0x0006    6 0x00 0x00 0x00000000
> 0x0007    7 0x00 0x00 0x00000000
> 0x0008    8 0x00 0x00 0x00000000
> 0x0039    0 0x04 0x00 0xc009048f

The bits 31:30 tell that this tunnel is active.

> ********** $ cat /sys/kernel/debug/thunderbolt/0-0/port6/regs
> ********************
> # offset relative_offset cap_id vs_cap_id value
> 0x0000    0 0x00 0x00 0x9a1f8086
> 0x0001    1 0x00 0x00 0x05080239
> 0x0002    2 0x00 0x00 0x010e0101
> 0x0003    3 0x00 0x00 0x80600010
> 0x0004    4 0x00 0x00 0x0100000d
> 0x0005    5 0x00 0x00 0x00004809
> 0x0006    6 0x00 0x00 0x00000000
> 0x0007    7 0x00 0x00 0x00000000
> 0x0008    8 0x00 0x00 0x00000000
> 0x0039    0 0x04 0x00 0x0009048f

This one is not.

> ********** $ cat /sys/kernel/debug/thunderbolt/0-1/port11/regs
> ********************
> # offset relative_offset cap_id vs_cap_id value
> 0x0000    0 0x00 0x00 0x15ef8086
> 0x0001    1 0x00 0x00 0x0608020a
> 0x0002    2 0x00 0x00 0x010e0102
> 0x0003    3 0x00 0x00 0x80b00008
> 0x0004    4 0x00 0x00 0x00800000
> 0x0005    5 0x00 0x00 0x00004809
> 0x0006    6 0x00 0x00 0x00000000
> 0x0007    7 0x00 0x00 0x00000000
> 0x0008    8 0x00 0x00 0x00000000
> 0x000a    0 0x03 0x00 0x00000339
> 0x000b    1 0x03 0x00 0x40110005
> 0x000c    2 0x03 0x00 0x00000000
> 0x000d    3 0x03 0x00 0x00000000
> 0x000e    4 0x03 0x00 0xffffffff
> 0x000f    5 0x03 0x00 0x00000000
> 0x0010    6 0x03 0x00 0x000009c4
> 0x0011    7 0x03 0x00 0x00c80002
> 0x0039    0 0x04 0x00 0x0009044f
> 0x003a    1 0x04 0x00 0x00004008
> 0x003b    2 0x04 0x00 0x000fff40
> 0x003c    3 0x04 0x00 0x00400005
> 0x003d    4 0x04 0x00 0x00c0a234

This is the "local" capability and it tells that this one supports MST
(bit 15).

I wonder if this dock has the two DP outputs behind a MST "hub" or so?
I've seen such devices out there. This would explain why there is only
single DP tunnel active.

I don't remember if you already mentioned but have you tried to connect
the second monitor to the USB-C downstream ports on that dock? At least
for some docks this is where the second DP OUT adapter is routed.

If the second DP tunnel gets activated you should also see bits 31:30 of
the port6/regs to be set by the connection manager firmware.
