Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352B3255C06
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 16:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgH1OMD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 10:12:03 -0400
Received: from mga11.intel.com ([192.55.52.93]:48032 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbgH1OMB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Aug 2020 10:12:01 -0400
IronPort-SDR: mTzOzLK+uCAQ4Tthpled8QY+7whBJ7Orj3oukqj28taGHvdLVDnkArYjSUXtacQ3ZXAxI2OQS2
 pDtH5JbXIhYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="154211819"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="154211819"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2020 07:12:01 -0700
IronPort-SDR: ojdwmhxED06K7XC2t1Pg2Fm3LMskUfddgFyUdMUMliOGez68uXqo7zZMNBAar+PD6V5Y2tfEZh
 J2QzbXFiiANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; 
   d="scan'208";a="403762847"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 28 Aug 2020 07:11:58 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 28 Aug 2020 17:11:58 +0300
Date:   Fri, 28 Aug 2020 17:11:58 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Badhri Jagan Sridharan <badhri@google.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/14 v1] usb: typec: tcpci: Add a getter method to
 retrieve tcpm_port reference
Message-ID: <20200828141158.GI174928@kuha.fi.intel.com>
References: <20200825042210.300632-1-badhri@google.com>
 <20200825042210.300632-5-badhri@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825042210.300632-5-badhri@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020 at 09:22:00PM -0700, Badhri Jagan Sridharan wrote:
> Allow chip level drivers to retrieve reference to tcpm_port.
> 
> Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 6 ++++++
>  drivers/usb/typec/tcpm/tcpci.h | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index 9e814d454d14..7b7991c8ac87 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -38,6 +38,12 @@ struct tcpci_chip {
>  	struct tcpci_data data;
>  };
>  
> +struct tcpm_port *tcpci_get_tcpm_port(struct tcpci *tcpci)
> +{
> +	return tcpci->port;
> +}
> +EXPORT_SYMBOL_GPL(tcpci_get_tcpm_port);

I wonder if it would be better if there were tpci callbacks, or
wrappers, for the tcpm functions that the glue drivers could then use
instead of directly calling the tcpm_*() functions?  That would allow
tcpci.c to keep tabs on what is going on.

That would somehow feel like a better approach to me, but maybe it
would only complicate things. Guenter, what do you think?


thanks,

-- 
heikki
