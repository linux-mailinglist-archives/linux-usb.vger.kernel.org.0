Return-Path: <linux-usb+bounces-29539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC535BFDD13
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 20:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D1B33A9C0D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 18:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AABA26ED3B;
	Wed, 22 Oct 2025 18:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcci.com header.i=@mcci.com header.b="ixgHTP9c"
X-Original-To: linux-usb@vger.kernel.org
Received: from spamtitan.mcci.com (spamtitan.mcci.com [66.152.127.76])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC21347FC2
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 18:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.152.127.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761157501; cv=none; b=pFzhHMKOBV70y8Ywt3QzK8q0sI7ER4vqZH2CAaKBAIJxVj900DCa3amF21xuHYcV9v7wvb2N2kBZa18vaEducWKMRhugDWmR5fCY/jvU8Z3UV7N2sw0c2TglktOUGoMCR84YBSxibghxR09X6Jyz4qDZPHQS0e8I0X7/F4+pxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761157501; c=relaxed/simple;
	bh=w50VDlSlsRRFOblnTN1EBRVbp1Pc8euYkRx+/JUOuFY=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=IAFfUq8+c5ifBHTTIWwAZQyQxIvrmllV8pBHk/InrPvyDfRNZBn9DuXOV7wVctW6Mvf0vUc9kliUt4rmh3yeMjNq0clmn4bHA3xMuQDmR5zdYoYHHgxzoPXrpQnxSou+VnHlHNAZVPYrBaAlu+zpB9hKyYQnPt4oE9bY3d3AZVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mcci.com; spf=pass smtp.mailfrom=mcci.com; dkim=pass (1024-bit key) header.d=mcci.com header.i=@mcci.com header.b=ixgHTP9c; arc=none smtp.client-ip=66.152.127.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mcci.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcci.com
Received: from spamtitan.mcci.com (localhost [127.0.0.1])
	by spamtitan.mcci.com (Postfix) with ESMTP id CDFF833659E;
	Wed, 22 Oct 2025 14:24:57 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mcci.com; s=spamtitan;
	t=1761157497; bh=w50VDlSlsRRFOblnTN1EBRVbp1Pc8euYkRx+/JUOuFY=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date;
	b=ixgHTP9cFc5qHLV8NeKjVeYs3dcprALiv/8UzGBBvAljbsyl2J17sfy5fZ/0GKTCN
	 B/9ouYdLj0JYIl4UWYox08iyveiH0re0mFltwq3YMAScoTtePCWhkourT5+URtG6rU
	 HoOhhmhpbuKXI8mjEGlkt2tgzLRGpHFMceJ+5AOY=
Received: from localhost (localhost [127.0.0.1])
	by spamtitan.mcci.com (Postfix) with ESMTP id BF71333659D;
	Wed, 22 Oct 2025 14:24:57 -0400 (EDT)
Authentication-Results: spamtitan.mcci.com;
        x-trusted-ip=pass
Received: from net2.mcci.com (net2.mcci.com [66.152.127.141])
	by spamtitan.mcci.com (Postfix) with ESMTP id 8D0C133632B;
	Wed, 22 Oct 2025 14:24:57 -0400 (EDT)
Received: from tmmnote12 (net7.mcci.com [66.152.127.168])
	by net2.mcci.com (Postfix) with ESMTP id 473991524C;
	Wed, 22 Oct 2025 14:24:57 -0400 (EDT)
From: "Terry Moore" <tmm@mcci.com>
To: "'Greg KH'" <gregkh@linuxfoundation.org>
Cc: "'Ruinskiy, Dima'" <dima.ruinskiy@intel.com>,
	"'Oliver Neukum'" <oliver@neukum.org>,
	"'Oliver Neukum'" <oneukum@suse.com>,
	=?iso-8859-2?Q?'Maciej_=AFenczykowski'?= <maze@google.com>,
	<linux-usb@vger.kernel.org>
References: <6c22b4d5-7d6d-41ab-9b00-9dccf3ec8963@intel.com> <2025102259-purebred-amulet-b6d2@gregkh> <00f101dc4361$7a5b8860$6f129920$@mcci.com> <2025102208-copper-aspirin-b1bb@gregkh>
In-Reply-To: <2025102208-copper-aspirin-b1bb@gregkh>
Subject: RE: cdc_ncm driver and NCM 1.1 revision
Date: Wed, 22 Oct 2025 14:24:57 -0400
Organization: MCCI Corporation
Message-ID: <022b01dc4381$2b8aef80$82a0ce80$@mcci.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFuWoWLMwmxFgSFPKvs3lm8BPFLQgFuUoYDAYW0HvkBatGSPrWHI4nw
Content-Language: en-us

Hi Greg,

>> We're working on an interop test in December. We really hope to find any
>> active open-source developers so we get them involved in the interop
>> testing. 

> Do you have devices that we can test changes with?  Without that, it's
> going to be hard to implement anything.

Member companies are working on devices. MCCI plans to have a test device;
we've sampled to a couple of the member companies. It's a USB 3.2 gen2
device for engineering purposes, MCCI's Model 3411 board with updated
firmware. 

I'll ask at the Thursday meeting if there's any other info I should share
from other companies that might help with testing in the open-source area.

Best regards,
--Terry


