Return-Path: <linux-usb+bounces-32856-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKRNIwapeWl/yQEAu9opvQ
	(envelope-from <linux-usb+bounces-32856-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 07:13:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CE29D5C4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 07:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86E08301BC3B
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 06:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210E4337104;
	Wed, 28 Jan 2026 06:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RIoyvAFc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8202E62B4
	for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 06:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580773; cv=none; b=umr0zDcrRSGEv7laZoHxv4uZZ3awalPNgtO8RKdfXI6FcGcbTm5W9w3aPZHLghaYZz64/2ysRN1lwUcg3Bv8f6ygmobeIit1icr677nPn9U+Xrbcvugam8yV4NpQagH7vWY3cY1flnWazzch5nB5NaCbiKfidUx0c42ef4L9OTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580773; c=relaxed/simple;
	bh=YLUHJd0pr/gCbRjHRGDjub5z3iJQrwi+JnrgPOc0y/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoUkHCLQtZ71g4cPxBHDf/uJJDrL+hjStYg9ypUZ39Zp9K5TIDRkMI3BmNMkAFBNhF/3rW2zgIrB9BpV4Osgt6ldbv0eOMiX/Qo2FuuFSgK0jkvj6Pmjv+KhTN34bypOZE9s2yrvOOOzKS9c55VVM6ciRPcf9o/wuBEEzNwYgjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RIoyvAFc; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a7a23f5915so42859045ad.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 22:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769580771; x=1770185571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3WEC8RD1aMs9IUB6uoRFQEPs+F4nQiduogoltfPveY=;
        b=RIoyvAFcKuWcG09cU5sO04zff2J3qDgZ8UuUiZG0G8jmNv/2phjL3Twv7PyD8H+T19
         ThWxC+p1mi3HWpZdvP/3VPsPT7nHgBEk/xbqo82EbJv6jczn1RwQl0Cqv2HAFl04aTwi
         +J8S0tBXuEmqF02SopUZatoltR0j2AxWejJRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769580771; x=1770185571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3WEC8RD1aMs9IUB6uoRFQEPs+F4nQiduogoltfPveY=;
        b=uj1El3SwFVtr3gEUlRDJLrDwyXJOICPH6d2mvk8S5B/Hcrq1BUfw7iHQ+ZdESVIumF
         nvItRkIXdbobIpDbKYe45xPt66yMC965OJA1gOdri+csTLUPxgWDK7fgUQnCWq3HmB3x
         xt7lx9mdJNh31h94+fV4wLmlFe8r+8LCG1zF4HUY6tt0Wk3jAUFVHushQRGBQ2f16aaP
         QzFT5Wqn1IOi5fb20r+gMjdZxCjeGwYNJs33VlBZpGzuPZ2mNAB8P7GWHxxETHwIqqDm
         3+RV/iY1bgXYKIOZfFyNBwv0PctQ5uaPo7sE+yUl6cwc8et+26LlrwcMUusav0v3dfn+
         EUbg==
X-Forwarded-Encrypted: i=1; AJvYcCXUnDYxtOghVwokNyXA2B+kk9Q2IB4PHLg6StVCWFYl37oGyXA0VWnBtw4sXnDy+cIgmwCVPwIT0sc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUBN+0ILQDQD61ouv1lv1TqIDFlMk2gkK+CcGrwBGt5uSYxwY3
	T9/I505sGLJfgafVSxmuumwbLNYp14myfINQzcsy53tTKT0sBDilB7X7AIOSyTJwyQ==
X-Gm-Gg: AZuq6aKuhe2coi6PhYAByRk2Fk73KDfj9tHcGM1NYHtEIRhCAvIT9xvL94q5m/Huq6e
	TKw0DS9XXSH1J2+g6CeEAZyWp2aj6VUi8+D750vd0GY1G3tOFhlIvw71xdzjvJYycvxY7yreQjP
	+XFISDPoADfs5VcoWoOTfMbC8n3e4VlwrdrO1Xf5y4w7NyfHsTccFV+LBQkSLAJYg/xW+kzX4Eu
	WAtCJltCJfDTy+Vmr/Z7lToBhaZ7AHJswKKLMYbnc+YiJP1CVD303WVe2yynPf3Fp833+z8mgQ5
	eel2bv8ipAMI9idygvbXce1aBiIfi9Ynit1EIUFPykoG+yXMRbOt+P1AIAaybJL4QIWGgy2ia5o
	fzGV+rdJWMYHsDNaC/99alxrcNmdR9qzGW3rhx/IqI4POKJf47vNIC7HTkm5g/Z2ZnvOM5f4fpr
	jEVllBLvMTcz16KCOqJhqgshDK2ok1uZoGmLvepD5l/AfSa8cOEA==
X-Received: by 2002:a17:903:384c:b0:29b:e512:752e with SMTP id d9443c01a7336-2a870dedf9cmr49345775ad.47.1769580770701;
        Tue, 27 Jan 2026 22:12:50 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:bf24:413d:1e8a:6aa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6efc1bsm11206955ad.74.2026.01.27.22.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 22:12:49 -0800 (PST)
Date: Wed, 28 Jan 2026 15:12:46 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Realtek linux nic maintainers <nic_swsd@realtek.com>, 
	Takashi Iwai <tiwai@suse.de>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: net: usb: r8152: resume-reset deadlock
Message-ID: <fnvkmao3cfavr6gijb53h77wtk2nixjjhczx5wxnu7baypbdmg@elrzevwou7dd>
References: <a4pjgee3vncuqw5364ajocuipnfudkjnguwmmvjzz3ee3yjxzs@zxldhr5x7dkk>
 <13903eae-7a61-44d6-8e54-1d3f85799f58@redhat.com>
 <whsdw44eikzzbzgzobfxxnbt2yibsqbm6o2dhrgmrbvr5srmkr@ic5em5ck5mcz>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <whsdw44eikzzbzgzobfxxnbt2yibsqbm6o2dhrgmrbvr5srmkr@ic5em5ck5mcz>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32856-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim]
