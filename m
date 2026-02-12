Return-Path: <linux-usb+bounces-33310-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOjiJ9GLjWnq3wAAu9opvQ
	(envelope-from <linux-usb+bounces-33310-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:14:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7C112B255
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DBAED30A3D2F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 08:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4891A2C21C2;
	Thu, 12 Feb 2026 08:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FAcI/J+Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1772C0F89
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 08:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884038; cv=none; b=ZIbwXHrr+gEGq5JITlpv1gfJSfQ/6p5POSd4UsJPhZeuOfFJLfDWc/UzCEzO55pQqiySa6anF0fQamy6p+JKC0cBS1no9Gq49HLBwKQwtizX39xgA4trgmDBass5+aGtk4Nwqo41HVXkJwoiOiG85ctiMrf/P7A3p+zIwGxgDM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884038; c=relaxed/simple;
	bh=7i/O4QTB7augo0QxF71smNPOLNyh4kpgEiRVpouU18M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MW0NqY6rDjoQdvyd5jq0jkx4+zUQXyEn55OirawJ/NIGcXrgwLMCkIz/1AZreG11oGOMYxlP5rnFiJSFOPrldehUKLUqzXW9eKfbpeMwHa+RUGR1FFIawqHxDCTY+diEtaOujCHeY1TAX6fLDRMXi1hteTNsk5yCwPe7Xka4Edk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FAcI/J+Z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-482f2599980so31610095e9.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 00:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770884035; x=1771488835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4YdSypDie7pXTZsY54yvh/zBL7cSy2S5lpZ9ItD4bec=;
        b=FAcI/J+ZqnTpWBiKxG/mJdG9h8Mw7VtPvmaFJA5Zp2Sujd5QTooecj1swtAfzWGdRH
         y7wra2yyA3TNH8bM51o89LnrprKGba6sNeve3kQ/Q+7nlyMfTU0ata1Q6Sz4UwY7C7Am
         RKqURHDXPfY9/cudHJYadRZzTRP9FCm83cEv0q2j7FNWa+jTz+/GLIfyH/LCnnOBcU0Y
         piXVcD6g1lDXTVVWPpS1iLvQftupb2r/JhfpNSIverZuHajEDkAf8rBL8JD1FoNSfBLf
         nk/gLU25FSP+4GCc0bXbiGxfiPyOpke5TUH4y4rA4FUMQNwBOLcHjMBX4ARTYxiS/rKL
         dj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770884035; x=1771488835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4YdSypDie7pXTZsY54yvh/zBL7cSy2S5lpZ9ItD4bec=;
        b=ZCA6fzLyBPRULEkEmaebU1XAMVpGj1itpqWD9M1wY1OLvYIw9cJFP3JTRydNmnTSul
         UbuzizkqlI8/LBFafo2aAHe0xY9hDWhvxd2hnveqDlSVvLHs+IfLoiTczdqhlpixDBWI
         8o9c9fxKy2966sBzfmiZq7ta9v5P587DfEP4gJBOq+XPvqwfZyFWbpjJTATcF3OfT5YP
         JvpSnGdPkdyAyiL+53YclCf06GBGtPCKuGiLNulRy6b/GLAfx+djJFkkf0YL0A20zIRd
         TBwSsthH81sNm0r3HwNbZtLY5aCouOjU1ftp4PViCOfiQh/62BLciEJMJXnCJ1pJRos9
         nNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVetMlknG/W+eLB7FKJE6C0U7nRmmZar7bNVwc+y0XvV23ZBT4P94J/3GDLs5C9PgouvzUphwWUdGM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8VrF4E+1WCmP/NyqhcGWmk0i5zHMT6i1YZQ7jQumMYi95s02K
	NBnxuc1XI6mGbgz0LOc5bnjtEKQYBf/BUCfCTmx6ozH58Gaf/yM1f49g5z9kUtRtLS4=
X-Gm-Gg: AZuq6aJqobCJb6Fp07kS9z8Ak46Lh3vObdSEhFB7ovnHrmfe2M/eUzkzG+bpToKToEm
	XxX3/vWDD0RaiZdkqQS0urbU1DjoyUBye7cKPK0MWinLdHJy/b4SYOlc0kOaP3gWQl5CEmWVx68
	7JzrbbVNBQkgQmdrebbTNsrf7r1AlUlioQ8Ep2GxE7OZ6NlSigaSm9rQmyT15zAP5tqFoG63VRl
	eD21UXqPatJPZInMkZnwuH6fJIQ0ePKiaSMvJDoJ1p835P7Xx2OGFuTBjzG5HDU2dFTeD/WU1K3
	fXat3oXwJJw2GOkX3yM5s9lTUe7XE6Lo9CWTWl8zuUO6ajPM3P9JqNmao3S+YU7Gv9BJBSu8Vts
	lXxH661THzDSO/KR7Cky2vVB6jai685uugSnxSA/sEgFgcwgs+DOBZS7fIqWmb6pyUu6CMsw0v3
	yrCv/R7ge2mTyEqUAEC9/bxybJywmI8WiLY+zZwvFIjEMMyysEMPMtMEMkndtF9qgGLaGj7F1ZN
	vge/g==
X-Received: by 2002:a05:600c:34d0:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-48367162f3cmr18337075e9.30.1770884035531;
        Thu, 12 Feb 2026 00:13:55 -0800 (PST)
Received: from ?IPV6:2001:a61:139c:5b01:2058:e5b2:62d3:4c3b? ([2001:a61:139c:5b01:2058:e5b2:62d3:4c3b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a6137d3sm61194485e9.1.2026.02.12.00.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 00:13:55 -0800 (PST)
Message-ID: <fceadd2e-a0e9-4d38-87fe-4513d60f7cb3@suse.com>
Date: Thu, 12 Feb 2026 09:13:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 USB mailing list <linux-usb@vger.kernel.org>
References: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
 <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
 <c6802a96-33d4-453a-b1b6-e74b4911555b@rowland.harvard.edu>
 <79868062-41e5-414b-a0b7-7aa162dbf4d6@suse.com>
 <313e86fd-0870-4b6b-b4ee-1ba3eb9d9d0b@rowland.harvard.edu>
 <83f20400-fc25-43d9-87ad-da51fa029c64@suse.com>
 <7403a3e8-764b-476d-ac45-f2de9e6b67ab@rowland.harvard.edu>
 <efbd1b4e-13c4-4531-bc11-4a9c541a7813@suse.com>
 <631119a4-6ac4-4142-8200-98a92a71bc8d@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <631119a4-6ac4-4142-8200-98a92a71bc8d@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[tor.lore.kernel.org:server fail,suse.com:server fail];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33310-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 1D7C112B255
X-Rspamd-Action: no action

On 12.02.26 03:34, Alan Stern wrote:

> In fact, is there any reason not to make usb_start_wait_urb() use
> wait_for_completion_killable_timeout() always?  Presumably a lot of the

Yes, there is such a reason. In fact a number of related but slightly
distinct reasons. They all boil down to all drivers being potentially
being in the block IO path due to resetting and resuming devices as
operations shared between all drivers but running in the context of the
thread that happens to trigger them.

Let us assume a device with two interfaces, for the sake of argument
a combined serial and storage device. Now user space opens the serial device.
The kernel (in the context of the opening task) now resumes both interfaces.
While the device is being resumed, the kernel decides to write out
pages associated with the storage interface. It will notice that the device
is being resumed and that the IO has to wait for that operation to finish
(and succeed, but that's a different question).

Now what does happen if the task doing the resuming dies due to a signal
while running a resume() method? Yes, a deadlock.
In short, resume(), reset_resume(), pre_reset() and post_reset()
cannot handle signals. Hence any waiting they do must be uninterruptible.

	Regards
		Oliver


