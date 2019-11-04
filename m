Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 362B2EDAB4
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 09:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfKDIpX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 03:45:23 -0500
Received: from mga17.intel.com ([192.55.52.151]:58678 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbfKDIpW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 03:45:22 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 00:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,266,1569308400"; 
   d="scan'208";a="212269041"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 04 Nov 2019 00:45:19 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 04 Nov 2019 10:45:19 +0200
Date:   Mon, 4 Nov 2019 10:45:19 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 13/18] usb: typec: ucsi: ccg: Move to the new API
Message-ID: <20191104084519.GA29493@kuha.fi.intel.com>
References: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
 <20191025082324.75731-14-heikki.krogerus@linux.intel.com>
 <638c43d4-6de0-81a3-018b-dc1e9488ec22@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <638c43d4-6de0-81a3-018b-dc1e9488ec22@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 02, 2019 at 09:34:55AM -0700, Guenter Roeck wrote:
> >   static irqreturn_t ccg_irq_handler(int irq, void *data)
> >   {
> > +	u16 reg = CCGX_RAB_UCSI_DATA_BLOCK(UCSI_CCI);
> >   	struct ucsi_ccg *uc = data;
> > +	u8 intr_reg;
> > +	u32 cci;
> > +	int ret;
> > +
> > +	ret = ccg_read(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = ccg_read(uc, reg, (void *)&cci, sizeof(cci));
> > +	if (ret) {
> > +		dev_err(uc->dev, "failed to read CCI\n");
> 
> ccg_read() already logs an error message.
> 
> > +		goto err_clear_irq;
> > +	}
> > +
> > +	if (UCSI_CCI_CONNECTOR(cci))
> > +		ucsi_connector_change(uc->ucsi, UCSI_CCI_CONNECTOR(cci));
> > -	ucsi_notify(uc->ucsi);
> > +	if (test_bit(DEV_CMD_PENDING, &uc->flags) &&
> > +	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> > +		complete(&uc->complete);
> > +
> > +err_clear_irq:
> > +	ret =  ccg_write(uc, CCGX_RAB_INTR_REG, &intr_reg, sizeof(intr_reg));
> > +	if (ret)
> > +		dev_err(uc->dev, "failed to clear interrupt\n");
> 
> ccg_write() already logs an error message.

OK. I'll drop both errors.

> >   	return IRQ_HANDLED;
> >   }

thanks,

-- 
heikki
