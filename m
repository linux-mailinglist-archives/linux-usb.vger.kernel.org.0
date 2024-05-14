Return-Path: <linux-usb+bounces-10254-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87C8C4AE2
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 03:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72E3A2835D6
	for <lists+linux-usb@lfdr.de>; Tue, 14 May 2024 01:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB27717F7;
	Tue, 14 May 2024 01:30:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-3.slingshot.co.nz (smtp-3.slingshot.co.nz [60.234.4.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C89ED8
	for <linux-usb@vger.kernel.org>; Tue, 14 May 2024 01:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.234.4.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650216; cv=none; b=hckTh3lQbjMHaU0oO/SQgOtz7EglJ+2Nliyt2Uvi6CrNfgAIKUyKynzdRdnk3790I4NoD8RicyNjDDuIWdD7rdsmi1HitsJk+mpHoBuit3t8RMgKpoCMdzXas8+LAYfxTIHZBSDkys+UGyqzcyxKFWY3paXL2wsQZeehVFehsHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650216; c=relaxed/simple;
	bh=UBvkaN7OfGD7yGAg5j9cT2UHYOi/jIDo9m5YtJk37+k=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=i9tp8LSGqoWLK8e0jGm2FBfQ6G4cSqjGTwvmwCdL8kEyuOZMoRWXj0Z4rfJqZ+8/iL1K9tGUHvX6NA2BCNh1B51YtLavhJ6H+GxLwXPILx+9tHwSFyOcItZRu+tCTMfMT/Pu6TS18GZFIjGvqKHDfeeV4eaGxxyk8P0uOwVsqsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slingshot.co.nz; spf=pass smtp.mailfrom=slingshot.co.nz; arc=none smtp.client-ip=60.234.4.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slingshot.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slingshot.co.nz
Received: from [49.225.18.18] (port=56967 helo=[192.168.68.55])
	by smtp-3.slingshot.co.nz with esmtpa (Exim 4.90_1)
	(envelope-from <charles7@slingshot.co.nz>)
	id 1s6ggG-0002z9-Am
	for linux-usb@vger.kernel.org; Tue, 14 May 2024 13:10:12 +1200
Message-ID: <befe7135-16f1-4a3f-8164-b15dd748e397@slingshot.co.nz>
Date: Tue, 14 May 2024 13:10:10 +1200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Content-Language: en-US
From: Charles Harris <charles7@slingshot.co.nz>
Subject: USB Device ID
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GeoIP: NZ
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --

Hi Alan and all
Noticed conversation as below on earlier post.

I would like to know if this code could be used in a similar case.

Linux Mint 21.3   Using LibreCalc

With USB RFID tag readers, (2 or more reader)  most enter direct into open focus spreadsheet.  However with no device number.   Have same pid and vid.

As the read from USB tag goes to the spreadsheet, can the device number  eg 004 and the bus number eg 004 be appended to the data read into the spreadsheet.  This would enable spreadsheet identify each reader and its location, to manipulate the tag reads by the  location etc.

If so, how do I go about setting up?

Your comments and advice would be much appreciated.

Charles Harris


