Return-Path: <linux-usb+bounces-31386-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D904BCB611C
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 14:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98375304DEF6
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 13:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445333126C6;
	Thu, 11 Dec 2025 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGgu3jc1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E75313529;
	Thu, 11 Dec 2025 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765460436; cv=none; b=qwgMyMJ7Hxo1wg/XptsemsOUKfYeCcPuzMxzsfwWwYjH5wvC/evz89+3rgZxK09oBxazMj2wAnuc+EXGGVw2AWqUWKmuTQaEnIcOb8bvPbpa9C7Le7VHF2thi1UcBYItICbJHiIUvwNsZdZZ5jOz9ghX3WTL7H5aK6DI1wsM/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765460436; c=relaxed/simple;
	bh=4ASCa5tSVFa5F5Mlrk4KxCo2wiu6Y8ZoR39RFaFuTaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g69FiwzD+8l+ZC68JG5JANxwnLhRkOoailFUrhXSt4f4rYfPkByprVLGFrpApkwyVuFi73T4nmROhBjnzMMCHA9UB91mXqKAyiU21NI6iMAlPiXSkzyD7BaYHfBr2mpe4RRBOrabxXP6QPSZBnvhZh9QcWiVAv/k8z1RDmWNiTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGgu3jc1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765460435; x=1796996435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4ASCa5tSVFa5F5Mlrk4KxCo2wiu6Y8ZoR39RFaFuTaY=;
  b=GGgu3jc12ZpryVoKMGus0SwoO8k8PvQU3aCwNvQm3XWvVOts0tSfECkj
   m3KLFTuchCS9oUFxbSxy44BnyP93P4C0KYM8176k7gdtp+Bn2S2veE7PW
   r3HWLeND1rIeyWIYarCTKV/yAOY/+Eo8lKeu63ocxXsAJpwFJMEA8vElF
   hvu0XBxmDTxXWpaEaJuuPFRpGTrlWQZkj/W9nbZEcjRUHOzzl8aEwS3Kc
   TtZkTuuY8X+ug1MXi6i72x20tL+59f+gVZ/a/5+wN4pEhM2ySG6qBV7Xc
   mZMG1fPbb/a8NzJMD9CeSIdpZS5/jz7JPmz8Otryv5KtHMpl+mbCZapbj
   A==;
X-CSE-ConnectionGUID: P7IXRRLxSXOhiTpT+DxAFA==
X-CSE-MsgGUID: yKN8flv9RMaX9E7UJF5paQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67327240"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67327240"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:40:34 -0800
X-CSE-ConnectionGUID: Im8UbXZsTL2/wJrvmy+/xw==
X-CSE-MsgGUID: /OZB2tKKRDe+EiIdhTrnmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="197620652"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.61])
  by fmviesa010.fm.intel.com with SMTP; 11 Dec 2025 05:40:27 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 11 Dec 2025 15:40:16 +0200
Date: Thu, 11 Dec 2025 15:40:16 +0200
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
Message-ID: <aTrJwA7Y4fWiTMzB@kuha>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>

