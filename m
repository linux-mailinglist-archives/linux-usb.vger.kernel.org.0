Return-Path: <linux-usb+bounces-37314-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGD4C60MA2pI0AEAu9opvQ
	(envelope-from <linux-usb+bounces-37314-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:19:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F951F3E7
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 23292303F709
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6864D1A38F9;
	Tue, 12 May 2026 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dFcnyoWI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC9320CAD
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778584721; cv=none; b=XHWJxRE2dMqYvjnBd7s5Dn+058eEWnlD8QALye0GTI3nnxg4Wvrr7PtTi5wjy8Ai6SoqYRNoQUTRkDlbc9rYBbGgO0TcNwZq0KUke9OY/8+nDPB4fTIcp2gTVwHRzQldEly3nrweCer3rlQGaAVyyLVNznG2ElbzqFD5Lg6noK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778584721; c=relaxed/simple;
	bh=OWq5UTPl+GJgH2MQJtWNRlZruR3ErcqmDHPkW8bvR2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5LXUrwRRigV3qTknD3B6y/eaADa0/nz40lxEcoCRki0N8Qm8KhSeuZDapryoqMh9O9xsVJEqDBXuaLIfEIQr9sVy4U/tUT+SSt6lJ0skCh2gFStp/NTkBhGoE1ADla02AERZcxZ+TdQW5rXTrWFs3+HDO0wSKVwonq67DXTI8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dFcnyoWI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso49557235e9.2
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778584718; x=1779189518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7Fu/sDmoEGC1esQmXDXb+KD1MzNHdm33KVYUDXueVc=;
        b=dFcnyoWIjS0RZRJmYNhx5LmVGhr79c6EvXkQ4x6vbWiDdnEMa9fQytLr1+6JZ1XOLO
         uJ2TXj6yoGJ8bbuv7UC4P2B3wb6AlGFpbS4hl+a03lC5GPVyRcpQuaKKdHqJoqlfWQu+
         F5H3rME3vzJH1d5htPvS9H95b2S7R+gsExeCxng/19TZgFhRqI8F9ajMyGu1pSMAwFvu
         NOPt0l0SCsFR87ng3ibLj4KPYAkY0fMJLxID9mgB5F1cx3mShGST6SgOT9zTmjcdpLB4
         Vrm46wlk7Ur4/jiajtpdyEOyMpiK9KytLUrCtJEpQkBoB0irAL2jRtdEM/diMRJ3an22
         JLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778584718; x=1779189518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7Fu/sDmoEGC1esQmXDXb+KD1MzNHdm33KVYUDXueVc=;
        b=Lylx56ljL8fShj5fwgP3lOEAzQsN+nVhM6MONTJR+NI7b9QXCCLAt6KTPv9SROy3zf
         kV1tGoq7F3IaK9uIknGhUL9hTLvI8fH+8HWficCUetHtwOzVDHxdem+oLlm+zXSyhl0b
         fgUuQDmwflSzOwh6qq+hMcDx22ZCCWAs1ZkQ5BfKsaN5ZiXqO0/4tOCUFJtuMIQXKr+y
         3aUQ5OSuZeVj2PCpA7dcWg9T/oiocZwZw0om8+YoI2K6qtq72Tadc2ntBLrDlsBdLG2q
         PpW4j6YkUGJtvut6Vpxh3KM1Hfkk7stwlZLXQSGTguS2yCjEo+oOce6R/wx+u1J3Azbi
         9xuw==
X-Forwarded-Encrypted: i=1; AFNElJ8xD+mQfpzDpbwTeddT1hc4VXhNBowLbCAn2wS9lJCDgtbGy7cCKj6hUywpYBWNncN1CpOLf+2ajUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YztteueACDfzBgWoNTxMepKJLvNUyfITadkPyiLWFy1xtf7gTp6
	qAwSSnmjhTM5qwJPlHzfyl5Kyi6UK8iURm2iDh2MNFymmxaB8U0AGq3yRD6zuV8htc/QrRhojx/
	waifo5ZQ=
X-Gm-Gg: Acq92OHjKNozgpHB9aIQGzBVHLyBRnX6FOiHyaDb/dIjEpsLy/K5O+5xYMBwawxuZLW
	GQRqSGrJXwIwCa96xV3kz3u8qDp4XP15Lx8/L3lpsdmaJ7Rb6LSuqj04oJL5yZiwEdYmQxMR7SA
	rcsQHw6V5s6laH2k8r6W038keuekcm1fCwvASDU/BhBetoqQ3c78J/WcAdQRvOMEj4B/FlPR0dS
	mPeEVJ/j+i4RonTHSlMi4GIiLb8pJQw7O3CAwEOZaq9QtwJCeeDfHLEUG7Rd7fKHQvyBzanZU3j
	0Wcd8asOw6Pf3jd6tAAUQpZ9d7LUrkzq4cgdRJxNnfIbVqI4IXuQ2AZxNfiN9I+ouRnEQAUqoTr
	G/nMa+24hrjZblS+OJzo0iUUG7KOmaYA2P6SNBVT2PpKJf/st5VQUNhRe4gubqrvCjMoBcWiZb+
	R9Tf+yUrqteLlUqI+GQw3csstfxuDHvYZuuGV3HyzWWlhEUADwEfhpAKHSJxAPh3DfXKg=
X-Received: by 2002:a05:600c:6299:b0:489:1f97:6b1d with SMTP id 5b1f17b1804b1-48e706edd0dmr222060945e9.28.1778584717954;
        Tue, 12 May 2026 04:18:37 -0700 (PDT)
Received: from ?IPV6:2001:a61:1340:4d01:cd44:140c:68d9:e8d0? ([2001:a61:1340:4d01:cd44:140c:68d9:e8d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e906a0615sm35111275e9.2.2026.05.12.04.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 04:18:37 -0700 (PDT)
Message-ID: <45798ce1-9995-4814-bfb7-e79f60b18c0c@suse.com>
Date: Tue, 12 May 2026 13:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [usb-storage] [PATCH] usb: storage: Add quirks for PNY Elite
 Portable SSD
To: Sam Burkels <sam@1a38.nl>, Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
References: <20260501132346.86572-1-sam@1a38.nl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260501132346.86572-1-sam@1a38.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 966F951F3E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37314-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1a38.nl:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim]
X-Rspamd-Action: no action

On 01.05.26 15:23, Sam Burkels wrote:
> The PNY Elite Portable SSD (USB ID 154b:f009) is a sibling of the
> already-quirked PNY Pro Elite SSDs (154b:f00b and 154b:f00d). Like its
> siblings, it uses a Phison-based USB-SATA bridge that exhibits
> firmware bugs when bound to the uas driver.
> 
> Without quirks, the device fails to complete READ CAPACITY commands
> when accessed over UAS on a SuperSpeed (USB 3) port. The device
> enumerates and reports as a SCSI direct-access device, but reports
> zero logical blocks and never finishes spin-up:
> 
>      usb 2-3: new SuperSpeed USB device number 8 using xhci_hcd
>      usb 2-3: New USB device found, idVendor=154b, idProduct=f009
>      usb 2-3: Product: PNY ELITE PSSD
>      usb 2-3: Manufacturer: PNY
>      scsi host0: uas
>      scsi 0:0:0:0: Direct-Access     PNY      PNY ELITE PSSD   0
>      sd 0:0:0:0: [sda] Spinning up disk...
>      [...10+ seconds of polling, no progress...]
>      sd 0:0:0:0: [sda] Read Capacity(16) failed: hostbyte=DID_ERROR
>      sd 0:0:0:0: [sda] Read Capacity(10) failed: hostbyte=DID_ERROR
>      sd 0:0:0:0: [sda] 0 512-byte logical blocks: (0 B/0 B)
> 
> Tested each individual quirk to find the minimum that fixes this:
>    - US_FL_NO_ATA_1X alone: device hangs on spin-up
>    - US_FL_NO_REPORT_OPCODES alone: works on USB 2.0, hangs on USB 3.0
>    - US_FL_NO_ATA_1X | US_FL_NO_REPORT_OPCODES: works on both
> 
> With both quirks the device enumerates correctly while still using
> the uas driver, and delivers full UAS throughput (~281 MB/s
> sequential read on a USB 3.0 Gen 1 port).
> 
> The existing PNY Pro Elite entries (f00b, f00d) only set NO_ATA_1X,
> but this device additionally chokes on REPORT OPCODES under
> SuperSpeed.
> 
> Signed-off-by: Sam Burkels <sam@1a38.nl>
Acked-by: Oliver Neukum <oneukum@suse.com>

