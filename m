Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E4258899F
	for <lists+linux-usb@lfdr.de>; Wed,  3 Aug 2022 11:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235651AbiHCJqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Aug 2022 05:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232303AbiHCJqk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Aug 2022 05:46:40 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808991CB12
        for <linux-usb@vger.kernel.org>; Wed,  3 Aug 2022 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659519999; x=1691055999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uvO14lXJwDC7GUDuP1K6HIWmZxesnGipb+DU+aFRpo0=;
  b=RpYkIs6O6Og5nJ4p4Z0zFYS2V2Yrnl0GDmWG+nb9c4PgMMqAxz8UjMTi
   lWDjBKDK468v/dq3eLy6PVmhyqWM4nGqs8ey3WkVKkWpvhfqW3yaPHZuS
   AqflMJQKT4y4Q8pEThOZzWsioedLG431ufwAVKjziXxlqVVqUeOVXDv0g
   6kFeyzo1PrNQ6pNI3gx0XseysRooRWEtxhB8APTPiqE0vPEND3KEUamPt
   eUR50rDQ2jlWXhGWXDILJf8IBasj1bcXpICmYzWcXArBcvcdGJM4CO1GN
   bM0kxxMzxuTtoR5412+AcxSsqDp0atcFT1DLD7L0J9mL57OOhapiG+WnW
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="287191896"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="287191896"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 02:46:39 -0700
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; 
   d="scan'208";a="778928311"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 02:46:35 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 03 Aug 2022 12:46:33 +0300
Date:   Wed, 3 Aug 2022 12:46:33 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH v2] thunderbolt: fix PCI device class after powering up
Message-ID: <YupD+YoRc4pYTdaQ@lahna>
References: <20220729094022.186496-1-lb@semihalf.com>
 <Yuep3lpI02gWiJY9@lahna>
 <CAK8ByeL4AJoXndO02Os0UPYZRiMeLmBjB-00VaEe-8KJF0tWzQ@mail.gmail.com>
 <YukhjOo4CteuM8q9@lahna>
 <CAK8ByeJ0=rbGr5+GZ_dDhMRnHjYxuCO9_cZONuXSz2tyL+QLzw@mail.gmail.com>
 <YuoyBf20gNLNqYdC@lahna>
 <CAK8ByeK=xOGshi9Yk2C3eVVNYprYFejX53OQzAztuxrKNK7F9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8ByeK=xOGshi9Yk2C3eVVNYprYFejX53OQzAztuxrKNK7F9A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 03, 2022 at 11:30:09AM +0200, Łukasz Bartosik wrote:
> >
> > Hi,
> >
> > On Tue, Aug 02, 2022 at 05:06:40PM +0200, Łukasz Bartosik wrote:
> > > > Is this something available for purchase? I'm asking because I have Acer
> > > > Tiger Lake based Chromebook (740 spin or something) here and the TBT
> > > > controller class is "USB controller" all the time, and this is what is
> > > > expected. It should not change the class at any point.
> > >
> > > Sorry this platform is not available on the market.
> >
> > I don't think the mainline Linux needs to have this kind of a quirk for
> > a device that is not available for general public.
> >
> 
> The reference Chromebook platform is not available on the market now
> however there will be Chromebooks based on that platform available for
> purchase in the future.

Right, and do you know if those have this issue? Like I said my
Chromebook, that is also based on the reference Chromebook, does not
have this problem so probably something firmware/hardware related that
does not appear when the production systems are ready. And this really
should not happen at all. I also suggest to contact the Intel TBT folks
(assuming your company is making these Chromebooks to make sure you have
the latest silicon/firmwares).
