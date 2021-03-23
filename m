Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACB83464DE
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 17:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbhCWQVB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 12:21:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:58154 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233171AbhCWQU5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 12:20:57 -0400
IronPort-SDR: K4fJMWjsxfTS0j9VFOOgf8NCRrAhbmVDK+MnUpWO1od/TVEFOKY2yiVS1hB+UxASXMJXqXGzcr
 ub8xeBA6NBGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="189913025"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="189913025"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 09:20:57 -0700
IronPort-SDR: GylakkK0CEToqI5SVYe9iTbn2d9JNyPMY2Vtk9YG/gPbIKwpaYQrHGO2kxkXxglV40cdXTa3Fz
 GjoLdKYUnagA==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; 
   d="scan'208";a="513805837"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2021 09:20:54 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 23 Mar 2021 18:20:51 +0200
Date:   Tue, 23 Mar 2021 18:20:51 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>
Subject: Re: [PATCH v2 3/3] thunderbolt: Expose more details about USB 3.x
 and DisplayPort tunnels
Message-ID: <20210323162051.GA2542@lahna.fi.intel.com>
References: <20210323145701.86161-1-mika.westerberg@linux.intel.com>
 <20210323145701.86161-4-mika.westerberg@linux.intel.com>
 <YFoIqi1hggi8xuYq@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFoIqi1hggi8xuYq@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 23, 2021 at 04:26:34PM +0100, Greg Kroah-Hartman wrote:
> > +static ssize_t tunneling_details_show(struct device *dev,
> > +				      struct device_attribute *attr, char *buf)
> > +{
> > +	const struct tb *tb = container_of(dev, struct tb, dev);
> > +
> > +	return sprintf(buf, "%d\n", !!(tb->cm_caps & TB_CAP_TUNNEL_DETAILS));
> 
> sysfs_emit() please.

Oops, missed that. Will fix in v3.

Thanks!
