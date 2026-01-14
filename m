Return-Path: <linux-usb+bounces-32333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C27D2D1F89E
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 15:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2692B300EDC8
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 14:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B585430C37B;
	Wed, 14 Jan 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oIN1NQVy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F2D2E1F02;
	Wed, 14 Jan 2026 14:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768402362; cv=none; b=DimoQRPLb7WEHmbwd8o/f7DFjZkk+vC4b1+FFHdSPDwKTaNkk2Do6sAxbmMh412BkJxGk7uNKoMhsJiCW4BVztkxKxSrX1g8DlL2tyD7zVTUmg1yIYjz23mJFMBj+f83kFoObgqiuBzKd4da9Vj0E0izqd5ovmpH53sp3AUGc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768402362; c=relaxed/simple;
	bh=dNgdeh66mbYlkQn0Le2nIbCxYc/84MQKqkAFeyOsX3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcNckPREMz56iA7rNmgk/eYk3qldYf7sWlH8SuYA7oIuW20QWPI7kFoo1C8OjpkrNK3UE5ykAcYqgoTM0KS9dKXqhS7hUjuRcAZz/+jfnjFEMwONLO0JZlssi1PSf2Kmx99pg77n5ralkoVdUGost4xyYV3a/k3coBjImTKeTYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oIN1NQVy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3542DC4CEF7;
	Wed, 14 Jan 2026 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768402361;
	bh=dNgdeh66mbYlkQn0Le2nIbCxYc/84MQKqkAFeyOsX3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIN1NQVyOfKuPJ5B0p12h4xHq7dNUhrMV/492n1ZofjVd9JH2IZTGB32k5H2deHH+
	 DoBj0S/lPaZ+lLgCjSVT2YKyQxzTHMqPPMOKXruxs+Nh9Iqola8MyqqjNXDhbXAiCG
	 Q7plQlbeaHPChUP2mXouWsgQs5fduEySn4XMOtQg=
Date: Wed, 14 Jan 2026 15:52:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>
Subject: Re: [PATCH v4 0/8] USB Type-C mode selection
Message-ID: <2026011423-voltage-frugally-084f@gregkh>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>

On Tue, Jan 13, 2026 at 01:05:28PM +0000, Andrei Kuchynski wrote:
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
> Mode selection is initiated only once during partner registration, and only
> if the port driver provides support for this feature. Subsequent
> mode-switching activities can be managed via existing sysfs entries. Any
> modifications to altmode priorities are relevant only to future
> connections.
> 
> This series is based on the RFC discussed here -
> https://lore.kernel.org/all/20251201122604.1268071-1-akuchynski@chromium.org/
> It incorporates the 'v5 USB Type-C alternate mode priorities' patches,
> reflecting the change of the is_typec_altmode macro to
> is_typec_port_altmode -
> https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.org/
> 
> This series was tested on an Android OS device with kernel 6.19.0-rc4,
> PDC: TI TPS6699, Realtek RTS5453.
> 
> Andrei Kuchynski (8):
>   usb: typec: Add mode_control field to port property
>   platform/chrome: cros_ec_typec: Set no_mode_control flag
>   usb: typec: ucsi: Set no_mode_control flag
>   usb: typec: Expose alternate mode priority via sysfs
>   usb: typec: Implement mode selection
>   usb: typec: Introduce mode_selection bit
>   usb: typec: ucsi: Support mode selection to activate altmodes
>   usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
> 
>  Documentation/ABI/testing/sysfs-class-typec |  11 +
>  drivers/platform/chrome/cros_ec_typec.c     |   1 +
>  drivers/usb/typec/Makefile                  |   2 +-
>  drivers/usb/typec/altmodes/displayport.c    |   6 +-
>  drivers/usb/typec/altmodes/thunderbolt.c    |   2 +-
>  drivers/usb/typec/class.c                   | 100 ++++++-
>  drivers/usb/typec/class.h                   |   3 +
>  drivers/usb/typec/mode_selection.c          | 288 ++++++++++++++++++++
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c       |  21 ++
>  drivers/usb/typec/ucsi/ucsi.c               |  12 +
>  drivers/usb/typec/ucsi/ucsi.h               |   4 +
>  include/linux/usb/typec.h                   |   3 +
>  include/linux/usb/typec_altmode.h           |  42 +++
>  13 files changed, 487 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/usb/typec/mode_selection.c
> 
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

