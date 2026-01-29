Return-Path: <linux-usb+bounces-32918-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFjBN4vpe2mtJQIAu9opvQ
	(envelope-from <linux-usb+bounces-32918-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 00:13:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F96B59A5
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 00:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3DB83003BE0
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 23:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D5F374755;
	Thu, 29 Jan 2026 23:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9nV0iD+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9845E374723;
	Thu, 29 Jan 2026 23:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769728390; cv=none; b=V2wAHPZD9LEfyugQd9zH3GHqDWN7K7Udo4AYM/10ydQSsB3ICwf3li5B1zxlZ3WOkErJqvgQg9zjG5JhdNi16nM0X32RGwv5EFnyW/LWrZmjGlUxHRETCyqJOD7r+AjLE/1dmHSWpJk+L20g9JDKKgMa2jN1Oj1f4td8m41ZWeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769728390; c=relaxed/simple;
	bh=jdUS/RkeSge3ss6yLDkjwfreK1ASHBDC+C1xIUcfjZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ur49AXqJaw4yjVcAmrT/9+jcgUKJ3Muguruzs30zFtm/KvHcfkZP5U+j/GfcJzVTpKPWvH6iR5/OVSiW5y9FxCJxnaGNvf30olFibEQM+U3gs0yRlECFaFugD2YJ7VKobAGjcf5Rb6x/K1sH5VQx/cVUqJnaCEoEGBgHSxyQaLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9nV0iD+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769728388; x=1801264388;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jdUS/RkeSge3ss6yLDkjwfreK1ASHBDC+C1xIUcfjZ8=;
  b=R9nV0iD+l61v3VMyLGP9LrgD+mS8gGzgkhV5LGAOojHesICi0ll7ckN1
   bRGzSBXJqWFbgs/D2w+htyzNfsA1lwFeLroTMOR2n9unJ/iyb7Af6aXtg
   iETRu5YyvHwozOghRfDznsJRzkUzdoZVohvyWOJcGvglxQxjnBEawe7By
   30Sl7gN44TM64bAZsWknwS+64IDce4P/5MesirMmCU4tEH7CVqG9Ov01l
   tCEADnGcnldTupj5o+0Sqi9cMEtbxKUVrYPsqSkO86sr3i86ugGHzQMcY
   FjXW+0pPTM8kwpK071kluDPOadbIuqQRRB/uuGfEYycSU4s+5odq7Ngil
   A==;
X-CSE-ConnectionGUID: CEMMXZp4TjaB7+9otGVPzw==
X-CSE-MsgGUID: GUIPNsHhTgKu1JmuzCyGEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96444643"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="96444643"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 15:13:07 -0800
X-CSE-ConnectionGUID: GMgd1aUJQBmZJrcSAcpBew==
X-CSE-MsgGUID: 6wlxTZ5wQueoVkK/m1QWxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="209125431"
Received: from soc-5cg1426swj.clients.intel.com (HELO [10.121.193.43]) ([10.121.193.43])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 15:13:07 -0800
Message-ID: <54d7e199-0887-4129-8743-dce13cc5d60a@linux.intel.com>
Date: Thu, 29 Jan 2026 15:13:02 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] thunderbolt: Fix S4 resume incongruities
To: Kenneth Crudup <kenny@panix.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
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
Content-Language: en-US
From: "Katiyar, Pooja" <pooja.katiyar@linux.intel.com>
In-Reply-To: <e821e8a1-8256-4f80-ab30-95f066d25946@panix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,intel.com,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-32918-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pooja.katiyar@linux.intel.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: 04F96B59A5
X-Rspamd-Action: no action

Hello,

