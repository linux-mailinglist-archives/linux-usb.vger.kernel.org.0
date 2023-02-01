Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82C9968621A
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 09:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjBAIuu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 03:50:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjBAIus (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 03:50:48 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7385113F2
        for <linux-usb@vger.kernel.org>; Wed,  1 Feb 2023 00:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675241447; x=1706777447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tC6oEIo6jZbpH/aXg9XiNggkb6veHEonLpxyqob6SXQ=;
  b=fKmC2dVFEdwZNr77tc/ojpwyqrxVpQgIG8ds3eOxxo8QuHadaPQaZbGl
   WLD3abiI4Rjizb+DfK3wBk3Y4SZXsEw0fo9VDiWFRWFYES1qL2l1RCebF
   O9bUQg+LAM0qumujKmFjkqoj6xdJl9E92KpUfE1MXrhefcekHnVinAgg3
   rLCQjmMvhnqm3QX2pOMNu0QOX8h26aaDSCbqz04drICNlT3G3t7Gq52zm
   ORqjWrjoRcW6l3KumM6zJVYG999go3yA2lF9HuZZJntXQokimgQHqpuEG
   AAC/+fgwbJUlRQ619txQi9cYwqvqnnuoFg2YlJUS4EL4o69I0goM6sSB+
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="307747292"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="307747292"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 00:50:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="807486589"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="807486589"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 01 Feb 2023 00:50:37 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 01 Feb 2023 10:50:36 +0200
Date:   Wed, 1 Feb 2023 10:50:36 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [RFC PATCH] usb: typec: ucsi: change role command to async write
Message-ID: <Y9on3G7gXGEAN6oG@kuha.fi.intel.com>
References: <1675158735-2757-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675158735-2757-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 31, 2023 at 05:52:15PM +0800, Linyu Yuan wrote:
> In ucsi_dr_swap() and ucsi_pr_swap(), it will wait complete.
> it is better change role switch command to async mode which will avoid
> reset ppm in condition that data/power switch can't operate.

I think I need a little bit more information. Reseting the whole PPM
is a heavy operation, I do admit that, but you are not really
explaining what happens in your case when the driver does it - why is
it a problem?

The proposal of using async_write here is in any case not acceptable.
You would now end up generationg a spurious command completion event
that can in worst case will screws up some other command.

If the PPM reset is the problem here, then perhaps the proper thing to
do would be to remove that instead?

thanks,

> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 00fc867..466ae93 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -997,17 +997,21 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
>  
>  static int ucsi_role_cmd(struct ucsi_connector *con, u64 command)
>  {
> +	struct ucsi *ucsi = con->ucsi;
>  	int ret;
>  
> -	ret = ucsi_send_command(con->ucsi, command, NULL, 0);
> +	mutex_lock(&ucsi->ppm_lock);
> +	ret = ucsi->ops->async_write(ucsi, UCSI_CONTROL, &command, sizeof(command));
> +	mutex_unlock(&ucsi->ppm_lock);
> +
>  	if (ret == -ETIMEDOUT) {
>  		u64 c;
>  
>  		/* PPM most likely stopped responding. Resetting everything. */
> -		ucsi_reset_ppm(con->ucsi);
> +		ucsi_reset_ppm(ucsi);
>  
> -		c = UCSI_SET_NOTIFICATION_ENABLE | con->ucsi->ntfy;
> -		ucsi_send_command(con->ucsi, c, NULL, 0);
> +		c = UCSI_SET_NOTIFICATION_ENABLE | ucsi->ntfy;
> +		ucsi_send_command(ucsi, c, NULL, 0);
>  
>  		ucsi_reset_connector(con, true);
>  	}
> -- 
> 2.7.4

-- 
heikki
