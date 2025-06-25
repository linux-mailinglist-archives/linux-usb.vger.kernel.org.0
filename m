Return-Path: <linux-usb+bounces-25105-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB0DAE8806
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 17:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80EA41C21609
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E62D283FE5;
	Wed, 25 Jun 2025 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aGSGgzV7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2038D26B748
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 15:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864978; cv=none; b=nY4l5kZhEWznRwORwrBT6dm8KVbLx4i6Bz1jMwgqcxJHqpTcMu0R6KaLml5rcJXst8aZKQIuujx0t0w9AWXGj/PJVHK3xbPDi7lY4rqRDkiRQHat9ush4zViM1u9JsGCwq2TMnkNLdQEZgvW7gHu+Ome8svcPzV7wvAchMoQ1/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864978; c=relaxed/simple;
	bh=j5mgnbJQ5WWT/vsDjSFay0KlwHwDVe8GjN5gCveGRro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OcBd9kJUtC7ThD1VVCAdcqv8RQ5dr2Kcxi4Ro0CrKAQuC53sZDiG3hPJjOHPre1LtNTFkIPqk45m2Y7yI0rYZNGkpczhU9/Nwk8QjHLhiC1ZojkAZ9UhEngu3usr0Htvio0XZ9XFLADCBLo+3JUY7kZWpLClLfN4epHQ8/Fyvxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aGSGgzV7; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-60be827f2b7so645736eaf.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 08:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864976; x=1751469776; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yMJ0KIa8ThNZRQ38Iaz0SXdoOE4jU5SACxNa3HsV1s=;
        b=aGSGgzV72KI7nzfA4OM/DM7/3LhOsfcqqUCzWQ6/UZkXZ0eWuECxo2mT8bWJRDlYeI
         HW6eDG7tosc3k6Y9sX2bxo/TqVrObtpXpFdbUv158TZwbVe8PeHQ1sMXC4FLQl8ig9f/
         vJ5OjE2xCzwq/J92QhBCX9Z1qU9v6y692Nj6rDO3Dotuaw4gdFB+mW4p51RB/6/SMNy7
         OpEgbyA7Bxnxt9CYDRk3T4bIAWzc7Yla2LgPWj0l39UbbCa1L89r6la6s1Hmjc+kk9wR
         N+KbEQyJTyo7KKqOLq32Gfmw77IQT3bGZL/W9loYvwtnI38P18+rih8nPg480TPPJy6C
         r4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864976; x=1751469776;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yMJ0KIa8ThNZRQ38Iaz0SXdoOE4jU5SACxNa3HsV1s=;
        b=MgEh942t0HBvXR7SyO5CL9zi1hBhAqthxOCPED5RteDOWzW+f/CebzyYxraCUCMemF
         BbD1MgH007O3p9yYLgYZuKiAM69NtyqyybajIGl9ry8C5y6tfDzAllSpdLWITNzQfxd5
         NyfEm5BFS5saHAEwA170FrUVBPFOZHZdfaYWU+kWzEm/uaucE+Atfjw9WIgYWQroRpnl
         UvVNqbMbDsexminhyBYehkTW+KQruvMyMjVaVQ4soS5DuTW8A7YZhBg0Hb+vVfxuRQ0M
         VaBuxolA+qr6huaV14BvKUgn9T2OtFACFUXCbR2viLdLBq61BkUbqoSdZJuk6qAB/OYO
         VzuA==
X-Gm-Message-State: AOJu0Yw07ttrKjdLHdb+7ZRAUxrQKmf+z4eQPTtbOSrLoY5QzFddeXM0
	d2uIEBtqA+DCFknzc633VeHEb7Vguv6aCNfpZYIVhadqBZSAuwiTHBc8uPnpq2WuoE5xSdeI0kg
	kw6tN
