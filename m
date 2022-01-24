Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C100498537
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 17:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243923AbiAXQt7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 11:49:59 -0500
Received: from disco-boy.misterjones.org ([51.254.78.96]:34164 "EHLO
        disco-boy.misterjones.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243940AbiAXQtq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jan 2022 11:49:46 -0500
X-Greylist: delayed 1374 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 Jan 2022 11:49:45 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=misterjones.org; s=dkim20211231; h=Content-Transfer-Encoding:Content-Type:
        Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pQW1M27ED2rhteihxSShn2MlqgDybZWuzPBp6rnfjyY=; b=rdnKVvPj0jPK5Sn4loaIFZ7vsP
        h+xhgfSNuzDvgC/QqacA/CLX76Pde0s8T8AEYnIaWrB2vwco7Ayxx8iqoUAggTWJhjqOsgV6aDyQQ
        5tEBxJeMmupxWD9Al0PlGx+uhRYPR9mqxr+XYHhPhYfantjseE2/yrJKb/n2NmLSlFsgPWZkmUNll
        dT1h2SH8l/aYbF0CjlM28x6i7/RWV4MwTzBoXfqu4bm/n/ghgm1PR0NBWhLae4X0k0x4Ev+4/Cb1g
        ycxnwEiR4VRW4rjg9pTghQDvEhR2ZF3L+q/ZEm0EcS1UHFG2YPHmbTpNFRCawEjsJoqwPSUMsIZbf
        zkL/ZGEg==;
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@misterjones.org>)
        id 1nC2B6-002SO0-Sf; Mon, 24 Jan 2022 16:26:48 +0000
MIME-Version: 1.0
Date:   Mon, 24 Jan 2022 16:26:48 +0000
From:   Marc Zyngier <maz@misterjones.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?UTF-8?Q?Robert_=C5=9Awi=C4=99cki?= <robert@swiecki.net>,
        Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: Re: [PATCH 1/2] usb: typec: Only attempt to link USB ports if there
 is fwnode
In-Reply-To: <20220124090228.41396-2-heikki.krogerus@linux.intel.com>
References: <20220124090228.41396-1-heikki.krogerus@linux.intel.com>
 <20220124090228.41396-2-heikki.krogerus@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <fc2ed8eace5a5d6f42b6e45b38d79bb6@misterjones.org>
X-Sender: maz@misterjones.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robert@swiecki.net, mikhail.v.gavrilov@gmail.com
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2022-01-24 09:02, Heikki Krogerus wrote:
> The code that creates the links to the USB ports attached to
> a connector inside the system assumed that the ACPI nodes
> (fwnodes) always exist for the connectors, but it can not do
> that.
> 
> There is no guarantee that every USB Type-C connector has
> ACPI device node representing it in the ACPI tables, and
> even if there are the nodes in the ACPI tables, the _STA
> method in those nodes may still return 0 (which means the
> device does not exist from ACPI PoW).
> 
> This fixes NULL pointer dereference that happens if the
> nodes are missing.
> 
> Reported-and-tested-by: Robert Święcki <robert@swiecki.net>
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Fixes: 730b49aac426 ("usb: typec: port-mapper: Convert to the
> component framework")
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/typec/port-mapper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/port-mapper.c 
> b/drivers/usb/typec/port-mapper.c
> index 07d307418b470..b6e0c6acc628c 100644
> --- a/drivers/usb/typec/port-mapper.c
> +++ b/drivers/usb/typec/port-mapper.c
> @@ -56,6 +56,9 @@ int typec_link_ports(struct typec_port *con)
>  {
>  	struct each_port_arg arg = { .port = con, .match = NULL };
> 
> +	if (!has_acpi_companion(&con->dev))
> +		return 0;
> +
>  	bus_for_each_dev(&acpi_bus_type, NULL, &arg, typec_port_match);
> 
>  	/*
> @@ -74,5 +77,6 @@ int typec_link_ports(struct typec_port *con)
> 
>  void typec_unlink_ports(struct typec_port *con)
>  {
> -	component_master_del(&con->dev, &typec_aggregate_ops);
> +	if (has_acpi_companion(&con->dev))
> +		component_master_del(&con->dev, &typec_aggregate_ops);
>  }

This fixes an ugly Oops on the Apple M1. So FWIW:

Acked-by: Marc Zyngier <maz@kernel.org>
Tested-by: Marc Zyngier <maz@kernel.org>

         M.
-- 
Who you jivin' with that Cosmik Debris?
