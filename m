Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40AB9E354F
	for <lists+linux-usb@lfdr.de>; Thu, 24 Oct 2019 16:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405025AbfJXOOf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Oct 2019 10:14:35 -0400
Received: from mga09.intel.com ([134.134.136.24]:28946 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbfJXOOf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 24 Oct 2019 10:14:35 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 07:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; 
   d="scan'208";a="210167529"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 24 Oct 2019 07:14:32 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 24 Oct 2019 17:14:31 +0300
Date:   Thu, 24 Oct 2019 17:14:31 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 12/18] usb: typec: ucsi: acpi: Move to the new API
Message-ID: <20191024141431.GB29754@kuha.fi.intel.com>
References: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
 <20191023143939.39668-13-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023143939.39668-13-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

There is still one more thing that has to be fixed.

On Wed, Oct 23, 2019 at 05:39:33PM +0300, Heikki Krogerus wrote:
>  static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
>  {
>  	struct ucsi_acpi *ua = data;
> +	u32 cci;
> +	int ret;
> +
> +	ret = ucsi_acpi_read(ua->ucsi, UCSI_CCI, &cci, sizeof(cci));
> +	if (ret) {
> +		dev_err(ua->dev, "failed to read CCI\n");
> +		return;
> +	}
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(ua->ucsi, UCSI_CCI_CONNECTOR(cci));
>  
> -	ucsi_notify(ua->ucsi);
> +	if (test_bit(COMMAND_PENDING, &ua->flags) &&
> +	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> +		complete(&ua->complete);
>  }

On some platforms the firmware leaves the old connector value to the
connector change indication field of CCI. ucsi_notify() considered
that by ignoring any connector change indicators that came together
with command completions. I have to do the same here.

I'll prepare v3.

thanks,

-- 
heikki