Mon, Dec 01, 2025 at 12:25:56PM +0000, Andrei Kuchynski kirjoitti:
> This patch series introduces functionality to the USB Type-C Alternate Mode
> negotiation process by implementing a priority-based selection mechanism.
> 
> Currently, DisplayPort and Thunderbolt drivers initiate a mode entry
> separately within their respective probe functions. The Power Delivery
> Controller (PDC) retains the ability to activate either USB4 mode or
> Alternate Modes based on its internal policy.
> The mode selection mechanism disables Alternate Modes to be entered by
> their respective drivers and the PDC. Instead, a priority-ordered approach
> is used to activate the most desirable mode.
> 
> A new `priority` field is added to the `typec_altmode` structure to store
> a numerical priority value, with all priorities being unique.
> If the port driver supports the mode selection feature, it must set the
> `mode_selection` boolean field within the `typec_altmode` structure. This
> indicates to the alternate mode drivers that they are not to activate the
> altmode separately.
> 
> The mode selection process is managed by three API functions:
> - `typec_mode_selection_start`
> - `typec_altmode_state_update`
> - `typec_mode_selection_delete`
> 
> When a partner device is connected, the `typec_mode_selection_start`
> function executes the following steps:
> - It compiles a priority-ordered list of Alternate Modes that are mutually
> supported by both the port and the partner.
> - A dedicated mode selection task is subsequently initiated on the Work
> Queue.
> - This task attempts to activate a mode by starting with the
> highest-priority altmode on the list. Alternate modes are identified with
> their SVIDs. Activation/Deactivation performed via `activate` typec_altmode
> operation. The process stops as soon as a mode is successfully entered.
> Otherwise, after a timeout or if an error occurs, the next alternative mode
> will be activated.
> 
> The `typec_altmode_state_update` function is invoked by the port driver to
> communicate the current mode of the Type-C connector.
> 
> The `typec_mode_selection_delete` function is responsible for stopping the
> currently running mode selection process and releasing all associated
> system resources.
> 
> USB4 activation can be handled in two distinct ways:
> - Treated like an Alternate Mode, using associated sysfs attributes -
> `activate` port attribute to enable/disable the mode, `activate` partner
> attribute to activate/deactivate the mode, `priority` to keep modes
> priority.
> - Like a separate USB mode representing in sysfs via `usb_capabily` ports
> attribute to enable the mode on the port and `usb_mode` partner attribute
> to activate the mode. In this scenario, USB4 is the highest-priority mode,
> without the need for a separate priority field. It is put on the top of the
> preferred list if it is supported by the partner (partner->usb_capability
> has USB_CAPABILITY_USB4 bit set) and is supported and enabled on the port
> (port->usb_mode is USB_MODE_USB4).
> 
> This patch series implements the second approach. It identifies the USB4
> mode via its SVID 0xFF00. Instead of using the typec_altmode_ops activate()
> function, activation is handled via the typec_operations enter_usb_mode()
> function.
> Mode selection is initiated only once during partner registration, and only
> if the port driver provides support for this feature. Subsequent
> mode-switching activities can be managed via existing sysfs entries. Any
> modifications to altmode priorities are relevant only to future
> connections.
> 
> This series was tested on an Android OS device with kernel 6.17, PDC:
> TI TPS6699, Realtek RTS5453.
> This series depends on the 'USB Type-C alternate mode priorities' series:
> https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.org/ 

Without going into the code review yet, I'm okay with this in general,
except with the artificial SID for the USB4. I still don't understand
why do you guys think we should use that instead of an USB4 specific
device type?

I think somebody said earlier that the user space can't see the device
type of the alt modes? If that's really the case, then I think there
is some bigger issue here. Are you really sure that if you check the
device type of an alternate mode for example with udevadm, it does not
say DEVTYPE=typec_alternate_mode ?

        % udevadm info -q property --property=DEVTYPE /sys/bus/typec/devices/port0-partner.0
        DEVTYPE=typec_alternate_mode

Br,

> Andrei Kuchynski (8):
>   usb: typec: Implement mode selection
>   usb: typec: Integrate USB4 into the mode selection process
>   usb: typec: Introduce mode_selection bit
>   usb: typec: ucsi: Support mode selection to activate altmodes
>   usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
>   usb: typec: ucsi: Implement enter_usb_mode operation
>   usb: typec: ucsi: Support for Thunderbolt alt mode
>   platform/chrome: cros_ec_typec: Enforce priority-based mode selection
> 
>  drivers/platform/chrome/cros_ec_typec.c      |  47 ++-
>  drivers/platform/chrome/cros_typec_altmode.c |   8 +-
>  drivers/usb/typec/Makefile                   |   2 +-
>  drivers/usb/typec/altmodes/displayport.c     |   6 +-
>  drivers/usb/typec/altmodes/thunderbolt.c     |   2 +-
>  drivers/usb/typec/class.c                    |   1 +
>  drivers/usb/typec/class.h                    |   2 +
>  drivers/usb/typec/mode_selection.c           | 308 +++++++++++++++++++
>  drivers/usb/typec/ucsi/Makefile              |   4 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c        |  44 +++
>  drivers/usb/typec/ucsi/thunderbolt.c         | 199 ++++++++++++
>  drivers/usb/typec/ucsi/ucsi.c                |  56 +++-
>  drivers/usb/typec/ucsi/ucsi.h                |  27 ++
>  include/linux/usb/typec.h                    |   1 +
>  include/linux/usb/typec_altmode.h            |  43 +++
>  15 files changed, 728 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/usb/typec/mode_selection.c
>  create mode 100644 drivers/usb/typec/ucsi/thunderbolt.c
> 
> -- 
> 2.52.0.158.g65b55ccf14-goog

-- 
heikki

