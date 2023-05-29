Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E38714771
	for <lists+linux-usb@lfdr.de>; Mon, 29 May 2023 11:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231718AbjE2JvU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 May 2023 05:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjE2JvT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 May 2023 05:51:19 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A31990
        for <linux-usb@vger.kernel.org>; Mon, 29 May 2023 02:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685353878; x=1716889878;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=iK3xCAELz89pSO52DJjfWYpb7LV9OGuibSeKucL0Xjs=;
  b=PzRj9cTC8auhTU4NRcE+NPVFRsQe3oy3huYdvgz90+me55mRPeX4Sx8p
   F8TTgHhVaWZ99OG4jV6yDO1mjiH3pIkFp7rATyJxYNXrxs4YT9AXvDetb
   qTJ2bCfx8tdQb9nfqyTtWY2hVQt+YOdqtf2JCdiGEiaS1srXJuXkyOP99
   idswjtEaYD8ltQ5A6vVR1/a4Wcuvgye1MBvaszSgGdgPiJtVrRDndCtGs
   uErfFso+Z+kn4wJRQKBE0TIfFOOEQZ/taXZIVAN0+jAzA4qG/mNiTdahL
   Rtl/wIxWGPhMqO8+xO8UB7e+SWZfGLrdaD7RGRWqltqAcPjhRo1S/N/4w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="382923500"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="382923500"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2023 02:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="739092461"
X-IronPort-AV: E=Sophos;i="6.00,201,1681196400"; 
   d="scan'208";a="739092461"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 29 May 2023 02:50:57 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 96B92350; Mon, 29 May 2023 12:51:02 +0300 (EEST)
Date:   Mon, 29 May 2023 12:51:02 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Koba Ko <koba.ko@canonical.com>,
        Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 2/2] thunderbolt: Do not touch CL state configuration
 during discovery
Message-ID: <20230529095102.GY45886@black.fi.intel.com>
References: <20230525090124.11614-1-mika.westerberg@linux.intel.com>
 <20230525090124.11614-3-mika.westerberg@linux.intel.com>
 <CA+CmpXvpFQdgCRxUdRZxkqmwHZ5YQtsaat5+Ajooz8QGxu8wpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CmpXvpFQdgCRxUdRZxkqmwHZ5YQtsaat5+Ajooz8QGxu8wpg@mail.gmail.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 28, 2023 at 11:06:16AM +0300, Yehezkel Bernat wrote:
> On Thu, May 25, 2023 at 12:01 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > If the boot firmware has already established tunnels, especially ones
> > that have special requirements from the link such as DisplayPort, we
> > should not blindly enable CL states (nor change the TMU configuration).
> > Otherwise the existing tunnels may not work as expected.
> >
> > For this reason, skip the CL state enabling when we go over the existing
> > topology. This will als keep the TMU settings untouched because we do
>                                 ^ also
> 
> > not change the TMU configururation when CL states are not enabled.
>                                      ^ configuration
> 
> For the both patches in the series:
> 
> Acked-By: Yehezkel Bernat <YehezkelShB@gmail.com>

Thanks! Fixed the typos and applied both to thunderbolt.git/fixes.
