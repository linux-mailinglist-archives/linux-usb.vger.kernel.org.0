Return-Path: <linux-usb+bounces-37829-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEFgBGjADmrXBwYAu9opvQ
	(envelope-from <linux-usb+bounces-37829-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:20:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FD85A0EFF
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47F6030C188A
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 08:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1323D3A451C;
	Thu, 21 May 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPdUORPw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56E3A254A
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 08:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779351246; cv=none; b=bSdjZ1yMluCidqQ8MGIzsHgKg3lKsxhyrEm0o+CCfq6o6uzkpWqfEYne/Eb1+reZo5EGrwuhCu7Xuwmr+P13FkFCpJGCseQzr+6YLLeQgG4fJQMhw8zR4vkJs6qi0SfT2ITbe10fO6eUW1rTBI0nqMqMG24eqNNl/vqLYFpPXb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779351246; c=relaxed/simple;
	bh=YPz9Y7+DAcu/8VR5VxDC4TyzYcsWl2JqM0bjciNfHYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LZAPO+4m8fq6xnTrX6MEUoyASkUOvj97ZFX23Uyx7nmkPND9iWA6H7K3sMqVrMuaLDjqeSTSLN5qXs3nplqjopbbQDVnul4gO5OEQHEBCugnGpxSMEVz6AndBLg9trvMRG2ZUmByDtpjbwJ8L/6ifTolov4bWslHRu6Kjgv2PJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPdUORPw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so82485085e9.2
        for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 01:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779351242; x=1779956042; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XU27S8OkZVDk3+ckJS86aE+G8KWihq6r/BLmRcxGSd4=;
        b=HPdUORPwnUIDPNuk1Dr/bD5rjV2u7Zlm6cpDNdpmOn6ebBOlD6eejdfKcykapJN9fz
         NCHxyh31d2HC2eNEkj1LQGd5rwWYubWNuxI1lhndDIeCTaA3/+FuoLnYXJ7D4zcXcA7t
         pA0RmCpa1GHh91uf+1uwLyBw7O5IC8RdudwA6AkZfxv1HTtoHCIqY4wFfcBinyIUffQz
         wP0GBupGwCUA+xh2BPAE6+KMtAKiBRO4VYYckfDuRWR+GVDFThlQ4PSe1WI17XMZMBN0
         t43G26B3756batk0NHRMKBxmXliQ9KNCS4w+2m/s9tXuVZXehSYNYkROBdi8BvdMUCry
         F8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779351242; x=1779956042;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XU27S8OkZVDk3+ckJS86aE+G8KWihq6r/BLmRcxGSd4=;
        b=LcMMBhcCPjE0dn0FxT1B7T0fIC6Fw/y4OOABv3JNrxOenvd2LxbIQDYChc8dju9PFD
         JUSwsvPZYuzxBVGtl7+fgtDhZG0xeepSU6yggoerU8qlTxnefd3nq1WiIZU+hG6tz2m3
         t1rwDcQue5ceMjrlNk426CZMrX4HKVD1i8t99Snmq3WY7U9EZy9G7xNIWI1lOcXqNH2q
         r/GsOoKCfvSLzRYIernhHdufgyfJS4SyBA+8QJ9qPoTdt/GdEYgD9xpl/bi7cWXltEc/
         RX1frhoWxLsEkZlneYCdUu8/rroSiuc0VSjDzBlIMgYIo07OeqimLv8zhpMBvgY2HZEv
         P0gA==
X-Gm-Message-State: AOJu0Yy5rAYls1Uv22ZSJs8tzJSRgjEqHVvFxFaMmPgO6TN+k0tXz138
	erpB2d5rQMPsonCKzlfP8cobPMugyRoTg+3MKwe3wAGyuff3wCJ1yn0xwqSoWg==
X-Gm-Gg: Acq92OEVoxqZKOMaU5QViBpzAeRtbe8uYULQXpslt32EIVdDPpB9uTgsxNADB/zSiUv
	LFWS28hHvovIRpR1fubLhjDGx8OY2yY8LqTyv0fExjX8ZghUoVQNsj4VDSaWnND4KVx5/FxQFfB
	JYe2UXx2AdMufyiyTtL1vGYg7yTaC8tz+aNctqV7vcfpuDN+lqls7LQAdlLLTh8dihMHveGVtX6
	BvnV3SZxHwpRRK9UxHMj7UVZ7ir5lTymGZC33gb1rNmNXMueRIH8xOCfxv3XOOdR+DoQ+zSQuah
	4sjGODDHA3/8cQcqF4VN8us7qGMXlN4vRDLMCqzUZ9ycFYuE6ogTAFrNGrFWQrimEmoovU7R/kw
	xB9Hij5m/6pCOz9CtfxwjWF7QMve95CK6v/xBUrwK0EZq8Nha0PT1KuXn4aZsU672Gmufqf+IYX
	Vx457LDSVpq/QPOgr7637ejwc=
X-Received: by 2002:a05:600c:a15:b0:490:3cef:bd90 with SMTP id 5b1f17b1804b1-4903cefbe6emr4606245e9.26.1779351241558;
        Thu, 21 May 2026 01:14:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c42152sm10596325e9.9.2026.05.21.01.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:14:00 -0700 (PDT)
Date: Thu, 21 May 2026 11:13:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-usb@vger.kernel.org
Subject: [bug report] usb: udc: pxa: remove unused platform_data
Message-ID: <ag6-xhfFjb5NpXQz@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37829-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 66FD85A0EFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Arnd Bergmann,

Commit 25bd55f46032 ("usb: udc: pxa: remove unused platform_data")
from Apr 27, 2026 (linux-next), leads to the following Smatch static
checker warning:

	drivers/usb/gadget/udc/pxa27x_udc.c:2398 pxa_udc_probe()
	warn: 'udc->gpiod' is not an error pointer

drivers/usb/gadget/udc/pxa27x_udc.c
    2372 static int pxa_udc_probe(struct platform_device *pdev)
    2373 {
    2374         struct pxa_udc *udc = &memory;
    2375         int retval = 0;
    2376 
    2377         udc->gpiod = devm_gpiod_get(&pdev->dev, NULL, GPIOD_ASIS);
    2378         if (IS_ERR(udc->gpiod))
    2379                 return PTR_ERR(udc->gpiod);

The error handling moved to here.

    2380 
    2381         udc->regs = devm_platform_ioremap_resource(pdev, 0);
    2382         if (IS_ERR(udc->regs))
    2383                 return PTR_ERR(udc->regs);
    2384         udc->irq = platform_get_irq(pdev, 0);
    2385         if (udc->irq < 0)
    2386                 return udc->irq;
    2387 
    2388         udc->dev = &pdev->dev;
    2389         if (of_have_populated_dt()) {
    2390                 udc->transceiver =
    2391                         devm_usb_get_phy_by_phandle(udc->dev, "phys", 0);
    2392                 if (IS_ERR(udc->transceiver))
    2393                         return PTR_ERR(udc->transceiver);
    2394         } else {
    2395                 udc->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
    2396         }
    2397 
--> 2398         if (IS_ERR(udc->gpiod)) {
    2399                 dev_err(&pdev->dev, "Couldn't find or request D+ gpio : %ld\n",
    2400                         PTR_ERR(udc->gpiod));
    2401                 return PTR_ERR(udc->gpiod);
    2402         }

This is dead code.

    2403         if (udc->gpiod)
    2404                 gpiod_direction_output(udc->gpiod, 0);

The comments say udc->gpiod can't be NULL either.  Was
devm_gpiod_get_optional() intended?

    2405 
    2406         udc->clk = devm_clk_get(&pdev->dev, NULL);
    2407         if (IS_ERR(udc->clk))
    2408                 return PTR_ERR(udc->clk);
    2409 
    2410         retval = clk_prepare(udc->clk);
    2411         if (retval)
    2412                 return retval;

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

