Return-Path: <linux-usb+bounces-34934-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLLSCDBiuWlsCwIAu9opvQ
	(envelope-from <linux-usb+bounces-34934-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:16:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDEE2AB9F1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 15:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 652C430DA738
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 14:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73633E2748;
	Tue, 17 Mar 2026 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oqE2dutT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055D2773CA
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 14:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756414; cv=none; b=bIWDoKwSvRLL7tyGWI7Kqwa9JGugkUfTxascjvRFgAM0dHMT7/P7mIlIxQoyZqL+OTMW8ewYdWiDXZGs+yVpQveP9uFqRT163JaJhi97CYQdy1stM4kbcWAGYjYLaA7nyfTV6hXZamjPbVbQ1et+oC/B5CV5hDDrMRdM3/bBwBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756414; c=relaxed/simple;
	bh=kVnDGJ5RzXu5yl6vi7yCPicAlUAjqSsXEP0+BQIFbIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIw0rlemrkWuTwiYhARZV1QZ0XJ9jAeV9ibaXMpXw7+xlDQcXBtbJl0GGJplUNMrB+snnEPWmmHjO7YI85rKD97TXwmEfpXziG+SUHrSwz5YMmmYrMevW5KWsjg8fr17lsBFuaet7578C86zJ3pHpAj0MlW2lLccgJTQJCNoMG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oqE2dutT; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd8347d9fdso816967185a.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 07:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773756412; x=1774361212; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/rqnrhH/0M5HbNmB58L4IAuODmanLXy2KDjjudCHThg=;
        b=oqE2dutT7ksHlY2gsHBuJbzW4bXREOaWmF6ZveL8bqBq5VF5fo5kZShjvecW3ybEt9
         wrH8hc/DQbzFsgIOQDEIp8j7rC+Ue7iLjwMnTh7/ndT6HkvOvNhNIpdcKWvzAOHKLyUo
         h6pfm2V4YfQ0c5OXEI679TZlYiMcZkjHlUIhPibn30hHcBqkCqQ78YBb4HY5ef3yu5+j
         nSMvh7yvPGtcseQHYNJv1ut8sttJisGxl6BPUG0RHikgmQ4SeNK/JkBTQ/LfzOXkiCVA
         2cyqUyiyH6U55sDjDrvZxZDY6Jne5k9xI0RehrFJCYmd0adOkTFRDiSKwbOI3858hfDM
         IVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756412; x=1774361212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rqnrhH/0M5HbNmB58L4IAuODmanLXy2KDjjudCHThg=;
        b=rMP8h+4DKpEZoFzPKhvqK5Nh01z7uzc6WbUIjOp5DBzIwTcgqC7e3QFEqGNlG8ITxR
         opg7yHx+cEwxjR8ym/C6Z/ao/bX/WmuzTnbzOKA51nsLOkeqLGp5rZFx49yv842D6ER+
         imS2vPBU9hwq8sRtJ8U/BY8cqp82i6+E891aQ6YyOizoHC/yrPGY23jE/trmXCstzcTZ
         Gb+8MWwxyjs4OyH1HTVZ7yYOL76PPCSP6NDdc1oAXRbGXNeIWog8ZktLXm1sPFELsAEP
         ff/VeJ4EgdmpIgmevK7+PmINarqPNlPHB5KVdrstDAWnACdqKlymzsR00YJkeGdtFOlE
         Gm/g==
X-Forwarded-Encrypted: i=1; AJvYcCUNyN5ABjecPw4zHHQ5VqZNI3w1hqZuh04dqltnsmFZX7qPn0ePkobNPPRMTUbiyR9ogpHHc79KRTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygnf+wP+bfGicXRoskMzRSmlE5xA+7yszWztPBZ2zfsWkuKQP4
	CAUHnkdEXJUnZnS5/IAnrPAQpN9iFDNTrNHACe2344eRG1E/0HNrRt+nPOacKKkuBA==
X-Gm-Gg: ATEYQzwMCov3DLYE5bY9TZUGNAakVquAMUvmHSMp4A4mfr0inWFY+9P8puHmW3zHysD
	aGfp9mZqRPo0xd0zRiZFMnmAexHaDdpKJoqvMlNCfkdefYiJSZPFt9KTKmBf+MBY1j+FCSqluKX
	2+72B1ZS60rlSOjPwXG0IXUkdEAoC7nkVr6q/IJHcDo+WGOv/IQ61UPU0heeQSjfh7/1w/LoHjw
	HM3UIrlPmjasVTlMwyvx8pna9kU9eesqQuingLJTR/+g4GyN5KadqHk48TF6L+8H4Y0vFHfmp/l
	OOhKcvCSGii1e345T3ew8qXTiD9gaL3RCMP9LVEYtItDHIXErSnMwkXns6L2PwGKntttzIWqWWR
	TENIJImCDT8AbNXrObQEmiEc9PMz2lkY4bV/fK7+j9fAsvfdlOgo/Xvf1hFVb7HclGF6IMzEDas
	gksloBvncYrurPGijJBv5fyHjQ
X-Received: by 2002:a05:622a:1309:b0:509:b40:cf7a with SMTP id d75a77b69052e-50957c9f21emr225049071cf.17.1773756411683;
        Tue, 17 Mar 2026 07:06:51 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a116d86sm136133761cf.23.2026.03.17.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:06:50 -0700 (PDT)
Date: Tue, 17 Mar 2026 10:06:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: shitao <shitao@kylinos.cn>
Cc: zaitcev@redhat.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATH v2] usb: usblp: add the reset_resume function interface
Message-ID: <c4f66c3b-7cb4-4bcc-868a-d3aef2d9e521@rowland.harvard.edu>
References: <20260317125614.3215254-1-shitao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317125614.3215254-1-shitao@kylinos.cn>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34934-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DDEE2AB9F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 08:56:14PM +0800, shitao wrote:
> Add reset_resume callback to prevent premature device unbinding during
> S4 (hibernation) thaw phase, which would otherwise cause usblp to require
> a re-probe — a process that is slow and trigger error -517, and even
> has a high probability of causing use-after-free bugs and kernel panics.
> 
> Problem:
> When a USB printer(CH340S USB-to-parallel adapter ID 1a86:7584)
> is connected during S4 hibernation,the following sequence occurs:
> 
> 1. During thaw phase, USB core sets udev->reset_resume = 1
> 2. usb_resume_interface() checks for driver->reset_resume callback
> 3. If not implemented, interface is marked as needs_binding=1
> 4. usb_resume() calls unbind_marked_interfaces()
> 5. This forces disconnect via usb_forced_unbind_intf()
> 6. usblp_disconnect() immediately frees usblp structure if !usblp->used
> 7. However, PM subsystem still has references (usage_count > 0)

How can the PM subsystem have any references to anything that is private 
to usblp?  It should hold only references to the usb_device's and 
usb_interface's embedded device structs.

> 8. Subsequent PM callbacks access freed memory (0x6b6b6b6b SLAB poison)

This should not happen at all.  It indicates there is a serious bug 
somewhere, and hiding the bug by setting the reset_resume callback will 
not fix it.

> 9. Result: kernel panic in pm_op() with use-after-free
> 
> The bug manifests as:
> Unable to handle kernel paging request at virtual address 006b6b6b6b6b6b93
> pc : pm_op+0x50/0x80
> Call trace:
> pm_op+0x50/0x80
> dpm_resume+0xdc/0x200
> hibernation_snapshot+0x234/0x3d8

First, are you certain that setting the reset_resume callback equal to 
the resume callback is the right thing to do?  Don't printers hold some 
state information that will need to be restored after a reset?

Second, you should concentrate on fixing the invalid memory-access bug.

Alan Stern

