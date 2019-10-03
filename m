Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9FD1C99C9
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 10:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728180AbfJCIZj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 04:25:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:58292 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727357AbfJCIZj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 04:25:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B38BEADAB;
        Thu,  3 Oct 2019 08:25:35 +0000 (UTC)
Message-ID: <1570091132.18913.3.camel@suse.com>
Subject: Re: [RFC PATCH 06/22] thunderbolt: Add support for lane bonding
From:   Oliver Neukum <oneukum@suse.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Anthony Wong <anthony.wong@canonical.com>,
        Mario.Limonciello@dell.com,
        Andreas Noever <andreas.noever@gmail.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Lukas Wunner <lukas@wunner.de>
Date:   Thu, 03 Oct 2019 10:25:32 +0200
In-Reply-To: <20191002143020.GG2819@lahna.fi.intel.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
         <20191001113830.13028-7-mika.westerberg@linux.intel.com>
         <20191001123808.GA2954373@kroah.com>
         <20191001125320.GN2714@lahna.fi.intel.com>
         <1570026066.2472.15.camel@suse.com>
         <20191002143020.GG2819@lahna.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 02.10.2019, 17:30 +0300 schrieb Mika Westerberg:
> On Wed, Oct 02, 2019 at 04:21:06PM +0200, Oliver Neukum wrote:
> > Am Dienstag, den 01.10.2019, 15:53 +0300 schrieb Mika Westerberg:
> > > > 
> > > > Are we only going to be allowed to "bond" two links together?  Or will
> > > > we be doing more than 2 in the future?  If more, then we might want to
> > > > think of a different way to specify these...
> > > 
> > > AFAICT only two lanes are available in USB4. This goes over USB type-C
> > > using the two lanes there.
> > > 
> > > Of course I don't know if in future there will be USB4 1.1 or something
> > > that adds more lanes so if you think there is a better way to specify
> > > these, I'm happy to implement that instead :) 
> > 
> > If this ever can become asymmetric this interface is going to turn
> > around and bite.
> 
> Don't think it can be asymmetric but I'm open to all ideas how to make
> it more flexible :-)

Split the the attributes into link_speed_rx and link_speed_tx. For
link_width likewise. We had the same issue with USB.

	Regards
		Oliver

