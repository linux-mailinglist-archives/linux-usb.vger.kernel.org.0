Return-Path: <linux-usb+bounces-32114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 25243D0A669
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 14:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9502302FCC7
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 13:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D4335BDDE;
	Fri,  9 Jan 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEFTDTm+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E03596F1;
	Fri,  9 Jan 2026 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964610; cv=none; b=GeaZvB1HZfvlKGqP1i1GvM+pJYXTSzkYuLxMw6Op+YFIk3jJQofzJMwwrfhclvz42bKjDRsjO8syXWPGcnZO/88JPIMb02K7VR4JxMJ67dQ9chDrG3BL9L37v1NLcITtGXkamNdO2RfYz6n0d1oCJcK7mPfIY/3tq/VDNKbU0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964610; c=relaxed/simple;
	bh=Eiqy8QHhs0CCZc1VmkJi7YdpuVAIHCnMSQUKHKNFKS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iy/ASOeaQZoE/joPDlbQyjbwlemzUWV40fBbittakNB270h88AfjnxIPHhFjDC1k1sHgZwOItO2Tp5TCkuDuk9wQr/U+OhrVpGky45XiyxVedwIokauK7ZM/qtADIy8/rBimP185Il324jSzImgsMQTriuiVSC3yTvZOEbRUC+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEFTDTm+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767964609; x=1799500609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Eiqy8QHhs0CCZc1VmkJi7YdpuVAIHCnMSQUKHKNFKS8=;
  b=bEFTDTm+wM0/rkcxjCKN4RAG4FD4yCXS6deriARdCfte6GOsLiq/MzmT
   hdleavh0rvkorGppM0d4KdgwRlXD0DGT6TgJUgq0oypEgyC7nHOZUTVgX
   Am0hbsmcXhE/HEihc4LEQhqQJK+t+z2rsqth/Fs346t2O7S8RvVrIonmj
   1aeaQmhm0rKGXRAmFkcwdha06763UIgNCM/qy8QgCCqN5U6XQTDnax/ik
   VVWggsUoIszkNYpllh4UpRiR2yixfY3bHOsuvFKhsNYCU0MW5WWRcYPq7
   iaztQy6ye6u9YI+gghHjl3YHOBK+gv8PEO6iEiV8ScJp4/cSvyE6EyT5b
   Q==;
X-CSE-ConnectionGUID: lx//UIPZTfyP3ZNYcDLCbA==
X-CSE-MsgGUID: uNs6kFuSSYOm/2sIT24Eng==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73202818"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="73202818"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 05:16:48 -0800
X-CSE-ConnectionGUID: IWopFVngT/SgdSWuu+CWaw==
X-CSE-MsgGUID: aDURCKC7Q+a1MTH+U2FjWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="202677671"
Received: from khuang2-desk.gar.corp.intel.com (HELO kuha) ([10.124.223.90])
  by orviesa010.jf.intel.com with SMTP; 09 Jan 2026 05:16:42 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 09 Jan 2026 15:16:21 +0200
Date: Fri, 9 Jan 2026 15:16:21 +0200
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
Message-ID: <aWD_pbsydOcgNX3z@kuha>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
 <aTrJwA7Y4fWiTMzB@kuha>
 <aTrTvA8Srak1mNGS@kuha>
 <CAMMMRMdwX8wKJz6OEvosVXFH2npr+7pd0pdq3eY9r-Pbr3tjMw@mail.gmail.com>
 <aUp6FxThy1r2pNxD@kuha>
 <CAMMMRMfk1Rv7P4NMkYnG+2RFqVm-7Effb_xiBQU3NXhPJeeg_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMMRMfk1Rv7P4NMkYnG+2RFqVm-7Effb_xiBQU3NXhPJeeg_g@mail.gmail.com>

Wed, Jan 07, 2026 at 10:02:45AM +0100, Andrei Kuchynski kirjoitti:
> On Tue, Dec 23, 2025 at 12:17 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi,
> >
> > Tue, Dec 16, 2025 at 03:57:40PM +0100, Andrei Kuchynski kirjoitti:
> > > On Thu, Dec 11, 2025 at 3:23 PM Heikki Krogerus
> > > <heikki.krogerus@linux.intel.com> wrote:
> > > >
> > > > Thu, Dec 11, 2025 at 03:40:24PM +0200, Heikki Krogerus kirjoitti:
> > > > > Without going into the code review yet, I'm okay with this in general,
> > > > > except with the artificial SID for the USB4. I still don't understand
> > > > > why do you guys think we should use that instead of an USB4 specific
> > > > > device type?
> > > > >
> > > > > I think somebody said earlier that the user space can't see the device
> > > > > type of the alt modes? If that's really the case, then I think there
> > > > > is some bigger issue here. Are you really sure that if you check the
> > > > > device type of an alternate mode for example with udevadm, it does not
> > > > > say DEVTYPE=typec_alternate_mode ?
> > > > >
> > > > >         % udevadm info -q property --property=DEVTYPE /sys/bus/typec/devices/port0-partner.0
> > > > >         DEVTYPE=typec_alternate_mode
> > > >
> > > > Or just use grep :)
> > > >
> > > >         % grep DEVTYPE /sys/bus/typec/devices/port0-partner.0/uevent
> > > >         DEVTYPE=typec_alternate_mode
> > > >
> > > > So, if that really does not work, then there is a bug somewhere that
> > > > we obviously need to fix.
> > > >
> > > > Please note that the port altmodes are now also part of the bus.
> > > >
> > > > Br,
> > > >
> > > > --
> > > > heikki
> > >
> > > Thank you for the review, Heikki.
> > >
> > > The USB4 SID is utilized for distinguishing between USB4 and alternate
> > > modes internally and is not exposed to user-space. This represents internal
> > > implementation detail, for example the boolean variable `is_alternate`
> > > could serve the same purpose as the SID.
> > > This patch series introduces no new sysfs entries; the only new attribute,
> > > `priority`, was introduced in the mode priority series, available at
> > > https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.org/
> > >
> > > It is possible to use already existing `usb_capabily` and `usb_mode`
> > > attributes to manage USB4 mode, allowing verification of USB4 support on
> > > both the port and the partner. The activation of USB4 is accomplished
> > > through the implementation of the `enter_usb_mode` typec operation.
> > >
> > > I would like your opinion on whether using a USB4 device type would be a
> > > better approach.
> >
> > The device for the USB4 mode will need to have its own device type in
> > any case, but I'm indeed mainly concerned about how we expose the USB4
> > mode device to the user space.
> >
> > As a kernel internal implementation detail the custom SID is probable
> > fine for now, although I was actually hoping that we could improve the
> > API a bit. So something like typec_register_mode() type of API. You
> > probable could introduce something like this for that API:
> >
> >         struct typec_mode {
> >                 /* enum typec_accessory         accessory; */
> >                 enum usb_mode                   usb;      /* or just USB4 flag */
> >                 struct typec_altmode_desc       *altmode; /* NULL with USB4 */
> >         };
> 
> Got it.
> If you don’t have objections regarding the mode selection, I will proceed
> with sending the current patch series, omitting the USB4 support.
> The support for USB4 mode will be in a subsequent series.

No objections :)


-- 
heikki

