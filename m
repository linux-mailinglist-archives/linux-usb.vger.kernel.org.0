Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 146DA70D84A
	for <lists+linux-usb@lfdr.de>; Tue, 23 May 2023 11:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbjEWJBf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 May 2023 05:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236290AbjEWJBd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 May 2023 05:01:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92798FE
        for <linux-usb@vger.kernel.org>; Tue, 23 May 2023 02:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684832491; x=1716368491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=+BYdxmorpWr8KyXWeXZrGuWdoeFoYITDRcDLJHR+ejk=;
  b=PFY78NnPmZZfwi4YL7kaAeYNpKXqNmkjFnp9YG+Z16WxszaO49KeHaoF
   3BSTCzeSsd9H3FYQcCSsazdbl8gMVBU6kzr/QxQ1vThTAFiQUnqDJ7J/J
   Vt/qoxgk+WLT2kytdOZc6WaetP5psdXyBMIYWXDHrsGu93+4dHYrMYdfB
   LQJx4Jj07ljZpCnnDTTsP58t8elqB646ie9wIY2fEhfF2mByKOmrAfLQ0
   3SZ0XL4Q/8f0nknVSHpl7NzC/SG/xmq/ojj8Td76IgntDefiXteo/W6M2
   csL4kkVe1JQbXPGwD62RujRXVqOCrNnDsxPHoTeTnHOkP8thRYmjHh+cH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="332796897"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="332796897"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 02:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="793660623"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; 
   d="scan'208";a="793660623"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 23 May 2023 02:01:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 1AF4123E; Tue, 23 May 2023 12:01:32 +0300 (EEST)
Date:   Tue, 23 May 2023 12:01:32 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Tomasz =?utf-8?Q?Mo=C5=84?= <tomasz.mon@nordicsemi.no>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: USB 2.0 host controller for Thunderbolt 4
Message-ID: <20230523090132.GO45886@black.fi.intel.com>
References: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd807b391dec726401e36a25f8c8987571d771be.camel@nordicsemi.no>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, May 23, 2023 at 10:53:17AM +0200, Tomasz Moń wrote:
> Hello,
> 
> Dell Latitude 5330 with 12th Gen Intel(R) Core(TM) i7-1265U contains
> following PCI devices:
>   * 8086:461e - Alder Lake-P Thunderbolt 4 USB Controller
>   * 8086:51ed - Alder Lake PCH USB 3.2 xHCI Host Controller
> 
> Thunderbolt 4 USB Controller initializes first and therefore following
> usb host controllers are registered:
>   * usb1 - USB 2.0 High-Speed
>   * usb2 - USB 3.2 Enhanced SuperSpeed
>   * usb3 - USB 2.0 High-Speed
>   * usb4 - USB 3.1 Enhanced SuperSpeed
> 
> When I connect SuperSpeed device directly to the Dell Latitude, it ends
> up on usb4. Low/Full/High-Speed devices end up on usb3 as expected.
> 
> When I connect Thunderbolt 3 dock, two new host controllers show up:
>   * usb5 - USB 2.0 High-Speed
>   * usb6 - USB 3.0 SuperSpeed
> 
> Devices connected through Thunderbolt 3 dock end up on expected host
> controllers, i.e. Low/Full/High-Speed devices connect to usb5 and
> SuperSpeed devices end up on usb6.
> 
> Is Thunderbolt 3 essentially tunnelling the USB 2.0 traffic (by
> tunnelling PCIe xHCI host controller traffic) on the superspeed
> differential pairs (operating in alternate TBT3 mode)?

It is not. The USB 2.x wires are separate on type-C cables.

> When I connect Thunderbolt 4 dock, the SuperSpeed devices connected to
> dock ports end up on usb2 host controller. However, Low/Full/High-Speed
> devices do end up on usb3 (USB 3.2 xHCI) and not on usb1 (Alder Lake-P
> Thunderbolt 4 USB Controller).

Yes, that's expected the TBT USB controller (on the host) does not
support USB 2.x so it is routed to the PCH one.

> Is there any condition under which the Low/Full/High-Speed devices
> would end up on usb1 (USB 2.0 High-Speed host controller interface
> created for Thunderbolt 4 USB Controller)?

If I understood this right, then no.

> Does the Alder Lake-P Thunderbolt 4 USB Controller even feature USB 2.0
> interface? If not, should the (effectively dummy) usb1 host controller
> even be registered? Is the USB 2.0 functionality provided entirely by
> the Alder Lake PCH USB 3.2 xHCI Host Controller (i.e. when there is no
> TBT3 dock connected)?

It does not.
