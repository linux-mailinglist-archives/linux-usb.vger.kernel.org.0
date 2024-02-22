Return-Path: <linux-usb+bounces-6896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D4185FCE8
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 16:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 897C11F276C8
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 15:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2888414F9CB;
	Thu, 22 Feb 2024 15:45:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7662D14C5B5
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708616709; cv=none; b=PjKUDlNl4WOh32kNHFniPuEtYBnpmSL8ptNr+KE4IfPU87Lwzuf5h7aIDm84yjsujHLMg6qIbbLP8wLW/1oqdPIUMYHUKXDLrxemr/yNzcVPEGthlZ8fJnw3kQE6+7zU77fgF4kNuPAxIl/JmB/c+H2P3yHASndvFA9QZzbQmxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708616709; c=relaxed/simple;
	bh=h1cNsBFXEuqC124iU3cXvGFB2oden75S4le8EHxmNzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UF1f6m15RIh2oCm8EdBXoEU8Dmag0zFRyBRvzwtD69OCCQH0kVtJYkZdmLHdbVrm0QsVPVfXk+jvFb2+NKD4GjXlDYugqT/ln0xplR8IhHyVgNSGwkpwz7eD1aRbwcEvwJnIQL9d2FnnMUJCq8zYr8nqczcPWW1rvwWm2uvVynk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AF2D861E5FE05;
	Thu, 22 Feb 2024 16:44:42 +0100 (CET)
Message-ID: <0e05a548-ded2-48f0-a6c1-bdbc71af5441@molgen.mpg.de>
Date: Thu, 22 Feb 2024 16:44:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH v2 2/2] usb: port: Don't try to peer unused USB ports
 based on location
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, aros@gmx.com,
 stern@rowland.harvard.edu, Mike Jones <mike@mjones.io>,
 Hans de Goede <hdegoede@redhat.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <1075b61e-d380-8e45-61e2-33d181444594@linux.intel.com>
 <20240220135946.4028553-1-mathias.nyman@linux.intel.com>
 <20240220135946.4028553-2-mathias.nyman@linux.intel.com>
 <ba2257e8-e34e-462d-828b-92dbcb747f8a@molgen.mpg.de>
 <2a6de928-a23c-8202-61c9-af41d515fcbc@linux.intel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2a6de928-a23c-8202-61c9-af41d515fcbc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Mathias,


Am 22.02.24 um 14:19 schrieb Mathias Nyman:
> On 21.2.2024 13.19, Paul Menzel wrote:
>> [CC: +Mike, +Hans, +Kai-Heng]
>>
>>
>> On the Dell XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022, the warning is 
>> also gone with v2 of your patches.
> 
> Thanks for testing, I'll submit these as proper patches.

Just a note, that I also successfully tested it on the Dell Precision 
3620 and documented this in the Linux Kernel Bugzilla issue [1].

I wasn’t able to test the two other systems yet.


Kind regards,

Paul


[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218486

