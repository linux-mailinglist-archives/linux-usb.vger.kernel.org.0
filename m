Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E48EDB43
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 10:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbfKDJHS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 04:07:18 -0500
Received: from mga11.intel.com ([192.55.52.93]:19173 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbfKDJHS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 04:07:18 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 01:07:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,266,1569308400"; 
   d="scan'208";a="212272833"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 04 Nov 2019 01:07:15 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 04 Nov 2019 11:07:15 +0200
Date:   Mon, 4 Nov 2019 11:07:15 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 12/18] usb: typec: ucsi: acpi: Move to the new API
Message-ID: <20191104090715.GB29493@kuha.fi.intel.com>
References: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
 <20191025082324.75731-13-heikki.krogerus@linux.intel.com>
 <d40c258c-790a-2412-94f2-c664a11eade2@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d40c258c-790a-2412-94f2-c664a11eade2@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sat, Nov 02, 2019 at 09:31:29AM -0700, Guenter Roeck wrote:
> > -static int ucsi_acpi_cmd(struct ucsi_ppm *ppm, struct ucsi_control *ctrl)
> > +static int ucsi_acpi_read(struct ucsi *ucsi, unsigned int offset,
> > +			  void *val, size_t val_len)
> >   {
> > -	struct ucsi_acpi *ua = container_of(ppm, struct ucsi_acpi, ppm);
> > +	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
> > +	int ret;
> > +
> > +	ret = ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> > +	if (ret)
> > +		return ret;
> > +
> > +	memcpy(val, (const void __force *)(ua->base + offset), val_len);
> > +
> 
> Would it be better to use memcpy_fromio() and memcpy_toio() if
> ua->base indeed points to iomem ?

No, it's not really iomem. It's just supplied to the driver as such.

thanks,

-- 
heikki
