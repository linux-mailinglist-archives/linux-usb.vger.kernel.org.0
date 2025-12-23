Return-Path: <linux-usb+bounces-31702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8B5CD9158
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 12:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 131883099D4B
	for <lists+linux-usb@lfdr.de>; Tue, 23 Dec 2025 11:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396933126D2;
	Tue, 23 Dec 2025 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b11uzxCY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8B22C236D;
	Tue, 23 Dec 2025 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488622; cv=none; b=XbToUNAH/Pdyx6m8ajvoGxuNYeQjaASUPcTVX2JZ4vpABMv18dp4HwAn8cohheJ5ZXkOqLS8OJ+kVUUQbN+nXZmitOrY24wSTUJWdKwXcr8X4OO5rJKgCrThEV23m1n26cKjxHPTTkqWPVetUo6wnnNLIGHUnVeswrEMNlUNiUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488622; c=relaxed/simple;
	bh=sXBwY5XSdNzV/btwmd+DepxU8mWg/Y4kaRSz0C0TQRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5NhbyhFZr7DG3+E5cXXMntFX7TPKX6RMqnzK3K212BYgmTwROrUc7x7V4OusVhYHv6kAc8l8Vg/dO80/PBvi6w3JKPpKpq6dAYbLeLXiCs66EfRUC+sfNpziYS6BAo+XpveDSDQPl0sEwi8KEqlaGDwfWd4WRcLGbJ9idZQyLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b11uzxCY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766488620; x=1798024620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sXBwY5XSdNzV/btwmd+DepxU8mWg/Y4kaRSz0C0TQRg=;
  b=b11uzxCY5ilewDUekt2NeWNtwSPVVdj6IJzjnvmLes6QHdCbYlsiII8G
   JXTSOsKKQQ/ZEJujiKW90hFUF7q3sZEPLdhdLJDVi3y07KovIzq3oKO8G
   HQ1zU14Jsi0ZFaapL6BighMnvMvCHo5G5UszKk5uRptV9UdVvte+kyhD8
   B0cwIxk+0vQ3IxQAdkvQ+VJDQV7+WAfygTwqGrSQvKl9VfmEEWRUu9RCY
   yc6Ft2GTpP6BL0svePKROxgZ6EY3VwdyvHoPbfmvyu3ndKHW6JgAMzeZW
   eKf+flOJoyUNrBlZh8TmxEUcSyxSb+/Oca72VRs/ZfqW+YJMc1gL78/Q5
   A==;
X-CSE-ConnectionGUID: NdwbvrWlRIGjMqk/SYwplw==
X-CSE-MsgGUID: D5LE78v6QuSxa5PMVKsYIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68092014"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68092014"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 03:17:00 -0800
X-CSE-ConnectionGUID: 5Xb+KvL4QS67d5QYOpz/lw==
X-CSE-MsgGUID: UYkogc3WRtqlQ613/AmtKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204699977"
Received: from bkammerd-mobl.amr.corp.intel.com (HELO kuha) ([10.124.220.158])
  by fmviesa004.fm.intel.com with SMTP; 23 Dec 2025 03:16:54 -0800
Received: by kuha (sSMTP sendmail emulation); Tue, 23 Dec 2025 13:16:39 +0200
Date: Tue, 23 Dec 2025 13:16:39 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] USB Type-C alternate mode selection
Message-ID: <aUp6FxThy1r2pNxD@kuha>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
 <aTrJwA7Y4fWiTMzB@kuha>
 <aTrTvA8Srak1mNGS@kuha>
 <CAMMMRMdwX8wKJz6OEvosVXFH2npr+7pd0pdq3eY9r-Pbr3tjMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMMRMdwX8wKJz6OEvosVXFH2npr+7pd0pdq3eY9r-Pbr3tjMw@mail.gmail.com>

Hi,

Tue, Dec 16, 2025 at 03:57:40PM +0100, Andrei Kuchynski kirjoitti:
> On Thu, Dec 11, 2025 at 3:23 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Thu, Dec 11, 2025 at 03:40:24PM +0200, Heikki Krogerus kirjoitti:
> > > Without going into the code review yet, I'm okay with this in general,
> > > except with the artificial SID for the USB4. I still don't understand
> > > why do you guys think we should use that instead of an USB4 specific
> > > device type?
> > >
> > > I think somebody said earlier that the user space can't see the device
> > > type of the alt modes? If that's really the case, then I think there
> > > is some bigger issue here. Are you really sure that if you check the
> > > device type of an alternate mode for example with udevadm, it does not
> > > say DEVTYPE=typec_alternate_mode ?
> > >
> > >         % udevadm info -q property --property=DEVTYPE /sys/bus/typec/devices/port0-partner.0
> > >         DEVTYPE=typec_alternate_mode
> >
> > Or just use grep :)
> >
> >         % grep DEVTYPE /sys/bus/typec/devices/port0-partner.0/uevent
> >         DEVTYPE=typec_alternate_mode
> >
> > So, if that really does not work, then there is a bug somewhere that
> > we obviously need to fix.
> >
> > Please note that the port altmodes are now also part of the bus.
> >
> > Br,
> >
> > --
> > heikki
> 
> Thank you for the review, Heikki.
> 
> The USB4 SID is utilized for distinguishing between USB4 and alternate
> modes internally and is not exposed to user-space. This represents internal
> implementation detail, for example the boolean variable `is_alternate`
> could serve the same purpose as the SID.
> This patch series introduces no new sysfs entries; the only new attribute,
> `priority`, was introduced in the mode priority series, available at
> https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.org/
> 
> It is possible to use already existing `usb_capabily` and `usb_mode`
> attributes to manage USB4 mode, allowing verification of USB4 support on
> both the port and the partner. The activation of USB4 is accomplished
> through the implementation of the `enter_usb_mode` typec operation.
> 
> I would like your opinion on whether using a USB4 device type would be a
> better approach.

The device for the USB4 mode will need to have its own device type in
any case, but I'm indeed mainly concerned about how we expose the USB4
mode device to the user space.

As a kernel internal implementation detail the custom SID is probable
fine for now, although I was actually hoping that we could improve the
API a bit. So something like typec_register_mode() type of API. You
probable could introduce something like this for that API:

        struct typec_mode {
                /* enum typec_accessory         accessory; */
                enum usb_mode                   usb;      /* or just USB4 flag */
                struct typec_altmode_desc       *altmode; /* NULL with USB4 */
        };

> Please note that patches 6 and 7 are not part of the mode selection series.
> They are not yet complete and are provided only to demonstrate how the
> entire feature should work.

Got it.

> I confirm there is no issue with the DEVTYPE. Thank you.

Okay, good. So there are no bugs at least :)

Br,

-- 
heikki

