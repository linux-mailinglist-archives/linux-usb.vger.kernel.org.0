Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E08408F90
	for <lists+linux-usb@lfdr.de>; Mon, 13 Sep 2021 15:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242698AbhIMNoL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Sep 2021 09:44:11 -0400
Received: from mga14.intel.com ([192.55.52.115]:62907 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243170AbhIMNmD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Sep 2021 09:42:03 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="221340990"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; 
   d="scan'208";a="221340990"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2021 06:32:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; 
   d="scan'208";a="608983420"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 13 Sep 2021 06:32:31 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 13 Sep 2021 16:32:30 +0300
Date:   Mon, 13 Sep 2021 16:32:30 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi GET_CONNECTOR_STATUS failed (-5)
Message-ID: <YT9S7sWLG5cXFH/y@kuha.fi.intel.com>
References: <b36249c5-776a-9338-bb9f-ae6a5c446860@huberulrich.de>
 <YSX7hZnCoFSXTFJe@kuha.fi.intel.com>
 <0e77017d-9358-a691-6293-234fcbab6a31@huberulrich.de>
 <a7f971ef-c3aa-aadc-e453-4c667a414131@huberulrich.de>
 <YSekP0+tq6ISq6my@kuha.fi.intel.com>
 <3fe6d701-bc14-9b26-a5af-aa38fe7c585e@huberulrich.de>
 <YSoGcC4Z1EP0S3KQ@kuha.fi.intel.com>
 <7e06ae23-1cdd-7fe5-8b56-d4a2f80809f2@huberulrich.de>
 <YTn75r/QUSjjQ0BV@kuha.fi.intel.com>
 <2b9b8209-d2d7-1cf1-ee48-490a77348ced@huberulrich.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b9b8209-d2d7-1cf1-ee48-490a77348ced@huberulrich.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 09, 2021 at 02:24:33PM +0200, Ulrich Huber wrote:
> > Any updates?
> 
> Whatever I tried, I can not manage to reproduce this issue. I haven't seen
> it for quite some time as well.
> 
> > 
> > Would it make sense to go ahead with my series now anyway at this
> > point since it seems to fix the other problems?
> 
> It would definitely make sense to go ahead with your series. Compared to the
> behavior without this fix, the situation improved tremendously. That hiccup
> I saw, does not degrade the connection as far as I can tell. At least the
> connection status has been correct after the error occurred. That was not
> the case without your fixes.

OK. I'll send them out this week.

thanks,

-- 
heikki
