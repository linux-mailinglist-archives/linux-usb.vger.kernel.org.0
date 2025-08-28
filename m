Return-Path: <linux-usb+bounces-27340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CDB392C3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 07:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 917243B378A
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 05:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B7F2066CE;
	Thu, 28 Aug 2025 05:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxSJuqRQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC29AD4B
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 05:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756357521; cv=none; b=VYX4M/Xyx3r4e3bzYqtBimuEbSMteOHNMrlKmjS3pE24MNtMRRR48leikE5kTiDV3qtgwnlQ7z/sas8dhyBLyZ9j+n8fd3ZdQlzTqVsIK14MR2tLJiTTElqXv6BlgP8k/L+8GFPDzUEpUu+U6op2WhVBE04+KHkSSBlk6YDP0Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756357521; c=relaxed/simple;
	bh=suewe3ylRzSEXQ+4xt7ptRiv+w6bYFKUW40JaVJvgXU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=oRTUsdftM6xjl8hhflwz53a25M73oHG46oY0PX8zv1t4j2y4OyndfnhKlN17YCv0FC9tqTPDRWKr1TFyyEpdsFVjvgDmC4RrIjt70kWjsrvynfrp5UCJJl9xs9WonkHoMcb8Z8ojg+h+rK2kED9zW88yP+MUPfIJJg6YtjB4QhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxSJuqRQ; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b47052620a6so1220847a12.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 22:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756357519; x=1756962319; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suewe3ylRzSEXQ+4xt7ptRiv+w6bYFKUW40JaVJvgXU=;
        b=dxSJuqRQzW+yBio0CnxTEWpAPzR23dFZGrVJJTvIkZeH4W+mNNiMglEEzTH6Ncnhf1
         0K/T/OeYAKbI79XGgdp9A6kKvbK00mhX/Mdq65HjRX2E1wPUTNpEn6lGSGbeIwjfoDM0
         wVJhs8fXbXIqovdEuOzV0BLI8iM7ptdam+sedeWRGupRNRiodAVPERGNwOR+zZWFnz4K
         UUNsojtfxgAS6srQERN2A2beNmmD0+PKJ9rP/IGgKHiNnxNhMHuukUOWiG6pUWWh/j7Z
         l9OotwUGGar6pQh9xS+VNEmwD0PslcdlEdp9HdSndLEdxwR1jMorzZyaad22ZvME1AI+
         zhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756357519; x=1756962319;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=suewe3ylRzSEXQ+4xt7ptRiv+w6bYFKUW40JaVJvgXU=;
        b=ApSunnpKffI0o2TGCd+xmb+MIuVPfCRBYg0xe9Yp4H0onCE08TtjbitYgjBTuA7MAW
         Itefya+KOQ4bMhNGWoDo9HUYvlj70AIn1iitgA8bmxtxR0cj7HtKd0h+L1L/8oWKNkME
         YrNqaoqFrX9jUEqBfQ5pL+aWiouRr1ZtAdF20i3UfZW+KU02lCM76J3WJ7fhw0UDeHRO
         dk3j9PPmTElqcCCHMb4pfcnEZEA4H5u6fF5wmV1XguMQnBHq4pqEyoRcMKnrMtPEN3QR
         Pg/3icueDdstlOLS7zfGGbm+vhYnLWXVYpn8ZSGozu1NeukNTjQ3ecq54piplP3pDOFV
         Njcg==
X-Gm-Message-State: AOJu0Yz3teg0orAticUGO7zfzsWqfvTgVAfcDsQXIwUFJ4BwMmzOzvbC
	+gwZRQxjJS5cFZDTSPFtcBMHxFulRv030TqRM7wUxZxzrMsuqZPh6Xh21xDerg==
X-Gm-Gg: ASbGncuNMsYtK6dY1mJNERhuEnyNU43UpIzaOW2fJ4nZ+FlvcHP7nTlAXlbkZqFdOVC
	sC9d1g58cJlxtZOKYdM/MwV+JwB8HRU++XNq1sFK6URFLemv+nBGa+ibni5iVu8XwJjuRldo+xj
	ZJgVMuGHfo6Odcx8LoN6rgV0ySRy33xvtxDUPBbbTJ8BxqY5LsaDn+oCMaDGOLeyUP6Ul0BNSOS
	+kxVj/GA6oG1erTg4byT3dQX2/pupKadJCCCbLQ7rqOWT2MU0ZaZBADstXhu/rVAVp7bvWOey0d
	LzUUzRjxL8Bd7j8AhJHDXgAdWy4D5uS6MFeagsHmirqjUbk1WPZcqoanecQvm9RHtmUJBnSKs0A
	jW8wT3Cff8mp8Sm6m1+0K/CjAnCM=
X-Google-Smtp-Source: AGHT+IHPZS8fM0kt+crh5Lgvgq0CCK7nh/Qi/HBwq+9iB/EuUoma/LFt9kVD44lJaunWJTfEf9S/IQ==
X-Received: by 2002:a17:90b:5246:b0:321:82a0:fe50 with SMTP id 98e67ed59e1d1-3275085dabemr9793425a91.5.1756357519277;
        Wed, 27 Aug 2025 22:05:19 -0700 (PDT)
Received: from [192.168.1.232] ([64.227.209.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327ab0b620csm1028074a91.10.2025.08.27.22.05.18
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 22:05:18 -0700 (PDT)
Message-ID: <87e75621-f12e-49cb-ad8d-581e4151216d@gmail.com>
Date: Wed, 27 Aug 2025 23:05:17 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nicholas Chin <nic.c3.14@gmail.com>
Subject: URB data not available through binary usbmon interface when
 URB_DMA_SG_COMBINED set
To: linux-usb@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

Recently I've been working on reverse engineering the USB protocol of
the Digilent Analog Discovery 2, which uses an FT232H in FIFO mode. I
noticed that tools such as Wireshark and usbdump, which rely on the
binary usbmon interface, were showing many URBs with no data, even
though I would expect a payload to be present. Looking at the fields in
the URB, it seems that the len_urb field of struct mon_bin_hdr was a
non-zero value, but the len_cap field was set to zero.

With the legacy text interface, I am able to see data in the same URBs
that the binary interface was not showing.

I did some digging and logging of drivers/usb/mon/mon_bin.c and found
that the len_cap field was being zeroed in mon_bin_event() due to a
positive return value of the mon_bin_get_data() call.
Looking into that function, it seems that it returns without copying any
data if urb->num_sgs is non zero and the URB_DMA_SG_COMBINED flag is set
in the urb->transfer flags. The comment around that code indicates that
"If IOMMU coalescing occured, we cannot trust sg_page" which I assume is
supposed to be the reason for this behavior.

The analogous function in the text interface, mon_text_get_data(), does
not check URB_DMA_SG_COMBINED, and instead just reads the first 32 bytes
of the first sg buffer.

Could someone please explain why/if this behavior is required if
URB_DMA_SG_COMBINED flag is set? Is there a way that usbmon could return
data in this situation?

I would assume that if the full data is able to make its way to
userspace then it should be possible for usbmon to also access that data.

Regards,

Nicholas

