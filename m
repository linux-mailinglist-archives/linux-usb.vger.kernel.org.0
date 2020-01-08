Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03568134636
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 16:29:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgAHP3r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 10:29:47 -0500
Received: from mga17.intel.com ([192.55.52.151]:4539 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbgAHP3q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 10:29:46 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 07:29:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; 
   d="scan'208";a="225923683"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 08 Jan 2020 07:29:43 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 08 Jan 2020 17:29:42 +0200
Date:   Wed, 8 Jan 2020 17:29:42 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: Actually enable all the interface
 notifications
Message-ID: <20200108152942.GE7440@kuha.fi.intel.com>
References: <20200108131347.43217-1-heikki.krogerus@linux.intel.com>
 <20200108131347.43217-3-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108131347.43217-3-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Wed, Jan 08, 2020 at 04:13:47PM +0300, Heikki Krogerus wrote:
> The notification mask was not updated properly before all
> the notifications were enabled in ucsi_init().
> 
> Fixes: 71a1fa0df2a3 ("usb: typec: ucsi: Store the notification mask")

That commit (71a1fa0df2a3) is still in your usb-next branch, so this
patch should also go only to your usb-next.

Sorry about the mix-up.

> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 466bd8afceea..59c8ccdc68ac 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -1007,6 +1007,7 @@ int ucsi_init(struct ucsi *ucsi)
>  	}
>  
>  	/* Enable all notifications */
> +	ucsi->ntfy = UCSI_ENABLE_NTFY_ALL;
>  	command = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
>  	ret = ucsi_run_command(ucsi, command, NULL, 0);
>  	if (ret < 0)
> -- 
> 2.24.1

thanks,

-- 
heikki