On Mon, Jan 19, 2026 at 02:13:50PM -0800, Kenneth Crudup wrote:
> 
> On 1/19/26 11:59, Mario Limonciello (AMD) (kernel.org) wrote:
> 
>> On 1/17/2026 10:57 AM, Katiyar, Pooja wrote:
>>
>>>> I have confirmation the hack patch does help the issue for us too.
>>>>
>>>> If your patch doesn't work another logical solution could be to destroy
>>>> all the tunnels as part of the PM freeze callback (not just the DP
>>>> resources).  Maybe even unify the suspend and freeze codepaths for more
>>>> opportunities for code reuse?
>>>>
>>>
>>> Thanks for confirming the hack patch helps!
>>>
>>> We are actually working on a solution that releases the DP resources and
>>> suspends the switch as part of the freeze sequence. This way the hibernation
>>> image that is stored doesn't contain any active tunnels, and during resume
>>> we get a DP hotplug notification for a new tunnel, similar to S5. So far
>>> this patch is working fine but is under review.
>>>
>>
>> Thanks.  If you want early testing from us too before you're ready to
>> post publicly feel free to ping it offline to me too.
> 
> I'd like to get a CC: on that, too.
> 
> I've been testing that hack patch and will test further later tonight.
> 
> The issue I'm trying to chase down (and not sure if any of this will
> help with this, I wonder if it's really BIOS/EC related) is often times
> that after a suspend (or hibernate, but I use "suspend then hibernate",
> which I think does both and chooses which to use upon resume) and then
> connect to a different dock (or setup) from the one I'd suspended with,
> sometimes I have to unplug/replug my TB cable, otherwise I either get no
> recognition of my new display setup (and sometimes TB devices) or it'll
> try and use the same monitor resolution of the previously-connected
> monitor (as if the TB subsystem doesn't recognize things have changed).
> 

Below is the patch series that addresses mentioned issue. There are two
patches in this series. The series takes care of releasing the DP resources
as part of freeze call before the hibernation image is created. You can test
it for your issues and let us know if it helps.

Please note that these changes are still under internal review and are
subject to change.

From: Pooja Katiyar <pooja.katiyar@intel.com>
Date: Thu, 22 Jan 2026 11:57:07 -0800
Subject: [RFC PATCH 1/2] thunderbolt: Add helper functions for suspend/resume
 operations

Extract common resume logic from tb_resume_noirq() into
tb_recover_tunnels() helper function to consolidate switch resume,
tunnel discovery/teardown, tunnel recreation, and topology
reinitialization logic.

Introduce __nhi_suspend_ops() and __nhi_resume_noirq() helper functions
to consolidate common suspend/resume logic used by multiple PM callbacks.

This is a preparatory cleanup for hibernation improvements.

Co-developed-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/thunderbolt/nhi.c | 46 ++++++++++++++++++++++++++-------------
 drivers/thunderbolt/tb.c  | 34 ++++++++++++++++++++---------
 2 files changed, 55 insertions(+), 25 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 6d0c9d37c55d..5b84223937fb 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -971,7 +971,14 @@ static irqreturn_t nhi_msi(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
+static int __nhi_suspend_ops(struct tb_nhi *nhi, bool wakeup)
+{
+	if (nhi->ops && nhi->ops->suspend_noirq)
+		return nhi->ops->suspend_noirq(nhi, wakeup);
+	return 0;
+}
+
+static int nhi_suspend_noirq(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct tb *tb = pci_get_drvdata(pdev);
@@ -982,18 +989,7 @@ static int __nhi_suspend_noirq(struct device *dev, bool wakeup)
 	if (ret)
 		return ret;
 
-	if (nhi->ops && nhi->ops->suspend_noirq) {
-		ret = nhi->ops->suspend_noirq(tb->nhi, wakeup);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int nhi_suspend_noirq(struct device *dev)
-{
-	return __nhi_suspend_noirq(dev, device_may_wakeup(dev));
+	return __nhi_suspend_ops(nhi, device_may_wakeup(dev));
 }
 
 static int nhi_freeze_noirq(struct device *dev)
@@ -1029,10 +1025,17 @@ static bool nhi_wake_supported(struct pci_dev *pdev)
 static int nhi_poweroff_noirq(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
+	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb_nhi *nhi = tb->nhi;
 	bool wakeup;
+	int ret;
+
+	ret = tb_domain_suspend_noirq(tb);
+	if (ret)
+		return ret;
 
 	wakeup = device_may_wakeup(dev) && nhi_wake_supported(pdev);
-	return __nhi_suspend_noirq(dev, wakeup);
+	return __nhi_suspend_ops(nhi, wakeup);
 }
 
 static void nhi_enable_int_throttling(struct tb_nhi *nhi)
@@ -1051,7 +1054,7 @@ static void nhi_enable_int_throttling(struct tb_nhi *nhi)
 	}
 }
 
-static int nhi_resume_noirq(struct device *dev)
+static int __nhi_resume_noirq(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct tb *tb = pci_get_drvdata(pdev);
@@ -1074,6 +1077,19 @@ static int nhi_resume_noirq(struct device *dev)
 		nhi_enable_int_throttling(tb->nhi);
 	}
 
+	return 0;
+}
+
+static int nhi_resume_noirq(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct tb *tb = pci_get_drvdata(pdev);
+	int ret;
+
+	ret = __nhi_resume_noirq(dev);
+	if (ret)
+		return ret;
+
 	return tb_domain_resume_noirq(tb);
 }
 
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4f5f1dfc0fbf..69015def6cd1 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3110,22 +3110,21 @@ static void tb_restore_children(struct tb_switch *sw)
 	}
 }
 