X-Rspamd-Queue-Id: E3CE29D5C4
X-Rspamd-Action: no action

On (26/01/28 14:58), Sergey Senozhatsky wrote:
> Something like this?
> 
> ---
> 
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 30f937527cd2..0a570b8ac7dd 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -8542,14 +8542,9 @@ static int rtl8152_system_resume(struct r8152 *tp)
>  	 * reset. This is important because the usb_lock_device_for_reset()
>  	 * that happens as a result of usb_queue_reset_device() will silently
>  	 * fail if the device was suspended or if too much time passed.
> -	 *
> -	 * NOTE: The device is locked here so we can directly do the reset.
> -	 * We don't need usb_lock_device_for_reset() because that's just a
> -	 * wrapper over device_lock() and device_resume() (which calls us)
> -	 * does that for us.
>  	 */
>  	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
> -		usb_reset_device(tp->udev);
> +		return -ENODEV;
>  
>  	return 0;
>  }
> @@ -8674,6 +8669,14 @@ static int rtl8152_resume(struct usb_interface *intf)
>  
>  	mutex_unlock(&tp->control);
>  
> +	/*
> +	 * This only happens for !SELECTIVE_SUSPEND and RTL8152_INACCESSIBLE,
> +	 * drop tp->control, because reset path can re-acquire it (e.g. for
> +	 * MAC address/policy update).
> +	 */
> +	if (ret == -ENODEV)
> +		ret = usb_reset_device(tp->udev);
> +
>  	return ret;
>  }

Sorry, sent it too early.  Something like instead perhaps:

---

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 30f937527cd2..c9406b89bb12 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -8538,20 +8538,18 @@ static int rtl8152_system_resume(struct r8152 *tp)
 		usb_submit_urb(tp->intr_urb, GFP_NOIO);
 	}
 
+	if (!test_bit(RTL8152_INACCESSIBLE, &tp->flags))
+		return 0;
+
 	/* If the device is RTL8152_INACCESSIBLE here then we should do a
 	 * reset. This is important because the usb_lock_device_for_reset()
 	 * that happens as a result of usb_queue_reset_device() will silently
 	 * fail if the device was suspended or if too much time passed.
-	 *
-	 * NOTE: The device is locked here so we can directly do the reset.
-	 * We don't need usb_lock_device_for_reset() because that's just a
-	 * wrapper over device_lock() and device_resume() (which calls us)
-	 * does that for us.
 	 */
-	if (test_bit(RTL8152_INACCESSIBLE, &tp->flags))
-		usb_reset_device(tp->udev);
+	if (test_bit(SELECTIVE_SUSPEND, &tp->flags))
+		return usb_reset_device(tp->udev);
 
-	return 0;
+	return -ENODEV;
 }
 
 static int rtl8152_runtime_suspend(struct r8152 *tp)
@@ -8674,6 +8672,14 @@ static int rtl8152_resume(struct usb_interface *intf)
 
 	mutex_unlock(&tp->control);
 
+	/*
+	 * This only happens for !SELECTIVE_SUSPEND and RTL8152_INACCESSIBLE,
+	 * drop tp->control, becuase reset can re-acquire it (e.g. from
+	 * max address reset)
+	 */
+	if (ret == -ENODEV)
+		ret = usb_reset_device(tp->udev);
+
 	return ret;
 }

