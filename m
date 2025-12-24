Return-Path: <linux-usb+bounces-31738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AFDCDB605
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 06:16:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D57A9301463D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 05:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC782989B5;
	Wed, 24 Dec 2025 05:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="CybNPw4a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7CE8635D
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 05:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766553346; cv=none; b=f5XpXz1CW5VBj57KGy0x6DtGtbj3b7u/klLSv2jtt/0JNUdmHn/QAH76oOTq9nJcGJtEhs1MroFUFPHy4orzweHvPZOgHol1J4hUIGbo4DSIVu5N56SYOL099uvFbV8FPF1KVCSknuxQjJ7SCocTl4F91ClDD+GgSCMCtFkEOk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766553346; c=relaxed/simple;
	bh=iY91bWCwiL2yU6XlErShHEs/AWxxXBdbR/oZ3a/cBxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nb6pTtt3x5cNic4I2Ubqhu/aa7cYUSNGME5tw1b14hJQNXsjUYxahcpLOW+tnlp5jjryYyEERuhR8iQh6AcYdmI9LNyL0CJ812NY1FEEL7HNU0reUDqTsGDn36NLogKI/hsUzE0IN1cJlInnfRzYy+CRbJEE/1uSi7rjne8THOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=CybNPw4a; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [192.168.55.29] (ip174-65-98-148.sd.sd.cox.net [174.65.98.148])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4dbg7V3syDz11cl;
	Wed, 24 Dec 2025 00:15:34 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1766553337; bh=iY91bWCwiL2yU6XlErShHEs/AWxxXBdbR/oZ3a/cBxc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CybNPw4as1Z5Heg19GvDmG2zRTPbK8cOCz8Wy79XSIf3eHCkXyGn3XVPtA/UgsXtf
	 xgz3nS+4tvmnujtghPXQdNr8Bm2Df5ULumPq3vib9m7FPEbIeV7YQttxQ4UIQ5iazI
	 K56LJMz6fY09nPDZOHT+htwmDBnQh11gaO1CVdNw=
Message-ID: <4da533b8-d216-4846-b4b4-c69a5ea6e2ee@panix.com>
Date: Tue, 23 Dec 2025 21:15:31 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] usb:xhci:route device to secondary interrupters
To: raoxu <raoxu@uniontech.com>, mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 michal.pecio@gmail.com, niklas.neronin@linux.intel.com, zhanjun@uniontech.com
References: <B857856CEAB5DF94+20251223101929.202681-1-raoxu@uniontech.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <B857856CEAB5DF94+20251223101929.202681-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/23/25 02:19, raoxu wrote:

> Some xHCI hosts expose multiple MSI/MSI-X vectors, but the driver
> currently routes all transfer completions through interrupter 0.
> This can lead to unnecessary contention on the primary event ring
> and IRQ vector.
> 
> Create a small set of secondary interrupters in xhci_mem_init().
> Cap the number in software (MAX_SECONDARY_INTRNUM, default 4).
> If any secondary allocation fails, roll back and keep using
> interrupter 0 only.

> Unify primary and secondary handling on xhci->interrupters[].
> Use the same paths for enable/disable and teardown.
> Keep behavior consistent across run/stop/resume.

I've been trying to break it (suspend/resume/sudden 
disconnect/disconnected while suspended/resumed) and so far, so good.

That being said, when it comes back from a hibernation resume the IRQ 
grouping seems to be "different", with it using a different set of IRQs 
after before the hibernation; not sure if that's intentional or not:

----
[E0] 1119 /home/kenny> fgrep xhci /proc/interrupts
  178:          0          0          0          0          0          0 
        185          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    0-edge      xhci_hcd
  179:          0          0          0          0          0          0 
          0    1395350          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    1-edge      xhci_hcd
  180:          0          0          0          0          0          0 
          0          0        121          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    2-edge      xhci_hcd
  181:          0          0          0          0          0          0 
          0          0          0    1250385          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    3-edge      xhci_hcd
  182:          0          0          0          0          0          0 
          0          0          0          0        300          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    4-edge      xhci_hcd
  186:        592          0          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
  187:          0      11118          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    1-edge      xhci_hcd
  188:          0          0      57856          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    2-edge      xhci_hcd
  189:          0          0          0      61344          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    3-edge      xhci_hcd
  190:          0          0          0          0     234011          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    4-edge      xhci_hcd
