Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC7624391A
	for <lists+linux-usb@lfdr.de>; Thu, 13 Aug 2020 13:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbgHMLHR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Aug 2020 07:07:17 -0400
Received: from mga12.intel.com ([192.55.52.136]:24483 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726072AbgHMLHR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 Aug 2020 07:07:17 -0400
IronPort-SDR: 1xLKQQTaxtmZUmoAxx1Ou67n0GUlqNvq7VymcjanyGI5Ozy/MhnPzNmEjanBUhoBglgrmoR7z8
 b4KBgLOYbuaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="133724978"
X-IronPort-AV: E=Sophos;i="5.76,308,1592895600"; 
   d="scan'208";a="133724978"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 04:07:16 -0700
IronPort-SDR: SWkeHnbggdoodf/8JYKjl6AXO2vWwIKJxK+m0ksEI3sVo+VKoKMvI/zc8/X4DcluBulseAx/Yr
 Y7EafThxH8tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,308,1592895600"; 
   d="scan'208";a="399132726"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 13 Aug 2020 04:07:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 13 Aug 2020 14:07:13 +0300
Date:   Thu, 13 Aug 2020 14:07:13 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: typec: ucsi: Fix various locking issues
Message-ID: <20200813110713.GG1169992@kuha.fi.intel.com>
References: <20200809141904.4317-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200809141904.4317-1-hdegoede@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 09, 2020 at 04:19:00PM +0200, Hans de Goede wrote:
> Hi Heikki, et al.,
> 
> As discussed before here is my fix for the AB BA lock inversion issue
> which lockdep found in the ucsi code.
> 
> While working on the AB BA fix I added a
> WARN_ON(!mutex_is_locked(&ucsi->ppm_lock)) to ucsi_run_command() and
> that found me some more unrelated issues of ucsi_run_command() getting
> called without the ppm_lock held. This is fixed in the second patch.
> This made me realize that the ppm_lock handling should probably just
> be pushed down to inside ucsi_run_command() instead of letting the
> callers worry about this.
> 
> In essence the first 3 patches are all related and all boil down to
> push the ppm_lock handling down into ucsi_run_command(), removing the
> difference between ucsi_run_command() and ucsi_send_command(). I have
> been thinking that we may want to just squash these 3 together. I've
> left them as separate patches now as thet document how I go to the
> end result after the 3th patch and having them separate might be
> easier for reviewing purposes. Let me know if you want a v2 of this
> patchset with them squashed into a single "usb: typec: ucsi: Rework
> ppm_lock handling" commit (with the commit messages merged).
> 
> The 4th patch makes the also already discussed change of holding
> con->lock for the entire duration of ucsi_register_port().

I'm fine with having them in separate pathes like that. This all looks
good to me. Thanks for fixing this. For the whole series:

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>


-- 
heikki
