Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44D9922EC4A
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 14:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgG0Mhj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 08:37:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:2550 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728173AbgG0Mhi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 08:37:38 -0400
IronPort-SDR: m4RrRPyPLTGUD2Q5DtmDF7FuOm+uKKNmX7O2bgXWNT6m0jrJssdEzINiSDFoEYCrVcSvL5R04h
 f7Ka3PIntpnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="150983675"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="150983675"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 05:37:38 -0700
IronPort-SDR: A0Vpd6PDP0n2Uw82EWNTfJI7KKJ0bT/TH/rTfyo3m8JvWh2FSh8568HkNNz6mCtdALK2FgtO3W
 QUIUDy/jrLtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="393970505"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 27 Jul 2020 05:37:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 27 Jul 2020 15:37:35 +0300
Date:   Mon, 27 Jul 2020 15:37:35 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: AB BA lock inversion in ucsi driver caused by "usb: typec: ucsi:
 displayport: Fix a potential race during registration"
Message-ID: <20200727123735.GA883641@kuha.fi.intel.com>
References: <734333be-aa48-d2fc-0463-6334115e3c12@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734333be-aa48-d2fc-0463-6334115e3c12@redhat.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans,

Sorry about the late reply. I just returned from vacation.

On Fri, Jul 17, 2020 at 12:04:58PM +0200, Hans de Goede wrote:
> Hi Heikki,
> 
> I've been running my personal kernel builds with lockdep enabled
> (more people should do that) and it found an AB BA lock inversion in the
> ucsi driver. This has been introduced by commit 081da1325d35 ("usb: typec:
> ucsi: displayport: Fix a potential race during registration").
> 
> The problem is as follows:
> 
> AB order:
> 
> 1. ucsi_init takes ucsi->ppm_lock (it runs with that locked for the duration of the function)
> 2. usci_init eventually end up calling ucsi_register_displayport, which takes
>    ucsi_connector->lock
> 
> BA order:
> 
> 1. ucsi_handle_connector_change work is started, takes ucsi_connector->lock
> 2. ucsi_handle_connector_change calls ucsi_send_command which takes ucsi->ppm_lock
> 
> I think this can be fixed by doing the following:
> 
> a. Make ucsi_init drop the ucsi->ppm_lock before it starts registering ports; and
>    replacing any ucsi_run_command calls after this point with ucsi_send_command
>    (which is a wrapper around run_command taking the lock while handling the command)
> 
> b. Move the taking of the ucsi_connector->lock from ucsi_register_displayport into
>    ucsi_register_port() to make sure that nothing can touch the connector/port until
>    ucsi_register_port() has completed.
> 
> 
> b. is not stricly necessary but it brings the locking during init more inline
> with locking done during runtime so this seems like a good idea.

Makes sense. So b. it is. Can you prepare the patch for that?

thanks,

-- 
heikki
