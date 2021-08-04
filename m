Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C1D3E048E
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 17:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239140AbhHDPm4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 11:42:56 -0400
Received: from mga18.intel.com ([134.134.136.126]:13044 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239195AbhHDPmw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Aug 2021 11:42:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="201130107"
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="201130107"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 08:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,294,1620716400"; 
   d="scan'208";a="503017497"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2021 08:42:25 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 04 Aug 2021 18:40:13 +0300
Date:   Wed, 4 Aug 2021 18:40:13 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andrea Stedile <andrea.stedile@studenti.unitn.it>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: Authorization for Thunderbolt device is forgotten after each
 reboot
Message-ID: <YQq03Yidm8Q52xXV@lahna>
References: <CAAs7NQRRJ4U0RQP1Y5VM4qrz7WX_ocuwouzen6pk2Q7HcAa76Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAs7NQRRJ4U0RQP1Y5VM4qrz7WX_ocuwouzen6pk2Q7HcAa76Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Aug 04, 2021 at 02:46:30PM +0200, Andrea Stedile wrote:
>    [The previous email wasn't delivered to everyone because it exceeded
>    size limits due to a video attachment, therefore I am resending it with
>    a streamable link instead]
>    Hello,
>    I am Andrea Stedile, a computer science student from Italy. I would
>    like to report a problem which I suspect is attributable to some recent
>    changes in the Thunderbolt driver. I am using Fedora 34 with Gnome 40.
>    I have already reported the problem to the distribution's Bugzilla [1].
>    The problem is as follows:
>    I have a Thunderbolt monitor [2] connected to my laptop. The
>    Thunderbolt monitor has an integrated USB dock, to which I attach my
>    mouse and keyboard dongles. With kernel 5.12.17-300 and before, I used
>    to boot up and the mouse and keyboard were functional.
>    After upgrading to kernel 5.13.4-200, at every boot, the mouse and
>    keyboard are not functional. I see in the GNOME settings that I have to
>    explicitly authorize the monitor with a button saying "Authorize and
>    Connect". Even though I do so, after rebooting, this setting is
>    "forgotten" and I have to tweak the setting again in order to make the
>    mouse and keyboard functional.

There was regression in v5.13 and it was fixed with following revert:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=8e3341257e3b5774ec8cd3ef1ba0c0d3fada322b

This will go to mainline soon and then to stable trees. Can you try if
it fixes your issue too?
