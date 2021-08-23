Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACB63F4C0B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 16:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbhHWOCO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 10:02:14 -0400
Received: from mga02.intel.com ([134.134.136.20]:48843 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229947AbhHWOAb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 10:00:31 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="204304221"
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="204304221"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 06:59:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,344,1620716400"; 
   d="scan'208";a="526072616"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 06:59:46 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 23 Aug 2021 16:59:43 +0300
Date:   Mon, 23 Aug 2021 16:59:43 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andrea Stedile <andrea.stedile@studenti.unitn.it>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: Authorization for Thunderbolt device is forgotten after each
 reboot
Message-ID: <YSOpz1Y87k5VcndO@lahna>
References: <CAAs7NQRRJ4U0RQP1Y5VM4qrz7WX_ocuwouzen6pk2Q7HcAa76Q@mail.gmail.com>
 <YQq03Yidm8Q52xXV@lahna>
 <CAAs7NQS85sbOumOziuiqs-VYgEs8Lyd4Kk2oqrOaVjTJCdQo+g@mail.gmail.com>
 <YRD4wkLhVPqgDPoj@lahna>
 <CAAs7NQSRW5wE667iHTvUy38gBRwjh8kh3Zs_i=o3cj-Jqp=wvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAs7NQSRW5wE667iHTvUy38gBRwjh8kh3Zs_i=o3cj-Jqp=wvw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 23, 2021 at 03:07:58PM +0200, Andrea Stedile wrote:
>    Hi,
>    I just wanted to let you know that 5.13.12 fixed the issue already for
>    me and others.
>    Thank you, and have a great day.
>    Andrea

Great! Thanks for the update and sorry about the breakage.