-static int tb_resume_noirq(struct tb *tb)
+/**
+ * tb_recover_tunnels() - Common resume logic for suspend and hibernate
+ * @tb: Domain to resume
+ *
+ * Common recovery logic shared between suspend resume and hibernate restore.
+ * Handles switch resume, tunnel discovery/teardown, tunnel recreation, and
+ * topology reinitialization.
+ */
+static void tb_recover_tunnels(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel, *n;
 	unsigned int usb3_delay = 0;
 	LIST_HEAD(tunnels);
 
-	tb_dbg(tb, "resuming...\n");
-
-	/*
-	 * For non-USB4 hosts (Apple systems) remove any PCIe devices
-	 * the firmware might have setup.
-	 */
-	if (!tb_switch_is_usb4(tb->root_switch))
-		tb_switch_reset(tb->root_switch);
-
 	tb_switch_resume(tb->root_switch, false);
 	tb_free_invalid_tunnels(tb);
 	tb_free_unplugged_children(tb->root_switch);
@@ -3166,6 +3165,21 @@ static int tb_resume_noirq(struct tb *tb)
 	tb_switch_enter_redrive(tb->root_switch);
 	 /* Allow tb_handle_hotplug to progress events */
 	tcm->hotplug_active = true;
+}
+
+static int tb_resume_noirq(struct tb *tb)
+{
+	tb_dbg(tb, "resuming...\n");
+
+	/*
+	 * For non-USB4 hosts (Apple systems) remove any PCIe devices
+	 * the firmware might have setup.
+	 */
+	if (!tb_switch_is_usb4(tb->root_switch))
+		tb_switch_reset(tb->root_switch);
+
+	tb_recover_tunnels(tb);
+
 	tb_dbg(tb, "resume finished\n");
 
 	return 0;
-- 
2.43.0



From: Pooja Katiyar <pooja.katiyar@intel.com>
Date: Thu, 22 Jan 2026 15:09:19 -0800
Subject: [RFC PATCH 2/2] thunderbolt: Redefine hibernate sequence for proper
 resource management

The current implementation uses the same suspend_noirq() callback
for both system suspend and hibernation flows. This creates a fundamental
timing issue during hibernation that corrupts tunnel resources.

Current hibernation flow:
1. Hibernation begins and kernel prepares to create hibernation image.
2. Active tunnel contexts, software references (krefs), and hardware
   states are captured and preserved in the hibernation image.
3. suspend_noirq() is called after hibernation image creation is
   complete.
4. Resources are freed and switch is suspended. Since image creation
   happened before this step, the release of resources is not part of
   hibernation image.
5. System transition to S4 and firmware reinitializes all hardware state.
6. During resume, hibernation image is restored with stale tunnel data.
7. Driver attempts to use invalid references that no longer match
   hardware.
8. SWCM flow tries to reactivate tunnels based on corrupted state.

This sequence is flawed because the hibernation image contains active
tunnel contexts, software references, and hardware register states that
become completely invalid after the power cycle and firmware reset.
When the system restores from this image, the thunderbolt driver attempts
to operate on stale data structures that no longer correspond to the
actual hardware state after reinitialization.

The DP tunneling failure illustrates this clearly:
- Before hibernation entry: DP tunnel created with kref=2.
- During image creation: Tunnel context preserved with kref=2 in
  hibernation image.
- After power-off/during S4 transition: Hardware completely reset, all
  tunnels cleared by firmware.
- During restore: Hibernation image restored with stale tunnel context
  (kref=2).
- During SWCM reactivation: Driver increments kref to 3 for same tunnel
  object.
- Result: Reference count mismatch (kref=3 instead of expected 2).
- Subsequent hotplug events fail due to not enough hopids available due
  to kref count mismatch.

Fix this by redefining the hibernate sequence with dedicated callbacks:

- Hibernate prepare callback: Tear down tunnels and release resources
  as part of freeze before hibernation image creation, ensuring clean
  state is captured.
- Separate poweroff/restore callbacks: Handle hibernation-specific reset
  requirements, accounting for complete hardware reinitialization by
  firmware.
- Clear separation from suspend/resume: Distinct code paths prevent
  resource management conflicts and ensure proper timing for each flow.

This redefines the hibernate sequence to ensure hibernation images contain
only clean, inactive tunnel state that can be safely restored without
resource conflicts or hardware state mismatches.

Co-developed-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
---
 drivers/thunderbolt/domain.c | 27 +++++++++++++
 drivers/thunderbolt/nhi.c    | 21 +++++++++-
 drivers/thunderbolt/tb.c     | 77 +++++++++++++++++++++++++++++++++---
 drivers/thunderbolt/tb.h     |  6 +++
 4 files changed, 124 insertions(+), 7 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 3ced37b4a869..d4f1aabb98c4 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -595,6 +595,33 @@ int tb_domain_thaw_noirq(struct tb *tb)
 	return ret;
 }
 
