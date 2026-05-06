Return-Path: <linux-usb+bounces-37006-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id D83GK6YY+2mYWgMAu9opvQ
	(envelope-from <linux-usb+bounces-37006-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 12:32:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E494D9527
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 12:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 727A7300789C
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 10:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 883003EC2FF;
	Wed,  6 May 2026 10:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3qBRRaV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C9B35294E
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 10:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063523; cv=none; b=Y1ahC2XbxoqCehMyc0MVW8i0HOpim0m6PAx3EC6+143NuramG36nXsaxgcU/+FhE9WBJg18NdwQgJwgnvK6uYiSu8/KtlucQYmS1MZaD/Utuk3zzO15x2Aqpzgyf5itgv0/oNIroRtWFe3pHvClw8pQTxCVhRYN0L/KxFrKQZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063523; c=relaxed/simple;
	bh=2u1hbOuO0VpjAHZvvKtwRuB3AqMRY6/qKgrC0iLEtcs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qe8UunyGIq6Tztc2kACZIlsdTsHyVrBAseKcTU1FxWjKt5CF0xBq4Z8EFzMH4XvnoLpw62rJh7uTmEUU1eVkfHg6CHQoCplIaD3GpdXIyvkEiIbvVRsLpUbuntsE4TiXcFQaLr4DyNCurc/hIpD9+Cdz6qxdbKYBAnaNJMJ+ugc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3qBRRaV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43d7645adbdso3797057f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778063520; x=1778668320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwUdW68A0CbE204lXa/smh9IH8R3/rozqZP7NaSGf5A=;
        b=N3qBRRaV0KA/L4odxTf/VNqzwh2+5MWufUqgKAW7xooUZCJN579khgEn+RghYhVub+
         ffn8G9L+k1jefkZ/zb3mzT3AdJshjFaCjGYCRmF2FmMdBWm3aV1LVpnGwBjY38FLk2bk
         vfK0bt14MAlkCNIpwVHsjdTd8EMylaTEFTRHlUI9aVlgisuwD5SdNyk29GC1bCiiRCj4
         fORf+15n3+wLnyBk2CAuSK89RhbMqvJi7pL9YGZ+i5m5vxgxTrh0y1hO1LpSHjIjP8vH
         +xC0yXywHQ1/iGrttV5hCv/4KywHutDaznAH/WDAkNWJYox9+Ubal9Tj3+a3aHL7L8oG
         aC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063520; x=1778668320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EwUdW68A0CbE204lXa/smh9IH8R3/rozqZP7NaSGf5A=;
        b=cMnoi6/HRMDFwpuTY+LstIWqS7g6udt5jRe80VdXVOIHSEjAbYEEKWYgzlUNBLKd5g
         cvbzvcuBPNhLhc/mWva2U2XXXMLzW++fKZiSvRmJVTCbFQMZcKIP1G2hP5+EvF8yyIh8
         HzyDddlMfY1u4GSnVwRjniuis638WzlkEkyzpWHfxdtnfOrvH6s3e5B79cjfAp+/VnA4
         mEZI8F24G1Mc6HyEbMz3OcCVsPCgboAutuLrJRYXxo4J3r6Zzfot5oTbuGT+thC/JCPS
         ggnMkBdxfvsixuZ7W4536FaePsjGYHUfPxPxTTpPU3/kN2XrefAL7PniIIvAl8ZTCRu5
         XlkA==
X-Forwarded-Encrypted: i=1; AFNElJ8VRSp05zRNY1r+zE/hhTPM9EshjwxH5qQw+oqEsB2Ofy3n8wL0t2x7CNsxkMwWV3kgVA4Zt0niE0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFXLqxXya6LX92t1bgcoqqSTbj4l9RzA+0mi+eYmgX+5ycx+L
	+fflQbAb6z9gJ9Ol1Lrvqwm2hm+61McZaf0zL6XkvZx2yBnXt9CH6qbI
X-Gm-Gg: AeBDievPVec7+VU/A4WpKtDa5R/qLQ3qW0rd9XtgGOj5rHY0lo/osLhCVRJFdzROb1f
	qb/as6GREF3f2rddeYeGdQsZg2BimYRVr/WmOdVIpiG/JIKg5mhcg5Up8HB+4LHBk04EzUiDr0a
	T2AE4WiBt5sUGt5xGMUTpGjyGDjPJNqeRHI+J9DY1Dl1eU5QsxHgPJAqgj01xghJAsOvH5R6k8i
	QpqqLcKNoopWXfnv5/2hLdr8uCf18fWXZAK4WzwipiWb4T/i2Svf+SEca+g8IXD4X6oI5nwWRJR
	ORQWkOhpQC6NVQnljUP2POHLqCP4Hmf6KvIEwjGjpAD2azTXYbusI3G6FVrnlYgkQ/CdEn+vqqa
	SSMZLA3njPH2finy0IkK4/LND5G6F09vJikixj/n0C1EDOgr4ogCsN/fmP20+n2e0J1LIaRtUXo
	PhpGMTDQ2Eb1Y/GKrHLvTL6BW64os79kjzzygWdg8gFSImmQ==
X-Received: by 2002:a5d:5f90:0:b0:451:ccc:a6e5 with SMTP id ffacd0b85a97d-4515d5c68d1mr4653082f8f.30.1778063519764;
        Wed, 06 May 2026 03:31:59 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960fd6sm12185219f8f.31.2026.05.06.03.31.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 06 May 2026 03:31:59 -0700 (PDT)
Date: Wed, 6 May 2026 12:31:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Alan Stern
 <stern@rowland.harvard.edu>, "Xuetao (kirin)" <xuetao09@huawei.com>,
 caiyadong@huawei.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: core: Fix root hub descriptor
 wBytesPerInterval
Message-ID: <20260506123155.3b041e55.michal.pecio@gmail.com>
In-Reply-To: <a7d9e9f2-4752-469f-b7e4-f0db11852e6f@linux.intel.com>
References: <20260504111353.55ba2530.michal.pecio@gmail.com>
	<a7d9e9f2-4752-469f-b7e4-f0db11852e6f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 21E494D9527
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37006-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, 6 May 2026 13:17:46 +0300, Mathias Nyman wrote:
> On 5/4/26 12:13, Michal Pecio wrote:
> > Per USB3 9.6.7, it's "the total number of bytes this endpoint will
> > transfer every service interval". There seems to be no good reason
> > to have wBytesPerInterval < wMaxPacketSize - either one is too low
> > or the other too high. Here, wBytesPerInterval is too low for hubs
> > with more than 15 ports and xHCI spec allows such root hubs.
> >   
> 
> There shouldn't be a USB3 hub with more than 15 ports as
> USB 3.x specification limits USB3 ports to 15.
> 
> See USB 3.2 section 10.15.2.1 Hub Descriptor
> "bNbrPorts:	Number of downstream facing ports that this hub supports. The
> 		maximum number of ports of ports a hub can support is 15."
> 
> 
> Hub driver also fails if hub has more than 15 ports.
> hub.c hub_configure():
> 
>     maxchild = USB_MAXCHILDREN;
>          if (hub_is_superspeed(hdev))
>                  maxchild = min_t(unsigned, maxchild, USB_SS_MAXPORTS);
> 
>          if (hub->descriptor->bNbrPorts > maxchild) {
>                  message = "hub has too many ports!";
>                  ret = -ENODEV;
>                  goto fail;
> 
> ch11.h:#define USB_SS_MAXPORTS           15
> 
> The USB 3.2 specification 10.15.1 'Standard Descriptors for Hub Class' also
> shows hardcoded values of '2' for both the wBytesPerInterval and wMaxPacketSize
> for the hub interrupt endpoint.

Thanks, looks like we should be able to get away with reducing
wMaxPacketSize then. Currently it's calculated to fit USB_MAXCHILDREN
i.e. 31 ports, supposedly dictated by the needs of (obsolete) WUSB.

Any preferences whether to replace USB_MAXCHILDREN with USB_SS_MAXPORTS
in the existing formula for USB3 hubs or just hardcode 0x02?

Regards,
Michal

