Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1922E5888B3
	for <lists+linux-usb@lfdr.de>; Wed,  3 Aug 2022 10:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbiHCIaF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Aug 2022 04:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbiHCIaE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Aug 2022 04:30:04 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3921E08C
        for <linux-usb@vger.kernel.org>; Wed,  3 Aug 2022 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659515403; x=1691051403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i7jrWrqxlOW3p7mZ1NJhkUaQn+McFV3RY3AngsOx3sw=;
  b=R2DtAl56OhYCb1VQ1iNTJcCnfJCT//f8O+QoJW/dXChO0XTd8+a/jf/h
   i6if/Rx2Tt/jBMftB5mxpqA5gZTOzXcu0dzrxrW6snEZbXjLtct5S7Sq9
   URyuE5+synw4BR5LFzQuJ3YblhPAYJGihXM0YupwjgkCnEu9MqQr3QhhE
   QUyVYrCm2T9KtbzIClv8vLOpUTdco3W0sYDa381fubPOUj1BCn2grpcUI
   jcM5PMOaEWRJO3vJwNLDr9VkSiVEMYYP7+QcEPiB9PvFcLS5+C31pvrQv
   VVaomn2TM3kPSA5oquZ0xwNa7RjK0++FweVMkuWkgDNx0tv+TjjZvnVH9
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="353621617"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="353621617"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 01:30:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="778909725"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 01:29:59 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 03 Aug 2022 11:29:57 +0300
Date:   Wed, 3 Aug 2022 11:29:57 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH v2] thunderbolt: fix PCI device class after powering up
Message-ID: <YuoyBf20gNLNqYdC@lahna>
References: <20220729094022.186496-1-lb@semihalf.com>
 <Yuep3lpI02gWiJY9@lahna>
 <CAK8ByeL4AJoXndO02Os0UPYZRiMeLmBjB-00VaEe-8KJF0tWzQ@mail.gmail.com>
 <YukhjOo4CteuM8q9@lahna>
 <CAK8ByeJ0=rbGr5+GZ_dDhMRnHjYxuCO9_cZONuXSz2tyL+QLzw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8ByeJ0=rbGr5+GZ_dDhMRnHjYxuCO9_cZONuXSz2tyL+QLzw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Tue, Aug 02, 2022 at 05:06:40PM +0200, Łukasz Bartosik wrote:
> > Is this something available for purchase? I'm asking because I have Acer
> > Tiger Lake based Chromebook (740 spin or something) here and the TBT
> > controller class is "USB controller" all the time, and this is what is
> > expected. It should not change the class at any point.
> 
> Sorry this platform is not available on the market.

I don't think the mainline Linux needs to have this kind of a quirk for
a device that is not available for general public.

> I compared the platform where I see the issue with another platform
> where thunderbolt is "usb controller" all the time
> and I noticed one difference in function icl_nhi_force_power() in
> drivers/thunderbolt/nhi_ops.c I observed the value of VS_CAP_22
> after being read and before being written again with additional bits
> set. And on the platform where thunderbolt is "usb controller" all the
> time
> this value was 0x22061002 after reading and 0x22061002 before being
> written. The value has not changed
> which suggest that thunderbolt was already powered up during probe.

It is being set also if you boot with device connected but in any case
the class code should not change ever. It may be that this is some older
spin of the Tiger Lake silicon that still had the wrong class but it got
fixed in later spins (or firmware, I don't remember which).
