Return-Path: <linux-usb+bounces-31663-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF3ACD482D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 02:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B35DA3002FEA
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 01:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF6E223DE7;
	Mon, 22 Dec 2025 01:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m48loExu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B2728373
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 01:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766367235; cv=none; b=MEn+qeTQ0xGOQS/4nF+3tT4Ymy6s+XqA3MBz8i+c6a5XiG4NdObBr7uL8rHlnE+Lwz2onuZQ+L4Rpk+gfhxAIxsCfP49kG0WTLSs4Ve+Cm6syyUTwzEP4JXwZ6dTgLcBXcb54TXelqeLSiTH/LBM7AXJ0GsEfAoi1ErQnpG64ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766367235; c=relaxed/simple;
	bh=T0unAYCmUf1rha66q0lhkxDRSVgeBn54NoWMfKr1nEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouq+IlST42mu36o7SHkF//LmlPrtMn+WYsmTgMmQjiQzEhKF7wcsWowpTiH/Ct8BGJ9Uw/+xR58vzEK46x9ZVeTCuAOENoJ/Yj5mUArCs9plIiyD1XlDaS9s99EtasWAZy5kYGzP7/BiWC4fUTO4MbF+/g2XaF4ujQq618BV4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m48loExu; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0a95200e8so31926915ad.0
        for <linux-usb@vger.kernel.org>; Sun, 21 Dec 2025 17:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766367232; x=1766972032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W5QFzfCMCqtrEImO8mNgaw0luE7vn8+ZfvMTGI7/aeA=;
        b=m48loExuIQqnPih6crphJSUiycCZlF9KzqyEruWSQGSwwIXUauL6i0v3uSMBovkKbd
         is91JUdVqTeMzBbqhR9AXrUEhrZHBSxXygiejUwOAmVK2rCZDCvc99tkXzVgKbKo8Aeo
         s4yzt3AvWjRQZt4w5cfsyR72LBO38wY5guB8w6HedsgzfVCEdNvBv2VL9hNK4u4u/8bf
         eKzER9JnoCBIV6VbCFykcXFtTNRO3XWvRHJGtEx8zLGaAb74aX1PQ5iA0p7KRYGpjG2D
         0mVXIR8Gdr5Ees94JETQgAbOu0znASTz6Gq/brxzv2a3dKCoE5XQAaf4boRKzvEUIFBM
         OluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766367232; x=1766972032;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5QFzfCMCqtrEImO8mNgaw0luE7vn8+ZfvMTGI7/aeA=;
        b=BllwRI+uJa10Xmspwx6zsp+1UT/I9o/3/uK08y/1pCaCYmd5W/jEBnkGxRgGuINmu3
         YCcEntSmDbauEyLCVPzMV1qS0AmXkR1MNeg3cCPmEZUyWqIdmA4JWB2f1LLJTlE+G4S4
         a6faFVNN3l0uhC7adMwg15iPNmOtn0Ec9jtZ49dDxwlIZzCr+f77Gt4G8R8JNV2iT/m3
         YXdccbFUIFxQuuESPBaE4d1GbNve2bjASXHSyC2UNzuP5+WjGkBctL2A6p8+GbOSBkzI
         85nsoSaj5zntSMIXSmOciHFtveUU6XIsnWQ06CVQNgdGIwZUdb9CZSknzyzKQFqrB7zf
         swLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqhKZvl3GoiNxe8JDxE8cIkmGTvxu4G5G9HawrHFQlAxGsQ1hfsk3cPNTXnXnlV9BjyKcJDZkLncw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBQyx8leC+wSgt4OseDBa8l3JI/1GHBRL3PdNVZVRwLRJjzG2
	um4kWEG/gN/Ism0+HmrvYzZWo24AwyZSbqyqvptvZ5Iy1UJkNh65GFUL
X-Gm-Gg: AY/fxX6ZPG10R6/xM/1EDe/5Z4ZyGnReNi4aIkdur3im7+x0ubsy7HhTUAtL9dXbY6r
	clO3c9tzcLbg2MBny6vpjhtRcfapMZqY0+89w6RlS5hdrXsylK2LIYqJaduVn6X3QhXaa9stfsu
	rIdNWuxT+a/Vf/XK+tlir56nVQIbZF6SMOhFe/yEkVM38drc9y0hdvZK6IYPpFpdKYGOJuOkc5I
	Axq7DUdLrDwGf8rtGSnkO7QzMZFHQB688vjEzbxd8A6djwBPhXi382SlsJqTcYyl/QSe2tcAvs7
	Ia3n6mKYlrybb1h0/70+ZVlm4Mz9CePPov1DrtAur2LAXgp9JiCR8M5/Ln+a0JopSsn4z3kHjRi
	h59M+X+2QqvIyszSdZiwdaaGSR0W9a/7croGutYTqDfw8jfswh8W+3CHVLR98XbrQIsYwIxe1XX
	pFIE/t3UAC53kzTu1VhesayLC/lOAUAZMMBim4xUHQbAM0XkPh0dk=
