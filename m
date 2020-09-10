Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1472263B2B
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 05:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgIJDDj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 23:03:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:43210 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726440AbgIJDCi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 23:02:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B4FCEB277;
        Thu, 10 Sep 2020 03:02:52 +0000 (UTC)
Message-ID: <1599706954.10822.3.camel@suse.de>
Subject: Re: [PATCH v2] usb: serial: Repair FTDI FT232R bricked eeprom
From:   Oliver Neukum <oneukum@suse.de>
To:     James Hilliard <james.hilliard1@gmail.com>,
        linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, Russ Dill <Russ.Dill@gmail.com>,
        Hector Martin <hector@marcansoft.com>
Date:   Thu, 10 Sep 2020 05:02:34 +0200
In-Reply-To: <20200909193419.2006744-1-james.hilliard1@gmail.com>
References: <20200909193419.2006744-1-james.hilliard1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 09.09.2020, 13:34 -0600 schrieb James Hilliard:
> This patch detects and reverses the effects of the malicious FTDI
> Windows driver version 2.12.00(FTDIgate).

Hi,

this raises questions.
Should we do this unconditionally without asking?
Does this belong into kernel space?

> +static int ftdi_repair_brick(struct usb_serial_port *port)
> +{
> +	struct ftdi_private *priv = usb_get_serial_port_data(port);
> +	int orig_latency;
> +	int rv;
> +	u16 *eeprom_data;
> +	u16 checksum;
> +	int eeprom_size;
> +	int result;
> +
> +	switch (priv->chip_type) {
> +	case FT232RL:
> +		eeprom_size = 0x40;
> +		break;
> +	default:
> +		/* Unsupported for brick repair */
> +		return 0;
> +	}
> +
> +	/* Latency timer needs to be 0x77 to unlock EEPROM programming */
> +	if (priv->latency != 0x77) {
> +		orig_latency = priv->latency;
> +		priv->latency = 0x77;
> +		rv = write_latency_timer(port);
> +		priv->latency = orig_latency;
> +		if (rv < 0)
> +			return -EIO;
> +	}

Do you really want to change this without returning to the original?

	Regards
		Oliver

