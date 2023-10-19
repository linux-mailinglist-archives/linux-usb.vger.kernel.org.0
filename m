Return-Path: <linux-usb+bounces-1887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C067CF04B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 08:45:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5158B20F21
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 06:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E50163DF;
	Thu, 19 Oct 2023 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDyGASLt"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22C63A5
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 06:45:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7130B0;
	Wed, 18 Oct 2023 23:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697697927; x=1729233927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cQvFQ+sT0o2iZJGt5HiCb0jFbkLHAUn4K2XjF8tN1dY=;
  b=cDyGASLtd+0AoYaC1s50+ocEtosGYylXDvg5axYf3AfUEpyhjJ5/IKY7
   Fg6mdl2qaf33Rklr+1bPpeJfFcVBT+zkpuiAdLB0Rmgh8d5SAR70hZO2B
   Z8p/QB230l7wFF+4/uRQ6+WL7nLGq5ZejZpsMShnELX4XN9dv7jDFWQi8
   DN2bIshy5xGrUKBrDifYPXp7jS3IJV8XS/5DwNmMEZJJou+6Bpeh+jJbU
   Qylr8Mc9r5a2hjwr9XiWbNGR9r5lt3T1nw1bgvPXmpe+9cv925GI2zqE8
   CllJxWR8fO1/lqMfRrqjnlKqc/7lN7C+4renP37dmHFfv+mdWpTBg88cn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="417297366"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="417297366"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 23:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="873345628"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="873345628"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga002.fm.intel.com with SMTP; 18 Oct 2023 23:45:24 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 19 Oct 2023 09:45:23 +0300
Date: Thu, 19 Oct 2023 09:45:23 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: gregkh@linuxfoundation.org, linux@roeck-us.net, kyletso@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: tcpm: Add additional checks for
 contaminant
Message-ID: <ZTDQg15FCdIM+wZd@kuha.fi.intel.com>
References: <20231015053108.2349570-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231015053108.2349570-1-badhri@google.com>

On Sun, Oct 15, 2023 at 05:31:08AM +0000, Badhri Jagan Sridharan wrote:
> When transitioning from SNK_DEBOUNCED to unattached, its worthwhile to
> check for contaminant to mitigate wakeups.
> 
> ```
> [81334.219571] Start toggling
> [81334.228220] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> [81334.305147] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
> [81334.305162] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> [81334.305187] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> [81334.475515] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> [81334.486480] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_DEBOUNCED, polarity 0, disconnected]
> [81334.486495] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
> [81334.486515] pending state change SNK_DEBOUNCED -> SNK_UNATTACHED @ 20 ms [rev3 NONE_AMS]
> [81334.506621] state change SNK_DEBOUNCED -> SNK_UNATTACHED [delayed 20 ms]
> [81334.506640] Start toggling
> [81334.516972] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> [81334.592759] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
> [81334.592773] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> [81334.592792] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> [81334.762940] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> [81334.773557] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_DEBOUNCED, polarity 0, disconnected]
> [81334.773570] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
> [81334.773588] pending state change SNK_DEBOUNCED -> SNK_UNATTACHED @ 20 ms [rev3 NONE_AMS]
> [81334.793672] state change SNK_DEBOUNCED -> SNK_UNATTACHED [delayed 20 ms]
> [81334.793681] Start toggling
> [81334.801840] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
> [81334.878655] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
> [81334.878672] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> [81334.878696] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> [81335.048968] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
> [81335.060684] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_DEBOUNCED, polarity 0, disconnected]
> [81335.060754] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
> [81335.060775] pending state change SNK_DEBOUNCED -> SNK_UNATTACHED @ 20 ms [rev3 NONE_AMS]
> [81335.080884] state change SNK_DEBOUNCED -> SNK_UNATTACHED [delayed 20 ms]
> [81335.080900] Start toggling
> ```
> 
> Cc: stable@vger.kernel.org
> Fixes: 599f008c257d ("usb: typec: tcpm: Add callbacks to mitigate wakeups due to contaminant")
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 6e843c511b85..1c7e8dc5282d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3903,6 +3903,8 @@ static void run_state_machine(struct tcpm_port *port)
>  		port->potential_contaminant = ((port->enter_state == SRC_ATTACH_WAIT &&
>  						port->state == SRC_UNATTACHED) ||
>  					       (port->enter_state == SNK_ATTACH_WAIT &&
> +						port->state == SNK_UNATTACHED) ||
> +					       (port->enter_state == SNK_DEBOUNCED &&
>  						port->state == SNK_UNATTACHED));
>  
>  	port->enter_state = port->state;
> 
> base-commit: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d
> -- 
> 2.42.0.655.g421f12c284-goog

-- 
heikki

