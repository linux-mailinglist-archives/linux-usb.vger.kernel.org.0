Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C0F1ADBEF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 13:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730213AbgDQLK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Apr 2020 07:10:59 -0400
Received: from mga07.intel.com ([134.134.136.100]:9466 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730168AbgDQLK6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Apr 2020 07:10:58 -0400
IronPort-SDR: CEcDq/cJg0hVDDqd+hH2wsAFIdl9w2Tm2FdFU3+AtrPRatT4RJy3S3ETvo7+t/3xIlnGUuDGd3
 /6st3t/ayUZw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2020 04:10:58 -0700
IronPort-SDR: yvp1gN832uEDniYQR8aan7CPBKa72FNwqyg5tTSzdrrpKrqPRLqsRalk42WmgT28jNXxphFNpt
 TE2o5+R1y0Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; 
   d="scan'208";a="364302675"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 17 Apr 2020 04:10:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 17 Apr 2020 14:10:54 +0300
Date:   Fri, 17 Apr 2020 14:10:54 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Mayank Rana <mrana@codeaurora.org>
Cc:     ajayg@nvidia.com, linux-usb@vger.kernel.org, jackp@codeaurora.org
Subject: Re: [PATCH] usb: typec: ucsi: set USB data role when partner type is
 power cable/ufp
Message-ID: <20200417111054.GA3718093@kuha.fi.intel.com>
References: <1584390949-9208-1-git-send-email-mrana@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584390949-9208-1-git-send-email-mrana@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 16, 2020 at 01:35:49PM -0700, Mayank Rana wrote:
> Currently UCSI framework doesn't update USB data role when partner type
> is reported as power cable or power cable with ufp connected. This
> results into no USB host mode functionality. This is valid usecase where
> user wants to use legacy type c power cable with type a female connector
> to attach different USB devices like mouse, thumb drive etc. Hence update
> USB data role as host when partner type is reported as power cable or
> power cable with ufp connected.
> 
> Signed-off-by: Mayank Rana <mrana@codeaurora.org>

I've now applied this to my ucsi branch:
https://github.com/krohei/linux/commit/fc5a9939c9b8bded598c39339992be470563604f

I will send it to Greg together with the other changes I have for this
driver next week.

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index d5a6aac..ce62732 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -558,6 +558,8 @@ static void ucsi_partner_change(struct ucsi_connector *con)
>  
>  	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
>  	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> +	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
> +	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
>  		typec_set_data_role(con->port, TYPEC_HOST);
>  		break;
>  	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
> @@ -619,6 +621,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
>  
>  		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
>  		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> +		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
> +		case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
>  			typec_set_data_role(con->port, TYPEC_HOST);
>  			break;
>  		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
> @@ -919,6 +923,8 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
>  
>  	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
>  	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
> +	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
> +	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
>  		typec_set_data_role(con->port, TYPEC_HOST);
>  		break;
>  	case UCSI_CONSTAT_PARTNER_TYPE_DFP:

thanks,

-- 
heikki
