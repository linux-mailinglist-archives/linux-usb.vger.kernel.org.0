Return-Path: <linux-usb+bounces-8001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 575CC87D335
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 19:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73BCA1C2190D
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 18:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28514F211;
	Fri, 15 Mar 2024 18:03:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21FF4CB3D
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710525819; cv=none; b=M9YMM2MwR7SGMnezLgyIk7bL+fm9SzyF+gnDxxhXchVuxh4L08FiKqfeFqLrnzIDdZQ2X+3kgVT0EotfSI8CyMrNiRomQP80AIEfQxSZPNH+o3DkqeBk5Tzh7FgYAUGn5mlPokZNkabU6HoVX2PjrMYhOAhGN8fkWsxjXnOqW0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710525819; c=relaxed/simple;
	bh=FzUTGuAuyqLk79Lgu+TVM4cpqGrP0lir9/aQZaG5YOU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=s65Kvojxk2JLq/usA96wElJ9qzjBKi+25tE09qh9QoK2nBGWS+na/QkZvpD4Le8AEaSrvlVtfzjNy3+/rbLapJJcdH0LNdTcMEpKjaL2qG5e+ZLo/3CFj5Fri0/y9DBFGN93FS6E0ONt2+bKijs74n2gadPjypBQ32rVRROv3mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.178.112] (p57b378ee.dip0.t-ipconnect.de [87.179.120.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CED9961E5FE01;
	Fri, 15 Mar 2024 19:02:44 +0100 (CET)
Message-ID: <563d514d-2a42-4a39-9cb3-e7f048bf1c47@molgen.mpg.de>
Date: Fri, 15 Mar 2024 19:02:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux warns `usb: port power management may be unreliable` on
 several systems
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Ivan Hu <ivan.hu@canonical.com>, fwts-devel@lists.ubuntu.com,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>
References: <5406d361-f5b7-4309-b0e6-8c94408f7d75@molgen.mpg.de>
 <7efc3c5b-3237-30c9-1ff2-88747897ed57@linux.intel.com>
 <0cd07b3e-148f-9d0b-7ef4-917b0ed23cbd@linux.intel.com>
 <9c53ec38-812f-f701-d2f6-91e28367bb82@linux.intel.com>
 <62595888-9339-41fa-aab6-f76e581e371f@molgen.mpg.de>
 <fac3f92f-a13e-43b7-b707-e226ac47b256@canonical.com>
 <7c10e063-39d0-425a-8f4f-29d411675864@molgen.mpg.de>
In-Reply-To: <7c10e063-39d0-425a-8f4f-29d411675864@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


Am 04.03.24 um 07:57 schrieb Paul Menzel:

> Am 04.03.24 um 03:13 schrieb ivanhu:
>> Paul, thanks for report this.
>>
>> Could you help to file a bug on launchpad of fwts?
>> Please refer to, 
>> https://wiki.ubuntu.com/FirmwareTestSuite/FirmwareTestSuiteReportBug
> 
> Done [1].

I referenced the wrong report. It was bug #2055855 [2]. And as a 
heads-up, that Ivan posted a patch for fwts [3].


Kind regards,

Paul


> [1]: https://bugs.launchpad.net/fwts/+bug/2051336
>       "[FEAT] enable the dumping debug messages on S0ix failure for intel platforms"
[2]: https://bugs.launchpad.net/fwts/+bug/2055855
      "[FEAT] Check _PLD are not present for unusable USB ports"
[3]: https://lists.ubuntu.com/archives/fwts-devel/2024-March/013842.html

