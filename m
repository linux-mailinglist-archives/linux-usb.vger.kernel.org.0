Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2682F14648C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 10:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgAWJY5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 04:24:57 -0500
Received: from mga14.intel.com ([192.55.52.115]:37375 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAWJY5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jan 2020 04:24:57 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jan 2020 01:24:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; 
   d="scan'208";a="287358541"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 23 Jan 2020 01:24:54 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 23 Jan 2020 11:24:54 +0200
Date:   Thu, 23 Jan 2020 11:24:54 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     linux-usb@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: register DP only for NVIDIA DP VDO
Message-ID: <20200123092454.GA2905@kuha.fi.intel.com>
References: <20200116013247.16507-1-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116013247.16507-1-ajayg@nvidia.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ajay,

On Wed, Jan 15, 2020 at 05:32:46PM -0800, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> NVIDIA VirtualLink (svid 0x955) has two altmode with vdo values
> of vdo=0x1 for VirtualLink DP mode and vdo=0x3 for NVIDIA test
> mode. Register display altmode driver only for vdo=0x1
> 
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 12 ++++++++++--
>  include/linux/usb/typec_dp.h  |  2 ++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index d5a6aac86327..eca9d598a42f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -270,9 +270,16 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
>  
>  		switch (desc->svid) {
>  		case USB_TYPEC_DP_SID:
> -		case USB_TYPEC_NVIDIA_VLINK_SID:
>  			alt = ucsi_register_displayport(con, override, i, desc);
>  			break;
> +		case USB_TYPEC_NVIDIA_VLINK_SID:
> +			if (desc->vdo == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
> +				alt = typec_port_register_altmode(con->port,
> +								  desc);
> +			else
> +				alt = ucsi_register_displayport(con, override,
> +								i, desc);
> +			break;
>  		default:
>  			alt = typec_port_register_altmode(con->port, desc);
>  			break;
> @@ -475,7 +482,8 @@ static void ucsi_unregister_altmodes(struct ucsi_connector *con, u8 recipient)
>  	while (adev[i]) {
>  		if (recipient == UCSI_RECIPIENT_SOP &&
>  		    (adev[i]->svid == USB_TYPEC_DP_SID ||
> -			adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID)) {
> +			(adev[i]->svid == USB_TYPEC_NVIDIA_VLINK_SID &&
> +			adev[i]->vdo != USB_TYPEC_NVIDIA_VLINK_DBG_VDO))) {
>  			pdev = typec_altmode_get_partner(adev[i]);
>  			ucsi_displayport_remove_partner((void *)pdev);
>  		}
> diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
> index fc4c7edb2e8a..848321c4498e 100644
> --- a/include/linux/usb/typec_dp.h
> +++ b/include/linux/usb/typec_dp.h
> @@ -10,6 +10,8 @@
>   * IDs as the SVID.
>   */
>  #define USB_TYPEC_NVIDIA_VLINK_SID	0x955	/* NVIDIA VirtualLink */
> +#define USB_TYPEC_NVIDIA_VLINK_DP_VDO	0x1
> +#define USB_TYPEC_NVIDIA_VLINK_DBG_VDO	0x3

I think those should be defined in ucsi.c for now. We can move them to
the header if there is another user.

thanks,

-- 
heikki
