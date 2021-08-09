Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE863E430B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Aug 2021 11:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234660AbhHIJoE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 05:44:04 -0400
Received: from mga04.intel.com ([192.55.52.120]:48162 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234365AbhHIJoE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Aug 2021 05:44:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="212798413"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="212798413"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 02:43:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="438874142"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 02:43:33 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 09 Aug 2021 12:43:30 +0300
Date:   Mon, 9 Aug 2021 12:43:30 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andrea Stedile <andrea.stedile@studenti.unitn.it>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: Authorization for Thunderbolt device is forgotten after each
 reboot
Message-ID: <YRD4wkLhVPqgDPoj@lahna>
References: <CAAs7NQRRJ4U0RQP1Y5VM4qrz7WX_ocuwouzen6pk2Q7HcAa76Q@mail.gmail.com>
 <YQq03Yidm8Q52xXV@lahna>
 <CAAs7NQS85sbOumOziuiqs-VYgEs8Lyd4Kk2oqrOaVjTJCdQo+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAs7NQS85sbOumOziuiqs-VYgEs8Lyd4Kk2oqrOaVjTJCdQo+g@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Aug 06, 2021 at 08:59:09PM +0200, Andrea Stedile wrote:
>    Hi Mika,
>    Thanks a lot for answering.
>    I would like to try it out, but I've never compiled a driver before.
>    Could you perhaps send me a guide or some instructions? I have
>    downloaded the git repository you sent [1], but I don't know what to do
>    next. Moreover, how can I revert the change after I have concluded the
>    test?

The fix is now in v5.14-rc5 mainline kernel too so you don't need to do
the revert. Probably lands in stable kernels pretty soon and ends up in
your distro kernel within few weeks.

If you don't want to wait there is some documentation how to build your
own kernel here:

https://www.kernel.org/doc/html/latest/process/index.html

In a nutshell it is something like:

  $ make localmodconfig
  $ make nconfig # if you need to tune the config
  $ make -jMANY
  $ sudo make modules_install
  $ sudo make install
