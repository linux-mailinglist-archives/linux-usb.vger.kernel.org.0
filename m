Return-Path: <linux-usb+bounces-27352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CEBB39F68
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 15:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E5AD18935CB
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 13:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0EF2153D8;
	Thu, 28 Aug 2025 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bztP+PlZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609941E8329
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389212; cv=none; b=iQwGy7i0NLEegSlNgiL/N8euTw3IArvVf6LDyM8nSp/nvOQ3lg1L4XeHeuEJ3r0ujYih7UTc32vWgQ8R1PHqoQDRRNxnclnFT9qMm/a6C5RSVNbl6TUF+mllchBaiGybST49HOhQ3EHVV2v6kgLmWwpYM74xeMXwo6r8gt1W3x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389212; c=relaxed/simple;
	bh=lGhLLyZtsCMzsu1Qq8Jb2fnMFaqIFwyho0PDH4uIsSs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dcykRbV1Jk6dPvf5ybgGadzmObXoMHyQHvRUx3wsxvPYqEM9GVGpAzkjkVBqjT9L2VLf38C+OTx0wYwcldzeHCUEEHeaZtLcapCfy1Dp1IqZRgmhcTCT6zP9nq6+OrwKaAwKVu/Y/KSwqJS367joVEfn06ivXcipv7hCgQ7liBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bztP+PlZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b55ed86b9so5324705e9.0
        for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 06:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756389209; x=1756994009; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0n+63KcQD6FRBuDootetJfqfZ5jLeKBL3zFlMVXx4oA=;
        b=bztP+PlZGnXTYNX+dflJIGEME0I95bIORyRTI0AWPa91ZRtqDQJmNFBiPV9ADWnx1n
         D/OJz4anxI/bco68miVMRLmG+TyOYmBXPcE3LAIblqSMVd/wGFdWCeZb1CiMF+8PvwCz
         KQg+HYnU/vxzSZOuZ5VXIpbx4yMAdgoBa7sbHSs7GwUebKThrmoJ9w+HImxs5iaw8m7D
         LL0vpb8lSqqqBaKEog2sOiBDga5FOIFK5d0c6WqJaXQs+0lyLbvYDELsN4efWm2temBO
         E/AVZP7wSEUnf82Ftr7tlMRzm+rnBBsrryiEKFElwhWYQU6oD318ahY+78xbCJZhBx/o
         wesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756389209; x=1756994009;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0n+63KcQD6FRBuDootetJfqfZ5jLeKBL3zFlMVXx4oA=;
        b=uVJqlYm3JdczMZbFuzBEPExN+vjMkDuLs9AUQIVnzoTP3CFf35mhOhe/+/MBn7zBXV
         4S8ocA8Se86RJXHDhjHX3nabIHVTl/FMOYHEo0hXMFGrzpd7PKdFZ1iVKAwzL8N8aaij
         1FLHpUdyTB9NDDx2s24tACDygr/Zshh3M6M8aZzEk6qDBunRBswKOZm3eDG33yU/Xzqk
         vGWlKLFf9vJrudMhUNaw1NxsNYYY9pb/6ReNiiLFe/+YGtVgCtBKe3T2Ykuq6w992OKh
         vxYFyd3+sbaC2NWtzEqn+1w/kMRn2F1lGg1BjkIw6UV2PlLlIapneQlPQpum+TxnX2V9
         FNsA==
X-Forwarded-Encrypted: i=1; AJvYcCXzEa4UWRXDSMP2qdf8vOtJGCpi70ebeB7Mu++KbNL66F2Bhi5Qetpk2qXw2ozfnUvqk3hndtL6oMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWMRQ9HZOnFa3hx08P2I0/YdaQFETLRAbaU8aKvG6VikwbuUR/
	SLdSuqJS/zzhgMS78ESx7RWbumOzSjF/tMZ6y4sqf1bgjBk7fq5ADEhhgioNR6RvgcE=
X-Gm-Gg: ASbGncsrG+5mIptDVWecrHROJH/KDYHCVPWAiTID5hOqoommXjGJoALo+AIadYDD5Tv
	+oNBw/e6kdatpvv7eevNzsjs4C9/ykHUI7SyTG6RizFEcxenhvfAuqAsqjKtfTe0L7AG5tjrVqM
	AWC0TJL0XdFxpl9eDEB91r61WWwJUZW8niogkB9dQinNr5ZgLuHoPTE9UX6HRXOMD88OUXUv5f3
	r9ifb+3In0e6hQ0ttGb/XKKPmiUItQK7E+UehedB/cXknvY7Xsf7EcUuFaXxQfT3Fcl9nTCbMkY
	UsXIhGYbk+Hf21pw6ZslPDdc6k/64RGoBXqQpUflhA6Ibe2eL/24Jc0cNMzjFS1WCH4AId007BL
	+4CDQ5DPZjtpypP1Vl3Zhl2NZa4qmdtRyouuh6pJWoEPikr0E/GR1INcOvJWY0Hocyhg2v1YUd5
	s=
X-Google-Smtp-Source: AGHT+IGxsFe7uunyLZD7EgxOzsZkfPuY3RQNyOeNK4qkwcbIkq5Ft0w85K3csil0tzdXCS9kGTKJAQ==
X-Received: by 2002:a05:600c:3b25:b0:459:da89:b06 with SMTP id 5b1f17b1804b1-45b517b008dmr288637315e9.16.1756389208572;
        Thu, 28 Aug 2025 06:53:28 -0700 (PDT)
Received: from ?IPV6:2a02:3033:262:f8de:50f3:be08:1bba:104? ([2a02:3033:262:f8de:50f3:be08:1bba:104])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7c461edasm9110345e9.9.2025.08.28.06.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:53:28 -0700 (PDT)
Message-ID: <18f621e2-93dd-4153-8c37-f219deb4206d@suse.com>
Date: Thu, 28 Aug 2025 15:53:26 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Alan Stern <stern@rowland.harvard.edu>
Content-Language: en-US
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: when to cancel kevents in usbnet
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am looking at how kevents are handled. However, recent fiascos
I am reluctant to touch this area. Nevertheless, right now we are
cancelling all deferred kevents upon stop() being called.
It seems to me that that is correct with one exception.
If the deferred kevent is the need to clear a halt, we cannot
just drop that. The only reason we should do so is disconnect().
What do you think? Does this need to be split?

	Regards
		Oliver


