Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859E2397202
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 13:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhFALGg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 07:06:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:44932 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230288AbhFALGf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Jun 2021 07:06:35 -0400
IronPort-SDR: DsSswFkEkrCcqW4kILEJSAb9GTOt6zpnobfPVVBcLbeKMBb+g96rt0xU5NPPZQhwo4hx1pRXtx
 Cyi6BQEfryMA==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="190878083"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
   d="scan'208";a="190878083"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2021 04:04:54 -0700
IronPort-SDR: guHlYiqI2h9TyxydrIqUlRZ/v8ir7k1yY45FzrIUKuk6361cEY8C7W9DxZWvhlz8VYTCgR0iHS
 vRKnY8xPMePA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; 
   d="scan'208";a="549695674"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 01 Jun 2021 04:04:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 01 Jun 2021 14:04:50 +0300
Date:   Tue, 1 Jun 2021 14:04:49 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Azhar Shaikh <azhar.shaikh@intel.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: intel_pmc_mux: Update IOM port status
 offset for AlderLake
Message-ID: <YLYUUUH6a/YLA09N@kuha.fi.intel.com>
References: <20210601035843.71150-1-azhar.shaikh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601035843.71150-1-azhar.shaikh@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 31, 2021 at 08:58:43PM -0700, Azhar Shaikh wrote:
> Intel AlderLake(ADL) IOM has a different IOM port status offset than
> Intel TigerLake.
> Add a new ACPI ID for ADL and use the IOM port status offset as per
> the platform.
> 
> Signed-off-by: Azhar Shaikh <azhar.shaikh@intel.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Passed acpi_device_id->id to acpi_dev_present() and
>   acpi_dev_get_first_match_dev()
> 
>  drivers/usb/typec/mux/intel_pmc_mux.c | 28 ++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 46a25b8db72e..dc8689db0100 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -83,8 +83,6 @@ enum {
>  /*
>   * Input Output Manager (IOM) PORT STATUS
>   */
> -#define IOM_PORT_STATUS_OFFSET				0x560
> -
>  #define IOM_PORT_STATUS_ACTIVITY_TYPE_MASK		GENMASK(9, 6)
>  #define IOM_PORT_STATUS_ACTIVITY_TYPE_SHIFT		6
>  #define IOM_PORT_STATUS_ACTIVITY_TYPE_USB		0x03
> @@ -144,6 +142,7 @@ struct pmc_usb {
>  	struct pmc_usb_port *port;
>  	struct acpi_device *iom_adev;
>  	void __iomem *iom_base;
> +	u32 iom_port_status_offset;
>  };
>  
>  static void update_port_status(struct pmc_usb_port *port)
> @@ -153,7 +152,8 @@ static void update_port_status(struct pmc_usb_port *port)
>  	/* SoC expects the USB Type-C port numbers to start with 0 */
>  	port_num = port->usb3_port - 1;
>  
> -	port->iom_status = readl(port->pmc->iom_base + IOM_PORT_STATUS_OFFSET +
> +	port->iom_status = readl(port->pmc->iom_base +
> +				 port->pmc->iom_port_status_offset +
>  				 port_num * sizeof(u32));
>  }
>  
> @@ -559,14 +559,32 @@ static int is_memory(struct acpi_resource *res, void *data)
>  	return !acpi_dev_resource_memory(res, &r);
>  }
>  
> +/* IOM ACPI IDs and IOM_PORT_STATUS_OFFSET */
> +static const struct acpi_device_id iom_acpi_ids[] = {
> +	/* TigerLake */
> +	{ "INTC1072", 0x560, },
> +
> +	/* AlderLake */
> +	{ "INTC1079", 0x160, },
> +	{}
> +};
> +
>  static int pmc_usb_probe_iom(struct pmc_usb *pmc)
>  {
>  	struct list_head resource_list;
>  	struct resource_entry *rentry;
> -	struct acpi_device *adev;
> +	static const struct acpi_device_id *dev_id;
> +	struct acpi_device *adev = NULL;
>  	int ret;
>  
> -	adev = acpi_dev_get_first_match_dev("INTC1072", NULL, -1);
> +	for (dev_id = &iom_acpi_ids[0]; dev_id->id[0]; dev_id++) {
> +		if (acpi_dev_present(dev_id->id, NULL, -1)) {
> +			pmc->iom_port_status_offset = (u32)dev_id->driver_data;
> +			adev = acpi_dev_get_first_match_dev(dev_id->id, NULL, -1);
> +			break;
> +		}
> +	}
> +
>  	if (!adev)
>  		return -ENODEV;
>  
> -- 
> 2.17.1

-- 
heikki
