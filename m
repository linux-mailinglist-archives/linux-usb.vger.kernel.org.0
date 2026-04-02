Return-Path: <linux-usb+bounces-35911-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJHzMaq9zmmTpgYAu9opvQ
	(envelope-from <linux-usb+bounces-35911-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 21:04:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1CF38D889
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 21:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CEEA30701DE
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 18:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685E135CB6E;
	Thu,  2 Apr 2026 18:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TAr3PanS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED1B207DF7
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 18:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775156211; cv=none; b=KRbDvrjymMkcXNFI5YDg1YYpFMxIpZWeJl/D0y9sAhhW4nZKWrXr430pXmYRXZo+5+xVJM4QNtrCGk3iNbYUjl7jDMSjf2/6u0Zi1yM2RsVP2P7VqP3Vb2T9Qpxntzz92izT2vND0ZrT2JblHdT+j/lqr6wVASG9Th5UFQONKsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775156211; c=relaxed/simple;
	bh=GR/HDV3hC/Ih5gBR61ldxTjEJqaFC4QFcCNuYrGfEsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXEFajbSuFCn9W6NB7nDTDQvGoaifjhY7A7evbsN8XfILPyLFknXm93v+hyszR1fjxxHoQSjiKexA1xQ/f9HIDi6lff+yLViVHGGl3RhWrveMFiBPZ69kWfB6/KuSi34SraaKptwU7hUdoaWs2K9Hih0OIPedNxCxoMFGfIY4EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TAr3PanS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so12411915e9.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 11:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775156208; x=1775761008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0m9bXJvgrALKJ9p3Q2n22qDrsxN14oouyQEW4vfGf5E=;
        b=TAr3PanSUJrTEjcVRr0niPVcvaLIyvG2QS/w+aO9E3vyP4q7f1gHTf89qlrZEhdSju
         6DGJB0clgWs01mCoh75RK0KEeY8HhrdrAM4IOAJ1rOZ7Y8PT9/MxMtdreyGqlK1wS3SK
         DEH+tvKHGHz4Xwvs0fc4jyDhYbQoqoVcIdMdSyZR6d3kfsrrEiU0lUHQQLiOz2LtKLhm
         +CZiOoyWcv1PYcPFZ4ZX9z0ISBZ3MafCAW04EQL7dDv+0jB7YG65MM+HczEcBmH7ZrL9
         7r03bAPL57y3M570u6IJpuzrnpzBI5uPOo6FABWnWkxNFi704pNdM9SO9ILuPCY+nyJk
         tdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775156208; x=1775761008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m9bXJvgrALKJ9p3Q2n22qDrsxN14oouyQEW4vfGf5E=;
        b=R2+H+rEsU1QDuBdldGxI06wdzbkS+kpeajgwL0EKB9fmm9R0sAnRoWk/y3RDLY4RZv
         XCrHBr3jdd+mbj+uezGK08ZQZyGlxRkC0tENmZdTf5H6PmVEHHlQUA3rC3S+YM1Ffn6F
         CGd9dYBT8MAqA90H7G6Ct4RHDl5YkoMniO9ZW7U5YAZahyxggwtzmtefi+Xc2X/6+SYD
         0T9uAgG/hrXMOT/ccMZI+iIM8wcjN1kCciKyN3iK/sEN6/C70xU8/cxfHPFUn+icZlsY
         HnnFE9qb7UEgu/KuzYYQiweqVpq+EvdHxdXyQTaOF1po3N/wnQ9OgOpdo+u27pKdXGzW
         DTZA==
X-Forwarded-Encrypted: i=1; AJvYcCVXtmE9+1XmgoRWIFKVSD2PmxLWESl3rdW8TlsNN25TA1oCOxvJ+JXi8VhtIZ5UYinW247akmD6nrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQy+qZwPOF8sKQPRI6GwlZLzHui3X+mZBZ6+WDr7hYQepY5fIg
	niIKMit+v/9NK1W+ZC366Pznsys8jOT9lssB6VYwPvsTrpVCa66Dt8KqFc05qszwBLWltM/skrn
	NSKiY
X-Gm-Gg: ATEYQzyHKQSOUj46YitgyY7K/HrVrc21+y6w64JudT58f8KXe2PTWbRat+eBjeLYIen
	EeOLsU0vyPgKT/HH70nfwk8WUSr7zzog1bqoinX/dUi6QVoulCUb5/UZfQimb5eBbD9c64m/Uah
	wdfonnisxCPcI0rd67JH54lNRR9E0FVFFXvZhuwGS6Ecuzm7e5Vhoz31XvuQuKQN0ch5Z4YSob0
	ecgoORCEoFvpukyy2ARb9oXUd4a6wgWurV27I0IR5kT+LUM6CMPVLlL53gX84FcdI6AamyiERZz
	PneY7voHeVcW5hXh7MnnBQ1vwQk7wbPTKHubrFW0V2twwNtdPUG3vzFsZfGP4scQy2xUsv8mzp5
	W82hVg2ng5pamSWBM2hot1K77phnJSl604uBQNaE8bH7ja8cahaip3YCoC3VXYpiDPNsIWj1beN
	cXV9ZKtOLYc9WTJBoQy13vWdI7yKqkuFFrSiSsYc4xlFb9oIxGkQTnLAAYfrZ+xB+J1FY=
X-Received: by 2002:a05:600c:6095:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-488995cbf65mr3822905e9.0.1775156207780;
        Thu, 02 Apr 2026 11:56:47 -0700 (PDT)
Received: from ?IPV6:2001:a61:1398:d301:5a18:8325:8d63:9a52? ([2001:a61:1398:d301:5a18:8325:8d63:9a52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897b8176fsm4653395e9.0.2026.04.02.11.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:56:47 -0700 (PDT)
Message-ID: <0c1ab966-97b0-49b3-989e-c6bd2a8d1c79@suse.com>
Date: Thu, 2 Apr 2026 20:56:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10 INGENIC
 touchscreen
To: Dave Carey <carvsdriver@gmail.com>, oneukum@suse.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260402182950.389016-1-carvsdriver@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260402182950.389016-1-carvsdriver@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35911-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: ED1CF38D889
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 02.04.26 20:29, Dave Carey wrote:
> The Lenovo Yoga Book 9 14IAH10 (83KJ) has a composite USB device
> (17EF:6161) that controls both touchscreens via a CDC ACM interface.
> Interface 0 is a standard CDC ACM control interface, but interface 1
> (the data interface) incorrectly declares vendor-specific class (0xFF)
> instead of USB_CLASS_CDC_DATA. cdc-acm rejects the device at probe with
> -EINVAL, leaving interface 0 unbound and EP 0x82 never polled.
> 
> With no consumer polling EP 0x82, the firmware's watchdog fires every
> ~20 seconds and resets the USB bus, producing a continuous disconnect/
> reconnect loop that prevents the touchscreens from ever initialising.
> 
> Add two new quirk flags:
> 
> VENDOR_CLASS_DATA_IFACE: Bypasses the bInterfaceClass check in
> acm_probe() that would otherwise reject the vendor-class data
> interface with -EINVAL.
> 
> ALWAYS_POLL_CTRL: Submits the notification URB at probe() rather than
> waiting for a TTY open. This keeps EP 0x82 polled at all times,
> permanently suppressing the firmware watchdog. The URB is resubmitted
> after port_shutdown() and on system resume. SET_CONTROL_LINE_STATE
> (DTR|RTS) is sent at probe and after port_shutdown() to complete
> firmware handshake.
> 
> Note: the firmware performs exactly 4 USB connect/disconnect cycles
> (~19 s each) on every cold boot before stabilising. This is a fixed
> firmware property; touch is available ~75-80 s after power-on.
> 
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> Tested-by: Dave Carey <carvsdriver@gmail.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

