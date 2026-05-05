Return-Path: <linux-usb+bounces-36989-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPFPMlxf+mm3OAMAu9opvQ
	(envelope-from <linux-usb+bounces-36989-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 23:21:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9FA4D3DE2
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 23:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E72273031E83
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 21:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DCF448BD42;
	Tue,  5 May 2026 21:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kq1P3WsK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9039B3D666A;
	Tue,  5 May 2026 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778016086; cv=none; b=Ur4s6V1oiUw0EkcXYrtJABOmzUBcj2iKhoT0+6Enao8dUBT1MWaSHuOEaLkWK2q5nFeYsWZyiMdhdpj6poCV48Q9PAM9Pd6AkKCwCA4lar72KzoX2PkBHQJ6lQ46E/VRfcUQ2FUqo7QPmF+6U6136k+Sja01B1UMAlYhRkQ8stE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778016086; c=relaxed/simple;
	bh=xghO5CBSsFyAOKh7lxYXeF6ZcCL6Qp6b/FpUpisDQXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DuwgbXSA+fyyjvz14WIiEbZ5T3vYl/7IEF7L5kUY5oClWLf1dln/YIZxSMmrAPfQb8bV20P1JgBfnWHAMlUheT3xk5jtVua+2yA+ZXaCPx6LRtgSbFz59DkULv1YxPsv6OW5d1IKERr5Pe2v+BUBMvjY6SlCj0YEUPvGcfVLSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kq1P3WsK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D7CC2BCB4;
	Tue,  5 May 2026 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778016086;
	bh=xghO5CBSsFyAOKh7lxYXeF6ZcCL6Qp6b/FpUpisDQXA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kq1P3WsKcDWMVeSzrcmrVdo/kHY9WnUis0i48K0FdS7Qn9NRZ1BXDvZc9xH9tMvKw
	 FZvuEybn1Fxmo8BSZbGjMHufeRPwhi9ppA4x+lZW9y+dyFb6tZLyrfyRw9YuIt3GOU
	 uznU70mFSaM6AKgPG25DSoRLfqLTsms++CwgFhtc0CVxNHhGYfr9mqsHfF3PNDndDS
	 VVrPAWhff/3pAT76Ri+rBu+4MYFjULdNmk31bb7rp5Q+J5TTA4Ae8dnTTZWm+wj7pE
	 8aZhyVdqmH7VVppuegI+5YGsbwBlhKxd8GFprwO96O5ksUeZCOkyojlBjeIQYredJr
	 ybH5ZE+xS/RAA==
Message-ID: <e0afbf09-2ea5-4c52-9c0a-8a6e606c884e@kernel.org>
Date: Tue, 5 May 2026 16:21:24 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
Content-Language: en-US
To: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>,
 Kenneth Crudup <kenny@panix.com>
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pooja Katiyar <pooja.katiyar@intel.com>,
 Rene Sapiens <rene.sapiens@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20260106053749.61440-1-superm1@kernel.org>
 <20260107093353.GO2275908@black.igk.intel.com>
 <158442b3-28c2-4f8c-ba42-0b9c6661c650@kernel.org>
 <20260108114205.GS2275908@black.igk.intel.com>
 <ad8cf89d-a171-4e72-996e-8b09d16f9017@kernel.org>
 <20260109072318.GU2275908@black.igk.intel.com>
 <eb4685e6-04fc-4d21-bd98-2a297c183966@linux.intel.com>
 <8cf57879-5fa7-4d23-afb4-6ef99f0ce97a@kernel.org>
 <5834100b-788c-4520-9b70-f462f65149ca@linux.intel.com>
 <6438b5a3-a0f4-4c7d-9f56-59cdf7f5148f@kernel.org>
 <e821e8a1-8256-4f80-ab30-95f066d25946@panix.com>
 <54d7e199-0887-4129-8743-dce13cc5d60a@linux.intel.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <54d7e199-0887-4129-8743-dce13cc5d60a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2E9FA4D3DE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36989-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,intel.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 1/29/26 17:13, Katiyar, Pooja wrote:
> Hello,
> 
> On Mon, Jan 19, 2026 at 02:13:50PM -0800, Kenneth Crudup wrote:
>>
>> On 1/19/26 11:59, Mario Limonciello (AMD) (kernel.org) wrote:
>>
>>> On 1/17/2026 10:57 AM, Katiyar, Pooja wrote:
>>>
>>>>> I have confirmation the hack patch does help the issue for us too.
>>>>>
>>>>> If your patch doesn't work another logical solution could be to destroy
>>>>> all the tunnels as part of the PM freeze callback (not just the DP
>>>>> resources).  Maybe even unify the suspend and freeze codepaths for more
>>>>> opportunities for code reuse?
>>>>>
>>>>
>>>> Thanks for confirming the hack patch helps!
>>>>
>>>> We are actually working on a solution that releases the DP resources and
>>>> suspends the switch as part of the freeze sequence. This way the hibernation
>>>> image that is stored doesn't contain any active tunnels, and during resume
>>>> we get a DP hotplug notification for a new tunnel, similar to S5. So far
>>>> this patch is working fine but is under review.
>>>>
>>>
>>> Thanks.  If you want early testing from us too before you're ready to
>>> post publicly feel free to ping it offline to me too.
>>
>> I'd like to get a CC: on that, too.
>>
>> I've been testing that hack patch and will test further later tonight.
>>
>> The issue I'm trying to chase down (and not sure if any of this will
>> help with this, I wonder if it's really BIOS/EC related) is often times
>> that after a suspend (or hibernate, but I use "suspend then hibernate",
>> which I think does both and chooses which to use upon resume) and then
>> connect to a different dock (or setup) from the one I'd suspended with,
>> sometimes I have to unplug/replug my TB cable, otherwise I either get no
>> recognition of my new display setup (and sometimes TB devices) or it'll
>> try and use the same monitor resolution of the previously-connected
>> monitor (as if the TB subsystem doesn't recognize things have changed).
>>
> 
> Below is the patch series that addresses mentioned issue. There are two
> patches in this series. The series takes care of releasing the DP resources
> as part of freeze call before the hibernation image is created. You can test
> it for your issues and let us know if it helps.
> 
> Please note that these changes are still under internal review and are
> subject to change.
> 
> From: Pooja Katiyar <pooja.katiyar@intel.com>
> Date: Thu, 22 Jan 2026 11:57:07 -0800
> Subject: [RFC PATCH 1/2] thunderbolt: Add helper functions for suspend/resume
>   operations
> 
> Extract common resume logic from tb_resume_noirq() into
> tb_recover_tunnels() helper function to consolidate switch resume,
> tunnel discovery/teardown, tunnel recreation, and topology
> reinitialization logic.
> 
> Introduce __nhi_suspend_ops() and __nhi_resume_noirq() helper functions
> to consolidate common suspend/resume logic used by multiple PM callbacks.
> 
> This is a preparatory cleanup for hibernation improvements.
> 
> Co-developed-by: Rene Sapiens <rene.sapiens@linux.intel.com>
> Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
> Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
> ---
>   drivers/thunderbolt/nhi.c | 46 ++++++++++++++++++++++++++-------------
>   drivers/thunderbolt/tb.c  | 34 ++++++++++++++++++++---------
>   2 files changed, 55 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index 6d0c9d37c55d..5b84223937fb 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -971,7 +971,14 @@ static irqreturn_t nhi_msi(int irq, void *data)
>   	return IRQ_HANDLED;
>   }
>   
> -static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
> +static int __nhi_suspend_ops(struct tb_nhi *nhi, bool wakeup)
> +{
> +	if (nhi->ops && nhi->ops->suspend_noirq)
> +		return nhi->ops->suspend_noirq(nhi, wakeup);
> +	return 0;
> +}
> +
> +static int nhi_suspend_noirq(struct device *dev)
>   {
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	struct tb *tb = pci_get_drvdata(pdev);
> @@ -982,18 +989,7 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
>   	if (ret)
>   		return ret;
>   
> -	if (nhi->ops && nhi->ops->suspend_noirq) {
> -		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	return 0;
> -}
> -
> -static int nhi_suspend_noirq(struct device *dev)
> -{
> -	return __nhi_suspend_noirq(dev, device_may_wakeup(dev));
> +	return __nhi_suspend_ops(nhi, device_may_wakeup(dev));
>   }
>   
>   static int nhi_freeze_noirq(struct device *dev)
> @@ -1029,10 +1025,17 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
>   static int nhi_poweroff_noirq(struct device *dev)
>   {
>   	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct tb *tb = pci_get_drvdata(pdev);
> +	struct tb_nhi *nhi = tb->nhi;
>   	bool wakeup;
> +	int ret;
> +
> +	ret = tb_domain_suspend_noirq(tb);
> +	if (ret)
> +		return ret;
>   
>   	wakeup = device_may_wakeup(dev) && nhi_wake_supported(pdev);
> -	return __nhi_suspend_noirq(dev, wakeup);
> +	return __nhi_suspend_ops(nhi, wakeup);
>   }
>   
>   static void nhi_enable_int_throttling(struct tb_nhi *nhi)
> @@ -1051,7 +1054,7 @@ static void nhi_enable_int_throttling(struct tb_nhi *nhi)
>   	}
>   }
>   
> -static int nhi_resume_noirq(struct device *dev)
> +static int __nhi_resume_noirq(struct device *dev)
>   {
>   	struct pci_dev *pdev = to_pci_dev(dev);
>   	struct tb *tb = pci_get_drvdata(pdev);
> @@ -1074,6 +1077,19 @@ static int nhi_resume_noirq(struct device *dev)
>   		nhi_enable_int_throttling(tb->nhi);
>   	}
>   
> +	return 0;
> +}
> +
> +static int nhi_resume_noirq(struct device *dev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct tb *tb = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = __nhi_resume_noirq(dev);
> +	if (ret)
> +		return ret;
> +
>   	return tb_domain_resume_noirq(tb);
>   }
>   
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 4f5f1dfc0fbf..69015def6cd1 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3110,22 +3110,21 @@ static void tb_restore_children(struct tb_switch *sw)
>   	}
>   }
>   
> -static int tb_resume_noirq(struct tb *tb)
> +/**
> + * tb_recover_tunnels() - Common resume logic for suspend and hibernate
> + * @tb: Domain to resume
> + *
> + * Common recovery logic shared between suspend resume and hibernate restore.
> + * Handles switch resume, tunnel discovery/teardown, tunnel recreation, and
> + * topology reinitialization.
> + */
> +static void tb_recover_tunnels(struct tb *tb)
>   {
>   	struct tb_cm *tcm = tb_priv(tb);
>   	struct tb_tunnel *tunnel, *n;
>   	unsigned int usb3_delay = 0;
>   	LIST_HEAD(tunnels);
>   
> -	tb_dbg(tb, "resuming...\n");
> -
> -	/*
> -	 * For non-USB4 hosts (Apple systems) remove any PCIe devices
> -	 * the firmware might have setup.
> -	 */
> -	if (!tb_switch_is_usb4(tb->root_switch))
> -		tb_switch_reset(tb->root_switch);
> -
>   	tb_switch_resume(tb->root_switch, false);
>   	tb_free_invalid_tunnels(tb);
>   	tb_free_unplugged_children(tb->root_switch);
> @@ -3166,6 +3165,21 @@ static int tb_resume_noirq(struct tb *tb)
>   	tb_switch_enter_redrive(tb->root_switch);
>   	 /* Allow tb_handle_hotplug to progress events */
>   	tcm->hotplug_active = true;
> +}
> +
> +static int tb_resume_noirq(struct tb *tb)
> +{
> +	tb_dbg(tb, "resuming...\n");
> +
> +	/*
> +	 * For non-USB4 hosts (Apple systems) remove any PCIe devices
> +	 * the firmware might have setup.
> +	 */
> +	if (!tb_switch_is_usb4(tb->root_switch))
> +		tb_switch_reset(tb->root_switch);
> +
> +	tb_recover_tunnels(tb);
> +
>   	tb_dbg(tb, "resume finished\n");
>   
>   	return 0;

Sorry for the insanely big delay, but we were getting totally unexpected 
results with your patch series.  It was helping; but then even with it 
taken off it was also helping :P.

It turned out the issue that prompted my series got fixed in another 
way.  It took some time to figure out why.  It was fixed by this change:

15b1d7b77e9836ff4184093163174a1ef28bbdd7

That is basically because of the order of events the kernel does we were 
having a link training failure.  My series (and your patches) did change 
the order of events to adjust it.  But instead we are catching this 
sequence in the GPU driver and handling it more cleanly.


