Return-Path: <linux-usb+bounces-34138-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p011KOZ5qmkqSQEAu9opvQ
	(envelope-from <linux-usb+bounces-34138-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 07:53:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF5C21C313
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 07:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E85363034CAE
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 06:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894FE371CFC;
	Fri,  6 Mar 2026 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="C8D/217i"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83829366DA6
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 06:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780001; cv=none; b=iRnAHtof4Jjj8S2TY4nNg11CJFmmT1J3HRfuiF3hOPIYENwu8xcIJZUnpPXFdbCpipsEf8bSLU3HXYO6yAImLlFCJz+gMcxUWU/fsh1fmFE/cu8MNeHB2gEacnBi5PJywCpD3N4wJh4AH/fXmbKW1iWvb6yqwRUXqjlS8dm7+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780001; c=relaxed/simple;
	bh=PenAPIStX2M7YTvJWEhcIzcrsrFP6xx4C/Q5Zagbl8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eawek/8yzVBeaKU5xaQXcjNy+UbJx1o51NMo+rgrNFMUudRmzyHfTl4lhbCT9SUgyvaKr2Ng0XvILJlcOsr6LSxaWR7cdt14YhOVtl+iG/ssjTFST7srqKwiEAZsRtZMP5Eu4WjK6pcqpBXCYRJ5r4D1jZ06SiNeYNmx8p69y4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=C8D/217i; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1772779982;
	bh=rIKVTreJq8GDlRP1Gu83cp/gne4uwt1kqFgzrcEZpwE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=C8D/217iwEJjRLrAI/gkV+AgqK4u9QtGI6i6x+eqSpRUOuioVF3Z3snxHekkSVD5C
	 Gs1hlYFC9hQYMp0UJ8FamPq3617mbMotLQwqIdvy7h7MKAurEFIlH8lkeqRl5JRemE
	 4D0okOtrYFdgnhEY2R4vO+Kd10fDEK/NUApPJDNA=
X-QQ-mid: zesmtpip2t1772779967tdd2db676
X-QQ-Originating-IP: xbt+VMUc5QggPI6KwTfkc94agsFpQ4s1Kken0+wpQNw=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Mar 2026 14:52:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2474265510470450867
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: niklas.neronin@linux.intel.com
Cc: Thinh.Nguyen@synopsys.com,
	linux-usb@vger.kernel.org,
	mathias.nyman@linux.intel.com,
	raoxu@uniontech.com
Subject: Re: [RFC PATCH 09/12] usb: xhci: optimize resuming from S4 (suspend-to-RAM)
Date: Fri,  6 Mar 2026 14:52:46 +0800
Message-ID: <1E638E645F8271BF+20260306065246.2393516-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305144824.3264408-10-niklas.neronin@linux.intel.com>
References: <20260305144824.3264408-10-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Ma+91PRqk5xHOW6LotGe6jZfS8MXOFAFNq2UT8sp8z5KfeQ8Q9GVaAws
	Gh4aqmZEl3Ls8EA3E9oggNiYAl+I0ehpupKtOxTymL9XRDISTZSZGr8f7uFY57dxrEyni/z
	FUCNOTQ3YokID6vaFSvjNA3udWRp4IDdihgRiGLd3cRhM0z1BCgPaNO3v5rk8lpnYSqlOfQ
	nu/vnbxWBNE0/ikKNQSo/IBxR0gI7YmSsEpuAKqYezFiALp3GbqLrvkn7gIpFJ9dBIv9S3w
	HzL2JjtFJOkEDattDSglC+WUsWK1bUp1I2NC0q1ZWs7hfQfrWFGs5JXF0G7Oul7Cx/DBuWo
	ftae5KFbHhrfx6fPheM2zs4nRO7abReS/rMFIdkv+LLbkIzzflObmZfqhjf8oObEKTEXnHh
	1BMomByJTyN/5RTqJdJ6B2nqsx0feBEOkHVAI/d5TFv9XHjCcEB1XAcpMUX1tVy5zmp9RyQ
	zxU0y96HILyx9k/Owj7W9VGZBFrrbCrMBfT+NvqqVYZAY02drPCDkYWukfFmO52oFg3QNXE
	lBkTwnfuAEm3QSUz6XfQu0NrTnES1hpiZgm/1orwe0CAa433a7XW7OPejj98sTzg9RKg+h8
	q3bQl5yMpNRyDyploWpP+SS7XYB8YEDbUQnzsNoVXDr/rQZzOB7q+mdEYI0bvZEON8fDyMu
	ASzP8+NWA3rhqumTBeEGX5pTA+PP8lQvafhfvuNfzJm94meYsnYxQGTkApPeQX7eXnXHure
	B0NIeocef+MSi1IXaQ3VULVUYHqc4hP6444vKtnZECKyAh9JvMCUzsRiW02N3glzA0spc1V
	ioH7NPuLOMMbNigm7o4VCPAMwUooaSCi6nXqCN59G8LyWLKiyVscllPxPbdFT4nmG3flik0
	BMOyEAkGGdaFR/AFWDVDnpQ4aEHN4BEFZjx7mv4+bLLNDiTjM1YIMcI6ly9Zm8xscHeWjPY
	c4dGn7O1LBDB4hbjSMlSm8iZgPZrNUnDMqaSo212n3puXxewchs6S3kIDSPxELaRqHhVZSc
	lVmMrJ1PXiTMTceWSO
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 3BF5C21C313
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34138-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,uniontech.com:dkim,uniontech.com:mid]
X-Rspamd-Action: no action

