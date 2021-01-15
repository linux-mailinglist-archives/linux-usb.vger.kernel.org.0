Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F252F73E6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 08:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731998AbhAOH7Q (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Jan 2021 02:59:16 -0500
Received: from mga04.intel.com ([192.55.52.120]:43100 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728688AbhAOH7P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 Jan 2021 02:59:15 -0500
IronPort-SDR: HhKihgQMw3fwCvikzy9M2OdjgrbhdR/8Ntgoi4R9Kz2JA/dhjX9/7fpjm2+E2EP9bFu5tNE60v
 ZDm9wDd85RvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="175935420"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; 
   d="scan'208";a="175935420"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 23:57:27 -0800
IronPort-SDR: 8EElx/k8/cRK3gbQxBTJnL+oOe0vzs2NsZn8zV9ot+fZTvtspVlOHMPp8daBG64Kw8gk4DbiQY
 /GQbjCFfXzsQ==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; 
   d="scan'208";a="425227787"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 23:57:23 -0800
Received: by lahna (sSMTP sendmail emulation); Fri, 15 Jan 2021 09:57:21 +0200
Date:   Fri, 15 Jan 2021 09:57:21 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <yehezkelshb@gmail.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: [PATCH v2] thunderbolt: Add support for de-authorizing devices
Message-ID: <20210115075721.GB968855@lahna.fi.intel.com>
References: <20210113100750.32692-1-mika.westerberg@linux.intel.com>
 <CA+CmpXscND_KCPj0yX=OEBW3=NibX3jDc3uKzcpTnVCL4c5AEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CmpXscND_KCPj0yX=OEBW3=NibX3jDc3uKzcpTnVCL4c5AEw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 13, 2021 at 02:56:14PM +0200, Yehezkel Bernat wrote:
> On Wed, Jan 13, 2021 at 12:07 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> >
> > In some cases it is useful to be able de-authorize devices. For example
> > if user logs out the userspace can have a policy that disconnects PCIe
> > devices until logged in again. This is only possible for software based
> > connection manager as it directly controls the tunnels.
> >
> > For this reason make the authorized attribute accept writing 0 which
> > makes the software connection manager to tear down the corresponding
> > PCIe tunnel. Userspace can check if this is supported by reading a new
> > domain attribute deauthorization, that holds 1 in that case.
> >
> > While there correct tb_domain_approve_switch() kernel-doc and
> > description of authorized attribute to mention that it is only about
> > PCIe tunnels.
> >
> > Cc: Christian Kellner <christian@kellner.me>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> 
> Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>

Thanks!

Applied to thunderbolt.git/next.