X-Google-Smtp-Source: AGHT+IH7exWhREro5NxI6Xas5KdaG+SnaR9DWbhtXrRPRhpzgU/mIheBXw6Z6/9A8t5H8BReLtaXvA==
X-Received: by 2002:a05:6a21:99a8:b0:35e:e604:f766 with SMTP id adf61e73a8af0-376a74f30a2mr8917108637.6.1766367232438;
        Sun, 21 Dec 2025 17:33:52 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7961fbb9sm7458578a12.2.2025.12.21.17.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 17:33:51 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
Date: Mon, 22 Dec 2025 09:33:48 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sanath.S@amd.com, "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH] [RFC] thunderbolt: Add delay for Dell U2725QE link width
Message-ID: <wqc6xvaeebqb5skiba3gpekdpmf3yz2zk3maeqprdtdpglvhww@za2efpacwhzo>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Andreas Noever <andreas.noever@gmail.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sanath.S@amd.com, "Lin, Wayne" <Wayne.Lin@amd.com>
References: <coxrm5gishdztghznuvzafg2pbdk4qk3ttbkbq7t5whsfv2lk5@3gqepcs6h4uc>
 <20251212123941.GK2275908@black.igk.intel.com>
 <484ff606-ec10-477c-acfe-d4d781e2873d@amd.com>
 <CAFv23Q=bLCif750y8eDEP4J+KwVy8CknZawYOGZWWrBSiE8FNA@mail.gmail.com>
 <20251217125507.GR2275908@black.igk.intel.com>
 <5d7f2661-f02b-4985-b438-196b48c10237@amd.com>
 <CAFv23QknLmZkC9Fc0FTFKCofngRUQipw4hGVG_P2k+TUb=KOeA@mail.gmail.com>
 <20251218072125.GU2275908@black.igk.intel.com>
 <6inne3luvw4ot3wqnsaw3gzhlxtd4756i465oto6so5ox3syxp@kibuv4vhvexx>
 <20251218102021.GV2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218102021.GV2275908@black.igk.intel.com>

On Thu, Dec 18, 2025 at 11:20:21AM +0100, Mika Westerberg wrote:
> On Thu, Dec 18, 2025 at 03:35:05PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > Now since USB 2.x has its own wires in Type-C cable this tells me that
> > > there is some real problem with the connection. Have you tried different
> > > cables already?
> > Here is the log I got with another tbt4 cable.
> > I'm using the kernel with Mario suggests modification.
> > 
> > https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.patched2.2_new_cable.out
> 
> Here I see (assuming I read it right) that the USB 2.x enumerates only
> after the first unplug:
> 
> [   28.589861] usb 3-2: New USB device found, idVendor=1d5c, idProduct=5801, bcdDevice= 1.01
> [   28.589864] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [   28.589865] usb 3-2: Product: USB2.0 Hub
> [   28.589866] usb 3-2: Manufacturer: Fresco Logic, Inc.
From the logs, sometimes this hub is enumerated before the call trace
and then enumerated again after the call trace.

And I also found there are some suspicious USB disconnections while
plugging in the tbt monitor.

I tried to avoid the USB disconnection by the following modification,
but still no luck.

```
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index be50d03034a9..ed3756065568 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5697,6 +5697,22 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
                        /* Don't resuscitate */;
                }
        }
+#ifdef CONFIG_PM
+       /* Handle device with temporarily lost connection */
+       else if (!(portstatus & USB_PORT_STAT_CONNECTION) && udev &&
+                       udev->state != USB_STATE_NOTATTACHED &&
+                       udev->persist_enabled) {
+               /*
+                * If a device with persist enabled temporarily loses connection
+                * during parent hub reconfiguration (e.g., Thunderbolt re-probe),
+                * don't immediately disconnect it. Clear the change bit and
+                * let the hub resume process handle it properly.
+                */
+               dev_dbg(&port_dev->dev, "device (state=%d) lost connection temporarily, not disconnecting\n",
+                               udev->state);
+               status = 0;
+       }
+#endif
        clear_bit(port1, hub->change_bits);

        /* successfully revalidated the connection */
```

Here is the log with the modification.
https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.usb_temporarily_lost_connection.out

> 
> Since Goshen Ridge is pretty stable in Linux I'm kind of suspecting still a
> connection issue rather than SW. Or could be power related too. AFAIK the
> USB 2.x should be rock solid but here it seems not. Are you using active or
> passive cables and do they have the lightning logo?
I can't tell the cable is active or passive, there is a lightning logo
on the both sides of the cable, and also a number "4" on the both sides.

> 
> You could still try to comment out both tb_retimer_scan() calls and see if
> that makes any difference but I doubt since your last log unplug happened
> when we were reading DROM of the second device router not when sidband
> access was done.
I still think it's waiting for something ready, but I don't know what it's
waiting for. Here is the log after applied the 2 seconds sleep.

https://people.canonical.com/~acelan/bugs/tbt_call_trace/intel/merged_6.18.0-d358e5254674+.wa_2_seconds.out

On AMD system, the issue could be reproduced 100% and requires at least
2 seconds to avoid the call trace.
I guess on Intel system the value could be lower, because the
reproduce rate is around 10% ~ 20% on Intel system.


