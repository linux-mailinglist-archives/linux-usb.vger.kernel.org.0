Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0179F692047
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 14:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjBJNzW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 08:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbjBJNzU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 08:55:20 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81067499F
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 05:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676037318; x=1707573318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ihiQ1hWcBYcRXdmYa29/XlMjS0HPy9W/xVI1jAlBajk=;
  b=Rd/6dy+arAJsFQsefMeukVEWzUALAfAzVTDuSiMl7UxqbU2I87Hsh590
   gAH6e3Cb0TYXrP1p1KAvD72l5pzRsqVUwqGaCSNZvoedTG1/k8TmDIMFX
   8N7v7hv2tVFrIFFYPoVG+qme8Nk30Gt3Izus+6rvnPWM7Mpm5ab0unwTj
   56e4Mds8mTqyTUcn/obNWXHOnqysRgHh6eTxvoags3UgNK+Rw8UkO7f5H
   PUwkXrVVAyfVoJ1570bjEZJmAA8jgVxZ0DKN+q1Vvj6k/nlFFK2q5vqen
   xW7oSzN3+Vc8hoX+b9YG12HBW+i1mCRwL9GshPnEUFjHCLKDyuQ7WMFca
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="330429843"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="330429843"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 05:55:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="810822664"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="810822664"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2023 05:55:15 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id EA0751C5; Fri, 10 Feb 2023 15:55:54 +0200 (EET)
Date:   Fri, 10 Feb 2023 15:55:54 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Disable CLx state for AMD Yellow Carp and
 Pink Sardine
Message-ID: <Y+ZM6qWBRCsjSxdH@black.fi.intel.com>
References: <1676035943-115840-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1676035943-115840-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Feb 10, 2023 at 07:32:23AM -0600, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> AMD Yellow Carp and Pink Sardine don't support CLx state,
> hence disabling it.

The lane adapters are supposed to announce whether CL-states are
supported or not. Is that not the case with the AMD hardware?