X-Gm-Gg: ASbGnctp/NBoIdD9mN/Z4lt3HF2qa9Z/pV6csillq5k4UX7LlmyH9Ody1RpDyYjGXUy
	tXFpSlYLATfDKOdllxDMoFH6o6ptwdgSrSLxfVM83cv2FQEARTbxeORRw2Tz3NDrCBgQnenRP5I
	4mWe84eAlRjVEPh5paA84C+BiAjA677jcqrg67m/nrlQesv91Ut5PEQ6Bc32Bcz2D3IFHbIXoiM
	7En1FT+5he+hHE+jXr6TXgbHluMj0rfqT13fmN4PidnydIgeSdwCOhqlDf1KicTx5ABANYgutqc
	lR00UBMepHGY9j0HE8SUXvXjhXZ3D2Tkju8dppLHWB+yQkV911r+EW4MYdKS5YI9hOXskw==
X-Google-Smtp-Source: AGHT+IEF3n7svWoo/6cym981fv/4pwR+Nsj4ssNw+U8KDgTbCFTRtTJPcJe14HCwDvRiLNFfrQWb3Q==
X-Received: by 2002:a05:6808:4f65:b0:407:9a0a:3f54 with SMTP id 5614622812f47-40af3e4e452mr6160364b6e.14.1750864976241;
        Wed, 25 Jun 2025 08:22:56 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6c4cdccsm2199612b6e.22.2025.06.25.08.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:55 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:54 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: o.rempel@pengutronix.de
Cc: linux-usb@vger.kernel.org
Subject: [bug report] net: usb: lan78xx: Convert to PHYLINK for improved PHY
 and MAC management
Message-ID: <162f8d6d-b2ff-4ad4-96ad-5477a1bb4217@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Oleksij Rempel,

The patch e110bc825897: "net: usb: lan78xx: Convert to PHYLINK for
improved PHY and MAC management" from Jun 18, 2025, leads to the
following static checker warning:

    drivers/net/usb/lan78xx.c:2851 lan78xx_phy_init()
    error: we previously assumed 'phydev' could be null (see line 2839)

drivers/net/usb/lan78xx.c
    2817 static int lan78xx_phy_init(struct lan78xx_net *dev)
    2818 {
    2819 	struct phy_device *phydev;
    2820 	int ret;
    2821 
    2822 	phydev = lan78xx_get_phy(dev);
    2823 	/* phydev can be NULL if no PHY is found and the chip is LAN7801,

Assume phydev is NULL

    2824 	 * which will use a fixed link later.
    2825 	 * If an  error occurs, return the error code immediately.
    2826 	 */
    2827 	if (IS_ERR(phydev))
    2828 		return PTR_ERR(phydev);
    2829 
    2830 	ret = lan78xx_phylink_setup(dev);
    2831 	if (ret < 0)
    2832 		return ret;
    2833 
    2834 	/* If no PHY is found, set up a fixed link. It is very specific to
    2835 	 * the LAN7801 and is used in special cases like EVB-KSZ9897-1 where
    2836 	 * LAN7801 acts as a USB-to-Ethernet interface to a switch without
    2837 	 * a visible PHY.
    2838 	 */
    2839 	if (!phydev) {
    2840 		ret = lan78xx_set_fixed_link(dev);
    2841 		if (ret < 0)
    2842 			goto phylink_uninit;
    2843 	}
    2844 
    2845 	ret = lan78xx_mac_prepare_for_phy(dev);
    2846 	if (ret < 0)
    2847 		goto phylink_uninit;
    2848 
    2849 	/* if phyirq is not set, use polling mode in phylib */
    2850 	if (dev->domain_data.phyirq > 0)
--> 2851 		phydev->irq = dev->domain_data.phyirq;
    2852 	else
    2853 		phydev->irq = PHY_POLL;
    2854 	netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);

Then this block will crash.

    2855 
    2856 	ret = phylink_connect_phy(dev->phylink, phydev);
    2857 	if (ret) {
    2858 		netdev_err(dev->net, "can't attach PHY to %s, error %pe\n",
    2859 			   dev->mdiobus->id, ERR_PTR(ret));
    2860 		goto phylink_uninit;
    2861 	}
    2862 
    2863 	ret = lan78xx_configure_leds_from_dt(dev, phydev);
    2864 	if (ret < 0)
    2865 		goto phylink_uninit;
    2866 
    2867 	return 0;
    2868 
    2869 phylink_uninit:
    2870 	lan78xx_phy_uninit(dev);
    2871 
    2872 	return ret;
    2873 }

regards,
dan carpenter

