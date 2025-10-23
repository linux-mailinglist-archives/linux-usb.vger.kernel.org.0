Return-Path: <linux-usb+bounces-29556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B63BFF3CA
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 07:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFE623A93F3
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 05:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C19262FEC;
	Thu, 23 Oct 2025 05:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b="p/RXhIFk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx10.gouders.net (mx10.gouders.net [202.61.206.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6A5245019
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.206.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196457; cv=none; b=BPQpHa60G6mRG1lZgakoHlpgQP99K9na4LRpDlcBegWAOqtaBi00gYs9rHMyKc/nr33KLvbtxKNcm2yUFPHfahcw+AZlt0Aljiu6u3BFUDJuHBHIBY8A/PITyHyREC/yUVe4ov2/aLqObkOFaKEUaMeIMWAmrMDy42iIVGxVzH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196457; c=relaxed/simple;
	bh=qgncZRfbUztC9oYPbb2dlcbZ42d+5VbERj+3rjCpQv8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cK+sChqJRN16mP8LlRj7H8LCQrE3+jH39qcQQbQKJcGdFsJRV0U7iYfEMYpXoLuIOPDl83bAmIZ4WCBPAlQthE0HEHcRUcfsXwfW9qFoQq6fk+PFtkCGXZoqgRFaeEOzXp7LO4EUhh5/zMM6jQOwtih1SFPup2EYcdnAr61JjI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net; spf=pass smtp.mailfrom=gouders.net; dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b=p/RXhIFk; arc=none smtp.client-ip=202.61.206.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gouders.net
Received: from localhost (ltea-047-065-178-028.pools.arcor-ip.net [47.65.178.28])
	(authenticated bits=0)
	by mx10.gouders.net (8.18.1/8.17.1.9) with ESMTPSA id 59N5Dm4o032732
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 23 Oct 2025 07:13:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
	t=1761196430; bh=qgncZRfbUztC9oYPbb2dlcbZ42d+5VbERj+3rjCpQv8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=p/RXhIFkW9dgHn+Mdmm0HrRfS3Wq9lLdkxTNzC9X7U9IEXpobIdErJS565zZm/2Tk
	 02Dajc9PGekmVE8D5uQJcvR7XWqCFqsrsYq/IoeWurOO1RVgvADbCohdAaUhV4CMiL
	 93HGtHFTxracw9IPehvXrq3+6Lzm6qNWBmJJTRIc=
From: Dirk Gouders <dirk@gouders.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        Niklas
 Neronin <niklas.neronin@linux.intel.com>,
        Nick Nielsen
 <nick.kainielsen@free.fr>, grm1 <grm1@mailbox.org>
Subject: Re: [PATCH 3/6] usb: xhci-pci: add support for hosts with zero USB3
 ports
In-Reply-To: <20251022233458.43a5aa9d.michal.pecio@gmail.com> (Michal Pecio's
	message of "Wed, 22 Oct 2025 23:34:58 +0200")
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
	<20250917210726.97100-4-mathias.nyman@linux.intel.com>
	<ghwm4msmyt.fsf@gouders.net>
	<20251022233458.43a5aa9d.michal.pecio@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Thu, 23 Oct 2025 07:13:48 +0200
Message-ID: <ghsefaryib.fsf@gouders.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Michal Pecio <michal.pecio@gmail.com> writes:

> On Wed, 22 Oct 2025 22:25:30 +0200, Dirk Gouders wrote:
>> I noticed that on my notebook (Lenovo ThinkPad L14 Gen 5, model
>> 21L5CTO1WW) the integrated camera is no longer detected.
>> 
>> Bisecting this problem (in Linus' tree) led me to this commit.
>
> Hi,
>
> Probably not only the camera but if you run 'lsusb' you will see that
> the whole bus is missing.
>
> That's a known bug, fixed by 8607edcd1748 in Greg's USB repository.

Thanks for that information and sorry for the noise.

Regards,

Dirk

