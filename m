Return-Path: <linux-usb+bounces-3394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35A7FB36A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 08:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AE8C281F18
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 07:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE8014A91;
	Tue, 28 Nov 2023 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/wc1yI3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC3210A;
	Mon, 27 Nov 2023 23:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701158364; x=1732694364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eH8K0Rq16QUjtscu5lkGKQW6/VMHMllPbrirgbRjrcQ=;
  b=e/wc1yI3NoRwywNF6JsynvxzgN0vyGBHzNqZYjlP0wbA5iTJjO/4Lg69
   HZTf0C7fscIh56Jx5tN2m0+ssIObaJExv6M8y2zY/9Ny6x64SEXmnTQHT
   yX00eZJlfww5T93WO2FvVUhiaFUQOQwj9/a92T0IYy2Mld5krB4P96Ubx
   0nc34o/odqAUnhJY9evAxewcY2S+HpQphy0ulc5YQ3krh/mFrpeJRJ/z6
   RifJIeVq14HnQBSbTAxLTm1bT94KeSNKfKLAnOVO12+SmMInlvJC2KXGh
   eyRumbv4lCvpkWyosLd23UC5LPbzV7AoZoCaTuH7CayO7Hl3V6qBZOWwM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="391745240"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="391745240"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 23:59:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="768441744"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="768441744"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga002.jf.intel.com with SMTP; 27 Nov 2023 23:59:21 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 28 Nov 2023 09:59:20 +0200
Date: Tue, 28 Nov 2023 09:59:20 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: linux@roeck-us.net, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	badhri@google.com
Subject: Re: [PATCH v1 2/2] usb: typec: tcpci: add vconn over current fault
 handling to maxim_core
Message-ID: <ZWWd2AU+rJOWzzvx@kuha.fi.intel.com>
References: <20231121203845.170234-4-rdbabiera@google.com>
 <20231121203845.170234-6-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121203845.170234-6-rdbabiera@google.com>

On Tue, Nov 21, 2023 at 08:38:48PM +0000, RD Babiera wrote:
> Add TCPC_FAULT_STATUS_VCONN_OC constant and corresponding mask definition.
> Maxim TCPC is capable of detecting VConn over current faults, so add
> fault to alert mask. When a Vconn over current fault is triggered, put the
> port in an error recovery state via tcpm_port_error_recovery.
> 
> Signed-off-by: RD Babiera <rdbabiera@google.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 20 +++++++++++++++++++-
>  include/linux/usb/tcpci.h                 |  5 ++++-
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> index 9454b12a073c..7fb966fd639b 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -92,11 +92,16 @@ static void max_tcpci_init_regs(struct max_tcpci_chip *chip)
>  		return;
>  	}
>  
> +	/* Vconn Over Current Protection */
> +	ret = max_tcpci_write8(chip, TCPC_FAULT_STATUS_MASK, TCPC_FAULT_STATUS_MASK_VCONN_OC);
> +	if (ret < 0)
> +		return;
> +
>  	alert_mask = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_TX_FAILED |
>  		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_RX_STATUS | TCPC_ALERT_CC_STATUS |
>  		TCPC_ALERT_VBUS_DISCNCT | TCPC_ALERT_RX_BUF_OVF | TCPC_ALERT_POWER_STATUS |
>  		/* Enable Extended alert for detecting Fast Role Swap Signal */
> -		TCPC_ALERT_EXTND | TCPC_ALERT_EXTENDED_STATUS;
> +		TCPC_ALERT_EXTND | TCPC_ALERT_EXTENDED_STATUS | TCPC_ALERT_FAULT;
>  
>  	ret = max_tcpci_write16(chip, TCPC_ALERT_MASK, alert_mask);
>  	if (ret < 0) {
> @@ -295,6 +300,19 @@ static irqreturn_t _max_tcpci_irq(struct max_tcpci_chip *chip, u16 status)
>  		}
>  	}
>  
> +	if (status & TCPC_ALERT_FAULT) {
> +		ret = max_tcpci_read8(chip, TCPC_FAULT_STATUS, &reg_status);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = max_tcpci_write8(chip, TCPC_FAULT_STATUS, reg_status);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (reg_status & TCPC_FAULT_STATUS_VCONN_OC)
> +			tcpm_port_error_recovery(chip->port);
> +	}
> +
>  	if (status & TCPC_ALERT_EXTND) {
>  		ret = max_tcpci_read8(chip, TCPC_ALERT_EXTENDED, &reg_status);
>  		if (ret < 0)
> diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
> index 83376473ac76..467e8045e9f8 100644
> --- a/include/linux/usb/tcpci.h
> +++ b/include/linux/usb/tcpci.h
> @@ -36,7 +36,9 @@
>  
>  #define TCPC_ALERT_MASK			0x12
>  #define TCPC_POWER_STATUS_MASK		0x14
> -#define TCPC_FAULT_STATUS_MASK		0x15
> +
> +#define TCPC_FAULT_STATUS_MASK			0x15
> +#define TCPC_FAULT_STATUS_MASK_VCONN_OC		BIT(1)
>  
>  #define TCPC_EXTENDED_STATUS_MASK		0x16
>  #define TCPC_EXTENDED_STATUS_MASK_VSAFE0V	BIT(0)
> @@ -104,6 +106,7 @@
>  
>  #define TCPC_FAULT_STATUS		0x1f
>  #define TCPC_FAULT_STATUS_ALL_REG_RST_TO_DEFAULT BIT(7)
> +#define TCPC_FAULT_STATUS_VCONN_OC	BIT(1)
>  
>  #define TCPC_ALERT_EXTENDED		0x21
>  
> -- 
> 2.43.0.rc1.413.gea7ed67945-goog

-- 
heikki