+int tb_domain_poweroff_noirq(struct tb *tb)
+{
+	int ret = 0;
+
+	mutex_lock(&tb->lock);
+	if (tb->cm_ops->poweroff_noirq)
+		ret = tb->cm_ops->poweroff_noirq(tb);
+	if (!ret)
+		tb_ctl_stop(tb->ctl);
+	mutex_unlock(&tb->lock);
+
+	return ret;
+}
+
+int tb_domain_restore_noirq(struct tb *tb)
+{
+	int ret = 0;
+
+	mutex_lock(&tb->lock);
+	tb_ctl_start(tb->ctl);
+	if (tb->cm_ops->restore_noirq)
+		ret = tb->cm_ops->restore_noirq(tb);
+	mutex_unlock(&tb->lock);
+
+	return ret;
+}
+
 void tb_domain_complete(struct tb *tb)
 {
 	if (tb->cm_ops->complete)
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 5b84223937fb..e70201d72d2e 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -51,6 +51,8 @@ static bool host_reset = true;
 module_param(host_reset, bool, 0444);
 MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
 
+static void nhi_reset(struct tb_nhi *nhi);
+
 static int ring_interrupt_index(const struct tb_ring *ring)
 {
 	int bit = ring->hop;
@@ -1030,7 +1032,7 @@ static int nhi_poweroff_noirq(struct device *dev)
 	bool wakeup;
 	int ret;
 
-	ret = tb_domain_suspend_noirq(tb);
+	ret = tb_domain_poweroff_noirq(tb);
 	if (ret)
 		return ret;
 
@@ -1080,6 +1082,21 @@ static int __nhi_resume_noirq(struct device *dev)
 	return 0;
 }
 
+static int nhi_restore_noirq(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb_nhi *nhi = tb->nhi;
+	int ret;
+
+	ret = __nhi_resume_noirq(dev);
+	if (ret)
+		return ret;
+
+	nhi_reset(nhi);
+	return tb_domain_restore_noirq(tb);
+}
+
 static int nhi_resume_noirq(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -1465,7 +1482,7 @@ static const struct dev_pm_ops nhi_pm_ops = {
 					    * pci-tunnels stay alive.
 					    */
 	.thaw_noirq = nhi_thaw_noirq,
-	.restore_noirq = nhi_resume_noirq,
+	.restore_noirq = nhi_restore_noirq,
 	.suspend = nhi_suspend,
 	.poweroff_noirq = nhi_poweroff_noirq,
 	.poweroff = nhi_suspend,
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 69015def6cd1..6d2a1814fa9a 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3111,14 +3111,16 @@ static void tb_restore_children(struct tb_switch *sw)
 }
 
 /**
- * tb_recover_tunnels() - Common resume logic for suspend and hibernate
+ * tb_recover_tunnels() - Common resume logic for suspend and hibernate resume
  * @tb: Domain to resume
+ * @restore: true if this is hibernate restore, false for suspend resume
  *
  * Common recovery logic shared between suspend resume and hibernate restore.
  * Handles switch resume, tunnel discovery/teardown, tunnel recreation, and
- * topology reinitialization.
+ * topology reinitialization. For hibernate restore, also handles TMU
+ * configuration and DP resource management.
  */
-static void tb_recover_tunnels(struct tb *tb)
+static void tb_recover_tunnels(struct tb *tb, bool restore)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel, *n;
@@ -3128,6 +3130,18 @@ static void tb_recover_tunnels(struct tb *tb)
 	tb_switch_resume(tb->root_switch, false);
 	tb_free_invalid_tunnels(tb);
 	tb_free_unplugged_children(tb->root_switch);
+
+	if (restore) {
+		/*
+		 * Configure host router's TMU to normal mode to support
+		 * the highest CLx state. This must be done before
+		 * restoring child to ensure proper TMU configuration
+		 * based on parent setting.
+		 */
+		tb_switch_tmu_configure(tb->root_switch, TB_SWITCH_TMU_MODE_LOWRES);
+		tb_switch_tmu_enable(tb->root_switch);
+	}
+
 	tb_restore_children(tb->root_switch);
 
 	/*
@@ -3144,6 +3158,18 @@ static void tb_recover_tunnels(struct tb *tb)
 		tb_tunnel_put(tunnel);
 	}
 
+	if (restore) {
+		/*
+		 * In case of hibernation, DP resources were freed
+		 * during freeze phase. Re-discover them to make those
+		 * DP IN adapters available for tunneling.
+		 */
+		tb_discover_dp_resources(tb);
+
+		/* Add DP IN resources for the root switch */
+		tb_add_dp_resources(tb->root_switch);
+	}
+
 	/* Re-create our tunnels now */
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list) {
 		/* USB3 requires delay before it can be re-activated */
@@ -3178,13 +3204,30 @@ static int tb_resume_noirq(struct tb *tb)
 	if (!tb_switch_is_usb4(tb->root_switch))
 		tb_switch_reset(tb->root_switch);
 
-	tb_recover_tunnels(tb);
-
+	tb_recover_tunnels(tb, false);
 	tb_dbg(tb, "resume finished\n");
 
 	return 0;
 }
 
