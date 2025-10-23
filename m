Return-Path: <linux-usb+bounces-29584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0182C01B9F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 16:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E8073BA923
	for <lists+linux-usb@lfdr.de>; Thu, 23 Oct 2025 14:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2903B2D5955;
	Thu, 23 Oct 2025 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnO9GxGG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C31E9905
	for <linux-usb@vger.kernel.org>; Thu, 23 Oct 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228797; cv=none; b=Ohp2ktAFUQALf3govGY7kdiIX2Msm4Irl7KPHXL9vi3iGrxJqVHKFmHGmjFPD/BF4PAVV+SXPwxRMDQ+L3t5QgP/z6e0Z7am9phb8egYsXIRF3ped/KgZNPkQTV5YMUt4nTeaAbLa6OxeSn/792zvmr/bCxr2rSIF/PX79IxZzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228797; c=relaxed/simple;
	bh=XfG7tBlrLksW1fSYV+g18KqLd2VZfcj7jC9PGDmokyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzrqoe69sd0JvuCVoVD2geZP1kXZHTf2F1a2zILugW+Te+smEsRnWKRLRnlw5k88PfrUUFqQ0vHPDMC5MqfT2ljqAL8FIgBZoYES0/avEAs0fp5pgQoCQPZS6CNRZA7ZKPoCfDq7Z5OHcAXirR+ZNIl2qV5pMye1q1hZZ+YDpgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnO9GxGG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85D3FC4CEE7;
	Thu, 23 Oct 2025 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761228797;
	bh=XfG7tBlrLksW1fSYV+g18KqLd2VZfcj7jC9PGDmokyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YnO9GxGGI+Jd3r3rb0LLOldZfXtaIJP/LiwGAZRAbysuAxX+9wKVYgpAlzxgjayLX
	 XdrAFfBC2d+x374D+mh8dtJa2pYQdd1Yn1WErkDsEJTqbbcmYwWXC+nHlyGkol0m3A
	 PUZUYLAaM0e+/n/bm9YpfvvMThiNBFkU6UZu4r0yttQAnoUZj6yM0fVYN0LZ72KMrX
	 3X39a0MrWiIl955Mt/EBSTmh0qFUpueUHdQiHBZR5vIJODN8gk1Hp8zkk96OiNZWqy
	 FbGaB06PihUzNGWBzdf/FuY9yVWLtDGeFu+iD8pqb+30GMoyJJcfmMGoB0UND8cpql
	 3/BzZAQeU5zHA==
Message-ID: <02191522-b3f7-459e-ae46-12788f36209a@kernel.org>
Date: Thu, 23 Oct 2025 09:13:15 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Reset NHI during S4 restore_noirq() callback
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: mario.limonciello@amd.com, andreas.noever@gmail.com, westeri@kernel.org,
 YehezkelShB@gmail.com, Sanath.S@amd.com, linux-usb@vger.kernel.org
References: <20251023050354.115015-1-superm1@kernel.org>
 <20251023055603.GU2912318@black.igk.intel.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20251023055603.GU2912318@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 12:56 AM, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Oct 23, 2025 at 12:03:26AM -0500, Mario Limonciello (AMD) wrote:
>> When a machine is restored from S4 if the firmware CM has created
>> tunnels there can be an incongruity of expectation from the kernel
>> when compared to booting from S5.
>>
>> For example this incongruity can lead to problems like the display
>> not working properly if the firmware CM didn't turn it on pre-OS
>> but the OS had it on before entering S4.
>>
>> Add an extra restore_noirq() callback to explicitly reset the NHI
>> before running the rest of the resume sequence.  This will allow
>> the standard discovery and probing routines to run and create the
>> tunnels as expected.
>>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>> Cc: Sanath.S@amd.com
>> ---
>>   drivers/thunderbolt/nhi.c | 15 ++++++++++++++-
>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
>> index 5f63f9b9cf405..042d184637a93 100644
>> --- a/drivers/thunderbolt/nhi.c
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -51,6 +51,8 @@ static bool host_reset = true;
>>   module_param(host_reset, bool, 0444);
>>   MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
>>   
>> +static void nhi_reset(struct tb_nhi *nhi);
> 
> Please move the whole function above nhi_restore_noirq() then.

OK - wasn't sure that would be OK to do.

> 
>> +
>>   static int ring_interrupt_index(const struct tb_ring *ring)
>>   {
>>   	int bit = ring->hop;
>> @@ -1077,6 +1079,17 @@ static int nhi_resume_noirq(struct device *dev)
>>   	return tb_domain_resume_noirq(tb);
>>   }
>>   
>> +static int nhi_restore_noirq(struct device *dev)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct tb *tb = pci_get_drvdata(pdev);
>> +	struct tb_nhi *nhi = tb->nhi;
>> +
>> +	nhi_reset(nhi);
>> +
> 
> Now that we do this, should ge get rid of the S4 things we do in
> tb_resume_noirq()? Especially this block:
> 
> 	/*
> 	 * If we get here from suspend to disk the boot firmware or the
> 	 * restore kernel might have created tunnels of its own. Since
> 	 * we cannot be sure they are usable for us we find and tear
> 	 * them down.
> 	 */
> 	tb_switch_discover_tunnels(tb->root_switch, &tunnels, false);
> 	list_for_each_entry_safe_reverse(tunnel, n, &tunnels, list) {
> 		if (tb_tunnel_is_usb3(tunnel))
> 			usb3_delay = 500;
> 		tb_tunnel_deactivate(tunnel);
> 		tb_tunnel_put(tunnel);
> 	}
> 

Yeah; I agree this block should go now.

> Also have you checked that this works when you have tunnels such as P2P
> (networking)?

I didn't check this, I'll spin a v2 and get that checked before posting it.

> 
>> +	return nhi_resume_noirq(dev);
>> +}
>> +
>>   static int nhi_suspend(struct device *dev)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>> @@ -1449,7 +1462,7 @@ static const struct dev_pm_ops nhi_pm_ops = {
>>   					    * pci-tunnels stay alive.
>>   					    */
>>   	.thaw_noirq = nhi_thaw_noirq,
>> -	.restore_noirq = nhi_resume_noirq,
>> +	.restore_noirq = nhi_restore_noirq,
>>   	.suspend = nhi_suspend,
>>   	.poweroff_noirq = nhi_poweroff_noirq,
>>   	.poweroff = nhi_suspend,
>> -- 
>> 2.43.0