On 2026-03-05 14:48 Niklas Neronin wrote:

> -	if (power_lost) {
> +	if (reset_registers) {
>  		if ((xhci->quirks & XHCI_COMP_MODE_QUIRK) &&
>  				!(xhci_all_ports_seen_u0(xhci))) {
>  			timer_delete_sync(&xhci->comp_mode_recovery_timer);
> @@ -1165,28 +1168,27 @@ int xhci_resume(struct xhci_hcd *xhci, bool power_lost, bool is_auto_resume)
>  		if (retval)
>  			return retval;
>
> -		xhci_dbg(xhci, "// Disabling event ring interrupts\n");
> -		writel(STS_EINT, &xhci->op_regs->status);
> -		xhci_disable_interrupter(xhci, xhci->interrupters[0]);
> +		/* Clear data which is re-initilized during runtime */
> +		xhci_for_each_ring_seg(xhci->interrupters[0]->event_ring->first_seg, seg)
> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);

If the driver is moving toward multiple operational
interrupters, the current reset logic seems to only
reset interrupter 0 explicitly. Should the secondary
operational interrupters be reset here as well? If so,
that would likely require additional
xhci_for_each_ring_seg() handling and may make the
resume/reset path more complex.

> +
> +		for (int i = xhci->max_ports; i > 0; i--)
> +			xhci_free_virt_devices_depth_first(xhci, i);
> +
> +		xhci->cmd_ring_reserved_trbs = 0;
> +		xhci_for_each_ring_seg(xhci->cmd_ring->first_seg, seg)
> +			memset(seg->trbs, 0, sizeof(union xhci_trb) * TRBS_PER_SEGMENT);
>
> -		xhci_dbg(xhci, "cleaning up memory\n");
> -		xhci_mem_cleanup(xhci);
>  		xhci_debugfs_exit(xhci);
> -		xhci_dbg(xhci, "xhci_stop completed - status = %x\n",
> -			    readl(&xhci->op_regs->status));
>

xhci_mem_cleanup() also clears software-side runtime
state, not just rings. Without equivalent cleanup,
state such as the command queue, cmd_timer, cmd_list,
and TT-related list state may remain across
reset-resume, which could lead to unexpected issues on
some hardware.

Thanks,

Xu Rao