+static int tb_restore_noirq(struct tb *tb)
+{
+	tb_dbg(tb, "restoring...\n");
+
+	/*
+	 * For USB4 hosts, always reset the root switch after hibernate
+	 * restore to trigger port re-enumeration and hotplug events.
+	 */
+	if (!tb_switch_is_usb4(tb->root_switch) ||
+	    usb4_switch_version(tb->root_switch) == 1)
+		tb_switch_reset(tb->root_switch);
+
+	tb_recover_tunnels(tb, true);
+	tb_dbg(tb, "restore finished\n");
+
+	return 0;
+}
+
 static int tb_free_unplugged_xdomains(struct tb_switch *sw)
 {
 	struct tb_port *port;
@@ -3211,7 +3254,13 @@ static int tb_freeze_noirq(struct tb *tb)
 {
 	struct tb_cm *tcm = tb_priv(tb);
 
+	tb_dbg(tb, "freezing...\n");
+	tb_disconnect_and_release_dp(tb);
+	tb_switch_exit_redrive(tb->root_switch);
+	tb_switch_suspend(tb->root_switch, false);
 	tcm->hotplug_active = false;
+	tb_dbg(tb, "freeze finished\n");
+
 	return 0;
 }
 
@@ -3223,6 +3272,22 @@ static int tb_thaw_noirq(struct tb *tb)
 	return 0;
 }
 
