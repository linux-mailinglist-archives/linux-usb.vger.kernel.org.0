Return-Path: <linux-usb+bounces-25118-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E545AE9BB4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 12:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D55C07BBBE3
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 10:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976F420E031;
	Thu, 26 Jun 2025 10:39:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2E816A94A
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934375; cv=none; b=GsWKaNwxWJ4gMADSQUBRwKgL6hvh2pcDOqcWIxa+WCLOigPgJy6aaAgns8q9w46yiLHAboF5qg/ERwxRguGMqCqtUROfFu/tSy7X4uJfVgO0t94fO5nadnTYmEYs59HB7I18Je2tleQhLDOVHyCcojc6jz59CkIlLAJK9ZcVb3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934375; c=relaxed/simple;
	bh=bImG1xdoz4PObOY1+0JSEfPyFhJ8Ll22tTHDNdOE3n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlrB2zPzPwYFrvOAomPBI8UoZL+8CVrViAHuND+n32VLcNZGdy+ARFTThQ3wyijT48DwZ6a7OLeqazT9Qc41o5BsCixsq1jxumdTYieE/OrT7PD0bbkmm55+IzFX2nPuvb1nhYqSmh+oSU7KWNvJFAVMX0tDrv2wwOQ1/SnVWLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uUk0y-0005ST-Ao; Thu, 26 Jun 2025 12:39:32 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uUk0y-005Qu8-0Q;
	Thu, 26 Jun 2025 12:39:32 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uUk0y-001YGV-05;
	Thu, 26 Jun 2025 12:39:32 +0200
Date: Thu, 26 Jun 2025 12:39:31 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: [bug report] net: usb: lan78xx: Convert to PHYLINK for improved
 PHY and MAC management
Message-ID: <aF0jY8gUPgYDSyew@pengutronix.de>
References: <162f8d6d-b2ff-4ad4-96ad-5477a1bb4217@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <162f8d6d-b2ff-4ad4-96ad-5477a1bb4217@sabinyo.mountain>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On Wed, Jun 25, 2025 at 10:22:54AM -0500, Dan Carpenter wrote:
> Hello Oleksij Rempel,
> 
> The patch e110bc825897: "net: usb: lan78xx: Convert to PHYLINK for
> improved PHY and MAC management" from Jun 18, 2025, leads to the
> following static checker warning:
> 
>     drivers/net/usb/lan78xx.c:2851 lan78xx_phy_init()
>     error: we previously assumed 'phydev' could be null (see line 2839)
> 
> drivers/net/usb/lan78xx.c
>     2817 static int lan78xx_phy_init(struct lan78xx_net *dev)
>     2818 {
>     2819 	struct phy_device *phydev;
>     2820 	int ret;
>     2821 
>     2822 	phydev = lan78xx_get_phy(dev);
>     2823 	/* phydev can be NULL if no PHY is found and the chip is LAN7801,
> 
> Assume phydev is NULL
> 
>     2824 	 * which will use a fixed link later.
>     2825 	 * If an  error occurs, return the error code immediately.
>     2826 	 */
>     2827 	if (IS_ERR(phydev))
>     2828 		return PTR_ERR(phydev);
>     2829 
>     2830 	ret = lan78xx_phylink_setup(dev);
>     2831 	if (ret < 0)
>     2832 		return ret;
>     2833 
>     2834 	/* If no PHY is found, set up a fixed link. It is very specific to
>     2835 	 * the LAN7801 and is used in special cases like EVB-KSZ9897-1 where
>     2836 	 * LAN7801 acts as a USB-to-Ethernet interface to a switch without
>     2837 	 * a visible PHY.
>     2838 	 */
>     2839 	if (!phydev) {
>     2840 		ret = lan78xx_set_fixed_link(dev);
>     2841 		if (ret < 0)
>     2842 			goto phylink_uninit;
>     2843 	}
>     2844 
>     2845 	ret = lan78xx_mac_prepare_for_phy(dev);
>     2846 	if (ret < 0)
>     2847 		goto phylink_uninit;
>     2848 
>     2849 	/* if phyirq is not set, use polling mode in phylib */
>     2850 	if (dev->domain_data.phyirq > 0)
> --> 2851 		phydev->irq = dev->domain_data.phyirq;
>     2852 	else
>     2853 		phydev->irq = PHY_POLL;
>     2854 	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
> 
> Then this block will crash.

Thank you for the bug report!

Here is the fix:
https://lore.kernel.org/all/20250626103731.3986545-1-o.rempel@pengutronix.de

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