[23/21:01:16 kenny@xps-9320]
[E0] 1120 /home/kenny> fgrep xhci /proc/interrupts
  178:          0          0          0          0          0          0 
        185          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    0-edge      xhci_hcd
  179:          0          0          0          0          0          0 
          0    1395350          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    1-edge      xhci_hcd
  180:          0          0          0          0          0          0 
          0          0        121          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    2-edge      xhci_hcd
  181:          0          0          0          0          0          0 
          0          0          0    1250385          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    3-edge      xhci_hcd
  182:          0          0          0          0          0          0 
          0          0          0          0        300          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    4-edge      xhci_hcd
  186:        592          0          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
  187:          0      11118          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    1-edge      xhci_hcd
  188:          0          0      57856          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    2-edge      xhci_hcd
  189:          0          0          0      61344          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    3-edge      xhci_hcd
  190:          0          0          0          0     234011          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    4-edge      xhci_hcd
[23/21:01:18 kenny@xps-9320]
[E0] 1121 /home/kenny> systemctl hibernate
[23/21:01:35 kenny@xps-9320]
[E0] 1122 /home/kenny> fgrep xhci /proc/interrupts
  178:          0          0          0          0          0          0 
        185          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    0-edge      xhci_hcd
  179:          0          0          0          0          0          0 
          0    1395350          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    1-edge      xhci_hcd
  180:          0          0          0          0          0          0 
          0          0        121          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    2-edge      xhci_hcd
  181:          0          0          0          0          0          0 
          0          0          0    1250385          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    3-edge      xhci_hcd
  182:          0          0          0          0          0          0 
          0          0          0          0        300          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    4-edge      xhci_hcd
  186:        796          0          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
  187:          0      11128          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    1-edge      xhci_hcd
  188:         55          0      57856          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    2-edge      xhci_hcd
  189:      60793          0          0      61344          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    3-edge      xhci_hcd
  190:       5951          0          0          0     234011          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    4-edge      xhci_hcd
[23/21:05:12 kenny@xps-9320]
[E0] 1123 /home/kenny> fgrep xhci /proc/interrupts
  178:          0          0          0          0          0          0 
        185          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    0-edge      xhci_hcd
  179:          0          0          0          0          0          0 
          0    1395350          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    1-edge      xhci_hcd
  180:          0          0          0          0          0          0 
          0          0        121          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    2-edge      xhci_hcd
  181:          0          0          0          0          0          0 
          0          0          0    1250385          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    3-edge      xhci_hcd
  182:          0          0          0          0          0          0 
          0          0          0          0        300          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    4-edge      xhci_hcd
  186:        796          0          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
  187:          0      11128          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    1-edge      xhci_hcd
  188:         55          0      57856          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    2-edge      xhci_hcd
  189:      60793          0          0      61344          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    3-edge      xhci_hcd
  190:       5951          0          0          0     234011          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    4-edge      xhci_hcd
[23/21:05:27 kenny@xps-9320]
[E0] 1124 /home/kenny> fgrep xhci /proc/interrupts
  178:          0          0          0          0          0          0 
        185          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    0-edge      xhci_hcd
  179:          0          0          0          0          0          0 
          0    1395350          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    1-edge      xhci_hcd
  180:          0          0          0          0          0          0 
          0          0        121          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    2-edge      xhci_hcd
  181:          0          0          0          0          0          0 
          0          0          0    1250385          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    3-edge      xhci_hcd
  182:          0          0          0          0          0          0 
          0          0          0          0        300          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    4-edge      xhci_hcd
  186:        796          0          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
  187:          0      11128          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    1-edge      xhci_hcd
  188:         55          0      57856          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    2-edge      xhci_hcd
  189:      60793          0          0      61344          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    3-edge      xhci_hcd
  190:       5951          0          0          0     234011          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    4-edge      xhci_hcd
[23/21:05:55 kenny@xps-9320]
[E0] 1125 /home/kenny> fgrep xhci /proc/interrupts
  178:          0          0          0          0          0          0 
        185          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    0-edge      xhci_hcd
  179:          0          0          0          0          0          0 
          0    1395350          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    1-edge      xhci_hcd
  180:          0          0          0          0          0          0 
          0          0        121          0          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    2-edge      xhci_hcd
  181:          0          0          0          0          0          0 
          0          0          0    1250385          0          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    3-edge      xhci_hcd
  182:          0          0          0          0          0          0 
          0          0          0          0        300          0 
    0          0 IR-PCI-MSI-0000:00:0d.0    4-edge      xhci_hcd
  186:        796          0          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    0-edge      xhci_hcd
  187:          0      11128          0          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    1-edge      xhci_hcd
  188:         55          0      57856          0          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    2-edge      xhci_hcd
  189:      60793          0          0      61344          0          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    3-edge      xhci_hcd
  190:       5951          0          0          0     234011          0 
          0          0          0          0          0          0 
    0          0 IR-PCI-MSI-0000:00:14.0    4-edge      xhci_hcd
[23/21:06:35 kenny@xps-9320]
----

So:

Tested-By: Kenneth R. Crudup <kenny@panix.com>

> Tested:
> S3 suspend/resume
> S4 hibernate/resume
> USB storage (U-disk), camera, mouse
-K

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