+static int tb_poweroff_noirq(struct tb *tb)
+{
+	struct tb_cm *tcm = tb_priv(tb);
+
+	tb_dbg(tb, "powering off...\n");
+	/*
+	 * During hibernate, freeze_noirq has already suspended
+	 * the topology and freed resources. Only disable hotplug
+	 * processing.
+	 */
+	tcm->hotplug_active = false;
+	tb_dbg(tb, "poweroff finished\n");
+
+	return 0;
+}
+
 static void tb_complete(struct tb *tb)
 {
 	/*
@@ -3297,8 +3362,10 @@ static const struct tb_cm_ops tb_cm_ops = {
 	.deinit = tb_deinit,
 	.suspend_noirq = tb_suspend_noirq,
 	.resume_noirq = tb_resume_noirq,
+	.restore_noirq = tb_restore_noirq,
 	.freeze_noirq = tb_freeze_noirq,
 	.thaw_noirq = tb_thaw_noirq,
+	.poweroff_noirq = tb_poweroff_noirq,
 	.complete = tb_complete,
 	.runtime_suspend = tb_runtime_suspend,
 	.runtime_resume = tb_runtime_resume,
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e96474f17067..42d924137f31 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -476,9 +476,11 @@ struct tb_path {
  *	     it is unregistered. Called without @tb->lock taken. Optional.
  * @suspend_noirq: Connection manager specific suspend_noirq
  * @resume_noirq: Connection manager specific resume_noirq
+ * @restore_noirq: Connection manager specific restore_noirq
  * @suspend: Connection manager specific suspend
  * @freeze_noirq: Connection manager specific freeze_noirq
  * @thaw_noirq: Connection manager specific thaw_noirq
+ * @poweroff_noirq: Connection manager specific poweroff_noirq
  * @complete: Connection manager specific complete
  * @runtime_suspend: Connection manager specific runtime_suspend
  * @runtime_resume: Connection manager specific runtime_resume
@@ -510,9 +512,11 @@ struct tb_cm_ops {
 	void (*deinit)(struct tb *tb);
 	int (*suspend_noirq)(struct tb *tb);
 	int (*resume_noirq)(struct tb *tb);
+	int (*restore_noirq)(struct tb *tb);
 	int (*suspend)(struct tb *tb);
 	int (*freeze_noirq)(struct tb *tb);
 	int (*thaw_noirq)(struct tb *tb);
+	int (*poweroff_noirq)(struct tb *tb);
 	void (*complete)(struct tb *tb);
 	int (*runtime_suspend)(struct tb *tb);
 	int (*runtime_resume)(struct tb *tb);
@@ -777,6 +781,8 @@ int tb_domain_resume_noirq(struct tb *tb);
 int tb_domain_suspend(struct tb *tb);
 int tb_domain_freeze_noirq(struct tb *tb);
 int tb_domain_thaw_noirq(struct tb *tb);
+int tb_domain_poweroff_noirq(struct tb *tb);
+int tb_domain_restore_noirq(struct tb *tb);
 void tb_domain_complete(struct tb *tb);
 int tb_domain_runtime_suspend(struct tb *tb);
 int tb_domain_runtime_resume(struct tb *tb);
-- 
2.43.0



Thanks and Regards,
Pooja


